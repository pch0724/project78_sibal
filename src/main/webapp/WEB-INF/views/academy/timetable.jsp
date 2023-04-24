<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	      
	.left-div{
	   display: absolute;
	   width: 18%;  
	   height:100%; 
	   background-color: #999999; 
	   border: 1px;
	   
	
	}
	
	.right-div{
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
</style>
</head>
<body>
   <c:import url="/WEB-INF/views/academy/base.jsp"/>
      <section class="sec">
      <div class="contents" style="display: flex;">
         <div class="left-div">
            이름 :&nbsp;<input class="readonly" type="text" placeholder="이석진" readonly="readonly" ><br />
            학번 :&nbsp;<input class="readonly" type="text" placeholder="1234567" readonly="readonly"><br />
            학과 :&nbsp;<input class="readonly" type="text" placeholder="행정" readonly="readonly" >&nbsp;과<br />
            <div>
               <form action="" method="post" style="margin-top: 5px;">
                  학년 :&nbsp;<select name=grade_select id="grade_select">
                     <option value="1">1학년</option>
                     <option value="2">2학년</option>
                     <option value="3">3학년</option>
                     <option value="4">4학년</option>
                  </select>
                  학기 :&nbsp;<select name=semester_select id="semester_select">
                     <option value="1">1학기</option>
                     <option value="2">2학기</option>
               </select>
               <button type="submit">선택</button>
            </form>
            </div>
         </div>
         <div class="right-div">
             <div class="main_timetable">
         <table style="border-collapse: collapse;">
            <tr align="center" class="row">
               <td class="cell">월</td>
               <td class="cell">화</td>
               <td class="cell">수</td>
               <td class="cell">목</td>
               <td class="cell">금</td>
               <td class="cellheader">교시</td>
            </tr>
         </table>
         <div class="timetable">
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">1</div>
            </div>
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">2</div>
            </div>
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">3</div>
            </div>
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">4</div>
            </div>
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">5</div>
            </div>
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">6</div>
            </div>
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">7</div>
            </div>
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">8</div>
            </div>
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">9</div>
            </div>
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">10</div>
            </div>
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">11</div>
            </div>
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">12</div>
            </div>
            <div class="row">
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cell"></div>
               <div class="cellheader">13</div>
            </div>
         </div>

      </div>
         </div>
      </div>
   </section>
</body>
</html>