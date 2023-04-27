<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	.student-info{
		display: flex;
		
	}
	.name-label{
		padding-right: 2%;
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
			<form:form action = "" method ="post" modelAttribute="getInfoMemberBean">
				<div style="text-align:left; font-size: 18px; padding-bottom: 1%;">학생 정보</div>
				<div class="student-info">
					<div class="name-label" style="font-weight:bold">
						<form:label path="name">이름</form:label>
						<div class="name-value">
							<form:input path="name" readonly="true"/>
						</div>
					</div>
					<div class="student-id-label" style=" font-weight:bold">
						<form:label path="ID">학번</form:label>
						<div class="student-id-value">
							<form:input path="ID" readonly="true"/>
						</div>
					</div>
				</div>
				
			</form:form>
			</div>
	</header>
	<!-- 수강과목 -->
	<div class="enrolled">
		<h3>수강과목</h3>
		<div class="table">
			<div class="row header">
				<div class="cell" style="width: 10%">강의평가</div>
			    <div class="cell" style="width: 10%">학수번호</div>
			    <div class="cell" style="width: 20%">교과목명</div>
			    <div class="cell" style="width: 7%">담당교수</div>
			    <div class="cell" style="width: 3%">학점</div>
			</div>
			<c:forEach var="Eval" items="${EvalInfo}">
			<div class="row">
			    <div class="cell">
				    <c:choose>
				    	<c:when test="${Eval.completed == true}">
				    		평가완료
				    	</c:when>
				    	<c:otherwise>
				    <a href="${root }evaluation/mid_eval?lec_ID=${Eval.lec_ID}&lec_name=${Eval.lec_name }&name=${Eval.name }" style="color:blue; font-weight: bold;">
				    	강의평가
				    </a>
				    </c:otherwise>
				    </c:choose>
			    </div>
			    <div class="cell" style="width: 10%">${Eval.lec_ID }</div>
			    <div class="cell" style="width: 20%">${Eval.lec_name }</div>
			    <div class="cell" style="width: 7%">${Eval.name }</div>
			    <div class="cell" style="width: 3%">${Eval.credits }</div>
			   
			</div>
			</c:forEach>
		</div>
	</div>
	
	
	</div>
	</section>
</body>
</html>