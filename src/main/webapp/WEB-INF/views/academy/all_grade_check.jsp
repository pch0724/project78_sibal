<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 학기 성적조회</title>
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
	/* css 추가 바람 */
</style>
</head>
<body>
	
	<c:import url="/WEB-INF/views/academy/base.jsp"/>
	
	<section class="sec">
		<div class = "contents">
		<!-- .contents 안에 html 추가 바람 -->
		<h2>전체학기성적조회</h2>
		</div>
	</section>

</body>
</html>