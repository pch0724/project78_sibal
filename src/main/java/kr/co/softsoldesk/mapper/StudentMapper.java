package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.StudentBean;

public interface StudentMapper {

	@Select("select Department_ID ,semester, grade from Student where Std_ID = #{Std_ID}")
	StudentBean getStudentInfo(int Std_ID);
	
}
