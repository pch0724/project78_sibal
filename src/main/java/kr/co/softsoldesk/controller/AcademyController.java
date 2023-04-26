package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.DepartmentBean;
import kr.co.softsoldesk.beans.GradeBean;
import kr.co.softsoldesk.beans.GradeDTO;
import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.beans.ProfessorBean;
import kr.co.softsoldesk.beans.StudentBean;
import kr.co.softsoldesk.service.GradeService;
import kr.co.softsoldesk.service.MemberService;
import kr.co.softsoldesk.service.TimeTableService;

@RequestMapping("/academy")
@Controller
public class AcademyController {
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private GradeService gradeService;
	
	@Autowired
	private TimeTableService timeTableService;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean;
	
	//메인
	@GetMapping("/index")
	public String academy_index(Model model) {
		// 권한 구분
		int r_id = loginMemberBean.getR_id();
		model.addAttribute("r_id", r_id);
		
		return "academy/index";
	}
	
	//학적정보
	//개인정보수정
	@GetMapping("/personal_info")
	public String academy_personal_info(@ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean, Model model){
		
		// 권한 구분
		int r_id = loginMemberBean.getR_id();		
		model.addAttribute("r_id", r_id);
		
		MemberBean tempModifyMemberBean = memberService.getModifyMemberInfo(loginMemberBean.getID());
			
		if(tempModifyMemberBean.getR_id() == 2) {
			ProfessorBean proBean = memberService.getProfessorInfo(loginMemberBean.getID());
			String D_Name = memberService.getDepartmentName(proBean.getDepartment_ID());	
			modifyMemberBean.setD_ID(proBean.getDepartment_ID());
			modifyMemberBean.setD_Name(D_Name);
			
		}else if(tempModifyMemberBean.getR_id() == 3){
			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			String D_Name = memberService.getDepartmentName(stdBean.getDepartment_ID());	
			
			modifyMemberBean.setSemester(stdBean.getSemester());
			modifyMemberBean.setGrade(stdBean.getGrade());
			modifyMemberBean.setD_ID(stdBean.getDepartment_ID());
			modifyMemberBean.setD_Name(D_Name);
						
		}
				
		modifyMemberBean.setID(tempModifyMemberBean.getID());
		modifyMemberBean.setName(tempModifyMemberBean.getName());
		modifyMemberBean.setPassword(tempModifyMemberBean.getPassword());
		modifyMemberBean.setBirth_Date(tempModifyMemberBean.getBirth_Date());
		modifyMemberBean.setAddress(tempModifyMemberBean.getAddress());
		modifyMemberBean.setEntrance_Date(tempModifyMemberBean.getEntrance_Date());
		modifyMemberBean.setPhone_num(tempModifyMemberBean.getPhone_num());
		modifyMemberBean.setEmergency_Contact(tempModifyMemberBean.getEmergency_Contact());
		modifyMemberBean.setEmail(tempModifyMemberBean.getEmail());
		modifyMemberBean.setMember_file(tempModifyMemberBean.getMember_file());
		return "academy/personal_info";
	}
	
	@PostMapping("/personal_info_pro")
	public String personal_info_pro(@Valid @ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean, BindingResult result) {
		
		if(result.hasErrors()) {
			
			return "academy/personal_info";
		}
		memberService.modifyMemberInfo(modifyMemberBean);
		
		return "academy/personal_info_success";
	}
	
	//수업
	//수강신청현황
	@GetMapping("/enrollment")
	public String academy_enrollment(Model model) {
		// 권한 구분
		int r_id = loginMemberBean.getR_id();		
		model.addAttribute("r_id", r_id);
		
		return "academy/enrollment";
	}

	// 시간표 조회
	@GetMapping("/timetable")
	public String academy_timetable(@ModelAttribute("getTimeTableinfo") MemberBean getTimeTable,
			@ModelAttribute(name = "getTimeTableUserInfo") LectureBean timeTableUserInfo, Model model) {

		// 권한 구분
		int r_id = loginMemberBean.getR_id();
		model.addAttribute("r_id", r_id);

		timeTableService.timeTableUserInfo(getTimeTable);

		List<LectureBean> getTimeTableUserInfo = timeTableService.allTimeTableInfo(model);
		model.addAttribute("getTimeTableUserInfo", getTimeTableUserInfo);
		for (LectureBean lecture : getTimeTableUserInfo) {
			System.out.println(lecture.getLec_id());
			System.out.println(lecture.getLec_name());
			System.out.println(lecture.getCompletion());
			System.out.println(lecture.getCredits());
			System.out.println(lecture.getDayOftheWeek());
			System.out.println(lecture.getStarttime());
			System.out.println(lecture.getEndtime());
			System.out.println(lecture.getR_id());

		}

		return "academy/timetable";
	}
	
	   @GetMapping("/timetable_pro")
	   public String academy_timetable_pro(@Valid @ModelAttribute("getTimeTableinfo") MemberBean getTimeTable, BindingResult result) {
	      if(result.hasErrors()) {
	         return "academy/timetable";
	      }
	      
	      timeTableService.timeTableUserInfo(getTimeTable);
	      
	      return "academy/timetable_success";
	   }
	//성적
	// 금학기 성적조회
	@GetMapping("/grade_check")
	public String academy_grade_check(@ModelAttribute(name = "getInfoMemberBean2") GradeDTO getInfoMemberBean2,
			Model model) {
		// 권한
		int r_id = loginMemberBean.getR_id();		
		model.addAttribute("r_id", r_id);

		
		gradeService.getMemberInfo2(getInfoMemberBean2);
		List<GradeBean> getGradeCheckInfo = gradeService.getGradeCheckInfo2(model);
		model.addAttribute("getGradeCheckInfo", getGradeCheckInfo);
		for (GradeBean grade : getGradeCheckInfo) {
			System.out.println(grade.getLec_name());
			System.out.println(grade.getName());
			System.out.println(grade.getCompletion());
			System.out.println(grade.getCredits());
			System.out.println(grade.getAt_score());
			System.out.println(grade.getM_score());
			System.out.println(grade.getF_score());
			System.out.println(grade.getA_score());
			System.out.println(grade.getGrade());
		}
		return "academy/grade_check";
	}

	//전체 성적조회
	@GetMapping("/all_grade_check")
	public String academy_all_grade_check(Model model) {
		// 권한
		int r_id = loginMemberBean.getR_id();		
		model.addAttribute("r_id", r_id);

		
		return "academy/all_grade_check";
	}
	//전체 성적조회
	@GetMapping("/grade_input")
	public String academy_grade_input(Model model) {
		// 권한
		int r_id = loginMemberBean.getR_id();		
		model.addAttribute("r_id", r_id);

		
		return "academy/grade_input";
	}
	
}
