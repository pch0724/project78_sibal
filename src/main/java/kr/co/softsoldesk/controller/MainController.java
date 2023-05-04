package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.softsoldesk.beans.BoardBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.service.MainService;
import kr.co.softsoldesk.service.MemberService;

@RequestMapping("/ma")
@Controller
public class MainController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MainService mainService;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean;
	
	@GetMapping("/index")
	public String main_index(@ModelAttribute MemberBean tempMemberBean, Model model) {		
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		
		List<BoardBean> list = new ArrayList<BoardBean>();
		for(int i=1; i<=4; i++) {
			list = mainService.getMainList();
			model.addAttribute("list", list);
			System.out.println(list);
		}
		
		return "ma/index";
	}
}
