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
      background-color: #999999; 
      border: 1px;
      
      
   
   }
   
   .right-div{ /* 내부 오른쪽 */
      display: absolute;
      width: 82%; 
      height:100%; 
      background-color: #dedede; 
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
</style>
</head>
<body>
   <c:import url="/WEB-INF/views/academy/base.jsp"/>
      <section class="sec">
      <div class="contents" style="display: flex;">
         <div class="left-div">
            <form:form action="${root}academy/timetable_pro" method="get" modelAttribute="getTimeTableinfo">
               <br />
               이름 :&nbsp;<form:input class="readonly" path="name" disabled="true"/>
               <br />
               학번 :&nbsp;<form:input class="readonly" path="ID" disabled="true"/>
               <br />
               학과 :&nbsp;<form:input class="readonly" path="d_name" disabled="true"/>
            </form:form>
            <div></div>
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
                        <td>${time}</td>
                        <c:forEach var="day" items="${['월', '화', '수', '목', '금']}">
                           <td>
                              <c:forEach var="lecture" items="${getTimeTableUserInfo}">
                                 <c:if test="${lecture.day eq day && lecture.starttime <= time && lecture.endtime >= time}">
                                         ${lecture.lec_name}
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