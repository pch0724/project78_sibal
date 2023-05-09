package kr.co.softsoldesk.beans;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GradeBean {
   
   private int std_ID;

   private String lec_ID;

   @Min(0)
   @Max(100)
   private int at_score;

   @Min(0)
   @Max(100)
   private int m_score;

   @Min(0)
   @Max(100)
   private int f_score;

   @Min(0)
   @Max(100)
   private int a_score;

   private double gpa;
   // + 선언
   private String lec_name;
   private String name;
   private String completion;
   private int credits;
   // private int total;

   // 전체성적조회 정보
   private int year;
   private int g_semester;
   private int en_a;
   private int en_b;
   private int en_all;
   private int ac_a;
   private int ac_b;
   private int ac_all;
   private double avg_grade;
   private int grade;
   private String d_name;
   private int rank;
   
   
   //성적 등급표시->점수반환 메소드
   @JsonProperty("gradeLetter")
   public String getGradeLetter() {
        if (gpa == 4.5) {
            return "A+";
        } else if (gpa == 4.0) {
            return "A";
        } else if (gpa == 3.5) {
            return "B+";
        } else if (gpa == 3.0) {
            return "B";
        } else if (gpa == 2.5) {
            return "C+";
        } else if (gpa == 2.0) {
            return "C";
        } else if (gpa == 1.5) {
            return "D+";
        } else if (gpa == 1.0) {
            return "D";
        } else {
            return "F";
        }
    }
   
   @JsonProperty("gpacalc")
   public double getgpacalc() {
      if (at_score+m_score+f_score+a_score >= 95) {
         return 4.5;
      }else if(at_score+m_score+f_score+a_score >= 90) {
         return 4;
      }else if(at_score+m_score+f_score+a_score >= 85) {
         return 3.5;
      }else if(at_score+m_score+f_score+a_score >= 80) {
         return 3;
      }else if(at_score+m_score+f_score+a_score >= 75) {
         return 2.5;
      }else if(at_score+m_score+f_score+a_score >= 70) {
         return 2;
      }else if(at_score+m_score+f_score+a_score >= 65) {
         return 1.5;
      }else if(at_score+m_score+f_score+a_score >= 60) {
         return 1;
      }else 
         return 0;
   }
}