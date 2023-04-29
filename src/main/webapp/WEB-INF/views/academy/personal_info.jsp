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
				<form:form action="${root }academy/personal_info_pro" method="post" modelAttribute="modifyMemberBean" enctype="multipart/form-data">
					 <input type="hidden" value = "${r_ID }" />
					<div class="form-group">
						<form:label path="member_file">사진</form:label>
						<c:if test="${modifyMemberBean.member_file == null }">
							<img src="${root }images/defaultProfile.png"/>
						</c:if>
						<c:if test="${modifyMemberBean.member_file != null}">
							<img src="${root }upload/${modifyMemberBean.member_file}"/>
						</c:if>
						<form:hidden path="member_file"/>
						<form:input type ="file" path="upload_file" class="form-control" accept ="image/*"/>
					</div>
					
					<div class="form-group">
						<form:label path="name">이름</form:label>
						<form:input path="name" class="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<form:label path="ID">학번/교직원번호</form:label>
						<form:input path="ID" class="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<form:label path="d_name">학과</form:label>
						<form:input path="d_name" class="form-control" readonly="true"/>
					</div>
					<c:if test="${r_id == 3 }">
						<div class="form-group">
							<form:label path="grade">학년</form:label>
							<form:input path="grade" class="form-control" readonly="true"/>
						</div>
						<div class="form-group">
							<form:label path="s_semester">학기</form:label>
							<form:input path="s_semester" class="form-control" readonly="true"/>
						</div>
					</c:if>
					<div class="form-group">
						<form:label path="password">비밀번호</form:label>
						<form:password path="password" class="form-control"/>
						<form:errors path="password" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="birth">생년월일</form:label>
						<form:input path="birth" class="form-control" readonly="true"/>
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
					<c:if test="${r_id == 3 }">
					<div class="form-group">
						<form:label path="entrance">입학일자</form:label>
						<form:input path="entrance" class="form-control" readonly="true"/>
					</div>
					</c:if>
					<div class="form-group">
						<form:label path="email">이메일</form:label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" style="color:red"/>
					</div>
					<div class="form-group">
						<div class="text-right">
							<form:button class="btn btn-primary">정보수정</form:button>
						</div>
					</div>
				</form:form>
			</div>
		</section>

</body>
</html>