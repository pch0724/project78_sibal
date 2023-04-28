package kr.co.softsoldesk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.softsoldesk.beans.GradeBean;
import kr.co.softsoldesk.beans.GradeDTO;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.dao.GradeDao;

@Service
public class GradeService {

   @Autowired
   private GradeDao gradeDao;

   @Resource(name = "loginMemberBean")
   private MemberBean loginMemberBean;


   
   public void getMemberInfo2(GradeDTO getInfoMemberBean2) {
      GradeDTO tempGetInfoMemberBean2 = gradeDao.getMemberInfo2(loginMemberBean.getID());
      
      getInfoMemberBean2.setStd_ID(tempGetInfoMemberBean2.getStd_ID());
      getInfoMemberBean2.setName(tempGetInfoMemberBean2.getName());
      getInfoMemberBean2.setD_name(tempGetInfoMemberBean2.getD_name());
      getInfoMemberBean2.setGrade(tempGetInfoMemberBean2.getGrade());
      getInfoMemberBean2.setS_semester(tempGetInfoMemberBean2.getS_semester());
   }
   /*
   public List<Std_HistoryBean> getLecList2(Model model) {
      List<Std_HistoryBean> getLecList = gradeDao.getLecList(loginMemberBean.getID());
      model.addAttribute("getLecList", getLecList);
      return getLecList;
   }
    * */
   public List<GradeBean> getGradeCheckInfo2(Model model) {
      List<GradeBean> getGradeCheckInfo = gradeDao.getGradeCheckInfo(loginMemberBean.getID());
      
      model.addAttribute("getGradeCheckInfo", getGradeCheckInfo);
      return getGradeCheckInfo;
   }
   
   public List<GradeBean> getallchk(int ID) {
	  return gradeDao.getallchk(ID);
   }

   public List<GradeBean> gradebyyear(int ID, int year, int semester) {
	  return gradeDao.gradebyyear(ID, year, semester);
   }
	 
}