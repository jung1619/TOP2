package global.sesoc.TOPproject.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import global.sesoc.TOPproject.VO.Schedule;

@Repository
public class ScheduleDAO {
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);
	
	@Inject
	SqlSession sqls;

	
	
	/* USER */
	
	public int insertUserSchedule(Schedule schedule){
		logger.info("회원 스케쥴 등록 : " + schedule);
		
		ScheduleMapperInterface mapper = sqls.getMapper(ScheduleMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.insertUserSchedule(schedule);
			logger.info("회원 스케쥴 등록 성공");
		}catch(Exception e){ logger.info("회원 스케쥴 등록 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	
	public ArrayList<Schedule> selectSchedule(String id){
		ArrayList<Schedule> schedule = new ArrayList<Schedule>();
		try {
			ScheduleMapperInterface mapper = sqls.getMapper(ScheduleMapperInterface.class);
			schedule = mapper.selectSchedule(id);
			logger.info("회원 스케쥴 리스트 : " + schedule);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return schedule;
	}
	
	
	public int updateUserSchedule(Schedule schedule){
		logger.info("회원 스케쥴 수정 : " + schedule);
		
		ScheduleMapperInterface mapper = sqls.getMapper(ScheduleMapperInterface.class);
		int result = 0;
		
		try{
			mapper.updateUserSchedule(schedule);
			logger.info("회원 스케쥴 수정 성공");
		}catch(Exception e){ logger.info("회원 스케쥴 수정 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int deleteUserSchedule(Schedule schedule){
		logger.info("회원 스케쥴 삭제 : " + schedule);
		
		ScheduleMapperInterface mapper = sqls.getMapper(ScheduleMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.deleteUserSchedule(schedule);
			logger.info("회원 스케쥴 삭제 성공");
		}catch(Exception e){ logger.info("회원 스케쥴 삭제 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	
	public int updateUserComplete(int complete){
		logger.info("회원 스케쥴 완료 처리 : " + complete);
		
		ScheduleMapperInterface mapper = sqls.getMapper(ScheduleMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.updateUserComplete(complete);
			logger.info("회원 스케쥴 완료 처리 성공");
		}catch(Exception e){ logger.info("회원 스케쥴 완료 처리 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	
	
	/* PROJECT */
	
	public int insertProjectSchedule(Schedule schedule){
		logger.info("프로젝트 스케쥴 등록 : " + schedule);
		
		ScheduleMapperInterface mapper = sqls.getMapper(ScheduleMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.insertProjectSchedule(schedule);
			logger.info("프로젝트 스케쥴 등록 성공");
		}catch(Exception e){ logger.info("프로젝트 스케쥴 등록 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int updateProjectSchedule(Schedule schedule){
		logger.info("프로젝트 스케쥴 수정 : " + schedule);
		
		ScheduleMapperInterface mapper = sqls.getMapper(ScheduleMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.updateProjectSchedule(schedule);
			logger.info("프로젝트 스케쥴 수정 성공");
		}catch(Exception e){ logger.info("프로젝트 스케쥴 수정 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int deleteProjectSchedule(Schedule schedule){
		logger.info("프로젝트 스케쥴 삭제 : " + schedule);
		
		ScheduleMapperInterface mapper = sqls.getMapper(ScheduleMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.deleteProjectSchedule(schedule);
			logger.info("프로젝트 스케쥴 삭제 성공");
		}catch(Exception e){ logger.info("프로젝트 스케쥴 삭제 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public ArrayList<Schedule> selectProjectSchedule(String p_num){
		System.out.println(p_num);
		ArrayList<Schedule> schedule = new ArrayList<Schedule>();
		
		ScheduleMapperInterface mapper = sqls.getMapper(ScheduleMapperInterface.class);
		
		try{
			schedule = mapper.selectProjectSchedule(p_num);
			logger.info(p_num + " 프로젝트 스케쥴 리스트 ");
		}catch(Exception e){
			
			logger.info("프로젝트 불러오기 실패");
			e.printStackTrace();
		}
		
		return  schedule;
	}
	
	
	public int updateProjectComplete(HashMap<String, Integer> map){
		logger.info("프로젝트 스케쥴 완료 처리 : " + map);
		
		ScheduleMapperInterface mapper = sqls.getMapper(ScheduleMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.updateProjectComplete(map);
			logger.info("프로젝트 스케쥴 완료 처리 성공");
		}catch(Exception e){ logger.info("프로젝트 스케쥴 완료 처리 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	
	public HashMap<String, Integer> selectProjectComplete(int p_num){
		logger.info("프로젝트 스케쥴 완료된 거 몇개냐 : " + p_num);
		
		ScheduleMapperInterface mapper = sqls.getMapper(ScheduleMapperInterface.class);
		ArrayList<Schedule> list = new ArrayList<Schedule>();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int count = 0; int length = 0;
		
		try{
			list = mapper.selectProjectComplete(p_num);
			length = list.size();
			
			for (Schedule schedule : list) {
				if( schedule.getComplete() == 1 )
					count++;
			}
			
			map.put("length", length); map.put("count", count);
			
			logger.info("프로젝트 스케쥴 완료 처리 성공 : " + map);
		}catch(Exception e){ logger.info("프로젝트 스케쥴 완료 처리 실패"); e.printStackTrace(); }
		
		return map;
	}
	
	
	
}//class
