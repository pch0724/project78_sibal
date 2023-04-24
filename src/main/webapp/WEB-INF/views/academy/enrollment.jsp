<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청현황</title>
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
		.all{
		border: 1px solid black;
		padding-left: 5px;
		padding-top: 5px;
		margin-bottom: 10px;
	}
	.navbar{
		display: flex;
		float: right;
		
	}
	.navbar2{
		
		padding-top: 10px;
		
	}
	
	ul{
	list-style: none;
	padding-left: 2px;
	}
	.a1{
		display: flex;
		
	}
	.a2{
		display: flex;
	 
	}

	.a3{
		display: flex;
		
	}
	.b{
		display: flex;

		
	}
	.b1{
		width: 100%;
		text-align: center;
	}
	
	.b2{
		display: flex;
		
	}
	.b2 div{
		border: 1px solid black;
		
	}
	.nemo{
		width: 7px;
		height: 20px;
		background-color: skyblue;
		border: 1px solid skyblue;
	}
	.c{
		width: 100%;
		height: 20%;
		text-align: center;
		border: 1px solid black;
	}
	/* css 추가 바람 */
</style>
</head>
<body>
	
	<c:import url="/WEB-INF/views/academy/base.jsp"/>
	
	<section class="sec">
		<div class = "contents">
		<!-- .contents 안에 html 추가 바람 -->
			<nav class="all">
			    <button onclick="">조회</button>
			    <div class="navbar">
			        <div class="a1">
			            <div>조회되었습니다.</div>
			            <div style="padding-left:20px;"><button onclick="">X</button></div>
			        </div>
			    </div>
			    <div class="navbar2">
			        <div class="a2">
			            <div style="padding: 0;">학번/성명</div>
			            <div style="padding: 0 5px;"><input type="text" /></div>
			            <div style="padding: 0px 5px;"><input type="text" /></div>
			            <div style="padding-left:120px;">학년도</div>
			            <div style="padding: 0 5px;"><input type="text" /></div>
			            <div style="padding-left:120px;">학기</div>
			            <div style="padding: 0 5px;"><input type="text" /></div>
			        </div>
			    </div>
			</nav>
		<button onclick="" style="float: right;">강의시간표</button>
		<div class="d1">
		    <div class="a3">
		   		<div class="nemo"></div>
		        <div>&nbsp;수강신청목록</div>
		    </div>
		</div>
		<p/><p/>
		<div class="b">
		    <div class="b1" style="border: 1px solid black;">
		        <div class="b2" style="background-color: skyblue; display: flex;">
		            <div style="width: 5%;">no</div>
		            <div style="width: 15%;">학수번호</div>
		            <div style="width: 23%;">교과목명</div>
		            <div style="width: 10%;">이수구분</div>
		            <div style="width: 7%;">학점</div>
		            <div style="width: 10%;">재수강 구분</div>
		            <div style="width: 10%;">강의시간</div>
		            <div style="width: 10%;">담당교수</div>
		            <div style="width: 10%;">수업계획서</div>
		        </div>
		        <div class="b2" style="display: flex; ">
		            <div class="no1" style="width: 5%;">1</div>
		            <div class="haksu1" style="width: 15%;">HALF0104</div>
		            <div class="lecname1" style="width: 23%;">정보조사와보고서작성</div>
		            <div class="isu1" style="width: 10%;">교양</div>
		            <div class="credits1" style="width: 7%;">3</div>
		            <div class="jesugang1" style="width: 10%;">관련없음</div>
		            <div class="time1" style="width: 10%;">금 6,7,8</div>
		            <div class="proname1" style="width: 10%;">박용식</div>
		            <div class="johwoi1" style="width: 10%;"><button onclick="">조회</button></div>
		        </div>
		        <div class="b2" style="display: flex; ">
		            <div class="no2" style="width: 5%;"></div>
		            <div class="haksu2" style="width: 15%;"></div>
		            <div class="lecname2" style="width: 23%;"></div>
		            <div class="isu2" style="width: 10%;"></div>
		            <div class="credits2" style="width: 7%;"></div>
		            <div class="jesugang2" style="width: 10%;"></div>
		            <div class="time2" style="width: 10%;"></div>
		            <div class="proname2" style="width: 10%;"></div>
		            <div class="johwoi2" style="width: 10%;"><button onclick="">조회</button></div>
		        </div>
		        <div class="b2" style="display: flex; ">
		            <div class="no3" style="width: 5%;"></div>
		            <div class="haksu3" style="width: 15%;"></div>
		            <div class="lecname3" style="width: 23%;"></div>
		            <div class="isu3" style="width: 10%;"></div>
		            <div class="credits3" style="width: 7%;"></div>
		            <div class="jesugang3" style="width: 10%;"></div>
		            <div class="time3" style="width: 10%;"></div>
		            <div class="proname3" style="width: 10%;"></div>
		            <div class="johwoi3" style="width: 10%;"><button onclick="">조회</button></div>
		        </div>
		        <div class="b2" style="display: flex; ">
		            <div class="no4" style="width: 5%;"></div>
		            <div class="haksu4" style="width: 15%;"></div>
		            <div class="lecname4" style="width: 23%;"></div>
		            <div class="isu4" style="width: 10%;"></div>
		            <div class="credits4" style="width: 7%;"></div>
		            <div class="jesugang4" style="width: 10%;"></div>
		            <div class="time4" style="width: 10%;"></div>
		            <div class="proname4" style="width: 10%;"></div>
		            <div class="johwoi4" style="width: 10%;"><button onclick="">조회</button></div>
		        </div>
		        <div class="b2" style="display: flex; ">
		            <div class="no5" style="width: 5%;"></div>
		            <div class="haksu5" style="width: 15%;"></div>
		            <div class="lecname5" style="width: 23%;"></div>
		            <div class="isu5" style="width: 10%;"></div>
		            <div class="credits5" style="width: 7%;"></div>
		            <div class="jesugang5" style="width: 10%;"></div>
		            <div class="time5" style="width: 10%;"></div>
		            <div class="proname5" style="width: 10%;"></div>
		            <div class="johwoi5" style="width: 10%;"><button onclick="">조회</button></div>
		        </div>
		    </div>
		</div>
		
		<div class="d1" style="padding-top:1%;">
		    <div class="a3">
		   		<div class="nemo"></div>
		        <div>&nbsp;교과목 해설서</div>
		    </div>
		</div>	
		<p/><p/>
		<div class="c">
			<pre></pre>
		</div>
		<div class="d1" style="padding-top:1%;">
		    <div class="a3">
		   		<div class="nemo"></div>
		        <div>&nbsp;담당교수 연락처 정보</div>
		    </div>
		</div>
		
			<div class="b1" style="border: 1px solid black;">
		        <div class="b2" style="background-color: skyblue; display: flex;">
		            <div style="width: 7%;">no</div>
		            <div style="width: 25%;">소속</div>
		            <div style="width: 10%;">성명</div>
		            <div style="width: 21%;">전화번호</div>
		            <div style="width: 27%;">Email</div>
		            <div style="width: 10%;">수업계획서</div>
		        </div>
		        <div class="b2" style="display: flex;">
		            <div class="prof_no1" style="width: 7%;">1</div>
		            <div class="prof_dept1" style="width: 25%;">가족복지학과</div>
		            <div class="prof_name1" style="width: 10%;">한영록</div>
		            <div class="prof_tel1" style="width: 21%;">010-2222-5438</div>
		            <div class="prof_email1" style="width: 27%;">hanyoungrok@gmail.com</div>
		            <div class="prof_button1" style="width: 10%;"><button onclick="">조회</button></div>
		        </div>
		        <div class="b2" style="display: flex;">
		            <div class="prof_no2" style="width: 7%;"></div>
		            <div class="prof_dept2" style="width: 25%;"></div>
		            <div class="prof_name2" style="width: 10%;"></div>
		            <div class="prof_tel2" style="width: 21%;"></div>
		            <div class="prof_email2" style="width: 27%;"></div>
		            <div class="prof_button2" style="width: 10%;"><button onclick="">조회</button></div>
		        </div>
		        <div class="b2" style="display: flex;">
		            <div class="prof_no3" style="width: 7%;"></div>
		            <div class="prof_dept3" style="width: 25%;"></div>
		            <div class="prof_name3" style="width: 10%;"></div>
		            <div class="prof_tel3" style="width: 21%;"></div>
		            <div class="prof_email3" style="width: 27%;"></div>
		            <div class="prof_button3" style="width: 10%;"><button onclick="">조회</button></div>
		        </div>
		       
		    </div>
		</div>
	</section>

</body>
</html>