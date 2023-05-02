<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
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
   height: 100%;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/academy/base.jsp"/>
	
	<section class ="sec">
		<div class = "contents">
			<div class="container" style="margin-top:100px">
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<div class="card shadow">
							<div class="card-body">
								<form:form action="${root }board/write_pro" method="post" modelAttribute = "writeContentBean" enctype="multipart/form-data">
								<form:hidden path="w_ID"/>
								<form:hidden path="w_name"/>
								<div class="form-group">
									<form:label path="title">제목</form:label>
									<form:input path="title" class="form-control"/>
									<form:errors path="title" class="form-control" style = "color: red"/>
								</div>
								<div class="form-group">
									<form:label path="text">내용</form:label>
									<form:textarea path="text" class="form-control" rows="10" style="resize:none"/>
									<form:errors path="text" class="form-control" style = "color: red"/>
								</div>
								<div class="form-group">
									<form:label path="upload_file">첨부 이미지</form:label>
									<form:input type="file" path="upload_file" class="form-control" accept="image/*"/>
								</div>
								<div class="form-group">
									<div class="text-right">
										<form:button class="btn btn-primary">작성하기</form:button>
									</div>
								</div>
								</form:form>
							</div>
						</div>
					</div>
					<div class="col-sm-3"></div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>