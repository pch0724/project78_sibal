package kr.co.softsoldesk.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		model.addAttribute("fail", fail);
		
		return "login";
	}

	@PostMapping("/login_pro")
	public String login_pro(@Valid @ModelAttribute("tempLoginMemberBean") MemberBean tempLoginMemberBean, BindingResult result) {
			
		if(result.hasErrors()) {
			return "login";
		}
		
		memberService.getLoginMemberInfo(tempLoginMemberBean); //로그인 여부
		
		if(loginMemberBean.isMemberLogin() == true) {
			return "login_success";
		}else {
			return "login_fail";
		}
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
	
}
