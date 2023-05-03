package kr.co.softsoldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.service.TimeTableService;

@RequestMapping("/enrollment")
@Controller
public class EnrollmentController {
   
   @Autowired
   private TimeTableService timeTableService;
   
   @GetMapping("/index")
   public String enrollment_index(@ModelAttribute("getTimeTableinfo") MemberBean getTimeTable, Model model) {
      
      String[] day = {"구분", "학과코드", "교과목명", "학점", "교수명", "요일", "강의시간", "강의실", "수강인원", "선택" };
        model.addAttribute("day", day);
      
      timeTableService.timeTableUserInfo(getTimeTable);
      
      return "enrollment/index";
   }
}