<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용자 등록</title>
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
		height: 92%;
	}
	
	table {
		table-layout: fixed;
		margin-top: 3%;
		margin-left: 7%;
		width: 87%;
		height: 60%;
		border-collapse: collapse;
		border: 2.5px solid #168;
	}
	
	td {
		width: 40%;
		padding: 10px;
		border: 0.5px solid #168;
		color: #168;
		text-align: center;
		vertical-align: middle;
	}
	
	td img {
		align-self: center;
		width: 80%;
		height: 100%;
	}
	
	label {
		font-weight: bold;
	}
	
	.form-control {
		display: block;
		width: 80%;
		padding: .375rem .75rem;
		font-size: 1rem;
		line-height: 1.5;
		color: #495057;
		background-color: #fff;
		background-clip: padding-box;
		border: 1px solid #ced4da;
		border-radius: .25rem;
		transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	}
	
	.btn {
		display: inline-block;
		font-weight: 400;
		color: #fff;
		text-align: center;
		vertical-align: middle;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
		background-color: #007bff;
		border: 1px solid #007bff;
		padding: .375rem .75rem;
		font-size: 1rem;
		line-height: 1.5;
		border-radius: .25rem;
		transition: color .15s ease-in-out, background-color .15s ease-in-out,
			border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	}
	
	.btn-primary {
		background-color: #007bff;
		border-color: #007bff;
	}
	
	.btn-primary:hover {
		background-color: #0069d9;
		border-color: #0062cc;
	}
	
	.btn-primary:focus, .btn-primary.focus {
		box-shadow: 0 0 0 .2rem rgba(38, 143, 255, .5);
	}
	
	.btn-primary:active, .btn-primary.active {
		background-color: #0062cc;
		border-color: #005cbf;
	}
</style>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
			document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview').src = "";
		}
	}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/academy/base.jsp"/>
		<section class="sec">
			<div class = "contents">
				<form:form action="${root }admin/addMember_Pro" method="post" modelAttribute="joinMemberBean" enctype="multipart/form-data">
					
					<form:input type = "hidden" path="r_ID" value = "${r_ID2 }"/>
					<form:input type = "hidden" path="first_login" value = "false"/>
					
					<table>
						<tr>
							<td colspan="2" rowspan="3">
								<img id="preview" style="padding: 5%" src="${root }images/defaultProfile.png"/>
								<form:label path="upload_file"></form:label>
								<form:input type ="file" path="upload_file" class="form-control" accept ="image/*" onchange="readURL(this);"/>						
							</td>
							<td>
								<form:label path="ID">학번/교직원번호</form:label>
							</td>
							<td>
								<form:input path="ID" class="form-control"/>
							</td>
							<td>
								<form:label path="name">이름</form:label>
							</td>
							<td>
								<form:input path="name" class="form-control"/>
							</td>
						</tr>
						
						<tr>
							<c:if test="${r_ID2 == 2 or r_ID2 == 3 }">
								<td>
									<form:label path="d_ID">학과</form:label>
								</td>
								<td>
									<form:select path="d_ID">
										<form:option value="110">가족복지학과</form:option>
										<form:option value="120">행정학과</form:option>
										<form:option value="210">컴퓨터공학과</form:option>
										<form:option value="220">생명공학과</form:option>
										<form:option value="310">무용예술학과</form:option>
									</form:select>
									
								</td>
							</c:if>
							<td>
								<form:label path="password">비밀번호</form:label>
							</td>
							<td>
								<form:password path="password" class="form-control"/>
								<form:errors path="password" style="color:red"/>
							</td>
						</tr>
						<tr>
							<c:if test="${r_ID2 == 3 }">
								<td>
									<form:label path="grade">학년</form:label>
								</td>
								<td>
									<form:select path="grade">
										<form:option value="1">1</form:option>
										<form:option value="2">2</form:option>
										<form:option value="3">3</form:option>
										<form:option value="4">4</form:option>
									</form:select>
									<b>학년</b>
								</td>
								<td>
									<form:label path="s_semester">이수학기</form:label>
							
								</td>
								<td>
									<form:select path = "s_semester">
										<form:option value="1">1</form:option>
										<form:option value="2">2</form:option>
										<form:option value="3">3</form:option>
										<form:option value="4">4</form:option>
										<form:option value="5">5</form:option>
										<form:option value="6">6</form:option>
										<form:option value="7">7</form:option>
										
									</form:select>
									<b>학기</b>
								</td>
							</c:if>
						</tr>
						<tr>
							<td>
								<form:label path="birth">생년월일</form:label>
							</td>
							<td colspan="2">
								<form:input path="birth" class="form-control"/>							
							</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<td>
								<form:label path="address">주소</form:label>
							</td>
							<td colspan="2">
								<form:input path="address" class="form-control"/>
								<form:errors path="address" style="color:red"/>
							</td>
							<td>
								<form:label path="email">이메일</form:label>
							</td>
							<td colspan="2">
								<form:input path="email" class="form-control" />
								<form:errors path="email" style="color:red"/>															
							</td>
						</tr>
						<tr>
							<td>
								<form:label path="phone">전화번호</form:label>
							</td>
							<td colspan="2">
								<form:input path="phone" class="form-control"/>
								<form:errors path="phone" style="color:red"/>
							</td>
							<td>
								<form:label path="emergency">비상연락처</form:label>
							</td>
							<td colspan="2">
								<form:input path="emergency" class="form-control"/>
								<form:errors path="emergency" style="color:red"/>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<form:button class="btn btn-primary">이용자 추가</form:button>
							</td>							
						</tr>
					</table>
