package kr.co.softsoldesk.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.dao.EnrollmentDao;

@Service
public class EnrollmentService {

	@Autowired
	EnrollmentDao enrollmentDao;

	@Resource(name = "loginMemberBean")
	private MemberBean loginMemberBean;

	// 전공구분선택, 학년선택, 검색을 이용해서 수강신청 진행중인 과목들 출력
	public List<LectureBean> searchLectures(String completion, String grade, String searchValue) {
		return enrollmentDao.searchLectures(completion, grade, searchValue);
	}

	// 수강신청한 과목들 INSERT
	public boolean enrollLecture(String stdId, String lecId, int year, int semester) {
		try {
			enrollmentDao.insertGrade(stdId, lecId, year, semester);
			return true;
		} catch (Exception e) {
			// 오류 처리를 할 수 있습니다.
			return false;
		}
	}

	// 수강신청한 과목들 출력
	public List<LectureBean> getEnrolledLectures(@Param("stdId") int stdId, @Param("semester") int semester,
			@Param("year") int year) {

		return enrollmentDao.getEnrolledLectures(stdId, semester, year);
	}

	// 수강신청 취소
	public void deleteLecture(@Param("stdId") int stdId, @Param("lecId") String lecId, @Param("semester") int semester,
			@Param("year") int year) {

		enrollmentDao.deleteLecture(stdId, lecId, semester, year);
	}

	public int capacity(String lec_ID, int year, int semester) {
		return enrollmentDao.capacity(lec_ID, year, semester);
	}

	public LectureBean checkValidBean_Select(@Param("lec_ID") String lec_ID, @Param("year") int year,
			@Param("semester") int semester) {
		return enrollmentDao.checkValidBean_Select(lec_ID, year, semester);
	}
}
