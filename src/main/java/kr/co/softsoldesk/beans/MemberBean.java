package kr.co.softsoldesk.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberBean {
	
	
	private int ID;
	
	private String Password;
	
	private String Name;
	
	private String Birth_Date;
	
	private String Phone_num;
	
	private String Emergency_Contact;
	
	private String Address;
	
	private String Entrance_Date;
	
	private String Email;
	
	private int R_id;
	
	private int semester;
	
	private int grade;
	
	private int D_ID;
	
	private String D_Name;
	
	private boolean memberIdExist;
	
	private boolean memberLogin;
	
	public MemberBean() {
		this.memberIdExist = false;
		this.memberLogin = false;
	}
	
}
