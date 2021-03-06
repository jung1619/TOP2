package global.sesoc.TOPproject;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.DAO.ScheduleDAO;
import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.Context;
import global.sesoc.TOPproject.VO.Notice;
import global.sesoc.TOPproject.VO.Project;
import global.sesoc.TOPproject.VO.Schedule;
import global.sesoc.TOPproject.VO.User;

@Controller
public class GroupController {
	
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	

	@Inject
	ProjectDAO projectDAO;
	@Inject
	UserDAO userDAO;
	@Inject
	ScheduleDAO shceduleDAO;
	
	
	
	@RequestMapping(value="groupForm", method=RequestMethod.GET)
	public String groupForm(User user, HttpSession hs, Model model){
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

       }
		//네비게이터에 임시로 값 담는 용도
		int page = 4;
		model.addAttribute("page", page);
		return "group_form";
	}
	
	
	@ResponseBody
	@RequestMapping(value="createProject", method=RequestMethod.POST)
	public String createProject(Project project){
		logger.info("프로젝트 생성 시도 : " + project);
		Project selectProject = null;
		
		
		int result = projectDAO.insertProject(project);
		if( result == 1 ){
			String setP_num = null;
			// 프로젝트 넘버를 불러다가 user정보에 update를 해줘야한다.
			// p_memeber_list에 애들 넣어주기
			logger.info("찾기위한 project:"+project);
			selectProject =  projectDAO.selectProject(project);
			logger.info("selectProject in GroupController : " +selectProject);
			String updateProject = selectProject.getP_num()+"";
			//<---마스터 아이디p_num에 추가--->
			String masterId = selectProject.getP_m_id();
			User updateMUser = userDAO.searchUser(masterId);
			logger.info("updateProject : "+updateProject);
			//업데이트 할 numberlist 붙여 넣음
			
			if(updateMUser.getP_num_list()==null){
				setP_num = updateProject;
			}else{
				setP_num = updateMUser.getP_num_list()+"/"+updateProject;
				
			}
			
			logger.info("setP_num : "+setP_num);
			updateMUser.setP_num_list(setP_num);
			int ressult = userDAO.updateUser_p_num_list(updateMUser);
			logger.info("성공여부 : "+ressult);
			
			//<--구성원 확인-->//
			//프로젝트 불러오기 
			String updateMember = selectProject.getMemberlist();
			logger.info("!!updateMember: "+updateMember);
			String [] updateMamberArr = updateMember.split("/");
			
			
			for(int i =1 ; i<updateMamberArr.length;i++){
				System.out.println("m:"+updateMamberArr[i]);
			}
			
			
			
			User updateUser = null;
			
			String setP_num2 = "";
			
			for(int i =1 ; i<updateMamberArr.length;i++){
				logger.info("m : "+ updateMamberArr[i]);
				updateUser = userDAO.searchUser(updateMamberArr[i]);
				logger.info(updateUser.toString());
				
				
				
				if(updateUser.getP_num_list()==null){
					logger.info("updateProject:=>"+updateProject);
					setP_num2 = updateProject;
				}else{
					logger.info("updateProject2:=>"+updateProject+"updateUserGetP_numList"+updateUser.getP_num_list());
					setP_num2 = updateUser.getP_num_list()+"/"+updateProject;
					
				}
				logger.info("setP_num2 : "+setP_num2);
				updateUser.setP_num_list(setP_num2);
				int result2 = userDAO.updateUser_p_num_list(updateUser);
				logger.info("성공여부 : "+result2);
			}
			
			return "1";
			
		}else{
			return "2";
		}
	}
	
	
	//그룹 일정 페이지
	@RequestMapping(value = "groupCal", method = RequestMethod.GET)
	public String groupCal(HttpSession hs, ModelMap modelMap,HttpServletRequest req, Model model, String groupNum) {
		
		String id = (String) hs.getAttribute("loginedId");
		hs.setAttribute("loginedId", id);
		
		//켈린더 관련
		String p_num = req.getParameter("groupNum");
		logger.info("p_num : " + p_num);
		if(p_num == null){
			p_num = groupNum;
			logger.info("p_num1 : " + p_num);
		}
		ArrayList<Schedule> scheduleListview = shceduleDAO.selectProjectSchedule(p_num);
		logger.info("스케쥴 : " + scheduleListview);
		modelMap.addAttribute("listview", scheduleListview);
		
		//프로젝트매니져, 프로젝트 이름
		Project pj = projectDAO.selectPj(groupNum);
		model.addAttribute("pj", pj);
		hs.setAttribute("pjm", pj.getP_m_id());
		
		int page = 2;
		model.addAttribute("page", page);
		model.addAttribute("p_num",p_num);
		return "group-cal";
	}
	
	
	//그룹 내 멤버 페이지
	@RequestMapping(value = "groupMem", method = RequestMethod.GET)
	public String groupMem(HttpSession hs, ModelMap modelMap,HttpServletRequest req, Model model, String groupNum) {
		
		String p_num = req.getParameter("groupNum");
		logger.info("p_num : " + p_num);
		if(p_num == null){
			p_num = groupNum;
			logger.info("p_num1 : " + p_num);
		}
		
		//일반멤버
		String memberList = projectDAO.memberList(groupNum);
		System.out.println(memberList);
				
		if( memberList != null ){				
			String [] mList = memberList.split("/");
			for(String s : mList){
				System.out.println(s);
			}
			logger.info("memberList : " + mList);
			model.addAttribute("mList", mList);
		}

		//프로젝트매니져, 프로젝트 이름
		Project pj = projectDAO.selectPj(groupNum);
		model.addAttribute("pj", pj);
		
		int page = 3;
		model.addAttribute("page", page);
		model.addAttribute("p_num",p_num);
		return "group-mem";
	}
	
	
	// 그룹 이동
	@RequestMapping(value = "group", method = RequestMethod.GET)
	public String group(HttpSession hs, ModelMap modelMap,HttpServletRequest req, Model model, String groupNum) {
		
		//켈린더 관련
		String p_num = req.getParameter("groupNum");
		logger.info("p_num : " + p_num);
		if(p_num == null){
			p_num = groupNum;
			logger.info("p_num1 : " + p_num);
		}
		ArrayList<Schedule> scheduleListview = shceduleDAO.selectProjectSchedule(p_num);
		logger.info("스케쥴 : " + scheduleListview);
		modelMap.addAttribute("listview", scheduleListview);
		
		//일반멤버
		String memberList = projectDAO.memberList(groupNum);
		System.out.println(memberList);
		
		if( memberList != null ){				
			String [] mList = memberList.split("/");
			for(String s : mList){
				System.out.println(s);
			}
			logger.info("memberList : " + mList);
			model.addAttribute("mList", mList);
		}
		
		//프로젝트매니져, 프로젝트 이름
		Project pj = projectDAO.selectPj(groupNum);
		model.addAttribute("pj", pj);
		
		int page = 1;
		model.addAttribute("page", page);
		
		
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
		
		model.addAttribute("p_master", pj.getP_m_id());
		return "group";
	}
	
	
	//개인 페이지
	@RequestMapping(value="personal",method=RequestMethod.GET)
	public String personal(User user, HttpSession hs, Model model){
		
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
		
		
		//네비게이터에 임시로 값 담는 용도
		int page = 1;
		model.addAttribute("page", page);
		
		return "personal";
	}
	
	
	@RequestMapping(value="personalCalendar",method=RequestMethod.GET)
	public String personalCalendar(User user, HttpSession hs, Model model){
		
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

         }
	      System.out.println(id);
	      ArrayList<Schedule> scheduleListview = shceduleDAO.selectSchedule(id);
	      logger.info("스케쥴 : " + scheduleListview);
	      model.addAttribute("listview", scheduleListview);
		
	      //네비게이터에 임시로 값 담는 용도
	      String personal = "personal";
	      model.addAttribute("personal", personal);
	      int page = 2;
	      model.addAttribute("page", page);

	      return "personal_cal";
	}
	
	
	@RequestMapping(value="fileList_pj", method=RequestMethod.GET)
	public String fileList_pj(int p_num){
		logger.info("해당 프로젝트의 파일 목록 이동 시도 : " + p_num);
		
		return "filelist_pj";
	}
	
	
	@ResponseBody
	@RequestMapping(value="loadFileList_pj", method=RequestMethod.POST)
	public ArrayList<Context> searchProjectFilelist(int p_num){
		logger.info("해당 프로젝트의 파일 목록 검색 시도 : " + p_num);
		
		ArrayList<Context> fileList_pj = projectDAO.searchProjectFilelist(p_num);
		logger.info("해당 프로젝트의 파일 목록 검색 시도 결과 : " + fileList_pj);
		
		return fileList_pj;
	}
	
	
	// 파일리스트에서 아래로 넘어감
	// 새로 읽는 페이지를 만들지 ajax할지 뒤로가기 가능하게할라면 새 페이지
	
	@RequestMapping(value="readFile_project", method=RequestMethod.GET)
	public String readFile_project(Model model, int c_num){
		logger.info("프로젝트의 특정 파일 검색 시도 : " + c_num);
		
		Context context = projectDAO.searchContext(c_num);
		
		model.addAttribute("content", context.getContext());
		System.out.println("~~~~~~~~~~~~~~여기까지 뷰쓰리 진입 전 old ~~~~~~~~~~~~~~");
		
		//채팅 로그
		
		return "view_3";
	}
	
	
	@RequestMapping(value="editFile_project", method=RequestMethod.GET)
	public String editFile_project(Model model, String myId, int c_num){
		logger.info("프로젝트의 특정 파일 검색 시도 : " + c_num);
		
		Context context = projectDAO.searchContext(c_num);
		
		model.addAttribute("content", context.getContext());
		System.out.println("~~~~~~~~~~~~~~여기까지 뷰쓰리 진입 전 old ~~~~~~~~~~~~~~");
		
		//채팅 로그
		
		return "view_3";
	}
	
	
	public int deleteProjectFile(int c_num){
		logger.info("프로젝트의 특정 파일 삭제 시도 : " + c_num);
		
		int result = projectDAO.deleteProjectFile(c_num);
		
		return result;
	}
	
	
	
}//class
