package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.EvaluationBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.service.EvaluationService;

@RequestMapping("/evaluation")
@Controller
public class EvaluationController {
	
	@Autowired
	private EvaluationService evaluationService;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean;
	
	@GetMapping("/mid")
	public String mid(@ModelAttribute("getInfoMemberBean") MemberBean getInfoMemberBean, Model model) {
		
		evaluationService.getMemberInfo(getInfoMemberBean);
		
		List<EvaluationBean> EvalInfo = evaluationService.getEvalInfo(model);
		
		model.addAttribute("EvalInfo",EvalInfo);
		
		
		
		return "evaluation/mid";
	}
	
	@GetMapping("/mid_eval")
	public String mid_eval(@ModelAttribute("writeEvalBean") EvaluationBean writeEvalBean, 
						   @RequestParam("lec_ID") String lec_ID,
						   @RequestParam("lec_name") String lec_name,
						   @RequestParam("name") String name, 
						   Model model) {
		
		
		model.addAttribute("lec_ID",lec_ID);
		model.addAttribute("lec_name",lec_name);
		model.addAttribute("name",name);
		
		
		writeEvalBean.setStd_ID(loginMemberBean.getID());
		
		return "evaluation/mid_eval";
	}
	
	@PostMapping("/mid_eval_pro")
	public String mid_eval_pro(@ModelAttribute("writeEvalBean") EvaluationBean writeEvalBean) {
		
		evaluationService.addEvalInfo(writeEvalBean);
		
		return "evaluation/mid_eval_success";
	}
	
	@GetMapping("/fin")
	public String fin() {
		return "evaluation/fin";
	}
}
