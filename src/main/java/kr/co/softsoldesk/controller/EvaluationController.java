package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/evaluation")
@Controller
public class EvaluationController {

	@GetMapping("/mid")
	public String mid() {
		return "evaluation/mid";
	}
	
	@GetMapping("/fin")
	public String fin() {
		return "evaluation/fin";
	}
}
