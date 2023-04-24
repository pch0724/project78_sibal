package kr.co.softsoldesk.beans;

import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EvaluationBean {
	
	private String Lec_ID;
	private int Std_ID;
	private int items1;
	private int items2;
	private int items3;
	private int items4;
	
	@Size(max = 200)
	private String feedback;
}
