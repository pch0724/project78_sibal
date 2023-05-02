package kr.co.softsoldesk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.MemberBean;

public class CheckBoardAccessInterceptor implements HandlerInterceptor{
	
	private MemberBean loginMemberBean;
	
	public CheckBoardAccessInterceptor(MemberBean loginMemberBean) {
		this.loginMemberBean = loginMemberBean;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		int r_ID = loginMemberBean.getR_ID();
		
		if(r_ID != 1) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/board/no_access");
			
			return false;
		}
		return true;
	}

	
}
