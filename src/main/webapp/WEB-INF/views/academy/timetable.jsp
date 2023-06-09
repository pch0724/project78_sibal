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

.left-div { /* 내부 왼쪽 */
   display: absolute;
   width: 18%;
   height: 100%;
   background-color: #f0f6f9;
   border: 1px;
}


.readonly{
	border-radius: 5px;
	border: 1px solid #168; 
	background: white;
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

.cellheader {
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
input:focus {outline:none;}
#choose{
	border-radius: 5px; 
	border: 1px solid #168;
	outline: none;
}
</style>
</head>
<body>
   <c:import url="/WEB-INF/views/academy/base.jsp"/>
      <section class="sec">
      <div class="contents" style="display: flex;">
           <hr style="border-bottom: 2px solid #168;"/>

         <div class="left-div">
               <form:form action="${root}academy/timetable_pro" method="get" modelAttribute="getTimeTableinfo">
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
            &nbsp;연도 :&nbsp; <form:select id="choose" path="year">
                     <form:option value="2022">2022</form:option>
                     <form:option value="2023">2023</form:option>
                  </form:select>
              학기 :&nbsp; <form:select id="choose" path="semester">
                     <form:option value="1">1학기</form:option>
                     <form:option value="2">2학기</form:option>
                  </form:select>
                  <br />
                  <br />
                  <input type="submit" value="조회" style="border-radius: 5px; border: 1px solid #168; margin-left: 90px; color:#168; background: white;"/>
               </form:form>
         </div>
         <div class="right-div">
               <div class="main_timetable">
                  <table>
                     <tr style="border-top: 2px solid #444; border-bottom: 2px solid #168; background-color: #f0f6f9; color:#168;">
                        <th style=" border: 1px solid #ccc;"></th>
                        <th style=" border: 1px solid #ccc;">월</th>
                        <th style=" border: 1px solid #ccc;">화</th>
                        <th style=" border: 1px solid #ccc;">수</th>
                        <th style=" border: 1px solid #ccc;">목</th>
                        <th style=" border: 1px solid #ccc;">금</th>
                     </tr>
						<c:forEach var="time" begin="1" end="14">
							<tr style="border: 1px solid #ccc;">
								<td align="center"
									style="width: 40px; height: 40px; border: 1px solid #ccc; font-weight: bold;">${time}</td>
								<c:forEach var="day" items="${day}">
									<c:set var="printed" value="false" />
									<c:forEach var="lecture" items="${getTimeTableUserInfo}">
										<c:if test="${lecture.day eq day && lecture.starttime == time}">
											<c:set var="rowspan" value="${lecture.endtime - lecture.starttime + 1}" />
											<td align="center" style="width: 75px; padding: 0; margin: 0; border: 1px solid #ccc; background: #f0f6f9; border-top: 2px solid #168; border-bottom: 2px solid #168;" rowspan="${rowspan}">
											<span style="font-size: 13px;"> 
												[&nbsp;${lecture.completion }&nbsp;] <br /> ${lecture.lec_name}&nbsp;(${lecture.c_ID})
											</span>
											</td>
											<c:set var="printed" value="true" />
										</c:if>
									</c:forEach>
									<c:if test="${!printed}">
										<c:set var="skipCell" value="false" />
										<c:forEach var="lecture" items="${getTimeTableUserInfo}">
											<c:if
												test="${lecture.day eq day && lecture.starttime < time && lecture.endtime >= time}">
												<c:set var="skipCell" value="true" />
											</c:if>
										</c:forEach>
										<c:if test="${!skipCell}">
											<td align="center"
												style="width: 75px; padding: 0; margin: 0; border: 1px solid #ccc;"></td>
										</c:if>
									</c:if>
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