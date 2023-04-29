package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.GradeBean;
import kr.co.softsoldesk.mapper.GradeMapper;

@Repository
public class GradeDao {

   
   @Autowired
   private GradeMapper gradeMapper;
   


   //매퍼 담기
   public List<GradeBean> getGradeCheckInfo(int ID) {
      return  gradeMapper.getGradeCheckInfo(ID);
   }
   
   // 전체 성적 조회
   public List<GradeBean> getallchk(int ID){
	      return gradeMapper.getallchk(ID);
   }
	  
   public List<GradeBean> gradebyyear(int ID, int year, int semester){
      return gradeMapper.gradebyyear(ID ,year, semester);
   }
	   
   
}