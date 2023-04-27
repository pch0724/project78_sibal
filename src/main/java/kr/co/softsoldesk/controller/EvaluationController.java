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
import kr.co.softsoldesk.beans.LectureBean;
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
		// 권한
		int r_ID = loginMemberBean.getR_ID();		
		model.addAttribute("r_ID", r_ID);
		
		
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
	public String fin(@ModelAttribute("getInfoMemberBean") MemberBean getInfoMemberBean, Model model) {
		// 권한
		int r_ID = loginMemberBean.getR_ID();		
		model.addAttribute("r_ID", r_ID);
		
		
		evaluationService.getMemberInfo(getInfoMemberBean);
		
		List<EvaluationBean> EvalInfo = evaluationService.getEvalInfo(model);
		
		model.addAttribute("EvalInfo",EvalInfo);
		
		
		
		return "evaluation/fin";
	}
	
	@GetMapping("/fin_eval")
	public String fin_eval(@ModelAttribute("writeEvalBean") EvaluationBean writeEvalBean, 
			@RequestParam("lec_ID") String lec_ID,
			@RequestParam("lec_name") String lec_name,
			@RequestParam("name") String name, 
			Model model) {
		
		
		model.addAttribute("lec_ID",lec_ID);
		model.addAttribute("lec_name",lec_name);
		model.addAttribute("name",name);
		
		
		writeEvalBean.setStd_ID(loginMemberBean.getID());
		
		return "evaluation/fin_eval";
	}
	
	@PostMapping("/fin_eval_pro")
	public String fin_eval_pro(@ModelAttribute("writeEvalBean") EvaluationBean writeEvalBean) {
		
		evaluationService.addEvalInfo(writeEvalBean);
		
		return "evaluation/mid_eval_success";
	}
	
	@GetMapping("/mid_check")
	public String mid_check(Model model) {
		// 권한
		int r_ID = loginMemberBean.getR_ID();		
		model.addAttribute("r_ID", r_ID);
		
		List<LectureBean> list = evaluationService.getLectureList(loginMemberBean.getID());
		int size = list.size()-1;
		model.addAttribute("list", list);
		model.addAttribute("size", size);
		return "evaluation/mid_check";
	}
	
	@GetMapping("/fin_check")
	public String fin_check(Model model) {
		// 권한
		int r_ID = loginMemberBean.getR_ID();		
		model.addAttribute("r_ID", r_ID);
		
		
		List<LectureBean> list = evaluationService.getLectureList(loginMemberBean.getID());
		int size = list.size()-1;
		model.addAttribute("list", list);
		model.addAttribute("size", size);
		return "evaluation/fin_check";
	}
}
