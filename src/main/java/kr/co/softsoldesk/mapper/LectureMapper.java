package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;

public interface LectureMapper {
	
	@Select("select ID, Name from member where ID = #{ID}")
	MemberBean getMemberInfo(int ID);
	
	@Select("select lec_id, lec_name, completion, grade, credits, c_id, capacity, day, starttime, endtime from lecture where p_ID = #{p_ID} and year=#{year} and semester=#{semester} order by lec_id")
	   List<LectureBean> getLectureList(@Param("p_ID") int p_ID,
	                            		@Param("year") int year,
	                            		@Param("semester") int semester);
	
	@Select("select day, starttime, endtime from lecture where lec_ID = '${lec_ID}' and year = ${year} and semester = ${semester}")
	LectureBean checkValidBean_Select (@Param("lec_ID")  String lec_ID,
								@Param("year") int year,
								@Param("semester") int semester);
	
}
