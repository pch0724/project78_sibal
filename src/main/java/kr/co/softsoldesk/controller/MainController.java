package kr.co.softsoldesk.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.service.MemberService;

@RequestMapping("/ma")
@Controller
public class MainController {
	
	@Autowired
	private MemberService memberService;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean;
	
	@GetMapping("/index")
	public String main_index(@ModelAttribute MemberBean tempMemberBean) {		
			
			
		
		
		return "ma/index";
	}
}
