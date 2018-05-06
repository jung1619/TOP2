package global.sesoc.TOPproject;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.Notice;
import global.sesoc.TOPproject.VO.PersonalEdit;
import global.sesoc.TOPproject.VO.Project;
import global.sesoc.TOPproject.VO.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	//ArrayList<Notice> n_list= new ArrayList<Notice>();
	@Autowired
	UserDAO userDAO;
	@Autowired
	ProjectDAO projectDAO;

	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() { return "home"; }

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String gohome() { return "redirect:/"; }
	
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test() { return "test"; }
	
	@RequestMapping(value = "filelist", method = RequestMethod.GET)
	public String filelist() { return "filelist"; }

	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String join() { return "join"; }

	@RequestMapping(value = "friend", method = RequestMethod.GET)
	public String friend(HttpSession hs, ModelMap modelMap,HttpServletRequest req, Model model, String groupNum) { 
		
		String id = (String) hs.getAttribute("loginedId");
		User loginedUser = userDAO.searchUser(id);
			
		hs.setAttribute("loginedId", loginedUser.getId());
		
		//그룹리스트
		String [] groupArr=null;
		String groupList = loginedUser.getP_num_list();
		Project selectProject = null;
		ArrayList <Project> p_list = new ArrayList<Project>();
		if( groupList != null ){				
			groupArr = groupList.split("/");
			logger.info("groupArr : " + groupArr);
			// p_num입력해서 프로젝트 명입력하는 list를 만들어 봅시다
			
			for(int i = 0; i<groupArr.length;i++){
				
				logger.info("검색할 p_num : "+groupArr[i]);
				int parse_p_num=Integer.parseInt(groupArr[i]);
				selectProject = projectDAO.searchProject(parse_p_num);
				if(selectProject !=null){
					p_list.add(selectProject);
				}
			}
			logger.info("p_list 확인:"+p_list);
			model.addAttribute("p_list",p_list);
			model.addAttribute("groupList", groupArr);
			//담을 notice
			ArrayList <Notice> noticeArr = new ArrayList<Notice>();	
			ArrayList <ArrayList<Notice>> b_noticeArr = new ArrayList <ArrayList<Notice>>();			

			}
		
		//네비게이터에 임시로 값 담는 용도
		int page = 3;
		model.addAttribute("page", page);
		
		return "friend";
	}
	
	@RequestMapping(value = "view_3", method = RequestMethod.GET)
	public String view_3() { return "view_3"; }

	
	@RequestMapping(value = "Notice", method = RequestMethod.POST)
	public String NoticePage(String p_num, Model model) {
		logger.info("Notice p_num: "+p_num);
		model.addAttribute("p_num", p_num);
		
		return "notice";
	}
	
	
	@RequestMapping(value="personalEdit",method=RequestMethod.GET)
	public String personalEdit(HttpSession session, Model model){
		ArrayList<PersonalEdit> c_list = new ArrayList<PersonalEdit>();
		
		String writer = (String)session.getAttribute("loginedId");
		c_list = projectDAO.selectContextList(writer);
		
		model.addAttribute("c_list", c_list);
		
		return "personalEditor";
	}


}// class
