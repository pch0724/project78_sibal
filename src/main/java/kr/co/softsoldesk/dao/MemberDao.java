package kr.co.softsoldesk.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.DepartmentBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.beans.ProfessorBean;
import kr.co.softsoldesk.beans.StudentBean;
import kr.co.softsoldesk.mapper.DepartmentMapper;
import kr.co.softsoldesk.mapper.MemberMapper;
import kr.co.softsoldesk.mapper.ProfessorMapper;
import kr.co.softsoldesk.mapper.StudentMapper;

@Repository
public class MemberDao {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private StudentMapper studentMapper;
	
	@Autowired
	private ProfessorMapper professorMapper;
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	//===========================================================
	
	//아이디 중복체크
	
	public String checkMemberIdExist(String ID) {
		
		return memberMapper.checkMemberIdExist(ID);
	}
	
	
	//===========================================================
	//관리자 권한 회원가입
	public void addMemberInfo(MemberBean joinMemberBean) {
		memberMapper.addMemberInfo(joinMemberBean);
	}
	//회원가입 학생
	public void addStudentInfo(StudentBean joinStudentBean) {
		studentMapper.addStudentInfo(joinStudentBean);
	}
	//회원가입 교수
	public void addProfessorInfo(ProfessorBean joinProfessorBean) {
		professorMapper.addProfessorInfo(joinProfessorBean);
	}
	//학과 정보
	public DepartmentBean getDepartmentInfo() {
		return departmentMapper.getDepartmentInfo();
	}
	
	//------------------------------------------------------------
	// 최초로그인
	public String checkFirstLogin(int ID) {
		return memberMapper.checkFirstLoginMember(ID);
	}
	
	// 비밀번호 변경
	public void modifyFirstLogin(MemberBean tempLoginMemberBean) {
		
		memberMapper.modifyFirstLogin(tempLoginMemberBean);
		
	}
	
	// 로그인
	
	public MemberBean getLoginMemberInfo(MemberBean tempLoginMemberBean) {
		
		return memberMapper.getLoginMemberInfo(tempLoginMemberBean);
	}
	
	// 교수 정보 조회
	public ProfessorBean getProfessorInfo(int P_ID) {
		return professorMapper.getProfessorInfo(P_ID);
	}
		
	// 학생 학년학기 조회
	public StudentBean getStudentInfo(int Std_ID) {
		return studentMapper.getStudentInfo(Std_ID);
	}
	
	// 학과이름 조회
	public String getDepartmentName(int D_ID) {
		return departmentMapper.getDepartmentName(D_ID);
	}
	
	
	// 개인정보 수정 조회
	public MemberBean getModifyMemberInfo(int ID) {
		return memberMapper.getModifyMemberInfo(ID);
	}
	// 개인정보 수정
	public void modifyMemberInfo(MemberBean modifyMemberBean) {
		memberMapper.modifyMemberInfo(modifyMemberBean);
	}
	
	// 시간표 - 학생
   public MemberBean getTimeTableinfo(int ID) {
         return memberMapper.getTimeTableinfo(ID);
   }
   
   // 시간표 - 교수
   public MemberBean getTimeTableProInfo(int ID) {
      return memberMapper.getTimeTableProInfo(ID);
   }
	
	// index페이지 취득학점 그래프
	public List<Map<String, Object>> getStudentCredits(int ID) {
		List<Map<String, Object>> creditList = memberMapper.getStudentCredits(ID);

		// 결과를 로그로 출력합니다.
		/*
		 * for (Map<String, Object> map : creditList) {
		 * System.out.println("MemberDao result: " + map); }
		 */

		return creditList;
	}

	// index페이지 신청학점
	public List<Map<String, Object>> getStudentappliedCredits(int ID) {
		List<Map<String, Object>> appliedCreditList = memberMapper.getStudentappliedCredits(ID);

		return appliedCreditList;
	}

	// index페이지 GPA그래프
	public Map<String, Integer> getGradeDistribution(int ID) {
		return memberMapper.getGradeDistribution(ID);
	}

}
