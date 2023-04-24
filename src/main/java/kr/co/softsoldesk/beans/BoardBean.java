package kr.co.softsoldesk.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardBean {

		private int Board_no;
		private String Category;
		private String Title;
		private int Writer_ID;
		private String Writer_Name;
		private String content;
		private String boarddate;
}
