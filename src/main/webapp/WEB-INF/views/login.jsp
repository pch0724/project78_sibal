<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap" rel="stylesheet">
<title>칠팔대학교 통합시스템 로그인</title>
<style type="text/css">
* {
	cursor:
	padding: 0;
	margin: 0;
	border: none;
}

h1 {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 2em;
	margin-left: 130px;
	margin-top: -250px;
}

body {
	overflow: hidden;
	background: url("${root }images/login_logo2.jpg");
	background-size: 100%;
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
}

main {
	height: 400px;
}

.login_section {
	position: relative;
}
/* 로그인 전체 */
.login-wrapper {
	border-radius: 15px;
	position: relative;
	top: 80px;
	left: 380px;
	width: 50%;
	height: 500px;
	box-sizing: border-box;
	font-size: 18px;
	color: #050099;
	margin-bottom: 20px;
	margin-top: 260px;
	margin-left:3px;
	padding: 5px;
	border: none;
}

/* 로그인 버튼 */
#login {
	border-radius: 3px;
	margin-top: 20px; 
	font-size: 16px;
	width: 408px;
	height: 40px;
	background-color: #000087;
}
footer {
	
	height: 40px;
	color: #595959;
}

.addr_info {
	margin-top:15px;
	margin-left:10px;
	position: absolute;
	left: 36.5%;
	display: flex;
	text-align: center;
	font-size: xx-small;
	
	border-top: 1px solid #595959;
}

.login_logo {
	margin-top: 20px;
	margin-left: 2%;
	width: 125px;
	height: 58px;
}

div>.login-wrapper {
	background-color: #BDBDBD;
}

.login_up {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 5%;
	padding: 1%;
}

#login-form>input {
	width: 100%;
	height: 30px;
	/* padding: 0 10px; */
	padding: 2%;
	box-sizing: border-box;
	margin-top: 1.35%;
	margin-bottom: 0.5%;
	border: 1px solid #0100FF;
	color: #000000;
	background-color: #FFFFFF;
}

ID, Password {
	background-color: #C0C0C0;
	width: 30%;
}

.lock {
	margin-top: 40px;
	width: 100%;
	height: 100%;
}

#notice_view {
	width: 100%;
	font-weight: bold;
	color: #CD1039;
	font-size: 5.5%;
	margin-top: 1.8%;
}

#notice_go {
	font-size: 5.5%;
	font-weight: bold;
	/* margin-bottom: 2.4%; */
}

.img1 {
	margin-left: 240px;
	margin-top: 37px;
	width: 210px;
	height: 210px;
}

button:hover {
	color: #FFFFFF;
}

button {
	height: 50%;
	width: 50%;
	padding: 5px;
	color: #ffffff;
}



#ID {
	font-family: 'Nanum Gothic', sans-serif;
	border: none;
	margin-top: -20px;
}

#pass {
	font-family: 'Nanum Gothic', sans-serif;
	border: none;
}

#ID1 {
	margin-left: 10px;
	margin-right: 10px;
	height: 16px;
	width: 16px;
}

#pass1 {
	margin-left: 10px;
	margin-right: 10px;
	
}
input:focus {
	outline:none;
}
.img2{
	top: 4px;
	width: 16px;
	height: 16px;
}
</style>
</head>
</head>
<body>
   <main>
      <section class="login_section">
            <div class="login-wrapper" >
               <div class="login_background">
                    <div class="lock"></div>
                       <div class="logo">
                          
                       </div>
                       <!-- action="#" -->
                       <div style=" margin-left: 160px; margin-top: 40px;">
			                    <form:form action="${root }login_pro" method="post"  path="login-form" modelAttribute="tempLoginMemberBean">
	                      <table style="background-color: white; border-radius: 15px; border: 2px solid #aeafb0;">
	                      	<tr style="border-bottom: 2px solid #aeafb0;">
	                      		<td style="border-bottom: 2px solid #aeafb0;">
			                        <div style=" margin-top: 10px; margin-bottom:5px; width: 400px;">
			                           <form:label id="ID1" path="ID"><img class="img2" src="${root}images/employee.png"></form:label>
			                           <form:input id="ID" path="ID" size="50" placeholder="학번/교직원번호"/>
			                           <form:errors path="ID" style='color:red'/>
			                        </div>
	                      		</td>
	                      	</tr>
	                      	<tr>
	                      		<td>
			                        <div style=" margin-top: 5px; margin-bottom:10px; width: 400px;">
			                           <form:label id="pass1" path="password"><img class="img2" src="${root}images/padlock.png"></form:label>
			                           <form:password id="pass" path="password" size="50" placeholder="비밀번호"/>
			                           <form:errors path="password" style='color:red'/>
			                        </div>
	                      		</td>
	                      	</tr>
			                </table>      
			                     <form:button type="submit" id="login">LOGIN</form:button>
			                    </form:form>
                    	</div>
                 </div><!-- login_background -->
             </div><!-- login-wrapper -->
         </section>
   </main>
      <footer >
      <hr />
      <div>
         <p class="addr_info">
		      <br />
		      <br />
            서울캠퍼스: 02-000-0000 (우 03016) 서울시 종로구 2길 20 솔대학교<br>
            천안캠퍼스: 041-000-0000(우 31066) 충청남도 천안시 동남구 칠팔대길 31 솔대학교<br>
            COPYRIGHT BY CHILPAL UNIVERSITY ALL RIGHTS RESERVED
         </p>
         </div>
      </footer>        
</body>
</html>