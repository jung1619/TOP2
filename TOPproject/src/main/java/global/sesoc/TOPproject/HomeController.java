package global.sesoc.TOPproject;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.DAO.UserDAO;
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

	
/*	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() { return "join"; }*/

	@RequestMapping(value = "friend", method = RequestMethod.GET)
	public String friend() { return "friend"; }
	
	@RequestMapping(value = "view_3", method = RequestMethod.GET)
	public String view_3() { return "view_3"; }

	
	
	
	@RequestMapping(value = "Notice", method = RequestMethod.POST)
	public String NoticePage(String p_num, Model model) {
		logger.info("Notice p_num: "+p_num);
		model.addAttribute("p_num", p_num);
		
		return "notice";
	}

/*	// 친구검색
	@ResponseBody
	@RequestMapping(value = "idSearch", method = RequestMethod.POST)
	public String idSearch(String searchId, HttpSession session) {
		logger.info("친구검색 시도 : " + searchId);
		User user = userDAO.searchUser(searchId);
		logger.info("친구검색 종료 : " + searchId);
		logger.info("sessionId : " + session.getAttribute("loginedId"));

		if(user != null && !(session.getAttribute("loginedId").equals(searchId))) {
			logger.info("success");
			return user.getId();
		}
		else {
			logger.info("failed");
			return "failed";
		}
		
	}*/
/*	
	//친구추가
	@ResponseBody
	@RequestMapping(value = "friendAdd", method = RequestMethod.POST)
	public String friendAdd(String searchId, HttpSession session) {
		logger.info("친구추가 시도 : " + searchId);

		String sessionId = (String) session.getAttribute("loginedId");
		logger.info(sessionId);
		logger.info(searchId);
		
		
		userDAO.updateFriendList(sessionId, searchId);
		
		//친구목록꺼내기
		String fList = userDAO.searchUserFL(sessionId);
		System.out.println(fList);
//		String [] friendList = fList.split("/");
//		for(String f : friendList) {
//			System.out.println(f);
//		}
		logger.info(fList);
		logger.info("친구추가 종료 : " + searchId);
		
		
		return fList;
	}*/


}// class
