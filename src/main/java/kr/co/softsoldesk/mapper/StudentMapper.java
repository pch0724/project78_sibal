package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.StudentBean;

public interface StudentMapper {

	@Select("select d_ID ,s_semester, grade from Student where std_ID = #{std_ID}")
	StudentBean getStudentInfo(int std_ID);
	//===================================================================================================================
	// 관리자 회원가입 시 추가 - r_id =3(학생)일 경우 호출
	@Insert("insert into student(std_ID, d_ID, grade, s_semester) values(#{std_ID}, #{d_ID}, #{grade}, #{s_semester})")
	void addStudentInfo(StudentBean joinStudentBean);
	
}
