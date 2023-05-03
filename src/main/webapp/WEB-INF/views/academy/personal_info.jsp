<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> -->
<style>
.sec {
	position: absolute;
	top: 8%;
	left: 15%;
	width: 85%;
	height: 92%;
}

.contents {
	width: 100%;
	height: 92%;
}

table {
	table-layout: fixed;
	margin-top: 3%;
	margin-left: 7%;
	width: 87%;
	height: 60%;
	border-collapse: collapse;
	border: 2.5px solid #168;
}

td {
	width: 40%;
	padding: 10px;
	border: 0.5px solid #168;
	color: #168;
	text-align: center;
	vertical-align: middle;
}

td img {
	align-self: center;
	width: 80%;
	height: 100%;
}

label {
	font-weight: bold;
}

.form-control {
	display: block;
	width: 80%;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.btn {
	display: inline-block;
	font-weight: 400;
	color: #fff;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: #007bff;
	border: 1px solid #007bff;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:hover {
	background-color: #0069d9;
	border-color: #0062cc;
}

.btn-primary:focus, .btn-primary.focus {
	box-shadow: 0 0 0 .2rem rgba(38, 143, 255, .5);
}

.btn-primary:active, .btn-primary.active {
	background-color: #0062cc;
	border-color: #005cbf;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/academy/base.jsp"/>
	
	<section class="sec">
		<div class = "contents">
			<form:form action="${root }academy/personal_info_pro" method="post" modelAttribute="modifyMemberBean" enctype="multipart/form-data">
			<input type="hidden" value = "${r_ID }" />
				<table>
					<tr>
					<td colspan="6" style ="padding: 0.5em 0.6em; text-align: left; font-size: 22px; color: #168"><b>개인정보수정</b></td>
					</tr>
					
					<tr>
						<td colspan="2" rowspan="3">
							<form:label path="member_file"></form:label>
							<c:if test="${modifyMemberBean.member_file == null }">
								<img src="${root }images/defaultProfile.png"/>
							</c:if>
							<c:if test="${modifyMemberBean.member_file != null}">
								<img src="${root }upload/${modifyMemberBean.member_file}"/>
							</c:if>
							<form:hidden path="member_file"/>
							<br />
						</td>
						<td>
							<form:label path="ID">학번/교직원번호</form:label>
						</td>
						<td>
							<form:input path="ID" class="form-control" readonly="true"/>
						</td>
						<td>
							<form:label path="name">이름</form:label>
						</td>
						<td>
							<form:input path="name" class="form-control" readonly="true"/>
						</td>
					</tr>
					
					<tr>
						<td>
							<form:label path="d_name">학과</form:label>
						</td>
						<td>
							<form:input path="d_name" class="form-control" readonly="true"/>
						</td>
						<td>
							<form:label path="password">비밀번호</form:label>
						</td>
						<td>
							<form:password path="password" class="form-control"/>
							<form:errors path="password" style="color:red"/>
						</td>
					</tr>
					<tr>
					<c:if test="${r_ID == 3 }">
						<td>
							<form:label path="grade">학년</form:label>
						</td>
						<td>
							<form:input path="grade" class="form-control" readonly="true"/>
						</td>
						<td>
							<form:label path="s_semester">학기</form:label>
						</td>
						<td>
							<form:input path="s_semester" class="form-control" readonly="true"/>
						</td>
					</c:if>
					</tr>
					<tr>
						<td colspan="2">
							<form:input type ="file" path="upload_file" class="form-control" accept ="image/*"/>
						</td>
						<c:if test="${r_ID == 3 }">
							<td>
								<form:label path="entrance">입학일자</form:label>
							</td>
							<td>
								<form:input path="entrance" class="form-control" readonly="true"/>					
							</td>
						</c:if>
						<td>
							<form:label path="birth">생년월일</form:label>
						</td>
						<td>
							<form:input path="birth" class="form-control" readonly="true"/>
						</td>
					</tr>
					
					<tr>
						<td>
							<form:label path="address">주소</form:label>
						</td>
						<td colspan="2">
							<form:input path="address" class="form-control"/>
							<form:errors path="address" style="color:red"/>
						</td>
						<td>
							<form:label path="email">이메일</form:label>
						</td>
						<td colspan="2">
							<form:input path="email" class="form-control" />
							<form:errors path="email" style="color:red"/>
						</td>
					</tr>
					
					<tr>
						<td>
							<form:label path="phone">연락처</form:label>
						</td>
						<td colspan="2">
							<form:input path="phone" class="form-control"/>
							<form:errors path="phone" style="color:red"/>
						</td>
						<td>
							<form:label path="emergency">비상연락처</form:label>
						</td>
						<td colspan="2">
							<form:input path="emergency" class="form-control"/>
							<form:errors path="emergency" style="color:red"/>
						</td>
					</tr>
					
					<tr align="center">
						<td colspan="6">
							<form:button class="btn btn-primary">정보수정</form:button>
						</td>
					</tr>
				</table>
			</form:form>
		</div>
	</section>
	
</body>
</html>