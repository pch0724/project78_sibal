<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<style>
* {
   box-sizing: border-box;
}

div.row {
   max-width: 80%;
   margin: 0 auto;
}

div.nav {
   background-color: navy;
   height: 50px;
   padding: 14px 0;
}

div.nav nav ul {
   margin: 0;
   padding: 0;
   list-style: none;
   display: flex;
   justify-content: center;
   align-items: center;
   height: 100%;
}

div.nav nav li {
   margin: 0 10px;
}

div.nav nav li a {
   color: #fff;
   text-decoration: none;
}

#logo {
   display: inline-block;
}

#logo img {
   width: 200px;
   height: auto;
}

#top_menu {
   display: flex;
   float: right;
   align-items: center;
}

#contents {
   background: url("${root }images/blue.jpg");
   background-size: 100%;
   background-repeat: no-repeat;
   min-height: 1300px;
   padding-top: 30px;
}

div.dflex {
   display: flex
}

div.square {
   display: inline-block;
   width: 33%;
   height: 300px;
   background: white;
   margin-right: 5px;
   border: solid 2px white;
   border-radius: 10px;
}

<!--
달력 -->#calendar-header {
   font-weight: bold;
   text-align: center;
   padding: 5px;
}

#calendar-body {
   width: 100%;
   border-collapse: collapse;
}

table {
   width: 100%;
   border-collapse: collapse;
}

th, td {
   padding: 5px;
   border: 1px solid #ccc;
   text-align: center;
}

.today {
   background-color: yellow;
}

<!--달력 -->
div.long {
   width: 80%;
   height: 60px;
   background-color: navy;
   border: solid 2px navy;
   border-radius: 10px;
   margin: 0 auto;
   margin-top: 10px;
}

div.square2 {
   display: inline-block;
   width: 32.5%;
   height: 300px;
   background: white;
   margin-right: 5px;
   margin-top: 10px;
   border: solid 2px white;
   border-radius: 10px;
}
</style>
<meta charset="UTF-8">
<title>칠전팔디</title>
</head>
<body onload="showTime()">
   <header>
      <div class="row">
         <div id="logo">
            <img src="${root }images/78.png" alt="Logo" />
         </div>
         <div id="top_menu">
            <a href="#">화면 배치 저장</a><a href="${root }logout">&nbsp; 로그아웃</a>
            <div id="clock"></div>
         </div>
      </div>
      <div class="nav">
         <div class="row">
            <nav>
               <ul>
                  <li class="menu"><a href="${root }academy/index">학사행정시스템</a></li>
                  <li class="menu"><a href="${root }enrollment/index">수강신청</a></li>
                  <li class="menu"><a href="#">칠전팔디시스템</a></li>
               </ul>
            </nav>
         </div>
      </div>
   </header>
   <section id="contents">
      <div class="row dflex">
         <div class="square"></div>
         <div class="square"></div>
         <div class="square">
            <div id="calendar">
               <div id="calendar-header"></div>
               <table id="calendar-body"></table>
            </div>
         </div>
      </div>
      <div class="long"></div>
      <div class="row dflex_bottom">
         <div class="square2"></div>
         <div class="square2"></div>
         <div class="square2"></div>
      </div>
   </section>
   <footer> </footer>
   <script>
      function showTime() {
         var date = new Date(); // 현재 시간 가져오기
         var hours = date.getHours();
         var minutes = date.getMinutes();
         var seconds = date.getSeconds();
         var ampm = hours >= 12 ? 'PM' : 'AM'; // 오전/오후 구분
   
         hours = hours % 12; // 12시간 형식으로 변경
         hours = hours ? hours : 12; // 0시일 경우 12시로 변경
         minutes = minutes < 10 ? '0' + minutes
               : minutes;
         seconds = seconds < 10 ? '0' + seconds
               : seconds;
   
         var time = hours + ':' + minutes + ':'
               + seconds + ' ' + ampm; // 시간 표시
         document.getElementById('clock').innerHTML = time; // 시계 표시
         setTimeout(showTime, 1000); // 1초마다 시간 갱신
      }
      
      // 달력
   function showCalendar() {
    const today = new Date();
    let year = today.getFullYear();
    let month = today.getMonth() + 1;

    const calendarHeader = document.getElementById("calendar-header");
    const calendarBody = document.getElementById("calendar-body");

    // 달력 헤더에 연도와 월을 출력합니다.
    const yearMonth = year + "년 " + month + "월";
    const headerHTML = "<div style='text-align:center; font-size: 24px; font-weight: bold;'>" + yearMonth + "</div>";
    calendarHeader.innerHTML = headerHTML;

    let calendarHTML = "<tr>";

    // 첫 번째 행에는 요일명을 출력합니다.
    calendarHTML += "<th>일</th>";
    calendarHTML += "<th>월</th>";
    calendarHTML += "<th>화</th>";
    calendarHTML += "<th>수</th>";
    calendarHTML += "<th>목</th>";
    calendarHTML += "<th>금</th>";
    calendarHTML += "<th>토</th>";
    calendarHTML += "</tr>";

    // 달력에 출력할 날짜를 계산합니다.
    const firstDay = new Date(year, month - 1, 1);
    const lastDay = new Date(year, month, 0);
    const daysInMonth = lastDay.getDate();

    let date = 1; // 첫 번째 날짜부터 시작합니다.

    // 현재 요일을 구합니다.
    const todayIndex = today.getDay();

    // 달력의 행을 출력합니다.
    for (let i = 0; i < 6; i++) {
        calendarHTML += "<tr>";

        for (let j = 0; j < 7; j++) {
            if (i === 0 && j < firstDay.getDay()) {
                calendarHTML += "<td></td>"; // 이번 달이 시작되는 요일 이전의 빈 칸을 출력합니다.
            } else if (date > daysInMonth) {
                calendarHTML += "<td></td>"; // 이번 달이 끝난 이후의 빈 칸을 출력합니다.
            } else {
                // 현재 날짜와 같으면 클래스에 "today"를 추가합니다.
                const className = (year === today.getFullYear() && month === today.getMonth() + 1 && date === today.getDate()) ? "today yellow" : "";

                // 현재 요일이면 클래스에 "today"를 추가합니다.
                if (j === todayIndex && i !== 0 && date <= daysInMonth) {
                    calendarHTML += `<td class="${className}">` + date + "</td>";
                } else {
                    calendarHTML += `<td class="${className}">` + date + "</td>";
                }

                date++;
            }
        }

        calendarHTML += "</tr>";
    }

    calendarBody.innerHTML = calendarHTML;
}

showCalendar();
   </script>
</body>
</html>