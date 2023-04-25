package kr.co.softsoldesk.beans;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberBean {
	
	
	private int ID;
	
	private String Password;
	
	private String Password2;
	
	private String Name;
	
	private String Birth_Date;
	
	private String Phone_num;
	
	private String Emergency_Contact;
	
	private String Address;
	
	private String Entrance_Date;
	
	private String Email;
	
	private int R_id;
	
	private String memberFirstLogin;

	private int semester;
	
	private int grade;
	
	private int D_ID;
	
	private String D_Name;
	
	private String member_file;
	//MultipartFile : 정적파일
	private MultipartFile upload_file;
	
	private boolean memberIdExist;
	//최초로그인 여부
	
	private boolean memberLogin;
	
	public MemberBean() {
		this.memberIdExist = false;
		this.memberLogin = false;
	}
	
}
