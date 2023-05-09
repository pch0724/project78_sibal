package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.LectureBean;

public interface EnrollmentMapper {
   //전공구분선택, 학년선택, 검색을 이용해서 수강신청 진행중인 과목들 출력(2023자료는 현재 없기에 2022년 1학기로 설정)
   @Select("SELECT LECTURE.LEC_ID, LEC_NAME, GRADE, NAME, CREDITS, COMPLETION, DAY, STARTTIME, ENDTIME, C_ID, CAPACITY, " +
           "(SELECT COUNT(*) FROM GRADE WHERE GRADE.LEC_ID = LECTURE.LEC_ID AND GRADE.YEAR = LECTURE.YEAR AND GRADE.G_SEMESTER = LECTURE.SEMESTER) AS enroll_count, " +
           "CAPACITY - (SELECT COUNT(*) FROM GRADE WHERE GRADE.LEC_ID = LECTURE.LEC_ID AND GRADE.YEAR = LECTURE.YEAR AND GRADE.G_SEMESTER = LECTURE.SEMESTER) AS available_seats " +
           "FROM LECTURE " +
           "INNER JOIN MEMBER ON MEMBER.ID = LECTURE.P_ID " +
           "WHERE COMPLETION LIKE  #{completion}  AND " +
           "LEC_NAME LIKE '%' || #{searchValue} || '%' AND " +
           "SEMESTER = 1 AND " +
           "YEAR = 2022 AND " +
           "(( " +
           "    CASE " +
           "        WHEN #{completion} = '교양' THEN 1 " +
           "        ELSE 0 " +
           "    END " +
           ") = " +
           "( " +
           "    CASE " +
           "        WHEN GRADE = 0 THEN 1 " +
           "        ELSE 0 " +
           "    END " +
           ")) AND " +
           "(GRADE = 0 OR GRADE LIKE  #{grade} )")
   List<LectureBean> searchLectures(@Param("completion") String completion,
                                     @Param("grade") String grade,
                                     @Param("searchValue") String searchValue);



   
   //수강신청한 과목들 INSERT
   @Insert("INSERT INTO GRADE (STD_ID, G_SEMESTER, LEC_ID, YEAR, AT_SCORE, M_SCORE, F_SCORE, A_SCORE, GPA) VALUES (#{stdId}, #{semester}, #{lecId}, #{year}, NULL, NULL, NULL, NULL, NULL)")
    void insertGrade(@Param("stdId") String stdId,
                     @Param("lecId") String lecId,
                     @Param("year") int year,
                     @Param("semester") int semester);
   
   //수강신청한 과목들 출력
   @Select("SELECT LECTURE.LEC_ID, LECTURE.LEC_NAME, LECTURE.GRADE, MEMBER.NAME, CREDITS, COMPLETION, DAY, STARTTIME, ENDTIME, C_ID, CAPACITY,"
         + "(SELECT COUNT(*) FROM GRADE WHERE GRADE.LEC_ID = LECTURE.LEC_ID AND GRADE.YEAR = LECTURE.YEAR AND GRADE.G_SEMESTER = LECTURE.SEMESTER) AS enroll_count "
         + "           FROM LECTURE "
         + "           INNER JOIN MEMBER ON MEMBER.ID = LECTURE.P_ID "
         + "           INNER JOIN GRADE ON LECTURE.LEC_ID=GRADE.LEC_ID AND LECTURE.YEAR=GRADE.YEAR AND SEMESTER=G_SEMESTER "
         + "           "
         + "           WHERE STD_ID=#{stdId} AND "
         + "           SEMESTER = #{semester} AND "
         + "           LECTURE.YEAR = #{year} ")
   List<LectureBean> getEnrolledLectures(@Param("stdId") int stdId,
                                 @Param("semester") int semester,
                                 @Param("year") int year);
   
   //수강신청 취소
   @Delete("DELETE FROM GRADE WHERE std_ID=#{stdId} AND lec_ID=#{lecId} AND G_SEMESTER=#{semester} AND YEAR=#{year} ")
   void deleteLecture(@Param("stdId") int stdId, @Param("lecId") String lecId,
                  @Param("semester") int semester, @Param("year") int year);

 //수강정원
   @Select("select capacity from lecture where lec_id=#{lec_ID} and year=#{year} and semester=#{semester}")
   int capacity(@Param("lec_ID") String lec_ID, @Param("year") int year, @Param("semester") int semester);

   @Select("SELECT NVL(SUM(credits), 0) AS total_credits "
		   + "FROM LECTURE "
		   + "INNER JOIN MEMBER ON MEMBER.ID = LECTURE.P_ID "
		   + "INNER JOIN GRADE ON LECTURE.LEC_ID=GRADE.LEC_ID AND LECTURE.YEAR=GRADE.YEAR AND SEMESTER=G_SEMESTER "
		   + "WHERE STD_ID= #{stdId} AND SEMESTER = #{semester} AND LECTURE.YEAR = #{year}")
   int getEnrolledCredits(@Param("stdId") int stdId,
		   @Param("semester") int semester,
		   @Param("year") int year);
   
   
   @Select("select credits from lecture where lec_id=#{lec_ID} and year=#{year} and semester=#{semester}")
   int selectCredits(@Param("lec_ID") String lec_ID, @Param("year") int year, @Param("semester") int semester);
   
   
   

}