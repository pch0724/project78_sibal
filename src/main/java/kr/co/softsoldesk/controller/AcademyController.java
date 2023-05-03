package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.GradeBean;
import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.beans.ProfessorBean;
import kr.co.softsoldesk.beans.StudentBean;
import kr.co.softsoldesk.dao.LectureDao;
import kr.co.softsoldesk.service.GradeService;
import kr.co.softsoldesk.service.MemberService;
import kr.co.softsoldesk.service.TimeTableService;

@RequestMapping("/academy")
@Controller
public class AcademyController {

	@Autowired
	private LectureDao lectureDao;

	@Autowired
	private MemberService memberService;

	@Autowired
	private GradeService gradeService;

	@Autowired
	private TimeTableService timeTableService;

	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean;

	// 메인
	@GetMapping("/index")
	public String academy_index(Model model) {

		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		if (r_ID == 3) {

			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			int grade = stdBean.getGrade();
			int s_semester = stdBean.getS_semester();

			model.addAttribute("grade", grade);
			model.addAttribute("s_semester", s_semester);
		}

		return "academy/index";
	}

	// 학적정보
	// 개인정보수정
	@GetMapping("/personal_info")
	public String academy_personal_info(@ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean, Model model) {

		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		if (r_ID == 3) {

			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			int grade = stdBean.getGrade();
			int s_semester = stdBean.getS_semester();

			model.addAttribute("grade", grade);
			model.addAttribute("s_semester", s_semester);
		}

		MemberBean tempModifyMemberBean = memberService.getModifyMemberInfo(loginMemberBean.getID());

		if (tempModifyMemberBean.getR_ID() == 2) {
			ProfessorBean proBean = memberService.getProfessorInfo(loginMemberBean.getID());
			String D_Name = memberService.getDepartmentName(proBean.getD_ID());
			modifyMemberBean.setD_ID(proBean.getD_ID());
			modifyMemberBean.setD_name(D_Name);

		} else if (tempModifyMemberBean.getR_ID() == 3) {
			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			String D_Name = memberService.getDepartmentName(stdBean.getD_ID());

			modifyMemberBean.setS_semester(stdBean.getS_semester());
			modifyMemberBean.setGrade(stdBean.getGrade());
			modifyMemberBean.setD_ID(stdBean.getD_ID());
			modifyMemberBean.setD_name(D_Name);

		}

		modifyMemberBean.setID(tempModifyMemberBean.getID());
		modifyMemberBean.setName(tempModifyMemberBean.getName());
		modifyMemberBean.setPassword(tempModifyMemberBean.getPassword());
		modifyMemberBean.setBirth(tempModifyMemberBean.getBirth());
		modifyMemberBean.setAddress(tempModifyMemberBean.getAddress());
		modifyMemberBean.setEntrance(tempModifyMemberBean.getEntrance());
		modifyMemberBean.setPhone(tempModifyMemberBean.getPhone());
		modifyMemberBean.setEmergency(tempModifyMemberBean.getEmergency());
		modifyMemberBean.setEmail(tempModifyMemberBean.getEmail());
		modifyMemberBean.setMember_file(tempModifyMemberBean.getMember_file());
		return "academy/personal_info";
	}

	@PostMapping("/personal_info_pro")
	public String personal_info_pro(@Valid @ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean,
			BindingResult result, Model model) {
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		if (r_ID == 3) {

			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			int grade = stdBean.getGrade();
			int s_semester = stdBean.getS_semester();

			model.addAttribute("grade", grade);
			model.addAttribute("s_semester", s_semester);
		}
		
		
		if (result.hasErrors()) {

			return "academy/personal_info";
		}
		memberService.modifyMemberInfo(modifyMemberBean);

		return "academy/personal_info_success";
	}

	// 수업
	// 수강신청현황
	@GetMapping("/enrollment")
	public String academy_enrollment(Model model) {
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		if (r_ID == 3) {

			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			int grade = stdBean.getGrade();
			int s_semester = stdBean.getS_semester();

			model.addAttribute("grade", grade);
			model.addAttribute("s_semester", s_semester);
		}

		return "academy/enrollment";
	}

