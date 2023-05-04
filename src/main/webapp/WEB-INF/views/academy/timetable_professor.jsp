<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>시간표 조회</title>
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
   }
         
   .left-div{ /* 내부 왼쪽 */
      display: absolute;
      width: 18%;  
      height:100%; 
      background-color: #f0f6f9; 
      border: 1px;
      
      
   
   }
   .readonly{
      margin-bottom: 5px;
   }
   
   
   .row {
      display: table-row;
      border-bottom: 1px solid black;
   }
   
   .cell {
      display: table-cell;
      border-right: 1px solid black;
      border-top: 1px solid black;
      padding: 10px;
      width: 19.2%;
      height: 39px;
      border-collapse: collapse;
   }
   .cellheader{
      display: table-cell;
      border-right: 1px solid black;
      border-top: 1px solid black;
      padding: 10px;
      width: 50px;
      
   }
.right-div {
  overflow: auto;
  width: 82%;
  height: 764px;
  background-color: #f5f5f5;
  border: 1px solid #ddd;
}

.main_timetable {
  width: 100%;
  height: 764px;
  float: right;
}

table {
  align-content: center;
  table-layout: fixed;
  border-collapse: collapse;
  border-top: 3px solid #168;
  width: 100%;
  height: 100%;
}

td,th {
  overflow: auto;
  width: 20%;
  height: 46px;
  border: 1px solid #ddd;
}

td .lecture-cell {
  background-color: #f0f6f9;
  display: inline-block;
  width: 95%;
  padding: 17px 4.25px 17.2px;
  color: #2e2e2e;
  border-bottom: 2px solid #168;
}

tr:first-child {
  border-top: 2px solid #444;
  background-color: #f0f6f9;
  color: #2e2e2e;
}

th {
  border: 1px solid #ddd;
}

td {
  border: 1px solid #ddd;
}

</style>
</head>
<body>
   <c:import url="/WEB-INF/views/academy/base.jsp"/>
      <section class="sec">
      <div class="contents" style="display: flex;">
         <div class="left-div">
            <form:form action="${root}academy/timetable_professor_pro" method="get" modelAttribute="getTimeTableProInfo">
              <table style="border-top: 2px solid #168; border-bottom: 2px solid #168;">
               <tr>
                      <td>&nbsp;이름 :&nbsp;<form:input class="readonly" path="name" readonly="true" size="15"/></td>
                   </tr> 
                  
                    <tr>
                       <td>&nbsp;학번 :&nbsp;<form:input class="readonly" path="ID" readonly="true" size="15" /></td>
                    </tr>
                  
                    <tr>
                       <td>&nbsp;학과 :&nbsp;<form:input class="readonly" path="d_name" readonly="true" size="15" /></td>
                    </tr>
            </table>
            <br />
           &nbsp;연도 :&nbsp;
           <form:select path="year">
             <form:option value="2022">2022</form:option>
             <form:option value="2023">2023</form:option>
           </form:select>
           학기 :&nbsp;
           <form:select path="semester">
             <form:option value="1">1학기</form:option>
             <form:option value="2">2학기</form:option>
           </form:select>
           <br />
           <br />
           <input type="submit" value="조회" style="border-radius: 5px; border: 1px solid #168; margin-left: 90px; color:#168; background: #f0f6f9;"/>
         </form:form>
         </div>
            <div class="right-div">
               <div class="main_timetable">
                  <table>
                     <tr style="border-top: 2px solid #444; border-bottom: 2px solid #168; background-color: #f0f6f9; color:#168;">
                        <th></th>
                        <th>월</th>
                        <th>화</th>
                        <th>수</th>
                        <th>목</th>
                        <th>금</th>
                     </tr>
                     <c:forEach var="time" begin="1" end="14">
                        <tr>
                           <td align="center" style="width: 40px;">${time}</td>
                           <c:forEach var="day" items="${day}">
                              <td align="center" style="padding: 0; margin: 0;" >
                                 <c:forEach var="lecture" items="${getProfessorTimeTableUserInfo}">
                                    <c:if test="${lecture.day eq day && lecture.starttime <= time && lecture.endtime >= time}">
                                       <b><span style="font-size: 13px; margin: 0;" class="lecture-cell ${lecture.lec_name}-cell">[&nbsp;${lecture.completion }&nbsp;]<br />${lecture.lec_name}&nbsp;(${lecture.c_ID})</span></b>
                                  <c:set var="highlight" value="${lecture.lec_name}-highlight" />
                                    </c:if>
                                 </c:forEach>
                              </td>
                           </c:forEach>
                        </tr>
                     </c:forEach>
                  </table>
               </div>
            </div>
         </div>
   </section>
</body>
</html>