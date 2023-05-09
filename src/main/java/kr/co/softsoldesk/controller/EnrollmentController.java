package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.service.EnrollmentService;
import kr.co.softsoldesk.service.GradeService;
import kr.co.softsoldesk.service.TimeTableService;

@RequestMapping("/enrollment")
@Controller
public class EnrollmentController {
   @Autowired
   private GradeService gradeService;
   
   @Autowired
   private TimeTableService timeTableService;
   
   @Autowired
   private EnrollmentService enrollmentService;
   
   @Resource(name = "loginMemberBean")
   private MemberBean loginMemberBean;
   
   @GetMapping("/index")
   public String enrollment_index(@ModelAttribute("getTimeTableinfo") MemberBean getTimeTable, Model model) {
      
      String[] day = {"구분", "학과코드", "교과목명", "학점", "교수명", "요일", "강의시간", "강의실", "수강인원", "선택" };
        model.addAttribute("day", day);
      
      timeTableService.timeTableUserInfo(getTimeTable);
      
      return "enrollment/index";
   }
   
   //전공구분선택, 학년선택, 검색을 이용해서 수강신청 진행중인 과목들 출력
   @PostMapping("/searchLectures")
   @ResponseBody
   public List<LectureBean> searchLectures(@RequestParam("completion") String completion,
                                           @RequestParam("grade") String grade,
                                           @RequestParam("searchValue") String searchValue) {
       return enrollmentService.searchLectures(completion, grade, searchValue);
   }
   
 //수강신청한 과목들 INSERT
   @PostMapping("/enrollLecture")
   @ResponseBody
   public String enrollLecture(@RequestParam("stdId") String stdId,
                               @RequestParam("lecId") String lecId,
                               @RequestParam("year") int year,
                               @RequestParam("semester") int semester) {
	   LectureBean checkValidBean = enrollmentService.checkValidBean_Select(lecId, year, semester);
       List<LectureBean> checkValidList = enrollmentService.getEnrolledLectures(loginMemberBean.getID(), semester, year);
       int cnt = gradeService.count(lecId, year, semester);
       int capacity = enrollmentService.capacity(lecId, year, semester);
      
       for(LectureBean valid : checkValidList) {
			if (valid.getDay().equals(checkValidBean.getDay()) && valid.getStarttime() <= checkValidBean.getEndtime()
					&& valid.getEndtime() >= checkValidBean.getStarttime()) {
				return "daytimeError";
			}
	  }
       
       if (cnt >= capacity) {
           return "capacityError";
       }
       boolean success = enrollmentService.enrollLecture(stdId, lecId, year, semester);
       if (success) {
           return "success";
       } else {
           return "error";
       }
   }
   
   //수강신청한 과목들 출력
   @GetMapping("/getEnrolledLectures")
   @ResponseBody
   public List<LectureBean> getEnrolledLectures() {
	    return enrollmentService.getEnrolledLectures(loginMemberBean.getID(),1,2022);
	}
   
   //수강신청 취소
   @PostMapping("/deleteLecture")
   public String deleteLecture(@RequestParam("stdId") int stdId,
                                @RequestParam("lecId") String lecId) {
       enrollmentService.deleteLecture(stdId, lecId,1,2022);
       return "redirect:/enrollment/getEnrolledLectures";
   }
   
}