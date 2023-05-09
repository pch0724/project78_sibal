package kr.co.softsoldesk.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.softsoldesk.beans.MemberBean;


// 프로젝트 Bean
@Configuration
public class RootAppContext {

	//Oracle 정보 끌어오기
	@Bean("loginMemberBean")
	@SessionScope
	public MemberBean loginMemberBean() {
		return new MemberBean();
	}
	
}
