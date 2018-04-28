package global.sesoc.TOPproject;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.Project;
import global.sesoc.TOPproject.VO.User;

@Controller
public class GroupController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@Inject
	ProjectDAO pDao;
	@Inject
	UserDAO uDao;
	
	
	
	@RequestMapping(value="groupForm", method=RequestMethod.GET)
	public String groupForm(String id){
		
		return "group_form";
	}
	
	
	@ResponseBody
	@RequestMapping(value="loadFL", method=RequestMethod.GET)
	public String[] loadFL(String id){
		logger.info("친구목록 조회 : " + id);
		
		String fl = uDao.searchUserFL(id);
		String[] list = fl.split("/");
		
		logger.info("친구목록 조회 결과 : " + list);
		return list;
	}
	
	
	@ResponseBody
	@RequestMapping(value="createProject", method=RequestMethod.POST)
	public String createProject(Project project){
		logger.info("프로젝트 생성 시도 : " + project);
		Project selectProject = null;
		
		
		int result = pDao.insertProject(project);
		if( result == 1 ){
			String setP_num = null;
			// 프로젝트 넘버를 불러다가 user정보에 update를 해줘야한다.
			// p_memeber_list에 애들 넣어주기
			logger.info("찾기위한 project:"+project);
			selectProject =  pDao.selectProject(project);
			logger.info("selectProject in GroupController : " +selectProject);
			String updateProject = selectProject.getP_num()+"";
			//<---마스터 아이디p_num에 추가--->
			String masterId = selectProject.getP_m_id();
			User updateMUser = uDao.searchUser(masterId);
			logger.info("updateProject : "+updateProject);
			//업데이트 할 numberlist 붙여 넣음
			
			if(updateMUser.getP_num_list()==null){
				setP_num = updateProject;
			}else{
				setP_num = updateMUser.getP_num_list()+"/"+updateProject;
				
			}
			
			logger.info("setP_num : "+setP_num);
			updateMUser.setP_num_list(setP_num);
			int ressult = uDao.updateUser_p_num_list(updateMUser);
			logger.info("성공여부 : "+ressult);
			
			//<--구성원 확인-->//
			//프로젝트 불러오기 
			String updateMember = selectProject.getP_memberlist();
			logger.info("!!updateMember: "+updateMember);
			String [] updateMamberArr = updateMember.split("/");
			
			
			for(int i =1 ; i<updateMamberArr.length;i++){
				System.out.println("m:"+updateMamberArr[i]);
			}
			
			
			
			User updateUser = null;
			
			String setP_num2 = "";
			
			for(int i =1 ; i<updateMamberArr.length;i++){
				logger.info("m : "+ updateMamberArr[i]);
				updateUser = uDao.searchUser(updateMamberArr[i]);
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
				int result2 = uDao.updateUser_p_num_list(updateUser);
				logger.info("성공여부 : "+result2);
			}
			
			
			
			return "1";
			
		}else{
			return "2";
		}
		
	//	return "group";
	}
	
	
	
}//class
