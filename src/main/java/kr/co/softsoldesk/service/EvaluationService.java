package kr.co.softsoldesk.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
   
   public List<LectureBean> getLectureList(@Param("p_ID") int p_ID,
                                  @Param("year") int year,
                                  @Param("semester") int semester) {
      
      return evaluationDao.getLectureList(p_ID,year,semester);
   }
   
   public Map<String, Object> getEvaluationStatistics(@Param("lec_ID") String lec_ID, @Param("year") int year, @Param("semester") int semester) {
       return evaluationDao.getEvaluationStatistics(lec_ID,year,semester);
   }
   
   public List<String> getFeedbackList(String lec_ID){
      return evaluationDao.getFeedbackList(lec_ID);
   }
   
}