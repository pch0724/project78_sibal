package kr.co.softsoldesk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.GradeBean;
import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;
import kr.co.softsoldesk.dao.GradeDao;

@Service
public class GradeService {

   @Autowired
   private GradeDao gradeDao;

   @Resource(name = "loginMemberBean")
   private MemberBean loginMemberBean;

   public List<GradeBean> getGradeCheckInfo(int ID, int year, int g_semester) {
      return gradeDao.getGradeCheckInfo(ID, year, g_semester);
   }

   // 전체 성적 조회
   // 전체성적조회 연도 학기별
   public List<GradeBean> getallchk(int ID) {
      return gradeDao.getallchk(ID);
   }

   // 전체성적조회 -> 합산
   public List<GradeBean> totalBean(int ID) {
      return gradeDao.totalBean(ID);
   }

   // 전체성적조회-> 개별학기세부
   public List<GradeBean> gradebyyear(int ID, int year, int semester) {
      return gradeDao.gradebyyear(ID, year, semester);
   }
   //교수: 성적입력 결과 확인
   //성적입력 - 강의리스트
   public List<LectureBean> LecListbyID(int ID, int year, int semester){
      return gradeDao.LecListbyID(ID, year, semester);
   }
   //성적입력-수강인원
   public int count(String lec_id, int year, int semester) {
         return gradeDao.count(lec_id, year, semester);
   }
   //성적입력-학생리스트
   public List<GradeBean> getStdList(int ID, String lec_ID, int year, int semester) {
      return gradeDao.getStdList(ID, lec_ID, year, semester);
   }
   //성적입력학생정보
      public GradeBean getStdInfo(int std_id, String lec_ID, int year, int semester) {
         return gradeDao.getStdInfo(std_id, lec_ID, year, semester);
      }
      
   //성적입력수행
   public void grade_input(GradeBean grade_input) {
      gradeDao.grade_input(grade_input);
   }
}