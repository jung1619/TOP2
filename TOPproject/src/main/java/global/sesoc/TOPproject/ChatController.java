package global.sesoc.TOPproject;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.VO.Context;
import global.sesoc.TOPproject.VO.Message;
import global.sesoc.TOPproject.VO.User;

@Controller
public class ChatController {
		
	
	@Autowired
	ProjectDAO projectDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	//chatroom이동 
	@RequestMapping(value="chat", method=RequestMethod.GET)
	public String Chatpage(int p_num, Model model, HttpSession hs){
		model.addAttribute("p_num",p_num);
		
		// 해당 프로젝트에 여러 파일이 있을 경우 파일명으로 해야하니까 임시로
		// 회의하기 버튼을 눌러서 채팅방 이동 시 해당 파일내용이 있는지 체크해서 없으면 기본 워드파일 하나를 만들어놓기
		Context context = projectDAO.searchContext(p_num);
		if( context == null ){
			context = new Context(p_num, "임시 파일명1", "할 수 있다!!", (String)hs.getAttribute("loginedId"));
			projectDAO.insertContext(context);
		}
		System.out.println(context);
		model.addAttribute("test", context.getContext());
		System.out.println("~~~~~~~~~~~~~~여기까지 뷰쓰리 진입 전~~~~~~~~~~~~~~");
		
		return "view_3";
	}
	
	//메시지 주고 받기
	@MessageMapping("/chat/{p_num}")
	@SendTo("/subscribe/chat/{p_num}")
	public Message sendChatMessage(@DestinationVariable("p_num") String p_num,Message message, SimpMessageHeaderAccessor headerAccessor){
		logger.info("채팅 컨트롤러 시작");
		User user =(User)headerAccessor.getSessionAttributes().get("user");//interceptor에 있는에 가져옴
		message.setId(user.getId());
		message.setNickName(user.getNickname());
		logger.info(message.toString());
		
		
		logger.info("채팅컨트롤러 종료");
		return message;
	}
	
	@MessageMapping("/chat/{p_num}/context")
	@SendTo("/subscribe/chat/{p_num}/context")
	public Context sendContext(@DestinationVariable("p_num") int p_num, Context context){
		logger.info("작업내용 바꿔볼까(임시)(edit.jsp의  change, sendContext에서 왔음) : " + p_num);
		
		context.setP_num(p_num);
		logger.info("받은 context : "+context);
		
		projectDAO.upDateContext(context);
		
		//여기서 저장한것을 다시 불러옴 context를 새롭게 불러온겁니다.
		context = projectDAO.searchContext(p_num);
		
		logger.info("저장 후 다시 불러와서 이제 화면에 뿌릴 context : "+context);
		
		return context;
	}
	
	
}
