package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.ProfessorBean;


public interface ProfessorMapper {

	@Select("select d_ID from Professor where p_ID = #{p_ID}")
	ProfessorBean getProfessorInfo(int p_ID);
	//=============================================================================================================
	// 관리자 회원가입 - r_id = 2(교수)일 경우 추가
	@Insert("insert into professor(p_ID, d_ID) values(#{p_ID}, #{d_ID})")
	void addProfessorInfo(ProfessorBean joinProfessorBean);
	
}
