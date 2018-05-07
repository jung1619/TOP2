package global.sesoc.TOPproject;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.DAO.ScheduleDAO;
import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.CompleteRateObj;
import global.sesoc.TOPproject.VO.Project;
import global.sesoc.TOPproject.VO.Schedule;
import global.sesoc.TOPproject.VO.User;

@Controller
public class ScheduleController {
	
	@Autowired
	UserDAO userDAO;
	@Autowired
	ProjectDAO projectDAO;
	@Autowired
	ScheduleDAO shceduleDAO;
	
	
	Schedule schedule;

	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	
	//시간의 형식을 바꿔줌   
	public String times(String taskS){
		String reStr = "";
		for (int i = 0; i < taskS.length(); i++) {
			if(taskS.charAt(i) == 'T' || taskS.charAt(i) == '-' || taskS.charAt(i) == ':'){
				reStr += "";
			} else{
				reStr += taskS.charAt(i);
			}
		}
		return reStr;
	}
	
	
	//개인일정 등록
	@RequestMapping(value = "/insertUserSchedule", method = RequestMethod.POST)
	public String insertUserSchedule(Model model, Schedule schedule, HttpSession hs) {
		//String id = (String)hs.getAttribute("loginedId");
		schedule.setStartdate(times(schedule.getStartdate()));
		schedule.setEnddate(times(schedule.getEnddate()));
		int result = shceduleDAO.insertUserSchedule(schedule);
		System.out.println(schedule);
		
		return "redirect:/personalCalendar";
	}
	
	
	//개인일정 수정
	@RequestMapping(value = "/updateUserSchedule", method = RequestMethod.POST)
	public String updateUserSchedule(Model model, Schedule schedule) {

		schedule.setStartdate(times(schedule.getStartdate()));
		schedule.setEnddate(times(schedule.getEnddate()));
		int result = shceduleDAO.updateUserSchedule(schedule);
		logger.info("개인일정 수정 : " + schedule);
		return "redirect:/personalCalendar";
	}
	
	
	//개인일정 삭제
	@RequestMapping(value = "/deleteUserSchedule", method = RequestMethod.POST)
	public String deleteUserSchedule(Model model, Schedule schedule) {

		int result = shceduleDAO.deleteUserSchedule(schedule);
		
		return "redirect:/personalCalendar";
	}
	
	
	//프로젝트 일정을 내 일정으로
	@RequestMapping(value = "/copyUserSchedule", method = RequestMethod.POST)
	public String copyUserSchedule(Model model, Schedule schedule, HttpSession hs, HttpServletRequest req) {
		String groupNum = req.getParameter("groupNum");
		schedule.setStartdate(times(schedule.getStartdate()));
		schedule.setEnddate(times(schedule.getEnddate()));
		int result = shceduleDAO.insertUserSchedule(schedule);
		
		model.addAttribute("p_num",groupNum);
		logger.info("프로젝트 일정을 내 일정으로 : " + schedule);
		return "redirect:groupCal?groupNum="+schedule.getP_num();
	}
	
	
	//프로젝트 일정 추가
	@RequestMapping(value = "/insertProjectSchedule", method = RequestMethod.POST)
	public String insertProjectSchedule(Model model, Schedule schedule, HttpSession hs,HttpServletRequest req) {
		logger.info("그룹스케쥴 등록1 : " + schedule);
		String groupNum = req.getParameter("groupNum");

		schedule.setStartdate(times(schedule.getStartdate()));
		schedule.setEnddate(times(schedule.getEnddate()));
		
		int result = shceduleDAO.insertProjectSchedule(schedule);
		
		model.addAttribute("p_num",groupNum);
		
		return "redirect:groupCal?groupNum="+schedule.getP_num();
	}
	
	
	//그룹일정 수정
	@RequestMapping(value = "/updateProjectSchedule", method = RequestMethod.POST)
	public String updateProjectSchedule(Model model, Schedule schedule, HttpServletRequest req) {
		String groupNum = req.getParameter("groupNum");
		
		schedule.setStartdate(times(schedule.getStartdate()));
		schedule.setEnddate(times(schedule.getEnddate()));
		int result = shceduleDAO.updateProjectSchedule(schedule);
		model.addAttribute("p_num",groupNum);
		logger.info("그룹스케쥴 수정 : " + schedule);
		return "redirect:groupCal?groupNum="+schedule.getP_num();
	}
	
	
	//그룹일정 삭제
	@RequestMapping(value = "/deleteProjectSchedule", method = RequestMethod.POST)
	public String deleteProjectSchedule(Model model, Schedule schedule, HttpServletRequest req) {

		String groupNum = req.getParameter("groupNum");
		
		int result = shceduleDAO.deleteProjectSchedule(schedule);

		model.addAttribute("p_num",groupNum);
		
		return "redirect:groupCal?groupNum="+schedule.getP_num();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "completeRateEachProject", method = RequestMethod.POST)
	public ArrayList<CompleteRateObj> completeRateEachProject(String myId){
		logger.info("-------------------------------------");
		logger.info("회원의 프로젝트별 완성도 조회 : " + myId);
		
		User user = userDAO.searchUser(myId);
		String[] plist = user.getP_num_list().split("/");
		
		ArrayList<CompleteRateObj> list = new ArrayList<>();
		
		for (String string : plist) {
			Project p = projectDAO.searchProject(Integer.parseInt(string));
			CompleteRateObj cro = new CompleteRateObj(p.getName(), completeRate(p.getP_num()));
			list.add(cro);
		}
		
		logger.info("회원의 프로젝트별 완성도 조회 완료 : " + list);
		return list;
	} 
	
	
	@ResponseBody
	@RequestMapping(value = "completeRateForProject", method = RequestMethod.POST)
	public int completeRateForProject(int p_num){
		logger.info("-------------------------------------");
		logger.info("현 프로젝트의 완성도 조회 : " + p_num);
		
		int rate = completeRate(p_num);
		
		logger.info("현 프로젝트의 완성도 조회 완료 : " + rate);
		return rate;
	}
	
	
	@RequestMapping(value = "updateUserComplete", method = RequestMethod.POST)
	public String updateUserComplete(int s_num){
		logger.info("회원 스케쥴 완료 처리 시도");
		
		int result = shceduleDAO.updateUserComplete(s_num);
		
		return "redirect:/personalCalendar";
	}
	
	
	@RequestMapping(value = "updateProjectComplete", method = RequestMethod.GET)
	public String updateProjectComplete(Model model, HttpServletRequest req, int s_num, int p_num){
		logger.info("프로젝트 스케쥴 완료 처리 시도 : " + p_num +"번 프로젝트의 "+ s_num);
		
		int result = shceduleDAO.updateProjectComplete(s_num);
		
		return "redirect:groupCal?groupNum=" + p_num;
	}
	
	
	@RequestMapping(value="selectProjectComplete", method=RequestMethod.GET)
	public int selectProjectComplete(int p_num){
		logger.info("프로젝트 스케쥴 완성도 조회 : " + p_num);
		
		Project pj = projectDAO.searchProject(p_num);
		int per = pj.getCompleterate();
		
		logger.info("프로젝트 스케쥴 완성도 조회 완료 : " + per );
		return per;
	}
	
	
	// 완성도 계산
	public int completeRate(int p_num){
		
		HashMap<String, Integer> map_per = new HashMap<String, Integer>();
		map_per = shceduleDAO.selectProjectComplete(p_num);
		
		int per = (int)((double)((double)map_per.get("count")/(double)map_per.get("length")) * 100);
		logger.info("프로젝트 완성도 계산 : " + per);
		
		return per;
	}
	
	
	
}//class
