<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class ="contents">
			<div class="container" style="margin-top:100px">
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<div class="card shadow">
							<div class="card-body">
								<div class="form-group">
									<label for="w_name">작성자</label>
									<input type="text" id="w_name" name="w_name" class="form-control" value="${readContentBean.w_name} " disabled="disabled"/>
								</div>
								<div class="form-group">
									<label for="content_date">작성날짜</label>
									<input type="text" id="boarddate" name="boarddate" class="form-control" value="${readContentBean.boarddate }" disabled="disabled"/>
								</div>
								<div class="form-group">
									<label for="title">제목</label>
									<input type="text" id="title" name="title" class="form-control" value="${readContentBean.title }" disabled="disabled"/>
								</div>
								<div class="form-group">
									<label for="text">내용</label>
									<textarea id="text" name="text" class="form-control" rows="10" style="resize:none" disabled="disabled">${readContentBean.text }</textarea>
								</div>
								<div class="form-group">
									<label for="content_file">첨부 이미지</label>
									<img src="${root }upload/${readContentBean.content_file}" width="100%"/>						
								</div>
								<div class="form-group">
									<div class="text-right">
										<a href="${root }board/main?page=${page}" class="btn btn-primary">목록보기</a>
										<c:if test="${readContentBean.w_ID == loginMemberBean.ID}"> <!-- 로그인 한 사람만 볼 수 있음 -->
											<a href="${root }board/modify?board_idx=${board_idx}&page=${page}" class="btn btn-info">수정하기</a>
											<a href="${root }board/delete?board_idx=${board_idx}" class="btn btn-danger">삭제하기</a>
										</c:if>
									</div>
								</div>
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
