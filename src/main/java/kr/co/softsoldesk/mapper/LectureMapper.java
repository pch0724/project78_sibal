package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;

public interface LectureMapper {

	@Select("select lec_id, lec_name, completion, grade, credits, r_id, capacity, dayoftheweek, starttime, endtime from lecture where p_id = #{p_id} and semester = 1 order by lec_id")
	List<LectureBean> getLectureList(int P_ID);
	
}
