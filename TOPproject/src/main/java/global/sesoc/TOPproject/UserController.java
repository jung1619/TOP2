package global.sesoc.TOPproject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.docx4j.docProps.variantTypes.Array;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.Context;
import global.sesoc.TOPproject.VO.Notice;
import global.sesoc.TOPproject.VO.Project;
import global.sesoc.TOPproject.VO.User;

@Controller
public class UserController {
	
	private final static Logger logger= LoggerFactory.getLogger(UserController.class);
	

	@Inject
	UserDAO uDao;
	@Inject
	ProjectDAO pDao;
	
	
	// 가입 시 중복 체크
	@ResponseBody
	@RequestMapping(value="CheckIdEmail",method=RequestMethod.POST)
	public String userNameCheck(String idEmail){
		logger.info("idEmail : "+ idEmail);
		
		User user = uDao.searchUser(idEmail);
		
		if( user != null ) return "1";
		else return "2";
	}
	
	// 회원가입
	@ResponseBody
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(User user){
		logger.info("회원 가입 시도 : " + user);
		
		int result = uDao.insertUser(user);
		
		return "home";
	}
	
	
	
	/* 친구검색
	@ResponseBody
	@RequestMapping(value = "idSearch", method = RequestMethod.POST)
	public String idSearch(String searchId, HttpSession session) {
		logger.info("친구검색 시도 : " + searchId);
		User user = uDao.searchUser(searchId);
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
		
	}
	
	//친구추가
	@ResponseBody
	@RequestMapping(value = "friendAdd", method = RequestMethod.POST)
	public String friendAdd(String searchId, HttpSession session) {
		logger.info("친구추가 시도 : " + searchId);

		String sessionId = (String) session.getAttribute("loginedId");
		logger.info(sessionId);
		logger.info(searchId);
		
		
		uDao.updateFriendList(sessionId, searchId);
		
		//친구목록꺼내기
		String fList = uDao.searchUserFL(sessionId);
		System.out.println(fList);
//			String [] friendList = fList.split("/");
//			for(String f : friendList) {
//				System.out.println(f);
//			}
		logger.info(fList);
		logger.info("친구추가 종료 : " + searchId);
		
		
		return fList;
	}*/
		
		
		
		
	
	
	@ResponseBody
	@RequestMapping(value="loadFL", method=RequestMethod.POST)
	public ArrayList<String> loadFL(String myId){
		System.out.println("---------------------------------------------");
		logger.info("친구목록 조회 : " + myId);
		
		ArrayList<String> myList = uDao.searchUserFL(myId);

		if( !(myList.isEmpty()) )						
			return myList;
		else return null;
	}
	
	
	@ResponseBody
	@RequestMapping(value="searchUserList", method=RequestMethod.POST)
	public ArrayList<User> searchUserList(String id){
		logger.info("해당 ID의 회원 목록 검색 시도 : " + id);
		
		ArrayList<User> userList = uDao.searchUserList(id);
		
		logger.info("해당 ID의 회원 목록 검색 종료 : " + userList);
		return userList;
	}
	
	
	@ResponseBody
	@RequestMapping(value="insertReq", method=RequestMethod.POST)
	public void insertReq(String myId, String herId){ 
		logger.info("친구 요청 시도 : " + myId + " / " + herId);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("requester", myId); map.put("receiver", herId);
		int result = uDao.insertReq(map);
		
		logger.info("친구 요청 등록 시도  종료");
	}
	
	/*
	@ResponseBody
	@RequestMapping(value="updateReq", method=RequestMethod.POST)
	public void updateReq(String myId, String herId, String flag){ 
		logger.info("친구 요청 상태 변화 시도 : " + myId + " / " + herId + " / " + flag);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("requester", herId); map.put("receiver", myId); map.put("check_req", flag);
		
		int result = uDao.updateReq(map);
		logger.info("친구 요청 상태 변화 시도 종료");
		
		if( map.get("flag").equals("1") ){ // 수락
			// 친구 추가
			
		}else if( map.get("flag").equals("2") ){ // 거절
			// 요청 삭제
		}
	}
	*/
	
