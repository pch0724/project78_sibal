<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<title>기말 강의평가 조회</title>
<style>
/*강의 선택*/
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
.lec-sel {
  display: flex; /* Flexbox 레이아웃 적용 */
   flex-wrap: nowrap;
  align-items: center; /* 내부 요소들을 수직 가운데 정렬 */
  
}
.lec-sel2 {
  display: flex; /* Flexbox 레이아웃 적용 */
   flex-wrap: nowrap;
  align-items: center; /* 내부 요소들을 수직 가운데 정렬 */
  }
.lec-sel > div {
  flex-basis: 0;
  flex-grow: 1;
  text-align: center;
  border-right : 2px solid #44f;
  padding: 10px;
  height: 10px;
}
.lec-sel2 > div {
 flex-basis: 0;
  flex-grow: 1;
  text-align: center;
  border-right : 1px solid #ccc;
  padding: 5px;
 
  }
/* 교수정보 css  */
.lecture-info  {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  padding: 10px;
  border: none;
}
.lecture-info > div {
  text-align: left;
  padding: 0 10px;
  border-right: 2px solid #4444ff;
}
.lecture-id-value {
  border-right: none;
}
/* 성적입력 css  */
.eval_check{
	display: flex;
	align-items: center;
	justify-content: flex-start;
	padding: 10px;
	border: none;
}
.eval_check>div {
	flex: 1;
	text-align: center;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
}
    }
.eval_check>div:first-child {
	border-left: none;
	font
}
.eval_check>div:last-child {
	border-right: none;
}
.eval_check > div.eval_choice {
  display: inline-flex;
  flex-wrap: nowrap;
  align-items: center;
   justify-content: center;
  
}
.eval_num{
	witdh : 120px;
}
.eval_check1 {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 10px;
    }
    
    .eval_num {
        width: 120px;
        text-align: center;
    }
    
    .eval_q {
        flex-grow: 1;
        text-align: left;
    }
</style>
<script>
 function inputg() {
	 var section = document.getElementById("inputg");
	 if(section.style.display=="none"){
		 section.style.display="block";
	 }else{
		 section.style.dispaly="none";
	 }
 }
 
</script>
</head>
<body>

	<c:import url="/WEB-INF/views/academy/base.jsp"/>
	<!-- 
	 -->
	<section class="sec">
	
		<div class = "contents">
			<!-- 강의선택  -->
			<div style="text-align: left; font-size: 18px; padding: 5px;">강의
				선택</div>
			<div class="lec-sel" style="font-weight: bold">
				<div class="lec-id">학수번호</div>
				<div class="lec-name">과목명</div>
				<div class="lec-type">이수구분</div>
				<div class="lec-grade">학년</div>
				<div class="lec-credit">학점</div>
				<div class="lec-class">강의실</div>
				<div class="lec-number">수강인원</div>
				<div class="lec-day">요일</div>
				<div class="lec-time">시간</div>
				<div>비고</div>
			</div>
			<c:forEach var = "i" begin="0" end="${size }">
				<div class="lec-sel2">
						<div class="lec-id">${list.get(i).lec_ID }</div>
						<div class="lec-name">${list.get(i).lec_name }</div>
						<div class="lec-type">${list.get(i).completion }</div>
						<div class="lec-grade">${list.get(i).grade }</div>
						<div class="lec-credit">${list.get(i).credits }</div>
						<div class="lec-class">${list.get(i).c_ID }</div>
						<div class="lec-number">${list.get(i).capacity }</div>
						<div class="lec-day">${list.get(i).day }</div>
						<div class="lec-time">${list.get(i).starttime }교시 ~ ${list.get(i).endtime }교시</div>
						<div>
							<input type="button" value="선택" onclick="inputg()"/>
						</div>
				</div>
			</c:forEach>
			<hr />
			<p></p>
			<!-- 과목정보  -->
			<section id="inputg" style="display: none">
			
				<div style="text-align: left; font-size: 18px; padding: 5px;">과목정보</div>
				<div class="lecture-info">
					<div class="name-label" style="font-weight: bold">과목명</div>
					<div class="name-value">${obj.lec_name }</div>
					<div class="lecture-id-label" style="font-weight: bold">학수번호</div>
					<div class="lecture-id-value">${obj.lec_ID }</div>
				</div>
		
				<div class="lecture-info">
					<div class="class-label" style="font-weight: bold">강의실</div>
					<div class="class-value">B102</div>
					<div class="day-label" style="font-weight: bold">요일</div>
					<div class="day-value">수</div>
					<div class="time-label" style="font-weight: bold">시간</div>
					<div class="time-value">09:00 ~ 12:00</div>
				</div>
				
				<!-- 강의평가내용 -->
				<div
					style="text-align: left; font-size: 18px; padding: 5px; display: flex; justify-content: space-between;">
					<div>강의평가 내용</div>
					
				</div>
				<div class="eval_check1" >
					<div class="eval_num">질문1</div>
					<div class="eval_q">강의 목표와 강의내용이 강좌명과 부합하는가?</div>
				</div>
				<div class="eval_check">
					<div class="eval_choice">선택1</div>
					<div class="eval_choice"></div>
					<div class="eval_choice">선택2</div>
					<div class="eval_choice"></div>
					<div class="eval_choice">선택3</div>
					<div class="eval_choice"></div>
					<div class="eval_choice">선택4</div>
					<div class="eval_choice"></div>
					<div class="eval_choice">선택5</div>
					<div class="eval_choice"></div>
					
				</div>
				<div class="eval_check1" >
					<div class="eval_num">질의2</div>
					<div class="eval_q">과제물의 내용과 양은 적절하였는가?</div>
				</div>
				<div class="eval_check">
					<div class="eval_choice">선택1</div>
					<div class="eval_choice"></div>
					<div class="eval_choice">선택2</div>
					<div class="eval_choice"></div>
					<div class="eval_choice">선택3</div>
					<div class="eval_choice"></div>
					<div class="eval_choice">선택4</div>
					<div class="eval_choice"></div>
					<div class="eval_choice">선택5</div>
					<div class="eval_choice"></div>
					
				</div>
				
				<hr />
				
				<div style="text-align: left; font-size: 18px; padding: 5px;">
					<div>피드백 내용</div>
					<div style="margin-top:5px">
						<textarea class="textarea" readonly="readonly" style="width:100%; height:120px; text-align:left; resize:none; background: #ffffdd;" > 
						${feedback }</textarea>
					</div>
				</div>
			</section>
		</div>
	</section>

</body>
</html>
