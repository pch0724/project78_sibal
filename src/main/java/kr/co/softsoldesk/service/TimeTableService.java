package kr.co.softsoldesk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.dao.LectureDao;
import kr.co.softsoldesk.dao.MemberDao;

@Service
public class TimeTableService {

	@Autowired
	   private MemberDao memberDao;
	   
	   @Autowired
	   private LectureDao lectureDao;
	   
	   @Resource(name = "loginMemberBean")
	   private MemberBean loginMemberBean;
	   
	   public void timeTableUserInfo(MemberBean timeTableUserInfo1) {
	       MemberBean timeTableUserInfo2=memberDao.getTimeTableinfo(loginMemberBean.getID());
	      timeTableUserInfo1.setID(timeTableUserInfo2.getID());
	      timeTableUserInfo1.setName(timeTableUserInfo2.getName());
	      timeTableUserInfo1.setD_name(timeTableUserInfo2.getD_name());
	      
	   
	      
	   }
	   
	   public List<LectureBean> allTimeTableInfo(Model model) {
	      List<LectureBean> timeTableUserInfo=lectureDao.getTimeTableUserInfo(loginMemberBean.getID(), loginMemberBean.getYear(), loginMemberBean.getSemester());
	      
	      model.addAttribute("timeTableUserInfo",timeTableUserInfo);
	      return timeTableUserInfo;
	     	      
	   }
	
}
