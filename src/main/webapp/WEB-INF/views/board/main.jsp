<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>
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
   overflow: auto;
}
</style>
</head>
<body>

	<c:import url="/WEB-INF/views/academy/base.jsp"/>
	
	<section class ="sec">
		<div class ="contents">
			<!-- 게시글 리스트 -->
			<div class="container" style="margin-top:4%; ">
				<div class="card shadow">
					<div class="card-body">
						<h4 class="card-title">공지사항</h4>
						<table class="table table-hover" id='board_list'>
							<thead>
								<tr>
									<th class="text-center d-none d-md-table-cell">글번호</th>
									<th class="w-50">제목</th>
									<th class="text-center d-none d-md-table-cell">작성자</th>
									<th class="text-center d-none d-md-table-cell">작성날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="obj" items="${contentList }">
									<tr>
										<td class="text-center d-none d-md-table-cell">${obj.board_idx}</td>
										<td><a href='${root }board/read?board_idx=${obj.board_idx}&page=${page}' style="text-decoration: none; color: inherit;">${obj.title}</a></td>
										<td class="text-center d-none d-md-table-cell">${obj.w_name}</td>
										<td class="text-center d-none d-md-table-cell">${obj.boarddate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<div class="d-none d-md-block">
							<ul class="pagination justify-content-center">
								<c:choose>
									<c:when test="${pageBean.prevPage <= 0 }">
									<!-- 이전 페이지 1 이하면 비활성화 -->
										<li class="page-item disabled">
											<a href="#" class="page-link">이전</a>
										</li>
									</c:when>
									
									<c:otherwise>
										<li class="page-item">
											<a href="${root }board/main?page=${pageBean.prevPage}" class="page-link">이전</a>
										</li>
									</c:otherwise>
								</c:choose>
								
								<!-- 숫자 -->
								<c:forEach var = "idx" begin="${pageBean.min }" end="${pageBean.max }">
									<c:choose>
										<c:when test="${idx == pageBean.currentPage }">
											<li class = "page-item active">
												<a href="${root }board/main?page=${idx}" class="page-link">${idx }</a>
											</li>
										</c:when>
										
										<c:otherwise>
											<li class = "page-item">
												<a href="${root }board/main?page=${idx}" class="page-link">${idx }</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
										
								<c:choose>
									<c:when test="${pageBean.max >= pageBean.pageCnt}">						
										<li class="page-item disabled">
											<a href="#" class="page-link">다음</a>
										</li>
									</c:when>
		
									<c:otherwise>
										<li class="page-item">
											<a href="${root }board/main?page=${pageBean.nextPage}" class="page-link">다음</a>
										</li>							
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
						
		
						<c:if test="${r_ID == 1 }">
							<div class="text-right">
								<a href="${root }board/write" class="btn btn-primary">글쓰기</a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>