	// 시간표 조회
	   @GetMapping("/timetable")
	   public String academy_timetable(@ModelAttribute("getTimeTableProInfo") MemberBean getTimeTableProInfo,
	         @ModelAttribute("getTimeTableinfo") MemberBean getTimeTable,
	         @ModelAttribute("getTimeTableUserInfo") LectureBean timeTableUserInfo, Model model) {

	      // 권한 구분
	      int r_ID = loginMemberBean.getR_ID();
	      model.addAttribute("r_ID", r_ID);
	      if (r_ID == 3) {

	         StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
	         int grade = stdBean.getGrade();
	         int s_semester = stdBean.getS_semester();

	         model.addAttribute("grade", grade);
	         model.addAttribute("s_semester", s_semester);

	         // 표
	         String[] day = { "월", "화", "수", "목", "금" };
	         model.addAttribute("day", day);

	         // 시간표-이름, 학번, 학과
	         timeTableService.timeTableUserInfo(getTimeTable);

	         // 시간표- 년도, 학기 값 받아오기
	         List<LectureBean> getTimeTableUserInfo = timeTableService.allTimeTableInfo(model);
	         model.addAttribute("getTimeTableUserInfo", getTimeTableUserInfo);

	      }
	      

	      return "academy/timetable";
	   }
	   
	   @GetMapping("/timetable_professor")
	   public String academy_timetable_professor(@ModelAttribute("getTimeTableProInfo") MemberBean getTimeTableProInfo,
	                                   @ModelAttribute("getProfessorTimeTableUserInfo") LectureBean getProfessorTimeTableUserInfo,
	                                   Model model) {
	      int r_ID = loginMemberBean.getR_ID();
	      model.addAttribute("r_ID", r_ID);
	      if (r_ID == 2) {

	         ProfessorBean proBean = memberService.getProfessorInfo(loginMemberBean.getID());
	         int p_ID = proBean.getP_ID();
	         int d_ID = proBean.getD_ID();

	         model.addAttribute("p_ID", p_ID);
	         model.addAttribute("d_ID", d_ID);

	         // 표
	         String[] day = { "월", "화", "수", "목", "금" };
	         model.addAttribute("day", day);

	         // 시간표-이름, 학번, 학과
	         timeTableService.getTimeTableProInfo(getTimeTableProInfo);

	         // 시간표- 년도, 학기 값 받아오기
	         List<LectureBean> getProfessorTimeTableUserInfo1 = timeTableService.getProfessorTimeTableUserInfo(model);
	         model.addAttribute("getProfessorTimeTableUserInfo1", getProfessorTimeTableUserInfo1);

	      }
	      
	      
	      
	      return "academy/timetable_professor";
	   }
	   
	   @GetMapping("/timetable_pro")
	   public String academy_timetable_pro(@Valid 
	         @ModelAttribute("getTimeTableinfo") MemberBean getTimeTableinfo,
	         @ModelAttribute("getTimeTableGradeAnSemeInfo") LectureBean getTimeTableGradeAnSemeInfo,
	         BindingResult result, Model model) {
	      
			// 권한 구분
			int r_ID = loginMemberBean.getR_ID();
			model.addAttribute("r_ID", r_ID);
			if (r_ID == 3) {
	
				StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
				int grade = stdBean.getGrade();
				int s_semester = stdBean.getS_semester();
	
				model.addAttribute("grade", grade);
				model.addAttribute("s_semester", s_semester);
			}

		   
	      if (result.hasErrors()) {
	         System.out.println(result.getAllErrors());
	         return "academy/timetable";
	      }
	      // 학생
	      timeTableService.timeTableUserInfo(getTimeTableinfo);

	      loginMemberBean.setYear(getTimeTableinfo.getYear());
	      loginMemberBean.setSemester(getTimeTableinfo.getSemester());

	      // 시간표 사용자 정보 조회
	      List<LectureBean> getTimeTableinfo1 = lectureDao.getTimeTableUserInfo(getTimeTableinfo.getID(),
	            getTimeTableinfo.getYear(), getTimeTableinfo.getSemester());
	      model.addAttribute("getTimeTableinfo", getTimeTableinfo1);
	      model.addAttribute("loginMemberBean", loginMemberBean.getID());
	      timeTableService.timeTableUserInfo(getTimeTableinfo);

	      return "academy/timetable_success";

	   }

