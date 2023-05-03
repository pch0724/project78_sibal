package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.GradeBean;

public interface GradeMapper {


   //세부정보
   @Select("select lec_name, member.name, completion, credits, at_score, m_score, f_score, a_score, gpa from grade inner join lecture on grade.lec_id = lecture.lec_id and semester=g_semester inner join member on member.id=p_id where std_id =#{ID} and grade.year=#{year} and g_semester=#{g_semester}")
   List<GradeBean> getGradeCheckInfo(@Param("ID") int ID, @Param("year") int year, @Param("g_semester") int g_semester);
   
   //전체성적조회-연도별 
   @Select("select grade.year, g_semester, "
         + "sum(case when completion='전공' then credits else 0 end) as en_a, "
         + "sum(case when completion='교양' then credits else 0 end) as en_b, "
        + "sum(credits) as en_all, "
        + "sum(case when gpa>0 and completion='전공' then credits else 0 end) as ac_a, "
        + "sum(case when gpa>0 and completion='교양' then credits else 0 end) as ac_b, "
        + "sum(case when gpa>0 then credits else 0 end) as ac_all, "
        + "round(avg(gpa),2) as avg_grade "
        + "from grade "
        + "inner join lecture on grade.lec_id = lecture.lec_id and lecture.semester=grade.g_semester "
        + "inner join member on member.id=p_id "
        + "where std_id =#{ID} "
        + "group by grade.year, g_semester")
   List<GradeBean> getallchk(int ID);
   
   //전체성적조회-합계
   @Select("select "
         + "sum(case when completion='전공' then credits else 0 end) as en_a, "
         + "sum(case when completion='교양' then credits else 0 end) as en_b, "
         + "sum(credits) as en_all, "
         + "sum(case when gpa>0 and completion='전공' then credits else 0 end) as ac_a, "
         + "sum(case when gpa>0 and completion='교양' then credits else 0 end) as ac_b, "
         + "sum(case when gpa>0 then credits else 0 end) as ac_all, "
         + "round(avg(gpa),2) as avg_grade "
         + "from grade "
         + "inner join lecture on grade.lec_id = lecture.lec_id "
         + "and lecture.semester=grade.g_semester "
         + "inner join member on member.id=p_id "
         + "where std_id =#{ID}")
   List<GradeBean> totalBean(int ID);
    
   //전체성적조회-개별연도
   @Select("select grade.year, grade.g_semester, grade.lec_id, lec_name, completion, credits, gpa "
         + "from grade inner join lecture on lecture.lec_id=grade.lec_id "
         + "and lecture.semester=grade.g_semester "
         + "where std_id=#{ID} and grade.year=#{year} and g_semester=#{g_semester}")
   List<GradeBean> gradebyyear(@Param("ID") int ID, @Param("year") int year, @Param("g_semester") int g_semester);
   
   
   //수강 내역 조회
   @Select("select grade.lec_ID, lecture.lec_name, completion, credits, day, starttime, endtime "
   		+ "from grade "
   		+ "inner join member on  grade.std_ID = member.id "
   		+ "inner join lecture on  grade.lec_id = lecture.lec_id and lecture.year=grade.year and lecture.semester=grade.g_semester "
   		+ "where std_ID = #{std_ID} and grade.year = #{year} and g_semester = #{g_semester}")
   List<GradeBean> getLectureList(int std_ID, int year, int g_semester);
   
   //수강교과목 교수 이름 조회
   @Select("select name from member "
   		+ "inner join professor on ID = p_ID "
   		+ "inner join lecture on professor.p_ID = lecture.p_ID "
   		+ "where lec_ID =#{lec_ID}")
   String getProfessorName(String lec_ID);
   
}
 