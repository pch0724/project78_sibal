package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.DepartmentBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.beans.StudentBean;
import kr.co.softsoldesk.mapper.DepartmentMapper;
import kr.co.softsoldesk.mapper.MemberMapper;
import kr.co.softsoldesk.mapper.StudentMapper;

@Repository
public class MemberDao {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private StudentMapper studentMapper;
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	//===========================================================
	
	//아이디 중복체크
	
	public String checkMemberIdExist(String ID) {
		
		return memberMapper.checkMemberIdExist(ID);
	}
	
	// 최초로그인
	public String checkFirstLogin(int ID) {
		return memberMapper.checkFirstLoginMember(ID);
	}
	
	
	// 로그인
	
	public MemberBean getLoginMemberInfo(MemberBean tempLoginMemberBean) {
		
		return memberMapper.getLoginMemberInfo(tempLoginMemberBean);
	}
	
	// 학생 학년학기 조회
	public StudentBean getStudentInfo(int Std_ID) {
		return studentMapper.getStudentInfo(Std_ID);
	}
	
	// 학과이름 조회
	public String getDepartmentName(int D_ID) {
		return departmentMapper.getDepartmentName(D_ID);
	}
	
	
	// 개인정보 수정
	public MemberBean getModifyMemberInfo(int ID) {
		return memberMapper.getModifyMemberInfo(ID);
	}
		
	public void modifyMemberInfo(MemberBean modifyMemberBean) {
		memberMapper.modifyMemberInfo(modifyMemberBean);
	}
	
	// 시간표
	public MemberBean getTimeTableinfo(int ID) {
	      return memberMapper.getTimeTableinfo(ID);
	}
	
}
