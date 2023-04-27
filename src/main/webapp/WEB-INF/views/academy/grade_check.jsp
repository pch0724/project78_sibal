<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<title>성적조회</title>
<style>
.sec {
   position: absolute;
   top: 8%;
   left: 15%;
   width: 85%;
   height: 92%;
}

.contents {
   width: 100%;
   height: 100%;
}

/* 학생정보 css  */
.student-info {
   display: flex;
   align-items: center;
   justify-content: flex-start;
   padding: 10px;
   border: none;
}

.student-info>div, label, input {
   text-align: left;
   padding: 0 10px;
   border-right: 2px solid #4444ff;
}

.student-id-value {
   border-right: none;
}

/* 성적정보 css  */
.grade-info {
   display: flex;
   align-items: center;
   justify-content: flex-start;
   padding: 10px;
   border: none;
}

.grade-info>div {
   flex: 1;
   text-align: center;
   border-left: 1px solid #ccc;
   border-right: 1px solid #ccc;
}

.grade-info>div:first-child {
   border-left: none;
}

.grade-info>div:last-child {
   border-right: none;
}
</style>
</head>
<body>

   <c:import url="/WEB-INF/views/academy/base.jsp" />

   <section class="sec">
      <div class="contents">
         <!-- 학생정보  -->
         <form:form action="" method="post"
            modelAttribute="getInfoMemberBean2">
            <div style="text-align: left; font-size: 18px; padding: 5px;">학생
               정보</div>
            <div class="student-info">
               <div class="name-label" style="font-weight: bold">이름</div>
               <div class="name-value">${getInfoMemberBean2.name }</div>
               <div class="student-id-label" style="font-weight: bold">학번</div>
               <div class="student-id-value">${getInfoMemberBean2.std_ID }</div>
            </div>

            <div class="student-info">
               <div class="major-label" style="font-weight: bold">학과</div>
               <div class="major-value">${getInfoMemberBean2.d_name }</div>
               <div class="grade-label" style="font-weight: bold">학년</div>
               <div class="grade-value">${getInfoMemberBean2.grade }</div>
               <div class="semester-label" style="font-weight: bold">학기</div>
               <div class="semester-value">${getInfoMemberBean2.s_semester }</div>
            </div>
         </form:form>
         <div style="text-align: left; font-size: 18px; padding: 5px;">금학기
            성적조회</div>
         <!-- 성적정보 -->
         <div class="grade-info" style="font-weight: bold">
            <div class="subject-name">과목명</div>
            <div class="professor">교수명</div>
            <div class="subject-type">이수구분</div>
            <div class="subject-credit">학점</div>
            <div class="attendance">출석</div>
            <div class="midterm">중간</div>
            <div class="final">기말</div>
            <div class="assignment">과제</div>
            <div class="grade">등급</div>
         </div>
   

         <c:forEach var="grade" items="${getGradeCheckInfo}">
            <div class="grade-info">
               <div class="subject-name">${grade.lec_name }</div>
               <div class="professor">${grade.name }</div>
               <div class="subject-type">${grade.completion }</div>
               <div class="subject-credit">${grade.credits }</div>
               <div class="attendance">${grade.at_score }</div>
               <div class="midterm">${grade.m_score }</div>
               <div class="final">${grade.f_score }</div>
               <div class="assignment">${grade.a_score }</div>
               <div class="grade">${grade.gpa }</div>
            </div>
         </c:forEach>

      </div>
      </section>
</body>
</html>