<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/locale-all.js"></script>

<script>
    $(document).ready(function() {
      $('#calendar').fullCalendar({
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        defaultDate: new Date(),
        navLinks: true,
        editable: true,
        eventLimit: true,
        events: [
          {
            title: '예제 이벤트',
            start: new Date()
          }
        ],
        locale: 'ko' // 한글로 변경
      });
    });
  </script>
<style>
body{
	background-image: url("${root}images/back____.png");
	background-size: 100%;
	background-repeat: repeat-y;
}
.fc-day .fc-widget-content .fc-thu .fc-future{
	height: 30px;
}
.fc th, .fc td {
	border-color: #eee;
	height: 20px;
}

.fc-today {
	background-color: #f8f9fa;
}

.fc-event {
	background-color: #007bff;
	border-color: #007bff;
}
.fc h2 {
	margin-top:10px;
	font-size: 15px;
}

* {
	box-sizing: border-box;
}

div.row {
	max-width: 80%;
	margin: 0 auto;
}

div.nav {
	font-family: 'Noto Sans KR', sans-serif;
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
	width: 400px;
}

#contents {
	background-size: 100%;
	background-repeat: repeat-y;
	min-height: 704px;
	padding-top: 30px;
}

div.dflex {
	display: flex;
	justify-content: space-around;
}

div.square {
	font-family: 'Noto Sans KR', sans-serif;
	flex-basis: calc(33.333% - 10px);
	flex-shrink: 0;
	flex-grow: 0;
	height: 300px;
	background: white;
	margin-right: 1%;
	border: solid 2px white;
	border-radius: 10px;
	margin-bottom: 1%;
	box-shadow: 0pc 6px 15px #001c4d;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
   padding: 5px;
   border-bottom: 1px solid #ccc;
   text-align: center;
}

.today {
	background-color: yellow;
}

div.square2 {
	font-family: 'Noto Sans KR', sans-serif;
	flex-basis: calc(33.333% - 10px);
	flex-shrink: 0;
	flex-grow: 0;
	height: 300px;
	background: white;
	margin-right: 1%;
	border: solid 2px white;
	border-radius: 10px;
	box-shadow: 0pc 6px 15px #001c4d;
}

#login {
	font-family: 'Noto Sans KR', sans-serif;
	margin-right: 10px;
	margin-left: -20px;
	margin-top: 20px;
	border-radius: 10px;
	border: 2px solid black;
	width: 80px;
	height: 30px;
	background-color: #000087;
}

#session-time {
	margin-left: 20px;
	width: 100px;
}
#upper_contents {
   background-size: 100%;
   background-repeat: no-repeat;
   min-height: 400px;
   padding-top: 10px;
}

.carousel-container {
   width: 1500px;
   overflow: hidden;
   position: relative;
   margin: 0 auto;
}

article>.carousel {
   position: relative;
}

.carousel-images {
   width: 6000px;
   position: relative;
   white-space: nowrap;
}

.carousel-images>li {
   display: inline-block;
}

.carousel-images>li img {
   margin-right: -5.5px;
   width: 750px;
}

.slide {
   position: absolute;
   top: 50%;
   transform: translateY(-50%);
   padding: 10px;
}

.slide img {
   opacity: 0.75;
}

.slide-left {
   left: 0;
    
}

.slide-right {
   right: 0;
}
.slide-left, .slide-right {
    z-index: 1;
}


li>img {
   height: 400px;
}

.carousel-scrollable ul {
   display: flex;
   flex-wrap: nowrap;
   margin: 0;
   padding: 0;
}

