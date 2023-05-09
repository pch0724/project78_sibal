package kr.co.softsoldesk.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	//관리자 권한 회원가입
	public void addMemberInfo(MemberBean joinMemberBean) {
		// 첨부파일 처리
		MultipartFile upload_file = joinMemberBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			//System.out.println(file_name);
			joinMemberBean.setMember_file(file_name);
		}
		//=============================================================
		
		memberDao.addMemberInfo(joinMemberBean);
	}
	
	//회원가입 학생
	public void addStudentInfo(StudentBean joinStudentBean) {
		memberDao.addStudentInfo(joinStudentBean);
	}
	
	//회원가입 교수
	public void addProfessorInfo(ProfessorBean joinProfessorBean) {
		memberDao.addProfessorInfo(joinProfessorBean);
	}
	
	//학과 정보 가져오기
	public DepartmentBean getDepartmentInfo() {
		return memberDao.getDepartmentInfo();
	}
	
	//==================================================================
	
	// 최초 로그인
	public String checkFirstLogin(int ID) {
		return memberDao.checkFirstLogin(ID);
	}
	
	public void modifyFirstLogin(MemberBean modifyLoginMemberBean) {
		memberDao.modifyFirstLogin(modifyLoginMemberBean);
	}
	
	// 로그인
	public void getLoginMemberInfo(MemberBean tempLoginMemberBean) {
		
		MemberBean tempLoginMemberBean2 = memberDao.getLoginMemberInfo(tempLoginMemberBean);
		
		// 가져온 값이 없을 시 예외처리
		if(tempLoginMemberBean2 != null) {
			
			loginMemberBean.setID(tempLoginMemberBean2.getID());
			loginMemberBean.setName(tempLoginMemberBean2.getName());
			loginMemberBean.setPassword(tempLoginMemberBean2.getPassword());
			loginMemberBean.setBirth(tempLoginMemberBean2.getBirth());
			loginMemberBean.setPhone(tempLoginMemberBean2.getPhone());
			loginMemberBean.setEmergency(tempLoginMemberBean2.getEmergency());
			loginMemberBean.setAddress(tempLoginMemberBean2.getAddress());
			loginMemberBean.setEntrance(tempLoginMemberBean2.getEntrance());
			loginMemberBean.setEmail(tempLoginMemberBean2.getEmail());
			loginMemberBean.setR_ID(tempLoginMemberBean2.getR_ID());
			loginMemberBean.setFirst_login(tempLoginMemberBean2.getFirst_login());
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

	// index페이지 취득학점 그래프
	public Map<String, Integer> getStudentCredits(int ID) {
		List<Map<String, Object>> creditList = memberDao.getStudentCredits(ID);
		// System.out.println("MemberService creditList: " + creditList);

		Map<String, Integer> resultMap = new HashMap<>();
		resultMap.put("교양", 0);
		resultMap.put("전공", 0);

		for (Map<String, Object> map : creditList) {
			String completion = (String) map.get("COMPLETION");
			Integer totalCredits = ((Number) map.get("TOTAL_CREDITS")).intValue();

			// Add the totalCredits to the resultMap under the corresponding completion key
			resultMap.put(completion, totalCredits);
		}

		// System.out.println("MemberService resultMap: " + resultMap);
		return resultMap;
	}

	// index페이지 신청학점
	public Map<String, Integer> getStudentappliedCredits(int ID) {
		List<Map<String, Object>> appliedCreditList = memberDao.getStudentappliedCredits(ID);

		Map<String, Integer> appliedresultMap = new HashMap<>();
		appliedresultMap.put("교양", 0);
		appliedresultMap.put("전공", 0);

		for (Map<String, Object> map : appliedCreditList) {
			String completion = (String) map.get("COMPLETION");
			Integer totalCredits = ((Number) map.get("TOTAL_CREDITS")).intValue();

			appliedresultMap.put(completion, totalCredits);
		}

		return appliedresultMap;
	}

	// index페이지 GPA 그래프
	public Map<String, Integer> getGradeDistribution(int ID) {
		return memberDao.getGradeDistribution(ID);
	}
}
