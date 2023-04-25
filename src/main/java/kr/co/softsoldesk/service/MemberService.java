package kr.co.softsoldesk.service;

import java.io.File;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.DepartmentBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.beans.StudentBean;
import kr.co.softsoldesk.dao.MemberDao;


@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean; // session영역
	//=============================================================
	// 파일 업로드
	@Value("${path.upload}")
	private String path_upload;
	
	private String saveUploadFile(MultipartFile upload_file) {
		
		String file_name = System.currentTimeMillis() + "_" +
							FilenameUtils.getBaseName(upload_file.getOriginalFilename()) + "." +
							FilenameUtils.getExtension(upload_file.getOriginalFilename());
		
		try {
			upload_file.transferTo(new File(path_upload + "/" + file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return file_name;
	}
	
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
	// 최초 로그인
	public String checkFirstLogin(int ID) {
		return memberDao.checkFirstLogin(ID);
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
			loginMemberBean.setMemberFirstLogin(tempLoginMemberBean2.getMemberFirstLogin());
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
		
		/*
		MultipartFile upload_file = modifyMemberBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			System.out.println(file_name);
			modifyMemberBean.setMember_file(file_name);
		}
		*/
		modifyMemberBean.setID(loginMemberBean.getID());
		
		memberDao.modifyMemberInfo(modifyMemberBean);
	}
	
	// 시간표
	public void timeTableUserInfo(MemberBean timeTableUserInfo) {
	      
	      timeTableUserInfo.setID(loginMemberBean.getID());
	      
	      memberDao.getTimeTableinfo(timeTableUserInfo.getID());
	      
	}
}
