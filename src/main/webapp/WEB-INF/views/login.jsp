<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>칠팔대학교 통합시스템 로그인</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	border: none;
}

body {
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
}

main {
    background-image: url("${root}images/login_bg.jpg");
	height: 849px;
}

.login_section{
	position: relative;
}
.login-wrapper{
	border-radius : 15px;
	position:relative;
	top: 350px;
	left: 450px;
    width: 40%;
    height: 55%;
    padding: 40%;
    box-sizing: border-box;
    font-size: 18px;
    color: #050099;
    background-color: #FFFFFF;
    margin-bottom: 20px;
    padding:5px;
    border:none;
}


div > .login-wrapper {
	 
	 background-color:#BDBDBD;
	 
}

.login_up {
	display: flex;
  	justify-content: center;
  	align-items: center;
	font-size: 5%;
	padding: 1%;
}



#login-form > input{
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


#login {
	width: 100%;
	height: 50%;
	/* padding: 5px; */
	
	background-color:#000087;
	
}

.lock {
	width: 100%;
	height: 100%;
}


#notice_view {
	width:100%;
	font-weight:bold;
	color: #CD1039;
	font-size: 5.5%;
	margin-top: 1.8%;
}

#notice_go {
	font-size: 5.5%;
	font-weight:bold;
	/* margin-bottom: 2.4%; */
}


 img {
		width:3.5%;
		height:5%;
}
 button:hover {
        	color: #FFFFFF;
 }
 button {
 	height: 50%;
 	width: 50%;
 	padding: 5px;
 	color: #FFFFFF;
 	
 }
 footer {
	background: #EAEAEA;
	height: 120px;
	
	
}
.addr_info {
	position: absolute;
	left:36.5%;
	display: flex;
	text-align: center;
    font-size:xx-small;
    margin: 3.5%;
}
</style>
</head>
</head>
<body>
	<main>
		<section class="login_section">
				<div class="login-wrapper" >
					<div class="login_background">
				        <div class="lock"><img src="${root}images/locker.png"/></div>
					        <div class="logo">
					        	<h2>Login</h2>
					        </div>
					        <!-- action="#" -->
				        <form:form action="${root }login_pro" method="post"  path="login-form" modelAttribute="tempLoginMemberBean">
				            <div>
					            <form:label path="ID">학번/교직원번호</form:label>
					            <form:input path="ID"/>
					            <form:errors path="ID" style='color:red'/>
				            </div>
				            
				            <div>
					            <form:label path="password">비밀번호</form:label>
				            	<form:password path="password"/>
					            <form:errors path="password" style='color:red'/>
				            </div>
							<form:button type="submit" id="login">로그인</form:button>
				        </form:form>
			        </div><!-- login_background -->
		    	</div><!-- login-wrapper -->
		   </section>
	</main>
		<footer >
		<div>
			<p class="addr_info">
				서울캠퍼스: 02-000-0000 (우 03016) 서울시 종로구 2길 20 칠팔대학교<br>
				천안캠퍼스: 041-000-0000(우 31066) 충청남도 천안시 동남구 칠팔대길 31 칠팔대학교<br>
				COPYRIGHT BY CHILPAL UNIVERSITY ALL RIGHTS RESERVED
			</p>
			</div>
		</footer>	
</body>
</html>