package global.sesoc.TOPproject.DAO;

import java.util.ArrayList;

import global.sesoc.TOPproject.VO.Schedule;

public interface ScheduleMapperInterface {

	
	/* USER  */
	public int insertUserSchedule(Schedule schedule);
	public int updateUserSchedule(Schedule schedule);
	public int deleteUserSchedule(Schedule schedule);
	public ArrayList<Schedule> selectSchedule(String id);
	public int updateUserComplete(int complete);
	
	
	/* PROJECT  */
	public int insertProjectSchedule(Schedule schedule);
	public int updateProjectSchedule(Schedule schedule);
	public int deleteProjectSchedule(Schedule schedule);
	public ArrayList<Schedule> selectProjectSchedule(String p_num);
	public int updateProjectComplete(int complete);
	public ArrayList<Schedule> selectProjectComplete(int p_num);

	
	
}
