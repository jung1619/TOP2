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
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.VO.Chat;
import global.sesoc.TOPproject.VO.Context;
import global.sesoc.TOPproject.VO.Message;
import global.sesoc.TOPproject.VO.User;

@Controller
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	
	@Autowired
	ProjectDAO projectDAO;
	
	

	//chatroom이동 
	@RequestMapping(value="chat", method=RequestMethod.GET)
	public String Chatpage(int p_num, Model model, HttpSession hs){
		logger.info("프로젝트 새 문서 - 에디터 이동 시도 : " + p_num);
		
		model.addAttribute("p_num" ,p_num);
		
		Context context = new Context(p_num, "document", (String)hs.getAttribute("loginedId"), "자유롭게 문서를 작성하실 수 있습니다.");
		projectDAO.insertContext(context);
		
		model.addAttribute("content", context.getContext());
		System.out.println("~~~~~~~~~~~~~~여기까지 뷰쓰리 진입 전 new ~~~~~~~~~~~~~~");
		
		
		Chat selectChat =  null;
		selectChat = projectDAO.selectChat(p_num);		
		model.addAttribute("chat", selectChat);
		
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
		Context resultContext = projectDAO.searchContext2(p_num);
		
		logger.info("저장 후 다시 불러와서 이제 화면에 뿌릴 context : "+resultContext);
		
		return resultContext;
	}
	
	
	//채팅 저장
	@ResponseBody
	@RequestMapping(value="saveChat",method=RequestMethod.POST)
	public int chatSave(String chat_log, int p_num){
		int result = 0;
		Chat chat = null;
		logger.info("chatSave in chatcontroller : "+chat_log+" p_num : "+p_num);
		
		
		chat = projectDAO.selectChat(p_num);
		
		//p_num의 채팅이 없을경우에  insert
		if(chat==null){
			System.out.println("안들어오나?");
			chat =   new Chat();
			chat.setChat_log(chat_log);
			chat.setP_num(p_num);
			result = projectDAO.insertChat(chat);
			
		}else{
			//있을 경우에는 update를 합니다.
			chat.setChat_log(chat_log);
			chat.setP_num(p_num);
			
			result = projectDAO.updateChat(chat);
		}
		
		return result;
	}
	
	
	
	
	
	
}
