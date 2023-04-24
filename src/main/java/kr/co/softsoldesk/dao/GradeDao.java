package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.GradeBean;
import kr.co.softsoldesk.beans.GradeDTO;
import kr.co.softsoldesk.mapper.GradeMapper;

@Repository
public class GradeDao {

   
   @Autowired
   private GradeMapper gradeMapper;
   

   public GradeDTO getMemberInfo2(int ID) {
      
      return gradeMapper.getMemberInfo2(ID);
   }
   /*
   
   public List<Std_HistoryBean> getLecList(int ID) {
       return gradeMapper.getLecList(ID);
   }
    * */
   //매퍼 담기
   public List<GradeBean> getGradeCheckInfo(int ID) {
      return  gradeMapper.getGradeCheckInfo(ID);
   }
}