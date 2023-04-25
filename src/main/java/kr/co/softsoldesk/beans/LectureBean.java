package kr.co.softsoldesk.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LectureBean {
	
	   private int ID;
	   private String lec_id;
	   
	   private String lec_name;
	   private int p_id;
	   private String completion;
	   private int credits;
	   private String dayOftheWeek;
	   private int starttime;
	   private int endtime;
	   private String r_id;

	   
	   private int grade;
	   private int capacity;
	   
	   
	   private int yearofopening;
	   private int d_id;
	   private int semester;
}
