package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
   

   
   @PostMapping("/grade_input.pro")
   public ResponseEntity<Void> gradeInput(@RequestBody GradeBean gradeBean, @ModelAttribute("grade_input") GradeBean grade_input, Model model) {
      
      
       try {
          gradeService.grade_input(gradeBean);
              System.out.println(gradeBean.getA_score());
              System.out.println(gradeBean.getStd_ID());
              System.out.println(gradeBean.getLec_ID());
           return new ResponseEntity<>(HttpStatus.OK);
       } catch (Exception e) {
           e.printStackTrace();
           return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
       }
   }

}