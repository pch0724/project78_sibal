package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.StudentBean;

public interface StudentMapper {

	@Select("select d_ID ,s_semester, grade from Student where std_ID = #{std_ID}")
	StudentBean getStudentInfo(int std_ID);
	
}
