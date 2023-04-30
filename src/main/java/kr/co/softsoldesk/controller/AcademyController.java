package kr.co.softsoldesk.controller;

import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.DepartmentBean;
import kr.co.softsoldesk.beans.GradeBean;
import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.beans.ProfessorBean;
import kr.co.softsoldesk.beans.StudentBean;
import kr.co.softsoldesk.dao.LectureDao;
import kr.co.softsoldesk.service.EvaluationService;
import kr.co.softsoldesk.service.GradeService;
import kr.co.softsoldesk.service.MemberService;
import kr.co.softsoldesk.service.TimeTableService;

@RequestMapping("/academy")
@Controller
public class AcademyController {
	
	@Autowired
	private LectureDao lectureDao;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private GradeService gradeService;
	
	@Autowired
	private EvaluationService evaluationService;
	
	@Autowired
	private TimeTableService timeTableService;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean;
	
	//메인
	@GetMapping("/index")
	public String academy_index(Model model) {
	
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		if(r_ID == 3) {
			
			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			int grade = stdBean.getGrade();
			int s_semester = stdBean.getS_semester();
			
			model.addAttribute("grade", grade);
			model.addAttribute("s_semester", s_semester);		
		}
		
		return "academy/index";
	}
	
	//학적정보
	//개인정보수정
	@GetMapping("/personal_info")
	public String academy_personal_info(@ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean, Model model){
		
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		if(r_ID == 3) {
			
			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			int grade = stdBean.getGrade();
			int s_semester = stdBean.getS_semester();
			
			model.addAttribute("grade", grade);
			model.addAttribute("s_semester", s_semester);		
		}
		
		MemberBean tempModifyMemberBean = memberService.getModifyMemberInfo(loginMemberBean.getID());
			
		if(tempModifyMemberBean.getR_ID() == 2) {
			ProfessorBean proBean = memberService.getProfessorInfo(loginMemberBean.getID());
			String D_Name = memberService.getDepartmentName(proBean.getD_ID());	
			modifyMemberBean.setD_ID(proBean.getD_ID());
			modifyMemberBean.setD_name(D_Name);
			
		}else if(tempModifyMemberBean.getR_ID() == 3){
			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			String D_Name = memberService.getDepartmentName(stdBean.getD_ID());	
			
			modifyMemberBean.setS_semester(stdBean.getS_semester());
			modifyMemberBean.setGrade(stdBean.getGrade());
			modifyMemberBean.setD_ID(stdBean.getD_ID());
			modifyMemberBean.setD_name(D_Name);
						
		}
				
		modifyMemberBean.setID(tempModifyMemberBean.getID());
		modifyMemberBean.setName(tempModifyMemberBean.getName());
		modifyMemberBean.setPassword(tempModifyMemberBean.getPassword());
		modifyMemberBean.setBirth(tempModifyMemberBean.getBirth());
		modifyMemberBean.setAddress(tempModifyMemberBean.getAddress());
		modifyMemberBean.setEntrance(tempModifyMemberBean.getEntrance());
		modifyMemberBean.setPhone(tempModifyMemberBean.getPhone());
		modifyMemberBean.setEmergency(tempModifyMemberBean.getEmergency());
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
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		if(r_ID == 3) {
			
			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			int grade = stdBean.getGrade();
			int s_semester = stdBean.getS_semester();
			
			model.addAttribute("grade", grade);
			model.addAttribute("s_semester", s_semester);		
		}

		
		return "academy/enrollment";
	}

	// 시간표 조회
	   @GetMapping("/timetable")
	   public String academy_timetable(@ModelAttribute("getTimeTableinfo") MemberBean getTimeTable,
	         @ModelAttribute("getTimeTableUserInfo") LectureBean timeTableUserInfo, 
	          Model model) {

		   // 권한 구분
		   int r_ID = loginMemberBean.getR_ID();
		   model.addAttribute("r_ID", r_ID);
		   if(r_ID == 3) {
			   
			   StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			   int grade = stdBean.getGrade();
			   int s_semester = stdBean.getS_semester();
			   
			   model.addAttribute("grade", grade);
			   model.addAttribute("s_semester", s_semester);		
		   }
	      
	      // 표
	      String[] day= {"월","화","수","목","금"};
	      model.addAttribute("day", day);
	      
	      //시간표-이름, 학번, 학과
	      timeTableService.timeTableUserInfo(getTimeTable);

	      //
	      List<LectureBean> getTimeTableUserInfo = timeTableService.allTimeTableInfo(model);
	      model.addAttribute("getTimeTableUserInfo", getTimeTableUserInfo);
	      for (LectureBean lecture : getTimeTableUserInfo) {
	         System.out.println(lecture.getLec_ID());
	         System.out.println(lecture.getLec_name());
	         System.out.println(lecture.getCompletion());
	         System.out.println(lecture.getCredits());
	         System.out.println(lecture.getDay());
	         System.out.println(lecture.getStarttime());
	         System.out.println(lecture.getEndtime());
	         System.out.println(lecture.getC_ID());
	         System.out.println("===============timetable================");

	      }

	      return "academy/timetable";
	   }
	   
