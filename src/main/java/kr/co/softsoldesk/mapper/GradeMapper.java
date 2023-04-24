package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.GradeBean;
import kr.co.softsoldesk.beans.GradeDTO;

public interface GradeMapper {

   @Select("SELECT name, std_id, d_name, grade, semester FROM student INNER JOIN member ON std_id = id INNER JOIN department ON department_id = D_id where id=#{ID}")
   GradeDTO getMemberInfo2(int ID);
   /*
   @Select("select lec_name1, lec_name2, lec_name3, lec_name4, lec_name5, lec_name6 from std_history where std_id=#{ID} and semester=1")
   List<Std_HistoryBean> getLecList(int ID);   
    * */
   
   
   //세부정보
   @Select("select lec_name, member.name, completion, credits, at_score, m_score, f_score, a_score, grade.grade from grade inner join lecture on grade.lec_id = lecture.lec_id inner join member on member.id=p_id where std_id =#{id} and yearofopening=2022 and semester=1 ")
   List<GradeBean> getGradeCheckInfo(int ID);
}
 