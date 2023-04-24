<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중간 강의평가 입력</title>
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
	
	.enrolled{
		background-color: #f2f2f2;
	}
	.table {
		border-collapse: collapse;
		width: 100%;
		margin: 0 auto;
		margin-top: 10px;
		overflow-x: auto;
	}
	.row {
	  display: table-row;
	}
	.cell {
	  display: table-cell;
	  padding: 8px;
	  border: 1px solid #ccc;
	  text-align: center;
	}
	.header {
	  font-weight: bold;
	  background-color: #f2f2f2;
	}
	.header .cell {
	  border-top: 2px solid #444;
	  border-bottom: 2px solid #444;
	}
</style>
</head>
<body >
	<c:import url="/WEB-INF/views/academy/base.jsp"/>
	
	
	
	<!-- 상단 조회 -->
	<section class="sec">
	
	<div class = "contents">
	<header style="margin: 15px, 15px, 10px, 20px; background-color: skyblue; height : 15%;">
		<div>
			<form action="" method = "post" style="display: inline;">
				<div style="margin-left: 30px;">
					<button type="button" onclick="" value = "select" style="color: white; border-radius: 10px; background-color: gray; margin: 20px, 20px">조회</button>
					<button type="submit" value = "save" style="color: white; border-radius: 10px; background-color: blue">저장</button>
					</div>
				<div style = "margin-left: 30px;">
					학번/이름:
					<input type="text" name = "id"/>
					<input type="text" name = "name"/>
				</div>
			</form>
		</div>
	</header>
	<!-- 수강과목 -->
	<div class="enrolled">
		<h3>수강과목</h3>
		<div class="table">
			<div class="row header">
				<div class="cell">속성 1</div>
			    <div class="cell">속성 2</div>
			    <div class="cell">속성 3</div>
			    <div class="cell">속성 4</div>
			    <div class="cell">속성 5</div>
			    <div class="cell">속성 6</div>
			</div>
			<div class="row">
			    <div class="cell">값 1-1</div>
			    <div class="cell">값 1-2</div>
			    <div class="cell">값 1-3</div>
			    <div class="cell">값 1-4</div>
			    <div class="cell">값 1-5</div>
			    <div class="cell">값 1-6</div>
			</div>
		</div>
	</div>
	
	<!-- 강의평가 입력 -->
	<form action="" method="post">
	<div class="course-info">
		<div class="course-code">ABC101</div>
		<div class="course-name">Introduction to ABC</div>
		<div class="professor-name">Prof. John Smith</div>
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

	<div class="evaluation-form">
		<h3>강의평가</h3>
		<h4>강의 내용</h4>
		<input type="radio" id="content-5" name="content" value="5"> 
		<label for="content-5">5</label> 
		<input type="radio" id="content-4" name="content" value="4"> 
		<label for="content-4">4</label> 
		<input type="radio" id="content-3" name="content" value="3"> 
		<label for="content-3">3</label>
		<input type="radio" id="content-2" name="content" value="2">
		<label for="content-2">2</label>
		<input type="radio" id="content-1" name="content" value="1">
		<label for="content-1">1</label>

		<h4>강의 속도</h4>
		<input type="radio" id="pace-5" name="pace" value="5"> 
		<label for="pace-5">5</label> 
		<input type="radio" id="pace-4" name="pace" value="4"> 
		<label for="pace-4">4</label> 
		<input type="radio" id="pace-3" name="pace" value="3"> 
		<label for="pace-3">3</label>
		<input type="radio" id="pace-2" name="pace" value="2"> 
		<label for="pace-2">2</label> 
		<input type="radio" id="pace-1" name="pace" value="1"> 
		<label for="pace-1">1</label>

		<h4>과제 난이도</h4>
		<input type="radio" id="assignment-5" name="assignment" value="5">
		<label for="assignment-5">5</label> 
		<input type="radio" id="assignment-4" name="assignment" value="4"> 
		<label for="assignment-4">4</label>
		<input type="radio" id="assignment-3" name="assignment" value="3">
		<label for="assignment-3">3</label>
		<input type="radio" id="assignment-2" name="assignment" value="2">
		<label for="assignment-2">2</label> 
		<input type="radio" id="assignment-1" name="assignment" value="1"> 
		<label for="assignment-1">1</label>

		<h4>출석 요구도</h4>
		<input type="radio" id="attendance-5" name="attendance" value="5">
		<label for="attendance-5">5</label> 
		<input type="radio" id="attendance-4" name="attendance" value="4"> 
		<label for="attendance-4">4</label> 
		<input type="radio" id="attendance-3" name="attendance" value="3"> 
		<label for="attendance-3">3</label>
		<input type="radio" id="attendance-2" name="attendance" value="2">
		<label for="attendance-2">2</label>
		<input type="radio"	id="attendance-1" name="attendance" value="1"> 
		<label for="attendance-1">1</label>
		
		<div class="form-group">
			<label for="comment">교수님께 하고 싶은 말</label>
			<textarea id="comment" name="comment" rows="5" cols="50"></textarea>
		</div>
	</div>
	<button type = "submit">제출</button>
	</form>
	</div>
	</section>
</body>
</html>