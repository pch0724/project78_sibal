package kr.co.softsoldesk.beans;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardBean {

	private int board_idx;
	//private String category;
	private String title;
	private int w_ID; //MEMBER - ID랑 연결될 예정
	private String w_name;
	private String text;
	private String boarddate;
	//파일주소
	private String content_file;
	//정적파일
	private MultipartFile upload_file;
}
