package kr.co.softsoldesk.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.DepartmentBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.beans.StudentBean;
import kr.co.softsoldesk.dao.MemberDao;


@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean; // session영역
	
	//==============================================================
	// 아이디 중복체크
	public boolean checkMemberIdExist(String ID) {
		String Name = memberDao.checkMemberIdExist(ID);
		
		if(Name == null) {
			return true;
		}else {
			return false;
		}
	}
	
	// 로그인
	public void getLoginMemberInfo(MemberBean tempLoginMemberBean) {
		
		MemberBean tempLoginMemberBean2 = memberDao.getLoginMemberInfo(tempLoginMemberBean);
		
		// 가져온 값이 없을 시 예외처리
		if(tempLoginMemberBean2 != null) {
			
			loginMemberBean.setID(tempLoginMemberBean2.getID());
			loginMemberBean.setName(tempLoginMemberBean2.getName());
			loginMemberBean.setPassword(tempLoginMemberBean2.getPassword());
			loginMemberBean.setBirth_Date(tempLoginMemberBean2.getBirth_Date());
			loginMemberBean.setPhone_num(tempLoginMemberBean2.getPhone_num());
			loginMemberBean.setEmergency_Contact(tempLoginMemberBean2.getEmergency_Contact());
			loginMemberBean.setAddress(tempLoginMemberBean2.getAddress());
			loginMemberBean.setEntrance_Date(tempLoginMemberBean2.getEntrance_Date());
			loginMemberBean.setEmail(tempLoginMemberBean2.getEmail());
			loginMemberBean.setMemberLogin(true);
					
		}
		
	}

	/*
	public void getModifyMemberInfo(MemberBean modifyMemberBean) {
		MemberBean tempModifyMemberBean = memberDao.getModifyMemberInfo(loginMemberBean.getID());
		
		modifyMemberBean.setID(tempModifyMemberBean.getID());
		modifyMemberBean.setName(tempModifyMemberBean.getName());
		
	}
	*/
	
	public void getModifyMemberInfo(MemberBean modifyMemberBean) {
		MemberBean tempModifyMemberBean = memberDao.getModifyMemberInfo(loginMemberBean.getID());
		StudentBean stdBean = memberDao.getStudentInfo(loginMemberBean.getID());
		String D_Name = memberDao.getDepartmentName(stdBean.getDepartment_ID());
				
		modifyMemberBean.setID(tempModifyMemberBean.getID());
		modifyMemberBean.setName(tempModifyMemberBean.getName());
		modifyMemberBean.setPassword(tempModifyMemberBean.getPassword());
		modifyMemberBean.setBirth_Date(tempModifyMemberBean.getBirth_Date());
		modifyMemberBean.setAddress(tempModifyMemberBean.getAddress());
		modifyMemberBean.setEntrance_Date(tempModifyMemberBean.getEntrance_Date());
		modifyMemberBean.setPhone_num(tempModifyMemberBean.getPhone_num());
		modifyMemberBean.setEmergency_Contact(tempModifyMemberBean.getEmergency_Contact());
		modifyMemberBean.setEmail(tempModifyMemberBean.getEmail());
		modifyMemberBean.setSemester(stdBean.getSemester());
		modifyMemberBean.setGrade(stdBean.getGrade());
		modifyMemberBean.setD_ID(stdBean.getDepartment_ID());
		modifyMemberBean.setD_Name(D_Name);
	}
	
	public void modifyMemberInfo(MemberBean modifyMemberBean) {
		
		modifyMemberBean.setID(loginMemberBean.getID());
		
		memberDao.modifyMemberInfo(modifyMemberBean);
	}
	
}
