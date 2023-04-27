package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.DepartmentBean;

public interface DepartmentMapper {

	@Select("select d_name from Department where d_ID = #{d_ID}")
	String getDepartmentName(int D_ID);
	
}
