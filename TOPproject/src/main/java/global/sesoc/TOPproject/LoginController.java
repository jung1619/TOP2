package global.sesoc.TOPproject;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.DAO.ScheduleDAO;
import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.Notice;
import global.sesoc.TOPproject.VO.Project;
import global.sesoc.TOPproject.VO.Schedule;
import global.sesoc.TOPproject.VO.User;

@Controller
public class LoginController {
	
	private final static Logger logger= LoggerFactory.getLogger(LoginController.class);
	
	
	@Inject
	UserDAO userDao;
	@Autowired
	ProjectDAO projectDAO;
	@Inject
	ScheduleDAO shceduleDAO;
	
	
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(User user, HttpSession hs, Model model){
		logger.info("로그인 시도 : " + user);
		
		User loginedUser = userDao.searchUser(user.getId());
		if(loginedUser==null) return "redirect:home";
		
		logger.info("loginedUser :"+loginedUser);
		if( user.getPw().equals(loginedUser.getPw()) ){
			
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
				Notice notice = null;
				ArrayList <Notice> noticeArr = new ArrayList<Notice>();	
				ArrayList <ArrayList<Notice>> b_noticeArr = new ArrayList <ArrayList<Notice>>();			
				
				//그룹리스트의 공지사항 불러오기
				for(int i = 0 ; i<groupArr.length;i++){
					logger.info("groupArr in HomeController : "+groupArr[i] );
					// 그룹리스트를 불러와서
					noticeArr = projectDAO.selectNotice(groupArr[i]);
						logger.info("받아온 notice in HomController : " + noticeArr);
						if(noticeArr != null){
							b_noticeArr.add(noticeArr);
							model.addAttribute("b_noticeArr", b_noticeArr);
							
						}else{
							System.out.println("notice를 추가하지 못했습니다.");
						}
				}
				
			}
			
			/* 친구리스트 - 0507uj 여기서 친구 목록 조회할 필요가 없다고 판단, 주석 처리
			String fList = userDao.searchUserFL(loginedUser.getId());
			String [] friendList = fList.split("/");
			for(String f : friendList) {
				System.out.println(f);
			}
			model.addAttribute("fList", friendList); */
			
			//켈린더 관련
			String id = (String) hs.getAttribute("loginedId");
			ArrayList<Schedule> scheduleListview = shceduleDAO.selectSchedule(id);
			model.addAttribute("listview", scheduleListview);
			
			//네비게이터에 임시로 값 담는 용도
			String personal = "personal";
			model.addAttribute("personal", personal);
			
			logger.info("로그인 시도 성공");
			return "home";
			
		}else{
			model.addAttribute("msg", "입력하신 아이디와 비밀번호를 다시 확인해 주십시오.");
			
			logger.info("로그인 시도 실패");
			return "home";
		}
	}//login()
	
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession hs){
		hs.invalidate();
		return "redirect:/";
	}//logout

}//class
