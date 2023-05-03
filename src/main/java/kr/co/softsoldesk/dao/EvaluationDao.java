package kr.co.softsoldesk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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
   
   public List<LectureBean> getLectureList(@Param("p_ID") int p_ID,
                                  @Param("year") int year,
                                  @Param("semester") int semester) {
      return lectureMapper.getLectureList(p_ID,year,semester);
   }
   
   public Map<String, Object> getEvaluationStatistics(@Param("lec_ID") String lec_ID, @Param("year") int year, @Param("semester") int semester) {
       return evaluationMapper.getEvaluationStatistics(lec_ID,year,semester);
   }
   public List<String> getFeedbackList(String lec_ID){
      return evaluationMapper.getFeedbackList(lec_ID);
   }
}