package kr.co.softsoldesk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.softsoldesk.beans.GradeBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.dao.GradeDao;

@Service
public class GradeService {

   @Autowired
   private GradeDao gradeDao;

   @Resource(name = "loginMemberBean")
   private MemberBean loginMemberBean;


   
 
   public List<GradeBean> getGradeCheckInfo(int ID) {
	   return gradeDao.getGradeCheckInfo(ID);
   }
	   
   
   public List<GradeBean> getallchk(int ID) {
	  return gradeDao.getallchk(ID);
   }

   public List<GradeBean> gradebyyear(int ID, int year, int semester) {
	  return gradeDao.gradebyyear(ID, year, semester);
   }
	 
}