.carousel-scrollable li {
   list-style-type: none;
}
a:link{
   text-decoration: none;
   color: black;
}
a:visited {
   text-decoration: none;
   color: black;
}
footer {
	background-color: #363636;
	color: #b0b0b0;
	font-size: 12px;
	padding-bottom: 30px;
	margin-top: 30px;
}
</style>
<meta charset="UTF-8">
<title>칠팔대학교 통합시스템</title>
</head>
<body style="margin: 0px; overflow-x: hidden; background-color: #d9d9d9;">
   <header style="background-color: #f2f2f2;">
      <div class="row">
         <div id="logo">
            <img src="${root }images/logo_ex5.png" alt="Logo" />
         </div>
         
                  <div id="top_menu">
            <div style="font-family: 'Noto Sans KR', sans-serif; padding-top: 5%; margin-left: -10px; width: 100px;">
               ${name }&nbsp;${r_name }
            </div>
            <div><img src="${root }images/sessiontimer.png" style="width: 24px; height: 24px; margin-top: 30px; margin-left: 15px;" /></div>
            <div id="session-time" style="font-family: 'Noto Sans KR', sans-serif; padding-top: 5%; font-size: small; margin-left: 9px;">
            <script>
               var sessionExpireTime = 30 * 60;

               function updateSessionTime() {
                  var sessionTimeDiv = document
                        .getElementById('session-time');

                  if (sessionTimeDiv) {
                     var minutes = Math
                           .floor(sessionExpireTime / 60);
                     var seconds = sessionExpireTime % 60;

                     if (minutes < 10)
                        minutes = '0' + minutes;
                     if (seconds < 10)
                        seconds = '0' + seconds;

                     var timeString = minutes + '분 ' + seconds + '초';
                     sessionTimeDiv.innerText = timeString;

                     sessionExpireTime--; // 세션 만료 시간에서 1초를 감소시킵니다.
                     
                     if (sessionExpireTime < 0) {
                         location.href = '${root}logout';
                     }
                  }
               }
               
               function resetSession() {
                     sessionExpireTime = 30 * 60; // 세션 만료 시간을 초기화합니다.
                  }

               updateSessionTime();
               setInterval(updateSessionTime, 1000); // 1초마다 updateSessionTime 함수를 호출하여 세션 만료 시간을 업데이트합니다.
            </script>
            </div>
            <button id="login" style="text-decoration: none; color: white; text-align: center;" type="button" onclick="resetSession()">연장</button>
            <button id="login" style="margin-left: 10px;"><a href="${root }logout" style="text-decoration: none; color: white; text-align: center;">로그아웃</a></button>
         </div>
      </div>
      <div class="nav">
         <div class="row">
            <nav>
               <ul>
                  <li class="menu"><a href="${root }academy/index">학사행정시스템</a></li>
                  <c:if test="${r_ID == 3 }">
                  	<li class="menu"><a href="${root }enrollment/index">수강신청</a></li>
                  </c:if>
           </ul>
            </nav>
         </div>
      </div>
   </header>
   <section id="contents">
   	<section id="upper_contents">
   <article class="container">
     <div class="carousel-container" style="margin-top: -58px;">
       <div class="carousel" data="0">
         <ul class="carousel-images">
	           <li><img src="${root }images/campus1.jpg" style="margin-left: -40px;"></li>
	           <li><img src="${root }images/campus2.jpg"></li>
	           <li><img src="${root }images/campus3.jpg"></li>
	           <li><img src="${root }images/campus4.jpg"></li>
	           <li><img src="${root }images/campus5.jpg"></li>
	           <li><img src="${root }images/campus6.jpg"></li>
	           <li><img src="${root }images/campus7.jpg"></li>
	           <li><img src="${root }images/campus8.jfif"></li>
	       
         </ul>
         <div class="slide slide-left">
              <button class="transparent-button" style="background: transparent; border: none; margin-left: -10px;">
                <img src="${root }images/arrow-left.png">
              </button>
            </div>
            <div class="slide slide-right">
              <button class="transparent-button" style="background: transparent; border: none; margin-right: 10px;">
                <img src="${root }images/arrow-right.png">
              </button>
            </div>
       </div>
     </div>
   </article>
 </section>
      <div style="overflow:auto; width: 100%; height: 55px; background-color: #242424; border-bottom: 1px solid #292929; border-top: 1px solid #292929; overflow-y: hidden; margin-top: -34px; margin-bottom: 30px;">
      	
      	<div align="center">
      		<ul>
      			<li style="display: inline-block; padding-right: 10%;">
      				<img src="${root }images/youtube.png" style="width: 16px; height: 16px;">
      				<a href="https://www.youtube.com/@SOLDESK." style="text-decoration: none; color: white; padding-bottom: 10px;" target="blank">유튜브</a>
      			</li>
      			<li style="display: inline-block;padding-right: 10%;">
      				<img src="${root }images/instagram.png" style="width: 16px; height: 16px;">
      				<a href="https://www.instagram.com/soldesk_it/" style="text-decoration: none; color: white; padding-bottom: 10px;" target="blank">인스타그램</a>
      			</li>
      			<li style="display: inline-block;padding-right: 10%;">
      				<img src="${root }images/facebook.png" style="width: 16px; height: 16px;">
      				<a href="https://www.facebook.com/soldesk0269017000/?ref=bookmarks" style="text-decoration: none; color: white; padding-bottom: 10px;" target="blank">페이스북</a>
      			</li>
      			<li style="display: inline-block;padding-right: 10%;">
      				<img src="${root }images/blog.png" style="width: 16px; height: 16px;">
      				<a href="https://blog.naver.com/soldeskceo" style="text-decoration: none; color: white; padding-bottom: 10px;" target="blank">블로그</a>
      			</li>
      		</ul>
      	</div>
      </div>
      <div class="row dflex">
      	<c:if test="${r_ID ==3 }">
         <div class="square">
            <div id="credits-check-container"></div>
         </div>
        </c:if> 
         <div class="square">
         <!-- 공지사항 -->
           <h4 class="card-title" style ="margin-left: 5px; margin-bottom: 7px;">&nbsp;공지사항</h4>
         <table class="table table-hover" style = "border: ">
            <thead>
               <tr>
                  <th class="text-center w-25" style="font-size: 13px; width: 50px;">글번호</th>
                  <th>제목</th>
                  <th class="text-center w-25 d-none d-xl-table-cell">작성날짜</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var ='obj' items= "${list }">
                  <tr>
                     <td class="text-center">${obj.board_idx }</td>
                     <th><a href='${root }board/read?board_idx=${obj.board_idx}&page=1' style="text-align: left; text-decoration: none; text-transform: none;">${obj.title }</a></th>
                     <td class="text-center d-none d-xl-table-cell">${obj.boarddate }</td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>                  
         <h4 style="text-align: right; margin-top: 0px; margin-right: 10px;"><a href="${root}board/main" class="btn btn-primary">더보기</a></h4>
         </div>
         
         <div class="square" id="calendar" style="height: 300px; overflow: hidden;">
         </div>
      </div>
      
      <div class="row dflex">
      	<c:if test="${r_ID ==3 }">
         <div class="square2" style="padding-left: 1%;">
        	<div id="gpa-check-container"></div>
         </div>
        </c:if>
        <div class="square2"><div class="books"></div></div>
        <div class="square2"><div class="weather-container"></div></div>
      </div>
   </section>
   <footer >
      <hr />
      <div>
         <p class="addr_info" align="center">
		      <br />
            서울캠퍼스: 02-000-0000 (우 03016) 서울시 종로구 2길 20 솔대학교<br>
            천안캠퍼스: 041-000-0000(우 31066) 충청남도 천안시 동남구 칠팔대길 31 솔대학교<br>
            COPYRIGHT BY CHILPAL UNIVERSITY ALL RIGHTS RESERVED
		      <br />
         </p>
         </div>
      </footer> 
