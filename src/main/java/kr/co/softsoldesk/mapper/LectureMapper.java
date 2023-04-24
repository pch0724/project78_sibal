package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.MemberBean;

public interface LectureMapper {

	@Select("select ID, Name from member where ID = #{ID}")
	MemberBean getMemberInfo(int ID);
	
}
