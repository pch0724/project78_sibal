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
import kr.co.softsoldesk.beans.ProfessorBean;
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
			loginMemberBean.setR_id(tempLoginMemberBean2.getR_id());
			loginMemberBean.setMemberFirstLogin(tempLoginMemberBean2.getMemberFirstLogin());
			loginMemberBean.setMember_file(tempLoginMemberBean2.getMember_file());
			loginMemberBean.setMemberLogin(true);
		}
		
	}

	// 교수 정보 조회
	public ProfessorBean getProfessorInfo(int P_ID) {
		return memberDao.getProfessorInfo(P_ID);
	}
		
	// 학생 학년학기 조회
	public StudentBean getStudentInfo(int Std_ID) {
		return memberDao.getStudentInfo(Std_ID);
	}
	
	// 학과이름 조회
	public String getDepartmentName(int D_ID) {
		return memberDao.getDepartmentName(D_ID);
	}
	
	public MemberBean getModifyMemberInfo(int ID) {
		return memberDao.getModifyMemberInfo(ID);

	}
	
	public void modifyMemberInfo(MemberBean modifyMemberBean) {
		
		MultipartFile upload_file = modifyMemberBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			System.out.println(file_name);
			modifyMemberBean.setMember_file(file_name);
		}
		memberDao.modifyMemberInfo(modifyMemberBean);
	}
	
	// 시간표
	public void timeTableUserInfo(MemberBean timeTableUserInfo) {
	      
	      timeTableUserInfo.setID(loginMemberBean.getID());
	      
	      memberDao.getTimeTableinfo(timeTableUserInfo.getID());
	      
	}
}
