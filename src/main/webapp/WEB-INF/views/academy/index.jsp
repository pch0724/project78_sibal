<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사 메인</title>
</head>
<style>
.sec {
   position: absolute;
   top: 8%;
   left: 15%;
   width: 85%;
   height: 92%;
   background-image: url("${root }images/sec_bg.jpg");
   background-size: 100%;
}
</style>
<body>
   
   <c:import url="/WEB-INF/views/academy/base.jsp"/>
   
   <section class="sec">
    </section>
</body>
</html>