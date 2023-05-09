package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.mapper.LectureMapper;
import kr.co.softsoldesk.mapper.MemberMapper;

@Repository
public class LectureDao {

	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private LectureMapper lectureMapper;

	public List<LectureBean> getTimeTableUserInfo(@Param("ID") int ID, @Param("year") int year, @Param("semester") int semester) {
		return memberMapper.getTimeTableUserInfo(ID, year, semester);

	}

	public List<LectureBean> getProfessorTimeTableUserInfo(@Param("ID") int ID, @Param("year") int year, @Param("semester") int semester) {

		return memberMapper.getProfessorTimeTableUserInfo(ID, year, semester);
	}

	
}
