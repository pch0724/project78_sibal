package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.EvaluationBean;
import kr.co.softsoldesk.mapper.EvaluationMapper;

@Repository
public class Mid_Eva_Dao {
	
	@Autowired
	private EvaluationMapper evaluationMapper;
	
	//=============================================================
	
	public List<EvaluationBean> getEvaluationList(){
		
		List<EvaluationBean> evaluationList = evaluationMapper.getEvaluationList();
				
		return evaluationList;	
	}
}
