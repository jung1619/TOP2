package global.sesoc.TOPproject.DAO;
 
import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.TOPproject.VO.Memo;
import global.sesoc.TOPproject.VO.Schedule;
import global.sesoc.TOPproject.VO.User;

public interface UserMapperInterface {

	public int insertUser(User user);
	public void insertFriendList(HashMap<String, String> map);
	public int insertUserSchedule(Schedule schedule);
	public int insertUserMemo(Memo memo);
	
	public User searchUser(String id);
	public ArrayList<Schedule> selectSchedule(String id);
	public String searchUserFL(String id);
	
	public int updateUser(User user);
	public int updateFriendList(HashMap<String, String> map);
	public int updateUserSchedule(Schedule schedule);
	public int updateUserMemo(Memo memo);
	
	public int deleteUserMemo(Memo memo);
	public int deleteUserSchedule(Schedule schedule);
	
	public int updateUser_p_num_list(User user);
	
}
