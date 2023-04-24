package kr.co.softsoldesk.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.softsoldesk.service.MemberService;

public class MemberInterceptor implements HandlerInterceptor{

	private MemberService memberService; 
	
	public MemberInterceptor(MemberService memberService) {
		this.memberService = memberService;
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	
	
	
}
