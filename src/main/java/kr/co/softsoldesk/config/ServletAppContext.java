package kr.co.softsoldesk.config;


import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.interceptor.CheckLoginInterceptor;
import kr.co.softsoldesk.interceptor.MemberSessionInterceptor;
import kr.co.softsoldesk.mapper.BoardMapper;
import kr.co.softsoldesk.mapper.ClassroomMapper;
import kr.co.softsoldesk.mapper.DepartmentMapper;
import kr.co.softsoldesk.mapper.EvaluationMapper;
import kr.co.softsoldesk.mapper.GradeMapper;
import kr.co.softsoldesk.mapper.LectureMapper;
import kr.co.softsoldesk.mapper.MemberMapper;
import kr.co.softsoldesk.mapper.ProfessorMapper;
import kr.co.softsoldesk.mapper.RoleMapper;
import kr.co.softsoldesk.mapper.Std_HistioryMapper;
import kr.co.softsoldesk.mapper.StudentMapper;

@PropertySource("/WEB-INF/properties/db.properties")
@ComponentScan("kr.co.softsoldesk.controller") // 스캔할 패키지 지정
@ComponentScan("kr.co.softsoldesk.beans") // 스캔할 패키지 지정
@ComponentScan("kr.co.softsoldesk.dao") // 스캔할 패키지 지정
@ComponentScan("kr.co.softsoldesk.service") // 스캔할 패키지 지정
@EnableWebMvc // @Controller로 등록되어 있는 클래스 셋팅
@Configuration // 일반 Bean 관리
public class ServletAppContext implements WebMvcConfigurer{

	@Value("${db.classname}")
	private String db_classname;
	
	@Value("${db.url}")
	private String db_url;
	
	@Value("${db.username}")
	private String db_username;
	
	@Value("${db.password}")
	private String db_password;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean;
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// view 경로와 확장자 셋팅
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 리소스(이미지, 영상, 소리 등 정적파일) 경로 매핑
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}
	
	// 데이터베이스 접속 정보 관리
	@Bean
	public BasicDataSource dataSource() {
		
		BasicDataSource source = new BasicDataSource();
		
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);

		return source;
	}

	// 쿼리문과 접속 관리하는 객체(sqlSessionFactory 접속, 쿼리를 관리하는 객체)
	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {
		
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		
		SqlSessionFactory factory = factoryBean.getObject();
		return factory;
	}   
	
	// 쿼리문 실행을 위한 객체(쿼리문을 관리하는 Mapper를 정의)
	@Bean
	public MapperFactoryBean<BoardMapper> getBoardMapper(SqlSessionFactory factory) throws Exception {
		
		MapperFactoryBean<BoardMapper> factoryBean = new MapperFactoryBean<BoardMapper>(BoardMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<ClassroomMapper> getClassroomMapper(SqlSessionFactory factory) throws Exception {
		
		MapperFactoryBean<ClassroomMapper> factoryBean = new MapperFactoryBean<ClassroomMapper>(ClassroomMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<DepartmentMapper> getDepartmentMapper(SqlSessionFactory factory) throws Exception {
		
		MapperFactoryBean<DepartmentMapper> factoryBean = new MapperFactoryBean<DepartmentMapper>(DepartmentMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<GradeMapper> getGradeMapper(SqlSessionFactory factory) throws Exception {
		
		MapperFactoryBean<GradeMapper> factoryBean = new MapperFactoryBean<GradeMapper>(GradeMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<LectureMapper> getLectureMapper(SqlSessionFactory factory) throws Exception {
		
		MapperFactoryBean<LectureMapper> factoryBean = new MapperFactoryBean<LectureMapper>(LectureMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<MemberMapper> getMemberMapper(SqlSessionFactory factory) throws Exception {
		
		MapperFactoryBean<MemberMapper> factoryBean = new MapperFactoryBean<MemberMapper>(MemberMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<ProfessorMapper> getProfessorMapper(SqlSessionFactory factory) throws Exception {
		
		MapperFactoryBean<ProfessorMapper> factoryBean = new MapperFactoryBean<ProfessorMapper>(ProfessorMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<RoleMapper> getRoleMapper(SqlSessionFactory factory) throws Exception {
		
		MapperFactoryBean<RoleMapper> factoryBean = new MapperFactoryBean<RoleMapper>(RoleMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<Std_HistioryMapper> getStd_HistioryMapper(SqlSessionFactory factory) throws Exception {
		
		MapperFactoryBean<Std_HistioryMapper> factoryBean = new MapperFactoryBean<Std_HistioryMapper>(Std_HistioryMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<StudentMapper> getStudentMapper(SqlSessionFactory factory) throws Exception {
		
		MapperFactoryBean<StudentMapper> factoryBean = new MapperFactoryBean<StudentMapper>(StudentMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<EvaluationMapper> getEvaluationMapper(SqlSessionFactory factory) throws Exception {
		
		MapperFactoryBean<EvaluationMapper> factoryBean = new MapperFactoryBean<EvaluationMapper>(EvaluationMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		WebMvcConfigurer.super.addInterceptors(registry);
		// 로그인 세션정보
		MemberSessionInterceptor memberSessionInterceptor = new MemberSessionInterceptor(loginMemberBean);
		InterceptorRegistration reg1 = registry.addInterceptor(memberSessionInterceptor);
		
		reg1.addPathPatterns("/**");
		
		// 로그인처리
		CheckLoginInterceptor checkLoginInterceptor=new CheckLoginInterceptor(loginMemberBean);
		InterceptorRegistration reg2 = registry.addInterceptor(checkLoginInterceptor);
		// 작동시기
		reg2.addPathPatterns("/academy/*","/enrollment/*","/evaluation/*","/ma/*", "/password_change"); //잠금
		//reg2.excludePathPatterns("/login"); // 허용
		
	}
	
	//Properties와 충돌되어 오류가 발생되므로 분리하여 등록
	@Bean
	public static PropertySourcesPlaceholderConfigurer PropertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
	
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasenames("/WEB-INF/properties/error_message");
		
		return res;
	}
	
	// 정적파일 인식
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		
		return new StandardServletMultipartResolver();
	}
	
}