	   @GetMapping("/timetable_professor_pro")
	   public String academy_timetable_professor_pro(@Valid 
	         @ModelAttribute("getTimeTableProInfo") MemberBean getTimeTableProInfo,
	         @ModelAttribute("getProfessorTimeTableUserInfo") LectureBean getProfessorTimeTableUserInfo,
	         BindingResult result, Model model) {
	      
		  int r_ID = loginMemberBean.getR_ID();
		  model.addAttribute("r_ID", r_ID); 
		   
	      if (result.hasErrors()) {
	         System.out.println(result.getAllErrors());
	         return "academy/timetable_professor";
	      
	      }
	      
	      // 교수
	      timeTableService.getTimeTableProInfo(getTimeTableProInfo);

	      loginMemberBean.setYear(getTimeTableProInfo.getYear());
	      loginMemberBean.setSemester(getTimeTableProInfo.getSemester());

	      List<LectureBean> getProfessorTimeTableUserInfo1 = lectureDao.getProfessorTimeTableUserInfo(getTimeTableProInfo.getID(),
	            getTimeTableProInfo.getYear(), getTimeTableProInfo.getSemester());
	      model.addAttribute("getProfessorTimeTableUserInfo1", getProfessorTimeTableUserInfo1);
	      model.addAttribute("loginMemberBean", loginMemberBean.getID());
	      timeTableService.getTimeTableProInfo(getTimeTableProInfo);

	      return "academy/timetable_professor_success";
	   }

	// 금학기성적조회
	@GetMapping("/grade_check")
	public String academy_grade_check(@ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean, Model model,
			@RequestParam(value = "year", defaultValue = "2022") int year,
			@RequestParam(value = "g_semester", defaultValue = "1") int g_semester) {
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		
		MemberBean tempModifyMemberBean = memberService.getModifyMemberInfo(loginMemberBean.getID());

		StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
		String D_Name = memberService.getDepartmentName(stdBean.getD_ID());

		modifyMemberBean.setSemester(stdBean.getS_semester());
		modifyMemberBean.setGrade(stdBean.getGrade());
		modifyMemberBean.setD_ID(stdBean.getD_ID());
		modifyMemberBean.setD_name(D_Name);

		modifyMemberBean.setID(tempModifyMemberBean.getID());
		modifyMemberBean.setName(tempModifyMemberBean.getName());
		modifyMemberBean.setPassword(tempModifyMemberBean.getPassword());
		modifyMemberBean.setBirth(tempModifyMemberBean.getBirth());
		modifyMemberBean.setAddress(tempModifyMemberBean.getAddress());
		modifyMemberBean.setEntrance(tempModifyMemberBean.getEntrance());
		modifyMemberBean.setPhone(tempModifyMemberBean.getPhone());
		modifyMemberBean.setEmergency(tempModifyMemberBean.getEmergency());
		modifyMemberBean.setEmail(tempModifyMemberBean.getEmail());
		modifyMemberBean.setMember_file(tempModifyMemberBean.getMember_file());

		List<GradeBean> getGradeCheckInfo = gradeService.getGradeCheckInfo(loginMemberBean.getID(), year, g_semester);
		model.addAttribute("getGradeCheckInfo", getGradeCheckInfo);

		return "academy/grade_check";
	}

	// 전체 성적조회
	@GetMapping("/all_grade_check")
	public String academy_all_grade_check(@RequestParam(value = "year") Optional<Integer> yeargOpt,
			@RequestParam(value = "g_semester") Optional<Integer> g_semesterOpt, Model model) {
		// 권한 구분
		StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
		int grade = stdBean.getGrade();
		int s_semester = stdBean.getS_semester();

		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		model.addAttribute("grade", grade);
		model.addAttribute("s_semester", s_semester);
		// 전체성적조회
		// 전체성적조회 -> 연도 학기별
		List<GradeBean> totalGPA = gradeService.getallchk(loginMemberBean.getID());
		model.addAttribute("totalGPA", totalGPA);
		int size1 = totalGPA.size() - 1;
		model.addAttribute("size1", size1);
		// 전체성적조회 -> 합산
		List<GradeBean> totalList = gradeService.totalBean(loginMemberBean.getID());
		GradeBean totalBean = null;

		if (totalList != null && !totalList.isEmpty()) {
			totalBean = totalList.get(0);
		}

		model.addAttribute("totalBean", totalBean);

		return "academy/all_grade_check";
	}

