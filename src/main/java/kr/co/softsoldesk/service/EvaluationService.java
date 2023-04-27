package kr.co.softsoldesk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.softsoldesk.beans.EvaluationBean;
import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.dao.EvaluationDao;

@Service
public class EvaluationService {

	@Autowired
	private EvaluationDao evaluationDao;
	
	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean;
	
	//===============================================
	

	public void getMemberInfo(MemberBean getInfoMemberBean) {
		MemberBean tempGetInfoMemberBean = evaluationDao.getMemberInfo(loginMemberBean.getID());
		
		getInfoMemberBean.setID(tempGetInfoMemberBean.getID());
		getInfoMemberBean.setName(tempGetInfoMemberBean.getName());
	}
	
	public List<EvaluationBean> getEvalInfo(int ID) {
		
		return evaluationDao.getEvalInfo(ID);
		
	}
	
	public void addEvalInfo(EvaluationBean writeEvalBean) {
		
		writeEvalBean.setStd_ID(loginMemberBean.getID());
		evaluationDao.addEvalInfo(writeEvalBean);
		
	}
	
	public List<LectureBean> getLectureList(int P_ID) {
		
		return evaluationDao.getLectureList(P_ID);
	}
	
	
}
