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
	private String password;
	//-----
	@Size(min = 4, max = 18, message = "4~18자 이내로 입력" )
	@Pattern(regexp = "[a-zA-Z0-9]*", message = "영어 대소문자 또는 숫자만 입력")
	private String password2;
	
	private String name;
	
	private String birth;

	private String phone;
	
	private String emergency;
	
	//@Pattern(regexp = "[가-힣0-9]*", message = "한글 또는 숫자만 입력")
	private String address;
	
	@Pattern(regexp = "[0-9]*", message = "숫자만 입력")
	private String entrance;
	
	@Email
	private String email;
	
	private int r_ID;
	
	private String first_login;
	
	private String member_file;
	//MultipartFile : 정적파일
	private MultipartFile upload_file; //oracle엔추가안함
	//---------------------------------------
	private int semester;
	
	private int grade;
	
	private int d_ID;
	
	private String d_name;
	
	
	
	private boolean memberIdExist;
	//최초로그인 여부
	
	private boolean memberLogin;
	
	public MemberBean() {
		this.memberIdExist = false;
		this.memberLogin = false;
	}
	
}
