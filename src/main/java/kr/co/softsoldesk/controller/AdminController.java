package kr.co.softsoldesk.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.beans.ProfessorBean;
import kr.co.softsoldesk.beans.StudentBean;
import kr.co.softsoldesk.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean;
	
	@GetMapping("/addMember_role")
	public String join_role(Model model) {
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		
		return "admin/addMember_role";
	}
	
	@PostMapping("/addMember")
	public String join(@ModelAttribute("joinMemberBean") MemberBean joinMemberBean, HttpServletRequest request, Model model) {
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		
		int r_ID2 = Integer.parseInt(request.getParameter("r_ID"));
		model.addAttribute("r_ID2", r_ID2);
		
		return "admin/addMember";
	}
	
	@PostMapping("/addMember_Pro")
	public String join_pro(@Valid @ModelAttribute("joinMemberBean") MemberBean joinMemberBean, BindingResult result, Model model) {
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		
		
		if(result.hasErrors()) {
			System.out.println(result.getAllErrors());
			return "admin/addMember";
		}
		memberService.addMemberInfo(joinMemberBean);
		MemberBean tempMemberBean = joinMemberBean;
		
		if(joinMemberBean.getR_ID() == 2) {
			ProfessorBean tempProfessorBean = new ProfessorBean();
			tempProfessorBean.setP_ID(joinMemberBean.getID());
			tempProfessorBean.setD_ID(joinMemberBean.getD_ID());
			
			memberService.addProfessorInfo(tempProfessorBean);
			
			return "admin/addMember_success";
			
		}else if(joinMemberBean.getR_ID() == 3) {
			StudentBean tempStudentBean = new StudentBean();
			tempStudentBean.setStd_ID(tempMemberBean.getID());
			tempStudentBean.setD_ID(tempMemberBean.getD_ID());
			tempStudentBean.setGrade(tempMemberBean.getGrade());
			tempStudentBean.setS_semester(tempMemberBean.getS_semester());
			
			memberService.addStudentInfo(tempStudentBean);
			
			return "admin/addMember_success";
			
		}else{
			return "admin/addMember_success";
		}
		
	}
	

}
