package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.beans.StudentBean;
import kr.co.softsoldesk.service.GradeService;
import kr.co.softsoldesk.service.MemberService;

@RequestMapping("/academy")
@Controller
public class AcademyController {
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private GradeService gradeService;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean;
	
	//메인
	@GetMapping("/index")
	public String academy_index() {
		return "academy/index";
	}
	//학적정보
	//개인정보수정
	@GetMapping("/personal_info")
	public String academy_personal_info(@ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean, Model model){
		
		memberService.getModifyMemberInfo(modifyMemberBean);
		System.out.println("==========================================");
		System.out.println(modifyMemberBean.getD_ID());
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
	public String academy_enrollment() {
		return "academy/enrollment";
	}
	//시간표 조회
	@GetMapping("/timetable")
	public String academy_timetable() {
		return "academy/timetable";
	}
	
	//성적
	//금학기 성적조회
	@GetMapping("/grade_check")
	   public String academy_grade_check(@ModelAttribute(name="getInfoMemberBean2") GradeDTO getInfoMemberBean2, Model model) {
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
	public String academy_all_grade_check() {
		return "academy/all_grade_check";
	}
	//전체 성적조회
	@GetMapping("/grade_input")
	public String academy_grade_input() {
		return "academy/grade_input";
	}
	//강의평가
	//중간 강의평가
	@GetMapping("/mid_evaluation")
	public String academy_mid_eval() {
		return "academy/mid_evaluation";
	}
	//기말 강의평가
	@GetMapping("/final_evaluation")
	public String academy_final_eval() {
		return "academy/final_evaluation";
	}

	
	
	
}
