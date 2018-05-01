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
	
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test() { return "test"; }
	
	@RequestMapping(value = "filelist", method = RequestMethod.GET)
	public String filelist() { return "filelist"; }

	
	
	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String join() { return "join"; }

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


}// class