	@ResponseBody
	@RequestMapping(value="deleteReq", method=RequestMethod.POST)
	public void deleteReq(String myId, String herId){ 
		logger.info("받은 친구 요청 거절 시도 : " + myId + " / " + herId);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("requester", herId); map.put("receiver", myId);
		
		int result = uDao.deleteReq(map);
		logger.info("받은 친구 요청 거절 시도 종료");
	}
	
	
	@ResponseBody
	@RequestMapping(value="addFriend", method=RequestMethod.POST)
	public void addFriend(String myId, String herId){ 
		logger.info("받은 친구 요청 수락 시도 : " + myId + " / " + herId);
		
		ArrayList<String> myList = uDao.searchUserFL(myId);
		ArrayList<String> herList = uDao.searchUserFL(herId);
		String myfl = null, herfl = null;

		for (String string : myList) {
			myfl += string +"/";
		}
		for (String string : herList) {
			herfl += string +"/";
		}
		
		int myResult = uDao.updateFriendList(myId, myfl);
		int herResult = uDao.updateFriendList(myId, herfl);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("requester", herId); map.put("receiver", myId);
		uDao.deleteReq(map);
		
		logger.info("받은 친구 요청 수락 시도 종료");
	}
	
	
	@ResponseBody
	@RequestMapping(value="searchReqList", method=RequestMethod.POST)
	public List<HashMap<String, String>> searchReq(String who, String myId){
		logger.info("친구 요청 목록 조회 시도 ");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("who", who); map.put("myId", myId);
		
		List<HashMap<String, String>> reqList = uDao.searchReqList(map);
		
		return reqList;
	}
	
	
	@ResponseBody
	@RequestMapping(value="deleteFriend", method=RequestMethod.POST)
	public void deleteFriend(String myId, String herId){ 
		logger.info("친구 삭제 시도 : " + myId + " / " + herId);
		
		ArrayList<String> myList = uDao.searchUserFL(myId);
		ArrayList<String> herList = uDao.searchUserFL(herId);
		String myfl = null, herfl = null;

		for(int i=0; i<=myList.size(); i++){			
			if( myList.get(i).equals(herId) )
				myList.remove(herId);
			else
				myfl += myList.get(i) +"/";
		}
		for(int i=0; i<=herList.size(); i++){			
			if( herList.get(i).equals(myId) )
				herList.remove(myId);
			else
				herfl += herList.get(i) +"/";
		}
		
		int myResult = uDao.updateFriendList(myId, myfl);
		int herResult = uDao.updateFriendList(myId, herfl);
		
		logger.info("친구 삭제 시도 종료");
	}
	
	
	
	// F I L E ------------------------------------------------------------------
	
	@RequestMapping(value="fileList_ps", method=RequestMethod.GET)
	public String fileList_ps(User user, HttpSession hs, Model model, String myId){
		logger.info("해당 ID의 파일 목록 이동 시도 : " + myId);

		User loginedUser = uDao.searchUser(myId);
			
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
				selectProject = pDao.searchProject(parse_p_num);
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
		int page = 5;
		model.addAttribute("page", page);
				
		return "filelist_ps";
	}
	
	
	@ResponseBody
	@RequestMapping(value="loadFileList_ps", method=RequestMethod.POST)
	public ArrayList<Context> searchUserFilelist(String myId){
		logger.info("해당 ID의 파일 목록 검색 시도 : " + myId);
		
		ArrayList<Context> fileList_ps = uDao.searchUserFilelist(myId);
		logger.info("해당 ID의 파일 목록 검색 시도 결과 : " + fileList_ps);
		
		return fileList_ps;
	}
	
	
	@RequestMapping(value="readFile_user", method=RequestMethod.GET)
	public String readFile_user(Model model, int c_num){
		logger.info("개인의 특정 파일 검색 시도 : " + c_num);
		
		Context context = uDao.searchContext(c_num);
		
		model.addAttribute("content", context.getContext());
		System.out.println("~~~~~~~~~~~~~~여기까지 뷰쓰리 진입 전 old ~~~~~~~~~~~~~~");
		
		return "personalEditor";
	}
	
	
	
	
	
	
}//class
