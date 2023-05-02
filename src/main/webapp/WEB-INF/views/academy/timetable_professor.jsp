<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표 조회</title>
<style>
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
      background-color: #ededed; 
      border: 1px;
      
      
   
   }
   
   .right-div{ /* 내부 오른쪽 */
      display: absolute;
      width: 82%; 
      height:100%; 
      background-color: #ffffff; 
      border: 1px;
   }
   .readonly{
      margin-bottom: 5px;
   }
   .main_timetable {
      width: 100%;
      height: 100%;
      float: right;
      
   }
   
   timetable {
      display: table;
      width: 100%;
      table-layout: fixed;
      border-collapse: collapse;
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
      /* css 추가 바람 */
       table {
       align-content:center;
       table-layout: fixed;
       border-collapse: collapse;
       width: 100%; /* 테이블이 화면 전체를 차지하도록 설정 */
       height: 100%;
  }

  td, th {
    
    width: 20%; /* 각 칸의 너비를 20%로 설정 */
    height: 46px; /* 각 칸의 높이를 100px로 설정 */
    border: 1px solid black;
    
    
  }
td .lecture-cell {
    background-color: #7794fc;
    display: inline-block;
    width: 95%;
    padding: 17px 4.25px 17.2px;
  }

</style>
</head>
<body>
   <c:import url="/WEB-INF/views/academy/base.jsp"/>
      <section class="sec">
      <div class="contents" style="display: flex;">
         <div class="left-div">
            <form:form action="${root}academy/timetable_professor_pro" method="get" modelAttribute="getTimeTableProInfo">
           <br />
           &nbsp;이름 :&nbsp;<form:input class="readonly" path="name" disabled="true"/>
           <br />
           &nbsp;학번 :&nbsp;<form:input class="readonly" path="ID" disabled="true"/>
           <br />
           &nbsp;학과 :&nbsp;<form:input class="readonly" path="d_name" disabled="true"/>
           <br />
           <br />
           연도 :&nbsp;
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
           <input type="submit" value="조회" style="margin-left: 90px;"/>
         </form:form>
         </div>
            <div class="right-div">
               <div class="main_timetable">
                  <table>
                     <tr>
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
                                       <b><span style="font-size: 13px; margin: 0;" class="lecture-cell ${lecture.lec_name}-cell">${lecture.lec_name}</span></b>
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