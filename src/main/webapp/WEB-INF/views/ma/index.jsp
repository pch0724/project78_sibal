<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
<title>칠팔대학교 통합시스템</title>
</head>
<body>
   <header>
      <div class="row">
         <div id="logo">
            <img src="${root }images/logo_78.png" alt="Logo" />
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
         <div class="square">
            <div class="weather-container">
             
         </div>
         </div>
         <div class="square"></div>
         <div class="square">
            
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

   </script>
</body>
</html>