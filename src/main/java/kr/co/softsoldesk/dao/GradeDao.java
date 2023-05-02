package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.GradeBean;
import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.mapper.GradeMapper;
import kr.co.softsoldesk.mapper.ProfessorMapper;

@Repository
public class GradeDao {

   
   @Autowired
   private GradeMapper gradeMapper;
   
   @Autowired
   private ProfessorMapper profMapper;

   //매퍼 담기
   public List<GradeBean> getGradeCheckInfo(int ID, int year, int g_semester){
      return  gradeMapper.getGradeCheckInfo(ID, year, g_semester);
   }
   
   // 전체 성적 조회
   //전체성적조회 연도 학기별
   public List<GradeBean> getallchk(int ID){
         return gradeMapper.getallchk(ID);
   }
   //전체성적조회 -> 합산
   public  List<GradeBean> totalBean(int ID){
      return gradeMapper.totalBean(ID);
   }
   
   
   //전체성적조회-> 개별학기세부
   public List<GradeBean> gradebyyear(int ID, int year, int semester){
   
      return gradeMapper.gradebyyear(ID ,year, semester);
   }
   //교수 | 성적입력결과 확인
   //성적입력-강의목록
   public List<LectureBean> LecListbyID(int ID, int year, int semester){
      return profMapper.LecListbyID(ID, year, semester);
   }
   //성적입력-수강인원
   public int count(String lec_id, int year, int semester) {
      return profMapper.count(lec_id, year, semester);
   }
   //성적입력확인-학생리스트
   public List<GradeBean> getStdList(int ID, String lec_ID, int year, int semester) {
      return profMapper.getStdList(ID, lec_ID, year, semester);
   }
   //성적입력학생정보
   public GradeBean getStdInfo(int std_id, String lec_ID, int year, int semester) {
      return profMapper.getStdInfo(std_id, lec_ID, year, semester);
   }
   
   
   //성적입력수행
   public void grade_input(GradeBean grade_input) {
       profMapper.grade_input(grade_input);
   }
}