<%-- 					<div class="form-group">
						<form:label path="upload_file">사진</form:label>
						<form:input type ="file" path="upload_file" class="form-control" accept ="image/*"/>
					</div>
					<div class="form-group">
						<form:label path="ID">학번/교직원번호</form:label>
						<form:input path="ID" class="form-control"/>
					</div>
					<div class="form-group">
						<form:label path="name">이름</form:label>
						<form:input path="name" class="form-control"/>
					</div>
					<c:if test="${r_ID2 == 2 or r_ID2 == 3 }">
						<div class="form-group">
							<form:label path="d_ID">학과</form:label>
							<form:select path="d_ID">
								<form:option value="110">가족복지학과</form:option>
								<form:option value="120">행정학과</form:option>
								<form:option value="210">컴퓨터공학과</form:option>
								<form:option value="220">생명공학과</form:option>
								<form:option value="310">무용예술학과</form:option>
							</form:select>
						</div>
					</c:if>
					<c:if test="${r_ID2 == 3 }">
						<div class="form-group">
							<form:label path="grade">학년</form:label>
							<form:select path="grade">
								<form:option value="1">1학년</form:option>
								<form:option value="2">2학년</form:option>
								<form:option value="3">3학년</form:option>
								<form:option value="4">4학년</form:option>
							</form:select>
						</div>
						
						<div class="form-group">
							<form:label path="s_semester">이수학기</form:label>
							<form:select path = "s_semester">
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
								<form:option value="4">4</form:option>
								<form:option value="5">5</form:option>
								<form:option value="6">6</form:option>
								<form:option value="7">7</form:option>
								<form:option value="8">8</form:option>
							</form:select>
						</div>
					</c:if>

					<div class="form-group">
						<form:label path="password">비밀번호</form:label>
						<form:password path="password" class="form-control"/>
						<form:errors path="password" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="birth">생년월일</form:label>
						<form:input path="birth" class="form-control"/>
					</div>
					<div class="form-group">
						<form:label path="phone">전화번호</form:label>
						<form:input path="phone" class="form-control"/>
						<form:errors path="phone" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="emergency">비상연락처</form:label>
						<form:input path="emergency" class="form-control"/>
						<form:errors path="emergency" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="address">주소</form:label>
						<form:input path="address" class="form-control"/>
						<form:errors path="address" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="email">이메일</form:label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="entrance">등록일자</form:label>
						<form:input path="entrance" class="form-control"/>
					</div>
					<div class="form-group">
						<div class="text-right">
							<form:button class="btn btn-primary">이용자 추가</form:button>
						</div>
					</div> --%>
				</form:form>
			</div>
		</section>

</body>
</html>