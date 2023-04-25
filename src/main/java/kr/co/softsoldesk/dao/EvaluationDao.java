package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.EvaluationBean;
import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.mapper.EvaluationMapper;
import kr.co.softsoldesk.mapper.LectureMapper;

@Repository
public class EvaluationDao {
	
	@Autowired
	private EvaluationMapper evaluationMapper;
	
	@Autowired
	private LectureMapper lectureMapper;
	
	//=============================================================
	
	public MemberBean getMemberInfo(int ID) {
		return evaluationMapper.getMemberInfo(ID); 
	}
	
	public List<EvaluationBean> getEvalInfo(int ID) {
		return evaluationMapper.getEvalInfo(ID);
	}
	
	public void addEvalInfo(EvaluationBean writeEvalBean) {
		evaluationMapper.addEvalInfo(writeEvalBean);
	}
	
	public List<LectureBean> getLectureList(int P_ID) {
		return lectureMapper.getLectureList(P_ID);
	}
}
