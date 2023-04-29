<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기말 강의평가 입력</title>
</head>
<body>
<!-- 강의평가 입력 -->
	
	<div class="course-info">
		<div class="course-code">학수번호 : ${lec_ID }</div>
		<div class="course-name">교과목명 : ${lec_name }</div>
		<div class="professor-name">교수명 : ${name }</div>
	</div>
	
	<div class="agreement-form">
		<div class="agreement-text">
			<p>강의 평가에 대한 내용이 공개됩니다. 이에 동의하십니까?</p>
		</div>
		<div class="agreement-checkbox">
			<input type="checkbox" id="agree-checkbox"> <label
				for="agree-checkbox">동의합니다</label>
		</div>
	</div>
	<form:form action="${root }evaluation/mid_eval_pro" method="post" modelAttribute="writeEvalBean">
	
	<form:hidden path="lec_ID"/>
	<form:hidden path="std_ID"/>
	<div>
		<h3>강의평가</h3>
		<h4>강의 내용</h4>
		<form:radiobutton path="items1" value="5" />5
		<form:radiobutton path="items1" value="4" />4
		<form:radiobutton path="items1" value="3" />3
		<form:radiobutton path="items1" value="2" />2
		<form:radiobutton path="items1" value="1" />1
		

		<h4>강의 속도</h4>
		<form:radiobutton path="items2" value="5" />5
		<form:radiobutton path="items2" value="4" />4
		<form:radiobutton path="items2" value="3" />3
		<form:radiobutton path="items2" value="2" />2
		<form:radiobutton path="items2" value="1" />1

		<h4>과제 난이도</h4>
		<form:radiobutton path="items3" value="5" />5
		<form:radiobutton path="items3" value="4" />4
		<form:radiobutton path="items3" value="3" />3
		<form:radiobutton path="items3" value="2" />2
		<form:radiobutton path="items3" value="1" />1

		<h4>출석 요구도</h4>
		<form:radiobutton path="items4" value="5" />5
		<form:radiobutton path="items4" value="4" />4
		<form:radiobutton path="items4" value="3" />3
		<form:radiobutton path="items4" value="2" />2
		<form:radiobutton path="items4" value="1" />1
		
		<form:label path="feedback">교수님께 하고 싶은 말</form:label>
		<form:textarea path="feedback"/>
		
	</div>
	<form:button type = "submit">제출</form:button>
	</form:form>
</body>
</html>