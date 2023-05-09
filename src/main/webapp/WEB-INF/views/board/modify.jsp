<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시물 수정</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style type="text/css">
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
	   overflow: auto;
	}
</style>
</head>
<body>

	<c:import url="/WEB-INF/views/academy/base.jsp"/>
	
	<section class ="sec">
		<div class ="contents">
			<div class="container" style="margin-top:4%">
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<div class="card shadow">
							<div class="card-body">
								<form:form action="${root }board/modify_pro" method="post" modelAttribute="modifyContentBean" enctype="multipart/form-data">
									<!-- 어떤 글을 수정하는지 알아야하므로 글 번호 필요 -->
									<form:hidden path="board_idx"/>
									<input type="hidden" name = "page" value = "${page }"/>
									<div class="form-group">
										<form:label path="w_name">작성자</form:label>
										<form:input path="w_name" class="form-control" readonly="true"/>
									</div>
									<div class="form-group">
										<form:label path="boarddate">작성날짜</form:label>
										<form:input path="boarddate" class="form-control" readonly="true"/>
									</div>
									<div class="form-group">
										<form:label path="title">제목</form:label>
										<form:input path="title" class="form-control"/>
										<form:errors path="title" style ="color:red"/>
									</div>
									<div class="form-group">
										<form:label path="text">내용</form:label>
										<form:textarea path="text" class="form-control" rows="10" style="resize:none"/>
										<form:errors path="text" style ="color:red"/>								
									</div>
									<div class="form-group">
										<form:label path="content_file">첨부 이미지</form:label>
										<c:if test="${modifyContentBean.content_file != null}">
										<img src="${root }upload/${modifyContentBean.content_file}" width="100%"/>
										<form:hidden path="content_file"/>
										</c:if>	
										<form:input type="file" path="upload_file" class="form-control" accept="image/*"/>					
									</div>
									<div class="form-group">
										<div class="text-right">
											<form:button type="submit" class="btn btn-primary">수정완료</form:button>
											<a href="${root }board/read?board_idx=${board_idx}&page=${page}" class="btn btn-info">취소</a>
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