	@GetMapping("/grade_input")
	public String academy_grade_input(@ModelAttribute("grade_input") GradeBean grade_input,
			@RequestParam(value = "year", defaultValue = "2022") int year,
			@RequestParam(value = "semester", defaultValue = "1") int semester, Model model) {

		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		if (r_ID == 3) {

			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			int grade = stdBean.getGrade();
			int s_semester = stdBean.getS_semester();

			model.addAttribute("grade", grade);
			model.addAttribute("s_semester", s_semester);
		}

		List<LectureBean> list = gradeService.LecListbyID(loginMemberBean.getID(), year, semester);
		int size = list.size() - 1;

		List<Integer> counts = new ArrayList<>();
		List<List<GradeBean>> stdList = new ArrayList<>();
		List<List<GradeBean>> stdInfoList = new ArrayList<>();

		for (LectureBean lecture : list) {
			int count = gradeService.count(lecture.getLec_ID(), year, semester);
			counts.add(count);
			List<GradeBean> slist = gradeService.getStdList(loginMemberBean.getID(), lecture.getLec_ID(), year,
					semester);
			stdList.add(slist);

			List<GradeBean> tempStdInfoList = new ArrayList<>();
			for (GradeBean gradeBean : slist) {
				int std_ID = gradeBean.getStd_ID();
				GradeBean stdInfo = gradeService.getStdInfo(std_ID, lecture.getLec_ID(), year, semester);
				tempStdInfoList.add(stdInfo);
			}
			stdInfoList.add(tempStdInfoList);
		}

		model.addAttribute("list", list);
		model.addAttribute("size", size);
		model.addAttribute("counts", counts);
		model.addAttribute("stdList", stdList);
		model.addAttribute("stdInfoList", stdInfoList);

		return "academy/grade_input";
	}

	// 성적입력 확인
	@GetMapping("/grade_output")
	public String academy_grade_output(@RequestParam(value = "year", defaultValue = "2022") int year,
			@RequestParam(value = "semester", defaultValue = "1") int semester, Model model) {
		// 권한 구분
		int r_ID = loginMemberBean.getR_ID();
		model.addAttribute("r_ID", r_ID);
		if (r_ID == 3) {

			StudentBean stdBean = memberService.getStudentInfo(loginMemberBean.getID());
			int grade = stdBean.getGrade();
			int s_semester = stdBean.getS_semester();

			model.addAttribute("grade", grade);
			model.addAttribute("s_semester", s_semester);
		}

		List<LectureBean> list = gradeService.LecListbyID(loginMemberBean.getID(), year, semester);
		int size = list.size() - 1;

		List<Integer> counts = new ArrayList<>();
		List<List<GradeBean>> stdList = new ArrayList<>();
		for (LectureBean lecture : list) {
			int count = gradeService.count(lecture.getLec_ID(), year, semester);
			counts.add(count);
			List<GradeBean> slist = gradeService.getStdList(loginMemberBean.getID(), lecture.getLec_ID(), year,
					semester);
			// 학생들을 총점 기준으로 내림차순 정렬
			slist.sort(
					(g1, g2) -> Integer.compare(g2.getAt_score() + g2.getM_score() + g2.getF_score() + g2.getA_score(),
							g1.getAt_score() + g1.getM_score() + g1.getF_score() + g1.getA_score()));

			// 순위를 계산하고 GradeBean에 저장
			int rank = 1;
			int prevTotal = -1;
			for (int i = 0; i < slist.size(); i++) {
				GradeBean gradeBean = slist.get(i);
				int total = gradeBean.getAt_score() + gradeBean.getM_score() + gradeBean.getF_score()
						+ gradeBean.getA_score();

				// 이전 학생의 총점과 현재 학생의 총점이 다르면 순위 증가
				if (prevTotal != total) {
					rank = i + 1;
					prevTotal = total;
				}

				gradeBean.setRank(rank);
			}

			stdList.add(slist);
		}

		model.addAttribute("list", list);
		model.addAttribute("size", size);
		model.addAttribute("counts", counts);
		model.addAttribute("stdList", stdList);

		return "academy/grade_output";
	}

}
