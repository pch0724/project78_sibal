package kr.co.softsoldesk.beans;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberBean {
	
	
	private int ID;
	
	@Size(min = 4, max = 18, message = "4~18자 이내로 입력")
	@Pattern(regexp = "[a-zA-Z0-9]*", message = "영어 대소문자 또는 숫자만 입력")
	private String Password;
	
	@Size(min = 4, max = 18, message = "4~18자 이내로 입력" )
	@Pattern(regexp = "[a-zA-Z0-9]*", message = "영어 대소문자 또는 숫자만 입력")
	private String Password2;
	
	private String Name;
	
	private String Birth_Date;

	private String Phone_num;
	
	private String Emergency_Contact;
	
	//@Pattern(regexp = "[가-힣0-9]*", message = "한글 또는 숫자만 입력")
	private String Address;
	
	@Pattern(regexp = "[0-9]*", message = "숫자만 입력")
	private String Entrance_Date;
	
	@Email
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