	      @GetMapping("/timetable_pro")
	      public String academy_timetable_pro(@Valid @ModelAttribute("getTimeTableinfo") MemberBean getTimeTableinfo, 
	                                         @ModelAttribute("getTimeTableGradeAnSemeInfo") LectureBean getTimeTableGradeAnSemeInfo, BindingResult result, Model model) {
	         if(result.hasErrors()) {
	            System.out.println(result.getAllErrors());
	            return "academy/timetable";
	         }
	         
	         timeTableService.timeTableUserInfo(getTimeTableinfo);
	         
	         loginMemberBean.setYear(getTimeTableinfo.getYear());
	         loginMemberBean.setSemester(getTimeTableinfo.getSemester());
	         // 시간표 사용자 정보 조회
	         
	         
	         List<LectureBean> getTimeTableinfo1 = lectureDao.getTimeTableUserInfo(getTimeTableinfo.getID(), getTimeTableinfo.getYear(), getTimeTableinfo.getSemester());
	         model.addAttribute("getTimeTableinfo", getTimeTableinfo1);
	         model.addAttribute("loginMemberBean",loginMemberBean.getID());
	         timeTableService.timeTableUserInfo(getTimeTableinfo);
	         for (LectureBean lecture : getTimeTableinfo1) {
	            System.out.println(lecture.getLec_ID());
	            System.out.println(lecture.getLec_name());
	            System.out.println(lecture.getCompletion());
	            System.out.println(lecture.getCredits());
	            System.out.println(lecture.getDay());
	            System.out.println(lecture.getStarttime());
	            System.out.println(lecture.getEndtime());
	            System.out.println(lecture.getC_ID());
	            System.out.println("===============timetable_pro================");

	         }
	         return "academy/timetable_success";
	         
	         
	      }
	//금학기성적조회
	      @GetMapping("/grade_check")
	      public String academy_grade_check(@ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean, Model model) {
	         // 권한
	         int r_ID = loginMemberBean.getR_ID();      
	         model.addAttribute("r_ID", r_ID);
	         MemberBean tempModifyMemberBean = memberService.getModifyMemberInfo(loginMemberBean.getID());
	         
	            StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
	            String D_Name = memberService.getDepartmentName(stdBean.getD_ID());   
	            
	            modifyMemberBean.setSemester(stdBean.getS_semester());
	            modifyMemberBean.setGrade(stdBean.getGrade());
	            modifyMemberBean.setD_ID(stdBean.getD_ID());
	            modifyMemberBean.setD_name(D_Name);
	                     
	               
	         modifyMemberBean.setID(tempModifyMemberBean.getID());
	         modifyMemberBean.setName(tempModifyMemberBean.getName());
	         modifyMemberBean.setPassword(tempModifyMemberBean.getPassword());
	         modifyMemberBean.setBirth(tempModifyMemberBean.getBirth());
	         modifyMemberBean.setAddress(tempModifyMemberBean.getAddress());
	         modifyMemberBean.setEntrance(tempModifyMemberBean.getEntrance());
	         modifyMemberBean.setPhone(tempModifyMemberBean.getPhone());
	         modifyMemberBean.setEmergency(tempModifyMemberBean.getEmergency());
	         modifyMemberBean.setEmail(tempModifyMemberBean.getEmail());
	         modifyMemberBean.setMember_file(tempModifyMemberBean.getMember_file());
	         
	         
	         List<GradeBean> getGradeCheckInfo= gradeService.getGradeCheckInfo(loginMemberBean.getID());
	         model.addAttribute("getGradeCheckInfo", getGradeCheckInfo);
	         
	         
	         return "academy/grade_check";
	      }

	//전체 성적조회
   @GetMapping("/all_grade_check")
   public String academy_all_grade_check(@RequestParam(value = "year") Optional<Integer> yeargOpt,
                                         @RequestParam(value = "semester") Optional<Integer> semesterOpt, Model model) {
		// 권한 구분
		StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
		int grade = stdBean.getGrade();
		int s_semester = stdBean.getS_semester();
		
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		model.addAttribute("grade", grade);
		model.addAttribute("s_semester", s_semester);

       List<GradeBean> totalGPA = gradeService.getallchk(loginMemberBean.getID());
       model.addAttribute("totalGPA", totalGPA);
       int size1 = totalGPA.size() - 1;
       model.addAttribute("size1", size1);

       return "academy/all_grade_check";
   }
	
	//성적입력
	@GetMapping("/grade_input")
	public String academy_grade_input(Model model) {
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		if(r_ID == 3) {
			
			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			int grade = stdBean.getGrade();
			int s_semester = stdBean.getS_semester();
			
			model.addAttribute("grade", grade);
			model.addAttribute("s_semester", s_semester);		
		}

		List<LectureBean> list = evaluationService.getLectureList(loginMemberBean.getID());
	    int size = list.size()-1;
	    model.addAttribute("list", list);
	    model.addAttribute("size", size);
	      
		return "academy/grade_input";
	}

}
