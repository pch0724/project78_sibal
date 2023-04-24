package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/enrollment")
@Controller
public class EnrollmentController {
	
	@GetMapping("/index")
	public String enrollment_index() {
		return "enrollment/index";
	}
}
