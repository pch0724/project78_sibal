package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.ProfessorBean;


public interface ProfessorMapper {

	@Select("select d_ID from Professor where p_ID = #{p_ID}")
	ProfessorBean getProfessorInfo(int p_ID);
	
}
