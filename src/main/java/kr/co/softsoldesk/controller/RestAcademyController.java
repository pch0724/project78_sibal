package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.softsoldesk.beans.GradeBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.service.GradeService;



@RestController
public class RestAcademyController {
   
   @Resource(name = "loginMemberBean")
   private MemberBean loginMemberBean;
   

   @Autowired
   private GradeService gradeService;
   
   @GetMapping("/all_grade_check.do")
   @ResponseBody
   public ResponseEntity<List<GradeBean>> academy_all_grade_check(@RequestParam(value = "year") int year,
                                                                  @RequestParam(value = "g_semester") int g_semester) {
       List<GradeBean> totalbyyear = new ArrayList<>();
       try {
           totalbyyear = gradeService.gradebyyear(loginMemberBean.getID(), year, g_semester);
       } catch (Exception e) {
           e.printStackTrace();
       }
    
       return ResponseEntity.ok(totalbyyear);
   }
}