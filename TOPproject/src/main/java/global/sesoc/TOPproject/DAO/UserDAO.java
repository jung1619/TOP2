package global.sesoc.TOPproject.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.docx4j.docProps.variantTypes.Array;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import global.sesoc.TOPproject.HomeController;
import global.sesoc.TOPproject.VO.Context;
import global.sesoc.TOPproject.VO.Memo;
import global.sesoc.TOPproject.VO.Schedule;
import global.sesoc.TOPproject.VO.User;

@Repository
public class UserDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);
	
	@Inject
	SqlSession sqls;
	
	
	
	// I N S E R T ------------------------------------------------------------------
	
	public int insertUser(User user){
		logger.info("회원 등록 : " + user);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", user.getId());
		map.put("fl", "");
		int result = 0;
		
		try{
			result = mapper.insertUser(user);
			mapper.insertFriendList(map);
			logger.info("회원 등록 성공");
		}catch(Exception e){ logger.info("회원 등록 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	
	public int insertUserMemo(Memo memo){
		logger.info("회원 메모 등록 : " + memo);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.insertUserMemo(memo);
			logger.info("회원 메모 등록 성공");
		}catch(Exception e){ logger.info("회원 메모 등록 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	
	public int insertReq(HashMap<String, String> map){
		logger.info("친구 요청 등록 : " + map);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		int result = 0;
		
		try {
			result = mapper.insertReq(map);
			logger.info("친구 요청 등록 성공");
		} catch (Exception e) { e.printStackTrace(); logger.info("친구 요청 등록 실패"); }
		
		return result;
	}
	
	
	
	// S E L E C T ------------------------------------------------------------------
	
	public User searchUser(String id){
		User user = null;
		logger.info("회원 검색 : " + id);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		
		try{
			user = mapper.searchUser(id);
			logger.info("회원 검색 성공 : " + user);
		}catch(Exception e){ logger.info("회원 검색 실패"); e.printStackTrace(); }
		
		return user;
	}
	
	
	public ArrayList<String> searchUserFL(String id){
		logger.info("친구목록 검색 : " + id);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		String fl = ""; 
		ArrayList<String> list = new ArrayList<>();
		
		try{
			fl = mapper.searchUserFL(id);
			if( fl != null ){				
				String[] slist = fl.split("/");
				
				for(int i=0; i<slist.length; i++){			
					list.add(slist[i]);
				}
			}
			logger.info("친구목록 검색 성공 : " + list);
		}catch(Exception e){ logger.info("친구목록 검색 실패"); e.printStackTrace(); }
		
		return list;
	}
	
	
	public ArrayList<User> searchUserList(String id){
		logger.info("해당 ID의 회원 목록 검색 : " + id);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		ArrayList<User> userList = new ArrayList<User>();
		
		try{
			userList = mapper.searchUserList(id);
			logger.info("해당 ID의 회원 목록 검색 성공 : " + userList);
		}catch(Exception e){ logger.info("해당 ID의 회원 목록 검색 실패"); e.printStackTrace(); }
		
		return userList;
	}
	
	
	public ArrayList<Context> searchUserFilelist(String id){
		logger.info("해당 ID의 파일 목록 검색 : " + id);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		ArrayList<Context> userList = new ArrayList<Context>();
		
		try{
			userList = mapper.searchUserFilelist(id);
			logger.info("해당 ID의 파일 목록 검색 결과 : " + userList);
		}catch(Exception e){ logger.info("해당 ID의 파일 목록 검색 실패"); e.printStackTrace(); }
		
		return userList;
	}
	
	
	public Context searchContext(int c_num){
		logger.info("개인의 특정 파일 검색 : " + c_num);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		Context context = null;
		
		try{
			context = mapper.searchContext(c_num);
			logger.info("개인의 특정 파일 검색 성공 : " + context);
		}catch(Exception e){ logger.info("개인의 특정 파일 검색 실패"); e.printStackTrace(); }
		return context;
	}
	
	
	public List<HashMap<String, String>> searchReqList(HashMap<String, String> map){
		logger.info("친구 요청 목록 조회 : " + map);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		List<HashMap<String, String>> list = null;
		
		try {
			list = mapper.searchReqList(map);
			logger.info("친구 요청 목록 조회 성공 : " + map.get("who")+ " ~ " + list);
		} catch (Exception e) { e.printStackTrace(); logger.info("친구 요청 목록 조회 실패"); }
		
		return list;
	}
	
	
	
	// U P D A T E ------------------------------------------------------------------
	
	//p_num_list에 추가
	public int updateUser_p_num_list(User user){
		int result = 0 ;
		
		logger.info("update : "+ user);
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		try{
			result = mapper.updateUser_p_num_list(user);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public int updateUser(User user){
		logger.info("회원 정보 수정 : " + user);
		int result = 0;
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		try{
			result = mapper.updateUser(user);
			logger.info("회원 정보 수정 성공");
		}catch(Exception e){ logger.info("회원 정보 수정 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int updateFriendList(String myId, String fl){
		logger.info("회원 친구목록 수정 : " + myId + " / " + fl);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);

		/*
		String fList = mapper.searchUserFL(id);
		if(fList.equals("temp")) {
			fList = oldFl;
		}
		else if(fList != null && !(fList.contains(oldFl))) {
			fList += "/" + oldFl;			
		}
		*/

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", myId); map.put("fl", fl);
		int result = 0;
		
		try{
			result = mapper.updateFriendList(map);
			logger.info("회원 친구목록 수정 성공");
		}catch(Exception e){ logger.info("회원 친구목록 수정 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int updateUserMemo(Memo memo){
		logger.info("회원 메모 수정 : " + memo);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.updateUserMemo(memo);
			logger.info("회원 메모 수정 성공");
		}catch(Exception e){ logger.info("회원 메모 수정 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	/*
	public int updateReq(HashMap<String, String> map){
		logger.info("친구 요청 상태 변화 : " + map);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		int result = 0;
		
		try {
			result = mapper.updateReq(map);
			if( result == 0 )
				logger.info("친구 요청 상태 변화 실패 " + result);
			else
				logger.info("친구 요청 상태 변화 성공 " + result);
		} catch (Exception e) { e.printStackTrace(); logger.info("친구 요청 상태 변화 실패"); }
		
		return result;
	}
	*/
	
	
	// D E L E T E ------------------------------------------------------------------
	
	public int deleteUserMemo(Memo memo){
		logger.info("회원 메모 삭제 : " + memo);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.deleteUserMemo(memo);
			logger.info("회원 메모 삭제 성공");
		}catch(Exception e){ logger.info("회원 메모 삭제 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	
	public int deleteReq(HashMap<String, String> map){
		logger.info("받은 친구 요청 삭제 : " + map);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		int result = 0;
		
		try {
			result = mapper.deleteReq(map);
			logger.info("받은 친구 요청 삭제 성공");
		} catch (Exception e) { e.printStackTrace(); logger.info("친구 요청 삭제 실패"); }
		
		return result;
	}
	
		
	
}//class
