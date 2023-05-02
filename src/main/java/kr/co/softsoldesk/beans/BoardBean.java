package kr.co.softsoldesk.beans;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardBean {

	private int board_idx;
	//private String category;
	@NotBlank(message = "제목을 입력하세요.")
	@Size(min = 4, max = 20, message = "4 ~ 20자 이내로 입력하세요.")
	private String title;
	private int w_ID; //MEMBER - ID랑 연결될 예정
	private String w_name;
	@NotBlank(message = "내용을 입력하세요.")
	@Size(min = 4, message = "4자 이상 입력하세요.")
	private String text;
	private String boarddate;
	//파일주소
	private String content_file;
	//정적파일
	private MultipartFile upload_file;
}
