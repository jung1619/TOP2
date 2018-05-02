package global.sesoc.TOPproject.DAO;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import global.sesoc.TOPproject.VO.Context;
import global.sesoc.TOPproject.VO.Memo;
import global.sesoc.TOPproject.VO.User;

public interface UserMapperInterface {

	public int insertUser(User user);
	public int insertFriendList(HashMap<String, String> map);
	public int insertUserMemo(Memo memo);
	public int insertReq(HashMap<String, String> map);
	
	public User searchUser(String id);
	public String searchUserFL(String id);
	public ArrayList<User> searchUserList(String id);
	public List<HashMap<String, String>> searchReqList(HashMap<String, String> map);
	public ArrayList<Context> searchUserFilelist(String id);
	public Context searchContext(int c_num);
	
	public int updateUser(User user);
	public int updateFriendList(HashMap<String, String> map);
	public int updateUserMemo(Memo memo);
	public int updateReq(HashMap<String, String> map);
	
	public int deleteUserMemo(Memo memo);
	public int deleteReq(HashMap<String, String> map);
	
	public int updateUser_p_num_list(User user);
	
}
