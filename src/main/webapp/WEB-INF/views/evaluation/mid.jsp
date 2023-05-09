<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중간 강의평가 입력</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
* {
   font-family: 'Noto Sans KR', sans-serif;
}
.sec{
    position:absolute;
    top:8%;
    left:15%;
    width: 85%;
    height: 92%;
   }

.contents{
      width: 100%;
      height: 100%;
      overflow: auto;
   }
   
.enrolled{
      background-color: #f2f2f2;
      
      
   }

   
.student-info{
   border-collapse: collapse;
    border-top: 3px solid #168;
    border-bottom: 3px solid #168;
    width: 100%;
    
}
.student-info td{
   border: 1px solid #ddd;
}

.table{
   border-collapse: collapse;
    border-top: 3px solid #168;
    width: 100%;
    
}
.table th {
  color: #168;
  background: #f0f6f9;
  text-align: center;
}
.table th, .table td {
  padding: 10px;
  border: 1px solid #ddd;
}
.table th:first-child, .table td:first-child {
  border-left: 0;
}
.table th:last-child, .table td:last-child {
  border-right: 0;
}
.table tr td:first-child{
  text-align: center;
}
.table caption{caption-side: bottom; display: none;}
input:focus {outline:none;}

</style>
</head>
<body >
   <c:import url="/WEB-INF/views/academy/base.jsp"/>
   
   
   
   <!-- 상단 조회 -->
   <section class="sec">
   
   <div class = "contents">
   
      <div>
         <form:form action = "" method ="post" modelAttribute="getInfoMemberBean">
            <p>
                  <span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;"><b>학생정보</b></span>
               </p>
               
            <table class="student-info">
               <tr>
                  <th><form:label path="name">이름</form:label></th>
                  <td class="name-value">
                     <form:input path="name" readonly="true"/>
                  </td>
               
                  <th><form:label path="ID">학번</form:label></th>
                  <td class="student-id-value">
                     <form:input path="ID" readonly="true"/>
                  </td>
                  <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td></td>
               </tr>
            </table>
            
         </form:form>
         </div>

   <!-- 수강과목 -->
   
      <p>
            <span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;"><b>수강과목</b></span>
         </p>
      <table class="table">
         <tr class="row header">
            <th class="cell" style="width: 10%">강의평가</th>
             <th class="cell" style="width: 10%">학수번호</th>
             <th class="cell" style="width: 20%">교과목명</th>
             <th class="cell" style="width: 7%">담당교수</th>
             <th class="cell" style="width: 3%">학점</th>
         </tr>
         <c:forEach var="Eval" items="${EvalInfo}">
         <tr class="row">
             <td class="cell">
                <c:choose>
                   <c:when test="${Eval.completed == true}">
                      평가완료
                   </c:when>
                   <c:otherwise>
                <a href="${root }evaluation/mid_eval?lec_ID=${Eval.lec_ID}&lec_name=${Eval.lec_name }&name=${Eval.name }" style="color:blue; font-weight: bold;">
                   강의평가
                </a>
                </c:otherwise>
                </c:choose>
             </td>
             <td class="cell" style="width: 10%">${Eval.lec_ID }</td>
             <td class="cell" style="width: 20%">${Eval.lec_name }</td>
             <td class="cell" style="width: 7%">${Eval.name }</td>
             <td class="cell" style="width: 3%">${Eval.credits }</td>
            
         </tr>
         </c:forEach>
   
   
   
      </table>
     </div>
   </section>
</body>
</html>