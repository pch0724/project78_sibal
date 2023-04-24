package kr.co.softsoldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.EvaluationBean;
import kr.co.softsoldesk.dao.Mid_Eva_Dao;

@Service
public class Mid_Eva_Service {

	@Autowired
	private Mid_Eva_Dao midEvaDao;
	
	//===============================================
	
	public List<EvaluationBean> getEvaluationList(){
		
		List<EvaluationBean> evaluationList = midEvaDao.getEvaluationList();
		
		return evaluationList;
	}
	
}
