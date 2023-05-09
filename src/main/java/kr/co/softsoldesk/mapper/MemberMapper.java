package kr.co.softsoldesk.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;

public interface MemberMapper {
	
	@Select("select name from member where ID = #{ID}")
	String checkMemberIdExist(String ID);
	
	@Select("select ID, Name, password, birth, phone, emergency, address, entrance, email, r_id, first_login, member_file from member where ID = #{ID} and password = #{password}")
	MemberBean getLoginMemberInfo(MemberBean tempLoginMemberBean);
	
	@Select("select first_login from member where ID = #{ID}")
	String checkFirstLoginMember(int ID);
	
	@Update("update member set password = #{password}, first_login = 'true' where ID = #{ID}")
	void modifyFirstLogin(MemberBean modifyLoginMemberBean);
	
	@Select("select ID, Name, password, birth, phone, emergency, address, entrance, email, r_id, member_file from member where ID = #{ID}")
	MemberBean getModifyMemberInfo(int ID);
	
	//@Update("update member set Password = #{Password}, Phone_num = #{Phone_num}, Emergency_Contact = #{Emergency_Contact}, Address = #{Address}, Email = #{Email} where ID = #{ID}")
	@Update("update member set password = #{password}, phone = #{phone}, emergency = #{emergency}, address = #{address}, email = #{email}, member_file = #{member_file, jdbcType=VARCHAR} where ID = #{ID}")
	void modifyMemberInfo(MemberBean modifyMemberBean);

	//시간표 - 학생
	   @Select("select name, ID, d_name "
	            + "from member inner join student on ID=std_ID inner join department on student.d_ID=department.d_ID "
	            + "where ID=#{ID}")
	   MemberBean getTimeTableinfo(int ID);
	   //시간표 - 교수
	   @Select("SELECT Member.name, Member.ID, Department.d_name "
	         + "FROM Member "
	         + "INNER JOIN Professor ON Member.ID = Professor.P_ID "
	         + "INNER JOIN Department ON Professor.d_ID = Department.d_ID "
	         + "WHERE Member.ID = #{ID}")
	   MemberBean getTimeTableProInfo(int ID);
	      
	   // 시간표 year, semester 값 받기       LectureDAO -- 학생
	    @Select("SELECT l.lec_ID, l.lec_name, l.completion, l.credits, l.day, l.starttime, l.endtime, l.c_ID, l.capacity "
	          + "FROM lecture l "
	          + "INNER JOIN grade g ON l.lec_ID = g.lec_ID "
	          + "  AND l.year = g.year "
	          + "  AND l.semester = g.g_semester "
	          + "WHERE g.std_ID = #{ID} "
	          + "  AND l.year = #{year} "
	          + "  AND l.semester = #{semester}")
	    List<LectureBean> getTimeTableUserInfo(@Param("ID") int ID, @Param("year") int year, @Param("semester") int semester);
	    
	    // 시간표 year, semester 값 받기       LectureDAO -- 교수
	    
	    @Select("SELECT l.lec_ID, l.lec_name, l.completion, l.credits, l.day, l.starttime, l.endtime, l.c_ID, l.capacity "
	            + "FROM lecture l "
	            + "INNER JOIN professor p ON l.p_ID = p.p_ID "
	            + "WHERE p.p_ID = #{ID} "
	            + "  AND l.year = #{year} "
	            + "  AND l.semester = #{semester}")
	    List<LectureBean> getProfessorTimeTableUserInfo(@Param("ID") int ID, @Param("year") int year, @Param("semester") int semester);
    
    //index페이지 취득학점 그래프
    @Select("SELECT completion, SUM(credits) AS total_credits "
          + "FROM ( "
          + "    SELECT lec_ID, completion, credits "
          + "    FROM lecture "
          + "    WHERE (lec_ID, year, semester) IN ( "
          + "        SELECT lec_ID, MAX(year) AS max_year, MAX(semester) KEEP (DENSE_RANK LAST ORDER BY year) AS max_semester "
          + "        FROM lecture "
          + "        WHERE lec_ID IN ( "
          + "            SELECT lec_ID "
          + "            FROM grade "
          + "            WHERE std_ID = #{ID} AND GPA > 0 "
          + "        ) "
          + "        GROUP BY lec_ID "
          + "    ) "
          + ") "
          + "GROUP BY completion")
    List<Map<String, Object>> getStudentCredits(int ID);
    
    //index페이지 신청학점
    @Select("SELECT completion, SUM(credits) AS total_credits "
          + "FROM ( "
          + "    SELECT lec_ID, completion, credits "
          + "    FROM lecture "
          + "    WHERE (lec_ID, year, semester) IN ( "
          + "        SELECT lec_ID, MAX(year) AS max_year, MAX(semester) KEEP (DENSE_RANK LAST ORDER BY year) AS max_semester "
          + "        FROM lecture "
          + "        WHERE lec_ID IN ( "
          + "            SELECT lec_ID "
          + "            FROM grade "
          + "            WHERE std_ID = #{ID} "
          + "        ) "
          + "        GROUP BY lec_ID "
          + "    ) "
          + ") "
          + "GROUP BY completion")
    List<Map<String, Object>> getStudentappliedCredits(int ID);
    
    
    //index페이지 GPA 그래프
    @Select("SELECT "
          + "    SUM(CASE WHEN GPA >= 4.5 THEN 1 ELSE 0 END) AS A_plus, "
          + "    SUM(CASE WHEN GPA >= 4.0 AND GPA < 4.5 THEN 1 ELSE 0 END) AS A, "
          + "    SUM(CASE WHEN GPA >= 3.5 AND GPA < 4.0 THEN 1 ELSE 0 END) AS B_plus, "
          + "    SUM(CASE WHEN GPA >= 3.0 AND GPA < 3.5 THEN 1 ELSE 0 END) AS B, "
          + "    SUM(CASE WHEN GPA >= 2.5 AND GPA < 3.0 THEN 1 ELSE 0 END) AS C_plus, "
          + "    SUM(CASE WHEN GPA >= 2.0 AND GPA < 2.5 THEN 1 ELSE 0 END) AS C, "
          + "    SUM(CASE WHEN GPA >= 1.5 AND GPA < 2.0 THEN 1 ELSE 0 END) AS D_plus, "
          + "    SUM(CASE WHEN GPA >= 0.5 AND GPA < 1.5 THEN 1 ELSE 0 END) AS D, "
          + "    SUM(CASE WHEN GPA <= 0.0 THEN 1 ELSE 0 END) AS F "
          + "FROM "
          + "    Grade "
          + "WHERE "
          + "    STD_ID = #{ID}")
    Map<String, Integer> getGradeDistribution(int ID);
    
	//============================================================================================================================================================================
    // 관리자 회원 추가
    @Insert("insert into member(ID, password, name, birth, phone, emergency, address, entrance, r_ID, first_login, member_file) "
    		+ "values(#{ID}, #{password}, #{name}, #{birth}, #{phone}, #{emergency}, #{address}, sysdate, #{r_ID}, #{first_login}, #{member_file})")
    void addMemberInfo(MemberBean joinMemberBean);
    
    
    
}
