package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.DepartmentBean;

public interface DepartmentMapper {

	@Select("select D_Name from Department where D_ID = #{D_ID}")
	String getDepartmentName(int D_ID);
	
}
