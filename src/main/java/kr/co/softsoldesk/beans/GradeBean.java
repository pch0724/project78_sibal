package kr.co.softsoldesk.beans;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

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
	   
	   private int gpa;
	   //+ 선언
	   private String lec_name;
	   private String name;
	   private String completion;
	   private int credits;
	   //private int total;
   
}