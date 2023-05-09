package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.mapper.EnrollmentMapper;
import kr.co.softsoldesk.mapper.LectureMapper;

@Repository
public class EnrollmentDao {
	@Autowired
	LectureMapper lectureMapper;
	
	@Autowired
	EnrollmentMapper enrollmentMapper;
	//전공구분선택, 학년선택, 검색을 이용해서 수강신청 진행중인 과목들 출력
	public List<LectureBean> searchLectures(String completion, String grade, String searchValue) {
	    return enrollmentMapper.searchLectures(completion, grade, searchValue);
	}
	//수강신청한 과목들 INSERT
	public void insertGrade(String stdId, String lecId, int year, int semester) {
	    enrollmentMapper.insertGrade(stdId, lecId, year, semester);
	}
	//수강신청한 과목들 출력
	public List<LectureBean> getEnrolledLectures(@Param("stdId") int stdId,
													@Param("semester") int semester,
													@Param("year") int year) {
	    return enrollmentMapper.getEnrolledLectures(stdId,semester,year);
	}
	//수강신청 취소
	public void deleteLecture(@Param("stdId") int stdId, @Param("lecId") String lecId,
						@Param("semester") int semester, @Param("year") int year) {
		enrollmentMapper.deleteLecture(stdId, lecId, semester, year);
	}
	public int capacity(String lec_ID, int year, int semester) {
		   return enrollmentMapper.capacity(lec_ID, year, semester);
		   }
	// 특정 강의 요일 시간
		public LectureBean checkValidBean_Select (@Param("lec_ID")  String lec_ID,
									@Param("year") int year,
									@Param("semester") int semester) {
			return lectureMapper.checkValidBean_Select(lec_ID, year, semester);
		}
		
		public int getEnrolledCredits(@Param("stdId") int stdId, @Param("semester") int semester, @Param("year") int year) {
			return enrollmentMapper.getEnrolledCredits(stdId, semester, year);
		}
		
		public int selectCredits(@Param("lec_ID") String lec_ID, @Param("year") int year, @Param("semester") int semester) {
			return enrollmentMapper.selectCredits(lec_ID, year, semester);
		}
}
