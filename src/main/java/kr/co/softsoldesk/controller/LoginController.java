package kr.co.softsoldesk.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.service.MemberService;


@Controller
public class LoginController {

	@Autowired
	private MemberService memberService;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean; // session 영역
	
	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginMemberBean") MemberBean tempLoginMemberBean,
						@RequestParam(value = "fail", defaultValue = "false") boolean fail, Model model) {
		tempLoginMemberBean.setID(null);
		
		model.addAttribute("fail", fail);
		
		return "login";
	}

	@PostMapping("/login_pro")
	public String login_pro(@Valid @ModelAttribute("tempLoginMemberBean") MemberBean tempLoginMemberBean, BindingResult result) {
			
		if(result.hasErrors()) {
			System.out.println("error");
			System.out.println(result.getAllErrors()); 
			return "login";
		}
		
		memberService.getLoginMemberInfo(tempLoginMemberBean); //로그인 여부
		
		if(loginMemberBean.isMemberLogin() == true) {
			System.out.println(loginMemberBean.getFirst_login());
			if(loginMemberBean.getFirst_login().equals("true")) {
				return "login_success";								
			}else {
				return "password_change";
			}
		}else {
			return "login_fail";
		}
	}
	
	@GetMapping("/not_login")
	public String not_login() {
		
		
		return "not_login";
	}
	
	
	@PostMapping("/password_change")
	public String password_change(@ModelAttribute("tempLoginMemberBean") MemberBean tempLoginMemberBean) {
		return "password_change";
	}
	
	@PostMapping("/password_change_pro")
	public String password_change_pro(@Valid @ModelAttribute("tempLoginMemberBean") MemberBean tempLoginMemberBean, BindingResult result) {
		
		if(result.hasErrors()) {
			System.out.println(result.getAllErrors());
			return "password_change";
		}
		memberService.modifyFirstLogin(tempLoginMemberBean);
		
		return "password_change_success";
	}
	

	@GetMapping("/logout")
	public String logout() {
		
		loginMemberBean.setMemberLogin(false);
		
		return "logout";
	}
	
	@GetMapping("/password_change")
	public String password_change() {
		return "password_change";
	}

	// index페이지 취득학점 그래프
	@GetMapping("/ma/credits")
	@ResponseBody
	public Map<String, Integer> getStudentCredits() {
		int loggedInUserId = loginMemberBean.getID();
		// 학생의 교양 및 전공 학점 데이터를 가져오는 서비스를 호출합니다.
		Map<String, Integer> credits = memberService.getStudentCredits(loggedInUserId);
		// System.out.println("Credits for user " + loggedInUserId + ": " + credits); //
		// 로그 추가

		return credits;
	}

	// index페이지 신청학점
	@GetMapping("/ma/appliedcredits")
	@ResponseBody
	public Map<String, Integer> getStudentappliedCredits() {
		int loggedInUserId = loginMemberBean.getID();
		Map<String, Integer> appliedcredits = memberService.getStudentappliedCredits(loggedInUserId);

		return appliedcredits;
	}

	@GetMapping("/credits_check")
	public String credits_check() {

		return "credits_check";
	}

	@GetMapping("/GPA_check")
	public String gpaCheck(Model model) {
		int stdID = loginMemberBean.getID();
		Map<String, Integer> gradeDistribution = memberService.getGradeDistribution(stdID);
		model.addAttribute("gradeDistribution", gradeDistribution);
		// System.out.println(gradeDistribution);
		return "GPA_check";
	}
}
