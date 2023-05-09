package kr.co.softsoldesk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.BoardBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.service.BoardService;

public class CheckWriterInterceptor implements HandlerInterceptor{

	private MemberBean loginMemberBean;
	private BoardService boardService;
	
	public CheckWriterInterceptor(MemberBean loginMemberBean, BoardService boardService) {
		this.loginMemberBean = loginMemberBean;
		this.boardService = boardService;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// read.jsp에서 주입된 content_idx
		String str1 = request.getParameter("board_idx");
		int board_idx = Integer.parseInt(str1); // 형 변환
		// 현재 게시글 가져오기
		BoardBean currentContentBean= boardService.getContentInfo(board_idx);
		
		//작성한 사람의 글번호와 로그인한 사람의 글번호가 다른 경우
		if(currentContentBean.getW_ID() != loginMemberBean.getID()) {
			// 경로 읽어와서
			String contextPath = request.getContextPath();
			// board/not_writer로 넘김
			response.sendRedirect(contextPath + "/board/not_writer");
			
			return false;
		}
		return true;
	}
	
}
