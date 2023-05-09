package kr.co.softsoldesk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.MemberBean;

public class CheckLoginInterceptor implements HandlerInterceptor{
	
	private MemberBean loginMemberBean;
	
	public CheckLoginInterceptor(MemberBean loginMemberBean) {
		this.loginMemberBean=loginMemberBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 로그인을 하지 않았다면
		if(loginMemberBean.isMemberLogin() == false) {
			// 로그인하지 않은 상태에서의 URL 호출
			String contextpath=request.getContextPath();
			response.sendRedirect(contextpath+"/not_login");
			// 다음 단계로 이동하지 않음
			return false;
		}
			// 로그인 되어 있는 상태
		return true;
	}
	
	

}
