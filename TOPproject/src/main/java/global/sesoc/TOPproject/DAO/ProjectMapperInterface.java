package global.sesoc.TOPproject.DAO;
 
import java.util.ArrayList;

import global.sesoc.TOPproject.VO.Context;
import global.sesoc.TOPproject.VO.Memo;
import global.sesoc.TOPproject.VO.Notice;
import global.sesoc.TOPproject.VO.Project;

public interface ProjectMapperInterface {

	public int insertProject(Project project);
	public int insertProjectNotice(Memo memo);
	
	public Project searchProject(int p_num);
	public Context searchContext(int p_num);
	public ArrayList<Context> fileList_pj(int p_num);
	
	public int updateProject(Project project);
	public int updateProjectNotice(Memo memo);
	
	public int deleteProjectNotice(Memo memo);
	
	//공지리스트불러오기
	public ArrayList<Notice> noticeList(String p_num);
	
	//멤버리스트불러오기
	public String memberList(String p_num);
	
	//PM 불러오기
	public Project selectPj(String p_num);
	
	//context저장
	public void upDateContext(Context context);
	
	//context 불러오기
	public Context selectContext(String p_num);
	
	//context 생성
	public void insertContext(Context context);
	
	//Projectselect
	public Project selectProject(Project beforeProject);
	
	//Notice Select
	public Notice selectNotice(String p_num);
	
	//insert Notice
	public int insertNotice(Notice notice);
	
	
	
}
