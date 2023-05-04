package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.GradeBean;
import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.ProfessorBean;


public interface ProfessorMapper {

	@Select("select d_ID from Professor where p_ID = #{p_ID}")
	ProfessorBean getProfessorInfo(int p_ID);
	//=============================================================================================================
	// 관리자 회원가입 - r_id = 2(교수)일 경우 추가
	@Insert("insert into professor(p_ID, d_ID) values(#{p_ID}, #{d_ID})")
	void addProfessorInfo(ProfessorBean joinProfessorBean);
	
	// 성적입력 -강의목록
	@Select("select lec_id, lec_name, completion, grade, credits, c_id, capacity, day, starttime, endtime "
			+ "from lecture " + "where p_id=#{ID} and year=#{year} and semester=#{semester}")
	List<LectureBean> LecListbyID(@Param("ID") int ID, @Param("year") int year, @Param("semester") int semester);

	// 성적입력-수강인원
	@Select("select count(*) from grade where lec_id=#{lec_ID} and year=#{year} and g_semester=#{semester}")
	int count(@Param("lec_ID") String lec_ID, @Param("year") int year, @Param("semester") int semester);

	// 성적입력-학생리스트
	@Select("select grade.std_id, name, d_name, student.grade, at_score, m_score, f_score, a_score, gpa from grade "
			+ "inner join member on grade.std_ID=ID " + "inner join student on grade.std_ID=student.std_id "
			+ "inner join department on  student.d_id=department.d_id "
			+ "inner join lecture on grade.lec_id=lecture.lec_id and grade.year=lecture.year and grade.g_semester=lecture.semester "
			+ "where lecture.p_id=#{ID} and lecture.lec_id=#{lec_ID} and lecture.year=#{year} and lecture.semester=#{semester}")
	List<GradeBean> getStdList(@Param("ID") int ID, @Param("lec_ID") String lec_ID, @Param("year") int year, @Param("semester") int semester);

	// 성적입력할 정보출력
	@Select("select at_score, m_score, f_score, a_score from grade where std_ID=#{std_ID} and lec_id=#{lec_ID} and g_semester=#{semester} and year=#{year}")
	GradeBean getStdInfo(@Param("std_ID") int std_ID, @Param("lec_ID") String lec_ID, @Param("year") int year, @Param("semester") int semester);

	//성적입력수행
   @Update("update grade set at_score=#{at_score, jdbcType=INTEGER}, m_score=#{m_score, jdbcType=INTEGER}, f_score=#{f_score, jdbcType=INTEGER}, a_score=#{a_score, jdbcType=INTEGER} "
           + "where std_ID=#{std_ID, jdbcType=INTEGER} "
           + "and lec_ID=#{lec_ID, jdbcType=VARCHAR} "
           + "and g_semester=#{g_semester, jdbcType=INTEGER} "
           + "and year=#{year, jdbcType=INTEGER}")
   void grade_input(GradeBean grade_input);


}