<script>
   // 날씨 api 호출
   $(document).ready(function() {
       
       // AJAX 요청을 사용하여 weather.jsp의 내용을 가져옵니다.
       $.ajax({
           url: '${root }ma/weather',
           dataType: 'html',
           success: function(data) {
               // 가져온 내용을 index.jsp의 해당 div에 삽입합니다.
               $('.weather-container').html(data);
           },
           error: function(xhr, status, error) {
               console.log('Error fetching weather data: ' + error);
           }
       });
   });
   
   //학점취득현황 호출
   $(document).ready(function() {
       // AJAX 요청을 사용하여 credits_check.jsp의 내용을 가져옵니다.
       $.ajax({
           url: '${root }credits_check',
           dataType: 'html',
           success: function(data) {
               // 가져온 내용을 index.jsp의 해당 div에 삽입합니다.
               $('#credits-check-container').html(data);
               
               
           },
           error: function(xhr, status, error) {
               console.log('Error fetching credits_check data: ' + error);
           }
       });
   });

    //GPA 그래프 호출
   $(document).ready(function() {
       // AJAX 요청을 사용하여 GPA_check.jsp의 내용을 가져옵니다.
       $.ajax({
           url: '${root }GPA_check',
           dataType: 'html',
           success: function(data) {
               // 가져온 내용을 index.jsp의 해당 div에 삽입합니다.
               $('#gpa-check-container').html(data);
           },
           error: function(xhr, status, error) {
               console.log('Error fetching GPA_check data: ' + error);
           }
       });
   });
// 알라딘 책 정보 호출
   $(document).ready(function () {
    fetchBooks('336');
   });
   
   function fetchBooks(categoryId) {
       $.ajax({
           url: '${root}ma/books/' + categoryId,
           dataType: 'html',
           success: function (data) {
               $('.books').html(data);
           },
           error: function (xhr, status, error) {
               console.log('Error fetching book data: ' + error);
           }
       });
   }
   
 
   
   

</script>
<script type="text/javascript" src="${root }script/carousel.js"></script>
<script type="text/javascript" src="${root }script/smoothscroll.min.js"></script>
</body>
</html>