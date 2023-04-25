package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.EvaluationBean;
import kr.co.softsoldesk.beans.MemberBean;

public interface EvaluationMapper {
	
	@Select("select ID, Name from member where ID = #{ID}")
	MemberBean getMemberInfo(int ID);
	
	@Select("select grade.lec_id,lec_name,name,credits from lecture inner join member on id=p_id inner join grade on lecture.lec_id=grade.lec_id where yearofopening=2022 and SEMESTER = 1 and std_id=#{ID}")
	List<EvaluationBean> getEvalInfo(int ID);
	
	@Insert("insert into evaluation(lec_ID, std_ID, items1, items2, items3, items4, feedback) values(#{lec_ID},#{std_ID},#{items1},#{items2},#{items3},#{items4},#{feedback})")
	void addEvalInfo(EvaluationBean writeEvalBean);
	
}
