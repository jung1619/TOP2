package global.sesoc.TOPproject.DAO;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import global.sesoc.TOPproject.VO.Memo;
import global.sesoc.TOPproject.VO.Schedule;
import global.sesoc.TOPproject.VO.User;

public interface UserMapperInterface {

	public int insertUser(User user);
	public void insertFriendList(HashMap<String, String> map);
	public int insertUserSchedule(Schedule schedule);
	public int insertUserMemo(Memo memo);
	public int insertReq(HashMap<String, String> map);
	
	public User searchUser(String id);
	public ArrayList<Schedule> selectSchedule(String id);
	public String searchUserFL(String id);
	public ArrayList<User> searchUserList(String id);
	public List<HashMap<String, String>> searchReqList(HashMap<String, String> map);
	
	public int updateUser(User user);
	public int updateFriendList(HashMap<String, String> map);
	public int updateUserSchedule(Schedule schedule);
	public int updateUserMemo(Memo memo);
	public int updateReq(HashMap<String, String> map);
	
	public int deleteUserMemo(Memo memo);
	public int deleteUserSchedule(Schedule schedule);
	public int deleteReq(HashMap<String, String> map);
	
	public int updateUser_p_num_list(User user);
	
}
