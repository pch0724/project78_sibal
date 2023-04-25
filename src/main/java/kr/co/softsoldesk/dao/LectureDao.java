package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.mapper.LectureMapper;
import kr.co.softsoldesk.mapper.MemberMapper;

@Repository
public class LectureDao {
	
	@Autowired
	private MemberMapper memberMapper;
	   
	public List<LectureBean> timeTableUserInfo(int ID) {
	      return memberMapper.timeTableUserInfo(ID);            
	}
	
}
