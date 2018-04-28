package global.sesoc.TOPproject;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.VO.Notice;
//noticecontroller
import global.sesoc.TOPproject.VO.Schedule;



@Controller
public class NoticeController {
	
	@Autowired
	ProjectDAO projectDAO;
	private final static Logger logger= LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value="NoticeInsert", method=RequestMethod.POST)
	public String boardinsert(String context, String p_num, Model model,ModelMap modelMap){
		logger.info("p_num: "+p_num+" context : "+context);
		Notice notice = new Notice();
		int result = 0;
		notice.setP_num(p_num);
		notice.setN_content(context);

		logger.info("insertNotice : "+notice);
		result = projectDAO.insertNotice(notice);
		
		if(result==1) {
			logger.info("공지 insert성공");
		}else{
			logger.info("공지 insert 실패");
		}
		
		
		//켈린더 관련
		
	
		ArrayList<Schedule> scheduleListview = projectDAO.selectProjectSchedule(p_num);
		logger.info("스케쥴 : " + scheduleListview);
		modelMap.addAttribute("listview", scheduleListview);
		
		//일반멤버
		String memberList = projectDAO.memberList(p_num);
		System.out.println(memberList);
		
		if( memberList != null ){				
			String [] mList = memberList.split("/");
			for(String s : mList){
				System.out.println(s);
			}
			logger.info("memberList : " + mList);
			model.addAttribute("mList", mList);
		}
		
		//프로젝트매니져
		String pm = projectDAO.selectPm(p_num);
		model.addAttribute("pm", pm);
		
		
		//공지사항 
		
		System.out.println("get으로 받아온 파라미터: "+p_num);
		//p_num을 받아다가 다오로 넣어서 끌어와야함
		ArrayList<Notice> n_list = projectDAO.noticeList(p_num);
		
		System.out.println("보내짐");
		
		for(Notice n  : n_list){
			System.out.println(n+"받아온 노티스 출력");
		}
		model.addAttribute("n_list", n_list);
		model.addAttribute("p_num",p_num);
		
		
		return"group";
	}
}
