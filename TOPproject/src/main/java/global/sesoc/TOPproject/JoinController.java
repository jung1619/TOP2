package global.sesoc.TOPproject;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.User;

@Controller
public class JoinController {
	
	private final static Logger logger= LoggerFactory.getLogger(JoinController.class);
	

	@Inject
	UserDAO userDao;
	
	
	@ResponseBody
	@RequestMapping(value="CheckIdEmail",method=RequestMethod.POST)
	public String userNameCheck(String idEmail){
		logger.info("idEmail : "+ idEmail);
		
		User user = userDao.searchUser(idEmail);
		
		if( user != null ) return "1";
		else return "2";
	}
	
	
	@ResponseBody
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(User user){
		logger.info("회원 가입 시도 : " + user);
		
		int result = userDao.insertUser(user);
		
		return "home";
	}
	
	
}//class
