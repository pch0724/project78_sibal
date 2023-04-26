package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.ProfessorBean;


public interface ProfessorMapper {

	@Select("select Department_ID from Professor where P_ID = #{P_ID}")
	ProfessorBean getProfessorInfo(int P_ID);
	
}
