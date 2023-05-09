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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
* {
   font-family: 'Noto Sans KR', sans-serif;
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
   overflow: auto;
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

.grades-table{
   border-collapse: collapse;
    border-top: 3px solid #168;
    width: 100%;
    
}
.student-info-table{
   border-collapse: collapse;
    border-top: 3px solid #168;
    border-bottom: 3px solid #168;
    width: 100%;
    
}
.student-info-table td{
   border: 1px solid #ddd;
}
.grades-table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    .grades-table th, .grades-table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .grades-table th:first-child, .grades-table td:first-child {
      border-left: 0;
    }
    .grades-table th:last-child, .grades-table td:last-child {
      border-right: 0;
    }
    .grades-table tr td:first-child{
      text-align: center;
    }
    .grades-table caption{caption-side: bottom; display: none;}

</style>
</head>
<body>

   <c:import url="/WEB-INF/views/academy/base.jsp" />

   <section class="sec">
      <div class="contents">
         <!-- 학생정보  -->
         <form:form action="" method="post"
            modelAttribute="modifyMemberBean">   
            <p>
               <span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;"><b>학생정보</b></span>
            </p>
            <table class="student-info-table">
             <tr>
                 <th class="name-label" style="font-weight: bold">이름</th>
                 <td class="name-value">${modifyMemberBean.name }</td>
                 <th class="student-id-label" style="font-weight: bold">학번</th>
                 <td class="student-id-value">${modifyMemberBean.ID }</td>
                 <th class="major-label" style="font-weight: bold">학과</th>
                 <td class="major-value">${modifyMemberBean.d_name }</td>
                 <th class="grade-label" style="font-weight: bold">학년</th>
                 <td class="grade-value">${modifyMemberBean.grade }</td>
                 <th class="semester-label" style="font-weight: bold">학기</th>
                 <td class="semester-value">${modifyMemberBean.semester }</td>
                 <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                 <td></td>
             </tr>
         </table>
         </form:form>
            <p>
               <span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;"><b>금학기 성적조회</b></span>
            </p>
         <!-- 성적정보 -->
         <table class="grades-table">
         <thead>
            <tr>
               <th>과목명</th>
               <th>교수명</th>
               <th>이수구분</th>
               <th>학점</th>
               <th>출석</th>
               <th>중간</th>
               <th>기말</th>
               <th>과제</th>
               <th>점수</th>
               <th>등급</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="grade" items="${getGradeCheckInfo}">
               <tr>
                  <td>${grade.lec_name }</td>
                  <td>${grade.name }</td>
                  <td>${grade.completion }</td>
                  <td>${grade.credits }</td>
                  <td>${grade.at_score }</td>
                  <td>${grade.m_score }</td>
                  <td>${grade.f_score }</td>
                  <td>${grade.a_score }</td>
                  <td>${grade.gpacalc }</td>
                  <td>${grade.gradeLetter }</td>
               </tr>
            </c:forEach>
         </tbody>
      </table>

      </div>
      </section>
</body>
</html>