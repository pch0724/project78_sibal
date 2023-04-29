package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.GradeBean;

public interface GradeMapper {


   //세부정보
   @Select("select lec_name, member.name, completion, credits, at_score, m_score, f_score, a_score, gpa from grade inner join lecture on grade.lec_id = lecture.lec_id and semester=g_semester inner join member on member.id=p_id where std_id =#{id} and year=2022 and g_semester=1")
   List<GradeBean> getGradeCheckInfo(int ID);
   
   //전체성적조회-연도별 
   @Select("SELECT year, semester, "
   + "SUM(CASE WHEN completion='전공' THEN credits ELSE 0 END) AS en_a, "
         + "SUM(CASE WHEN completion='교양' THEN credits ELSE 0 END) AS en_b, "
         + "SUM(CREDITS) AS en_all, "
         + "SUM(case when gpa>0 and completion='전공' THEN credits ELSE 0 END) AS ac_a, "
         + "SUM(CASE WHEN gpa>0 and completion='교양' THEN credits ELSE 0 END) AS ac_b, "
         + "SUM(case when gpa>0 then CREDITS else 0 end) AS ac_all, "
         + "ROUND(AVG(gpa),2) as avg_grade "
         + "FROM grade "
         + "INNER JOIN lecture ON grade.lec_id = lecture.lec_id and lecture.semester=grade.g_semester "
         + "INNER JOIN member ON member.id=p_id "
         + "WHERE std_id =#{ID} "
         + "GROUP BY year, semester")
   List<GradeBean> getallchk(int ID);
    
   //전체성적조회-개별연도
   @Select("select year, lecture.semester, grade.lec_id, lec_name, completion, credits, gpa from grade inner join lecture on lecture.lec_id=grade.lec_id and lecture.semester=grade.g_semester where std_id=#{ID} and year=#{year} and semester=#{semester}")
   List<GradeBean> gradebyyear(@Param("ID") int ID, @Param("year") int year, @Param("semester") int semester);
   
}
 