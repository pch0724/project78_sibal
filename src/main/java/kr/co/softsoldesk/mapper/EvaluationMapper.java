package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.EvaluationBean;

public interface EvaluationMapper {

	@Select("select Lec_ID, items1, items2, items3, items4, feedback from evaluation order by Lec_ID")
	List<EvaluationBean> getEvaluationList();
	
	
}
