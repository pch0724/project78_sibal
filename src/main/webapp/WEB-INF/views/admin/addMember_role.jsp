<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원구분 선택</title>
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
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/academy/base.jsp"/>
	<section class="sec">
		<div class="contents">
			<form action="${root }admin/addMember" method="post">
				<select id = "r_ID" name = "r_ID">
					<option value="1">관리자</option>
					<option value="2">교수</option>
					<option value="3">학생</option>
				</select>
				
				<input type="submit" value ="선택">
			</form>
		</div>
	</section>
</body>
</html>