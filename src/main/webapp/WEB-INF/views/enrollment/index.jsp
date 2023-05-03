<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<style type="text/css">
*{
   font-family: 'Noto Sans KR', sans-serif;
}
.header{
   background-color: #d1d1d1;
   
   border-collapse: collapse;
   width: 70%;
   height: 20%;
   position: absolute;
}
.header_cell{
   width: 20%;
   height: 40px;
}
.main{
   margin-top: 9.9%;
   background-color: #e3e3e3;
   width: 70%;
   height: 50%;
   position: absolute;
   overflow: auto;
}
.footer{
   margin-top: 38%;
   background-color: #f5f5f5;
   width: 70%;
   height: 30%;
   position: absolute;
   overflow: auto;
}
.right{
   margin-top: -1.5%;
   margin-left: 70%;
   background-color: #b5ceff;
   width: 30%;
   height: 100%;
   position: absolute;
   float: right;
}
#login {
   margin-right:5px;
   border-radius: 10px;
   border: 0px;
   width: 100px;
   height:30px;
   background-color:#000087;
   float: right;
}
.cell{
   style="border: 1px solid black;
}
</style>
<title>수강신청</title>
</head>
<body style="margin: 0; height: 1px;">
<form:form action="${root}enrollment/index" method="get" modelAttribute="getTimeTableinfo">
   <table class="header" >
      <tr style="margin-left: 5px;">
         <td class="header_cell">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름 / 학번 / 학과</td>
         <td class="header_cell" colspan="2">
            &nbsp;<form:input class="readonly" path="name" disabled="true" size="6"/>
            <form:input class="readonly" path="ID" disabled="true" size="6"/>
            <form:input class="readonly" path="d_name" disabled="true" size="6"/>
         </td>
         <td class="header_cell"></td>
         <td class="header_cell">
            <button id="login" >
               <a href="${root }ma/index" style="text-decoration: none; color: white;">홈 페이지</a>
            </button>&nbsp;&nbsp;
         </td>
      </tr>
      <tr style="margin-left: 5px;">
         <td class="header_cell" colspan="3">
            &nbsp;&nbsp;구분 :&nbsp;<select>
               <option value="전공">전공</option>
               <option value="교양">교양</option>
            </select>
            학년 :&nbsp;<select>
               <option value="1">1학년</option>
               <option value="2">2학년</option>
               <option value="3">3학년</option>
               <option value="4">4학년</option>
            </select>
             학기 :&nbsp;<select>
               <option value="1">1학기</option>
               <option value="2">2학기</option>
            </select>
            &nbsp;<button type="button">선택</button>
         </td>
         <td class="header_cell"></td>
         <td class="header_cell">
            <button id="login" >
               <a href="${root }academy/index" style="text-decoration: none; color: white;">학사페이지</a>
            </button>&nbsp;&nbsp;
         </td>
      </tr>
      <tr>
         <td class="header_cell" colspan="3">
            &nbsp;&nbsp;교과목명 :&nbsp;<input type="text" size="54">
            &nbsp;&nbsp;<button>검색</button>
         </td>
         <td class="header_cell"></td>
         <td class="header_cell"></td>
      </tr>
      <tr>
         <td class="header_cell"></td>
         <td class="header_cell"></td>
         <td class="header_cell"></td>
         <td class="header_cell"></td>
         <td class="header_cell">
            <button id="login" >
               <a href="${root }logout" style="text-decoration: none; color: white;">로그아웃</a>
            </button>&nbsp;&nbsp;
         </td>
      </tr>
   </table>
</form:form>>   
   <section class="main">
      <div>
      <table style="width: 100%; height:100%; border-collapse: collapse;" >
            <tr align="center" style="border: 1px solid black;">
               <td class="cell"></td>
               <td class="cell">구분</td>
               <td class="cell">학과코드</td>
               <td class="cell">교과목명</td>
               <td class="cell">학점</td>
               <td class="cell">교수명</td>
               <td class="cell">요일</td>
               <td class="cell">강의시간</td>
               <td class="cell">강의실</td>
               <td class="cell">수강인원</td>
               <td class="cell">선택</td>
            </tr>
            <tr>
            <c:forEach var="time" begin="1" end="20">
               <tr style="border: 1px solid #ccc;">
                  <td align="center" style="width: 40px; border: 1px solid #ccc;">${time}</td>
                  <c:forEach var="day" items="${day}">
                     <td align="center" style="padding: 0; margin: 0; border: 1px solid #ccc;"></td>
                  </c:forEach>
               </tr>
            </c:forEach>
         </tr>
         </table>
      </div>
   </section>
   <section class="footer">
      <div>
         <table style="width: 100%; height:100%; border-collapse: collapse;">
            <tr align="center" style="border: 1px solid black;">
               <td class="cell"></td>
               <td class="cell">구분</td>
               <td class="cell">학과코드</td>
               <td class="cell">교과목명</td>
               <td class="cell">학점</td>
               <td class="cell">교수명</td>
               <td class="cell">요일</td>
               <td class="cell">강의시간</td>
               <td class="cell">강의실</td>
               <td class="cell">수강인원</td>
               <td class="cell">선택</td>
            </tr>
            <tr>
            <c:forEach var="time" begin="1" end="10">
               <tr style="border: 1px solid #ccc;">
                  <td align="center" style="width: 40px; border: 1px solid #ccc;">${time}</td>
                  <c:forEach var="day" items="${day}">
                     <td align="center" style="padding: 0; margin: 0; border: 1px solid #ccc;"></td>
                  </c:forEach>
               </tr>
            </c:forEach>
         </tr>      
         </table>
      </div>
   </section>
   <section class="right">
      <div>
         <table>
                    
         </table>
      </div>
   </section>
</body>
</html>