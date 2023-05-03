<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
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
}

#contents {
   background: url("${root }images/back2.jpg");
   background-size: 100%;
   background-repeat: no-repeat;
   min-height: 704px;
   padding-top: 30px;
}

div.dflex {
   display: flex
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
   box-shadow : 0pc 6px 15px #001c4d;
   
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
   box-shadow : 0pc 6px 15px #001c4d;
}
#login {
   font-family: 'Noto Sans KR', sans-serif;
   margin-right:10px;
   margin-left:-20px;
   margin-top:20px;
   border-radius: 10px;
   border: 2px solid black;
   width: 80px;
   height:30px;
   background-color:#000087;
   
}
</style>
<meta charset="UTF-8">
<title>칠팔대학교 통합시스템</title>
</head>
<body style="margin: 0px;">
   <header>
      <div class="row">
         <div id="logo">
            <img src="${root }images/logo_ex5.png" alt="Logo" />
         </div>
         <div id="top_menu">
            <button id="login" ><a href="${root }logout" style="text-decoration: none; color: white;">로그아웃</a></button> 
            <div id="clock"></div>
         </div>
      </div>
      <div class="nav">
         <div class="row">
            <nav>
               <ul>
                  <li class="menu"><a href="${root }academy/index">학사행정시스템</a></li>
                  <li class="menu"><a href="${root }enrollment/index">수강신청</a></li>
           </ul>
            </nav>
         </div>
      </div>
   </header>
   <section id="contents">
      <div class="row dflex">
         <div class="square">
            <div id="credits-check-container"></div>
         </div>
         <div class="square">
         <!-- 공지사항 -->
           <h3 class="card-title">공지사항</h3>
         <table class="table table-hover">
            <thead>
               <tr>
                  <th class="text-center w-25">글번호</th>
                  <th>제목</th>
                  <th class="text-center w-25 d-none d-xl-table-cell">작성날짜</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var ='obj' items= "${list }">
                  <tr>
                     <td class="text-center">${obj.board_idx }</td>
                     <th><a href='${root }board/read?board_idx=${obj.board_idx}&page=1'>${obj.title }</a></th>
                     <td class="text-center d-none d-xl-table-cell">${obj.boarddate }</td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>                  
         <a href="${root }board/main" class="btn btn-primary">더보기</a>
         </div>
         <div class="square">
            
         </div>
      </div>
      <div class="row dflex">
         <div class="square2" style="padding-left: 1%;"><div id="gpa-check-container"></div></div>
         <div class="square2"></div>
         <div class="square2"><div class="weather-container"></div></div>
      </div>
   </section>
   <footer> </footer>
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
   
   
   
   

</script>

</body>
</html>