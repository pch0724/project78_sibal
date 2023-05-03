<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한구분 선택</title>
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
      height: 97%;
      overflow: hidden;
   }
	table {
		table-layout: fixed;
		margin-top: 8%;
		margin-left: 7%;
		margin-bottom: 10%;
		width: 87%;
		height: 60%;
		border-collapse: collapse;
		border: hidden;
	}
	
	td {
		width: 40%;
		padding: 10px;
		border: none;
		color: #688ABA;
		text-align: center;
		vertical-align: middle;
	}
	.btn{
		background-color: white;
		border: 1px solid #688ABA;
		border-color: #688ABA;
		border-radius: 10px;
		margin: 3% 3%;
		padding: 10% 13%;
	}
	img{
		width : 100%;
		height: 100%;
	}
	/* .btn {
		display: inline-block;
		font-weight: 400;
		width: 30%;
		height: 30%;
		color: #fff;
		text-align: center;
		vertical-align: middle;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
		background-color: #007bff;
		border: 1px solid #007bff;
		padding: 35% 35%;
		font-size: 20px;
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
	*/
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/academy/base.jsp"/>
	<section class='sec'>
		<div class='contents'>
			
			<table>
				<tr>
					<td colspan="3" style="font-size: 35px; height: 20%; border-bottom: 1px solid #168;"><b>권한구분</b></td>
		
				</tr>
				<tr>
					<td>
						<form action='${root}admin/addMember' method='post'>
							<input type='hidden' name='r_ID' value='1' /> <!-- 기본값 1 : 관리자 -->
							<button type='submit' class='btn'><img src="${root }images/admin.png"/></button>
						</form>
					</td>
					<td>
						<form action='${root}admin/addMember' method='post'>
							<input type='hidden' name='r_ID' value='2' />
							<button type='submit' class='btn'><img src="${root }images/professor.png"/></button>
						</form>
					</td>
					<td>
						<form action='${root}admin/addMember' method='post'>
							<input type='hidden' name='r_ID' value='3' />
							<button type='submit' class='btn'><img src="${root }images/student.png"/></button>
						</form>					
					</td>
				</tr>
			</table>
			
			<%-- 
			<span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;"><b>권한구분</b></span>
			<hr />
			<div>
			<form action='${root}admin/addMember' method='post'>
				<input type='hidden' name='r_ID' value='1' /> <!-- 기본값 1 : 관리자 -->
				<button type='submit' class='btn'>관리자</button>
			</form>
			
			<form action='${root}admin/addMember' method='post'>
				<input type='hidden' name='r_ID' value='2' />
				<button type='submit' class='btn'>교수</button>
			</form>
			
			<form action='${root}admin/addMember' method='post'>
				<input type='hidden' name='r_ID' value='3' />
				<button type='submit' class='btn'>학생</button>
			</form>
			</div>
			 --%>
		</div>
	</section>
</body>
</html>