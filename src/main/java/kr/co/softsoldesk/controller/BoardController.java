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

import kr.co.softsoldesk.beans.BoardBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.beans.PageBean;
import kr.co.softsoldesk.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean;
	
	//==========================================================================
	@GetMapping("/main")
	public String main(@RequestParam(value ="page", defaultValue = "1") int page, Model model) {
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		
		// 게시글
		List<BoardBean> contentList = boardService.getContentList(page);
		model.addAttribute("contentList", contentList);
		
		PageBean pageBean = boardService.getContentCnt(page);
		model.addAttribute("pageBean", pageBean);
		
		model.addAttribute("page", page);
		
		return "board/main";
	}
	
	@GetMapping("/read")
	public String read(@RequestParam("board_idx") int board_idx, 
					   @RequestParam(value ="page", defaultValue = "1") int page, Model model) {
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		
		// 게시물 고유번호
		model.addAttribute("board_idx", board_idx);
		// 게시글 상세 정보(글쓴 사람 이름, 아이디 포함
		BoardBean readContentBean = boardService.getContentInfo(board_idx);
		model.addAttribute("readContentBean", readContentBean);
		// 로그인 정보
		model.addAttribute("loginMemberBean", loginMemberBean);
		model.addAttribute("page", page);
		return "board/read";
	}	
	
	@GetMapping("/write")
	public String write(@ModelAttribute("writeContentBean") BoardBean writeContentBean, Model model) {
		
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		
		//ID, 이름
		int w_ID = loginMemberBean.getID();
		String w_name = loginMemberBean.getName();
		
		writeContentBean.setW_ID(w_ID);
		writeContentBean.setW_name(w_name);
		
		return "board/write";
		
	}

	@PostMapping("/write_pro")
	public String write_pro(@Valid @ModelAttribute("writeContentBean") BoardBean writeContentBean, Model model, BindingResult result) {
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		
		
		if(result.hasErrors()) {
			return "board/write";
		}
		
		boardService.addContentInfo(writeContentBean);
		
		return "board/write_success";
		
	}

	@GetMapping("/not_writer")
	public String not_writer() {
		return "board/not_writer";
	}

	@GetMapping("/no_access")
	public String no_access() {
		return "board/no_access";
	}

	@GetMapping("/modify")
	public String modify(@RequestParam("board_idx") int board_idx,
						 @RequestParam("page") int page,
						 @ModelAttribute(name = "modifyContentBean") BoardBean modifyContentBean, Model model) {
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		
		
		model.addAttribute("board_idx", board_idx);
		model.addAttribute("page", page);
		//게시글 하나의 정보
		BoardBean tempContentBean = boardService.getContentInfo(board_idx);
		
		modifyContentBean.setW_name(tempContentBean.getW_name());
		modifyContentBean.setBoarddate(tempContentBean.getBoarddate());
		modifyContentBean.setTitle(tempContentBean.getTitle());
		modifyContentBean.setContent_file(tempContentBean.getContent_file());
		modifyContentBean.setW_ID(tempContentBean.getW_ID());
		
		modifyContentBean.setBoard_idx(board_idx);  //param 값 그대로 가져오기
		
		return "board/modify";
	}
	
	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyContentBean") BoardBean modifyContentBean, 
							 @RequestParam("page") int page, Model model,
							 BindingResult result) {
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		
		
		model.addAttribute("page", page);
		
		if(result.hasErrors()) {
			return "board/modify";
		}
		
		boardService.modifyContentInfo(modifyContentBean);
		
		return "board/modify_success";
		
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("board_idx") int board_idx, Model model) {
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		
		model.addAttribute("board_idx", board_idx);
		
		boardService.deleteContentInfo(board_idx);
		
		return "board/delete";
	}
}
