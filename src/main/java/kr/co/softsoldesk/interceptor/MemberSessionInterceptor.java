package kr.co.softsoldesk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.MemberBean;

public class MemberSessionInterceptor implements HandlerInterceptor {

	private MemberBean loginMemberBean;
	
	public MemberSessionInterceptor(MemberBean loginMemberBean) {
		this.loginMemberBean = loginMemberBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		request.setAttribute("loginMemberBean", loginMemberBean);
		
		return true;
	}
	
	
}
