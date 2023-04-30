<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
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
	div.all {
	width: 100%;
	height: 200px;
	display: flex;
	justify-content: center;
	align-items: center;
}

div#photo {
	float: left;
	width: 3.5cm;
	height: 4.5cm;
	border: 1px solid black;
	background-color: white;
	margin: 10px;
	display: inline-block;
	vertical-align: top;
}

div#infomodify {
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	height: 40px;
	width: 120px;
	border: none;
	border-radius: 5px;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
	margin-top: 200px;
	margin-left: 10px;
}

div.info1 {
	display: inline-block;
	float: left;
	margin-top: 50px;
}

div.info1_1 {
	display: inline-block;
	vertical-align: top;
	float: left;
	margin-top: 50px;
}

div.list1 {
	border: solid black 1px;
	width: 150px;
}

div.list2 {
	border: solid black 1px;
	width: 150px;
}

div.list3 {
	border: solid black 1px;
	width: 150px;
}

div.list4 {
	border: solid black 1px;
	width: 150px;
}

div.info2 {
	display: inline-block;
	float: left;
	margin-top: 50px;
}

div.info2_1 {
	display: inline-block;
	vertical-align: top;
	float: left;
	margin-top: 50px;
}

div.info3 {
	display: inline-block;
	float: left;
	margin-top: 50px;
}

div.info3_1 {
	display: inline-block;
	vertical-align: top;
	float: left;
	margin-top: 50px;
}

div.all2 {
	width: 100%;
	margin-top: 10px;
	height: 200px;
}

div.info4 {
	display: inline-block;
	float: left;
	margin-left: 25.5%;
}

div.info4_1 {
	display: inline-block;
	float: left;
	vertical-align: top;
}

div.list5 {
	border: solid black 1px;
	width: 150px;
}

div.list6 {
	border: solid black 1px;
	width: 150px;
}

div.list7 {
	border: solid black 1px;
	width: 400px;
}
	/* css 추가 바람 */
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/academy/base.jsp"/>
		<section class="sec">
			<div class = "contents">
				<form:form action="${root }admin/addMember_Pro" method="post" modelAttribute="joinMemberBean" enctype="multipart/form-data">
					<form:input type = "hidden" path="r_ID" value = "${r_ID2 }"/>
					<form:input type = "hidden" path="first_login" value = "false"/>
					<div class="form-group">
						<form:label path="upload_file">사진</form:label>
						<form:input type ="file" path="upload_file" class="form-control" accept ="image/*"/>
					</div>
					<div class="form-group">
						<form:label path="ID">학번/교직원번호</form:label>
						<form:input path="ID" class="form-control"/>
					</div>
					<div class="form-group">
						<form:label path="name">이름</form:label>
						<form:input path="name" class="form-control"/>
					</div>
					<c:if test="${r_ID2 == 2 or r_ID2 == 3 }">
						<div class="form-group">
							<form:label path="d_ID">학과</form:label>
							<form:select path="d_ID">
								<form:option value="110">가족복지학과</form:option>
								<form:option value="120">행정학과</form:option>
								<form:option value="210">컴퓨터공학과</form:option>
								<form:option value="220">생명공학과</form:option>
								<form:option value="310">무용예술학과</form:option>
							</form:select>
						</div>
					</c:if>
					<c:if test="${r_ID2 == 3 }">
						<div class="form-group">
							<form:label path="grade">학년</form:label>
							<form:select path="grade">
								<form:option value="1">1학년</form:option>
								<form:option value="2">2학년</form:option>
								<form:option value="3">3학년</form:option>
								<form:option value="4">4학년</form:option>
							</form:select>
						</div>
						
						<div class="form-group">
							<form:label path="s_semester">이수학기</form:label>
							<form:select path = "s_semester">
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
								<form:option value="4">4</form:option>
								<form:option value="5">5</form:option>
								<form:option value="6">6</form:option>
								<form:option value="7">7</form:option>
								<form:option value="8">8</form:option>
							</form:select>
						</div>
					</c:if>

					<div class="form-group">
						<form:label path="password">비밀번호</form:label>
						<form:password path="password" class="form-control"/>
						<form:errors path="password" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="birth">생년월일</form:label>
						<form:input path="birth" class="form-control"/>
					</div>
					<div class="form-group">
						<form:label path="phone">전화번호</form:label>
						<form:input path="phone" class="form-control"/>
						<form:errors path="phone" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="emergency">비상연락처</form:label>
						<form:input path="emergency" class="form-control"/>
						<form:errors path="emergency" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="address">주소</form:label>
						<form:input path="address" class="form-control"/>
						<form:errors path="address" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="email">이메일</form:label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="entrance">등록일자</form:label>
						<form:input path="entrance" class="form-control"/>
					</div>
					<div class="form-group">
						<div class="text-right">
							<form:button class="btn btn-primary">이용자 추가</form:button>
						</div>
					</div>
				</form:form>
			</div>
		</section>

</body>
</html>