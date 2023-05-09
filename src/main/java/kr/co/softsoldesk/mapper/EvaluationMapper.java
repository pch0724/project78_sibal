package kr.co.softsoldesk.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.EvaluationBean;
import kr.co.softsoldesk.beans.MemberBean;

public interface EvaluationMapper {
   
   @Select("select ID, name from member where ID = #{ID}")
   MemberBean getMemberInfo(int ID);
   /*
   @Select("select grade.lec_id,lec_name,name,credits from lecture inner join member on id=p_id inner join grade on lecture.lec_id=grade.lec_id where year=2022 and semester = 1 and std_id=#{ID}")
   List<EvaluationBean> getEvalInfo(int ID);
   */
   @Insert("insert into evaluation(lec_ID, std_ID, items1, items2, items3, items4, feedback) values(#{lec_ID},#{std_ID},#{items1},#{items2},#{items3},#{items4},#{feedback})")
   void addEvalInfo(EvaluationBean writeEvalBean);
   
   @Select("SELECT Distinct L.lec_ID, L.lec_name, M.name, L.credits, "
          + "       CASE WHEN EXISTS (SELECT 1 FROM evaluation WHERE lec_ID = L.lec_ID AND std_ID = #{ID}) THEN 1 ELSE 0 END AS completed "
          + "FROM lecture L, member M, grade G "
          + "WHERE L.p_id = M.id AND L.lec_ID = G.lec_ID AND G.std_ID = #{ID} and L.year = 2022 AND G.g_semester = 1 order by l.lec_id")
    @Results(id = "EvaluationBean", value = {
               @Result(property = "completed", column = "completed", javaType = Boolean.class)
          })
    List<EvaluationBean> getEvalInfo(int ID);
   
   @Select("  WITH grade_counts AS ( "
	         + "  SELECT COUNT(DISTINCT std_id) AS grade_std_count "
	         + "  FROM Grade "
	         + "  WHERE lec_id = #{lec_ID} AND year = #{year} AND g_semester = #{semester} "
	         + "), "
	         + "evaluation_counts AS ( "
	         + "  SELECT  "
	         + "    COUNT(DISTINCT std_id) AS evaluation_std_count, "
	         + "    ROUND(AVG(items1), 2) AS avg_items1, "
	         + "    ROUND(AVG(items2), 2) AS avg_items2, "
	         + "    ROUND(AVG(items3), 2) AS avg_items3, "
	         + "    ROUND(AVG(items4), 2) AS avg_items4 "
	         + "  FROM Evaluation "
	         + "  WHERE lec_id = #{lec_ID} AND year = #{year} AND semester = #{semester} "
	         + ") "
	         + "SELECT  "
	         + "  g.grade_std_count, "
	         + "  e.evaluation_std_count, "
	         + "  e.avg_items1, "
	         + "  e.avg_items2, "
	         + "  e.avg_items3, "
	         + "  e.avg_items4, "
	         + "  ROUND((e.avg_items1 + e.avg_items2 + e.avg_items3 + e.avg_items4), 2) AS total_sum, "
	         + "  ROUND(((e.avg_items1 + e.avg_items2 + e.avg_items3 + e.avg_items4) / 4), 2) AS total_avg "
	         + "FROM grade_counts g, evaluation_counts e")
   Map<String, Object> getEvaluationStatistics(@Param("lec_ID") String lec_ID, @Param("year") int year, @Param("semester") int semester);
   
   @Select("SELECT FEEDBACK FROM EVALUATION WHERE LEC_ID = #{lec_ID} AND FEEDBACK IS NOT NULL")
   List<String> getFeedbackList(String lec_ID);

   
}