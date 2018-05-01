package global.sesoc.TOPproject.DAO;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.TOPproject.HomeController;
import global.sesoc.TOPproject.VO.Context;
import global.sesoc.TOPproject.VO.Memo;
import global.sesoc.TOPproject.VO.Notice;
import global.sesoc.TOPproject.VO.Project;

@Repository
public class ProjectDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	SqlSession sqls;
	
	
	
	// I N S E R T ------------------------------------------------------------------
	
	public int insertNotice(Notice notice){
		int result = 0;
		logger.info("insertNotice in Dao : " + notice);
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		
		try{
			result = mapper.insertNotice(notice);
		}catch(Exception e){ e.printStackTrace(); }
		return result;
	}
	
	
	public void insertContext(Context context){
		logger.info("context생성 = "+context);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		
		try{
			mapper.insertContext(context);
		}catch(Exception e){ e.printStackTrace(); }
	}
	
	
	public int insertProject(Project project){
		logger.info("프로젝트 생성 : " + project);
		Project selectProject   = null;
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.insertProject(project);
			logger.info("프로젝트 생성 성공");
		}catch(Exception e){ logger.info("프로젝트 생성 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int insertProjectNotice(Memo memo){
		logger.info("프로젝트 공지 등록 : " + memo);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.insertProjectNotice(memo);
			logger.info("프로젝트 공지 등록 성공");
		}catch(Exception e){ logger.info("프로젝트 공지 등록 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	
	// U P D A T E ------------------------------------------------------------------
	
	public int updateProject(Project project){
		logger.info("프로젝트 수정 : " + project);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.updateProject(project);
			logger.info("프로젝트 수정 성공");
		}catch(Exception e){ logger.info("프로젝트 수정 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int updateProjectNotice(Memo memo){
		logger.info("프로젝트 공지 수정 : " + memo);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.updateProjectNotice(memo);
			logger.info("프로젝트 공지 수정 성공");
		}catch(Exception e){ logger.info("프로젝트 공지 수정 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public void upDateContext(Context context){
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
			
		try{
			mapper.upDateContext(context);
			logger.info("작업내용 저장 성공(임시) : " + context + "/n" 
					+ "-----------------------------------------------------------------------------------------------");
		}catch(Exception e){ e.printStackTrace(); }

	}
	
	
	
	// D E L E T E ------------------------------------------------------------------
	
	public int deleteProjectNotice(Memo memo){
		logger.info("프로젝트 공지 삭제 : " + memo);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.deleteProjectNotice(memo);
			logger.info("프로젝트 공지 삭제 성공");
		}catch(Exception e){ logger.info("프로젝트 공지 삭제 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	
	//S E L E C T ------------------------------------------------------------------
	
	public Context selectContext(String p_num){
		Context result_context=null;
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		
		try{
			result_context = mapper.selectContext(p_num);
			logger.info("selectContext in DAO : " +result_context);
		}catch(Exception e){ e.printStackTrace(); }
		
		return result_context; 
	}
	
	
	public ArrayList<Notice> noticeList(String p_num){
		System.out.println(p_num);
		ArrayList<Notice> n_list = null;
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		
		
		try{
			n_list = mapper.noticeList(p_num);
			logger.info("공지 불러오기 성공");
		}catch(Exception e){
			
			logger.info("공지리스트 불러오기 실패");
			e.printStackTrace();
		}
		
		return  n_list;
	}
	
	
	public String memberList(String p_num){
		String p_memberList = "";
		
		logger.info("DAO p_num : "+p_num);
		ProjectMapperInterface mapper=  sqls.getMapper(ProjectMapperInterface.class);
		
		try{
			p_memberList = mapper.memberList(p_num);
			logger.info("DAO p_memberList : "+p_memberList);
		}catch(Exception e){
			logger.info("memberList불러오기 실패");
			e.printStackTrace();
		}
		
		return p_memberList;			
	}
	
	
	public Project selectPj(String p_num){
		Project pj = new Project();
		
		logger.info("DAO p_num : "+p_num);
		ProjectMapperInterface mapper=  sqls.getMapper(ProjectMapperInterface.class);
		
		try{
			pj = mapper.selectPj(p_num);
			logger.info("DAO pm : "+ pj);
		}catch(Exception e){
			logger.info("pm 불러오기 실패");
			e.printStackTrace();
		}
		return pj;
	}
	
	
	public Project selectProject(Project beforeProject){
		Project selectProject=  null;
		
		logger.info("selectProject  beforeProject:" + beforeProject);
		ProjectMapperInterface mapper  = sqls.getMapper(ProjectMapperInterface.class);
		try {
			selectProject = mapper.selectProject(beforeProject);
			
		}catch(Exception e){
			e.printStackTrace();
			logger.info("selectProject 실패");
		}
		
		return selectProject;
	}
	
	
	public Project searchProject(int p_num){
		logger.info("프로젝트 검색 : " + p_num);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		Project project = null;
		
		try{
			project = mapper.searchProject(p_num);
			logger.info("프로젝트 스케쥴 검색 성공 : " + project);
		}catch(Exception e){ logger.info("프로젝트 스케쥴 검색 실패"); e.printStackTrace(); }
		return project;
	}
	
	
	public Context searchContext(int p_num){
		logger.info("작업내용 검색(임시) : " + p_num);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		Context context = null;
		
		try{
			context = mapper.searchContext(p_num);
			logger.info("작업내용 검색(임시) 성공 : " + context);
		}catch(Exception e){ logger.info("작업내용 검색(임시) 실패"); e.printStackTrace(); }
		return context;
	}
	
	
	public Notice selectNotice(String p_num){
		Notice notice = null;
		ProjectMapperInterface mapper  = sqls.getMapper(ProjectMapperInterface.class);
		
		try{
			notice =mapper.selectNotice(p_num); 
		}catch(Exception e){ e.printStackTrace(); }
		
		return notice;
	}
	
	
	public ArrayList<Context> fileList_pj(int p_num){
		logger.info("프로젝트별 파일 목록 조회 : " + p_num);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		ArrayList<Context> context = new ArrayList<>();
		
		try{
			context = mapper.fileList_pj(p_num);
			logger.info("프로젝트별 파일 목록 조회 성공 : " + context);
		}catch(Exception e){ logger.info("프로젝트별 파일 목록 조회 실패"); e.printStackTrace(); }
		return context;
	}
	

	
}//class
