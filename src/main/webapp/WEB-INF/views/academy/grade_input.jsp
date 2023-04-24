<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<title>성적 입력</title>
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
.gradeinput-info{
	display: flex;
	align-items: center;
	justify-content: flex-start;
	padding: 10px;
	border: none;
}

.gradeinput-info>div {
	flex: 1;
	text-align: center;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
}
.gradeinput-info input[type="button"] {
      width: 100%;
      height: 100%;
      margin: 0;
      padding: 0;
    }
.gradeinput-info>div:first-child {
	border-left: none;
	font

}

.gradeinput-info>div:last-child {
	border-right: none;
}
.gradeinput-info > div.attendance,
.gradeinput-info > div.midterm,
.gradeinput-info > div.final,
.gradeinput-info > div.save,
.gradeinput-info > div.assignment {
  display: inline-flex;
  flex-wrap: nowrap;
  align-items: center;
   justify-content: center;
  
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
	
	<section class="sec">
		<div class = "contents">
	
			<!-- 강의선택  -->
			<div style="text-align:left; font-size: 18px; padding: 5px; ">강의 선택</div>
			<div class="lec-sel" style=" font-weight:bold">
				<div class="lec-id" >학수번호</div>
				<div class="lec-name" >과목명</div>
				<div class="lec-type" >이수구분</div>
				<div class="lec-grade" >학년</div>
				<div class="lec-credit" >학점</div>
				<div class="lec-class"  >강의실</div>
				<div class="lec-number"  >수강인원</div>
				<div class="lec-day" >요일</div>
				<div class="lec-time" >시간</div>
				<div >비고</div>
			</div>
			<div class="lec-sel2">
				<div class="lec-id" >aaaaaaa</div>
				<div class="lec-name" >aaaaaa</div>
				<div class="lec-type" >전공</div>
				<div class="lec-grade" >1</div>
				<div class="lec-credit" >3</div>
				<div class="lec-class"  >A101</div>
				<div class="lec-number"  >70</div>
				<div class="lec-day" >월</div>
				<div class="lec-time" >09:00 ~ 12:00</div>
				<div ><input type="button" value="선택" /></div>
			</div>
			<div class="lec-sel2">
				<div class="lec-id" >BBBBBBB</div>
				<div class="lec-name" >BBBBBBB</div>
				<div class="lec-type" >전공</div>
				<div class="lec-grade" >2</div>
				<div class="lec-credit" >3</div>
				<div class="lec-class"  >A301</div>
				<div class="lec-number"  >60</div>
				<div class="lec-day" >수</div>
				<div class="lec-time" >13:00 ~ 16:00</div>
				<div ><input type="button" value="선택" /></div>
			</div>
			<hr />
			<div style="float:right"><input type="button" value="입력하기" onclick="inputg()"/></div>
			<p></p>
			<!-- 과목정보  -->
			<section id="inputg" style="display:none">
			 <div style="text-align:left; font-size: 18px; padding: 5px; ">과목 정보</div>
			<div class="lecture-info">
				<div class="name-label" style="font-weight:bold">과목명</div>
				<div class="name-value">JAVA</div>
				<div class="lecture-id-label" style=" font-weight:bold">학수번호</div>
				<div class="lecture-id-value">HALF0104</div>
			</div>
		
			<div class="lecture-info">
				<div class="class-label" style="font-weight: bold">강의실</div>
				<div class="class-value">B102</div>
				<div class="day-label" style="font-weight: bold">요일</div>
				<div class="day-value">수</div>
				<div class="time-label" style="font-weight: bold">시간</div>
				<div class="time-value">09:00 ~ 12:00</div>
			</div>
			<!-- 성적 입력 매뉴얼 -->
			<div style="text-align: left; font-size: 18px; padding: 5px;">
				<div>성적입력 매뉴얼</div>
				<div style="margin-top:5px">
					<textarea class="textarea" readonly="readonly" style="width:100%; height:110px; text-align:left; resize:none; background: #ffffdd;" > 
		${guide }</textarea>
				</div>
			</div>
				<!-- 개별성적입력 -->
				<div
					style="text-align: left; font-size: 18px; padding: 5px; display: flex; justify-content: space-between;">
					<div>성적입력</div>
					<div style="display: flex; align-items: center;">
						<div style="font-size: 14px; margin-right: 5px;">이름으로 검색</div>
						<div>
							<input type="text" name="sname" style="width: 60px" />
						</div>
						<div>
							<input type="button" name="sname-click" style="width: 40px"
								value="찾기" />
						</div>
					</div>
				</div>
				<div class="gradeinput-info" style="font-weight: bold">
					<div class="std-id">
						<input type="button" value="학번" style="width: 100%; height: 100%;" />
					</div>
					<div class="std-name">
						<input type="button" value="이름" />
					</div>
					<div class="major">
						<input type="button" value="학과" />
					</div>
					<div class="std-grade">
						<input type="button" value="학년" />
					</div>
					<div class="attendance">
						<input type="button" value="출석" />
					</div>
					<div class="midterm">
						<input type="button" value="중간점수" />
					</div>
					<div class="final">
						<input type="button" value="기말점수" />
					</div>
					<div class="assignment">
						<input type="button" value="과제점수" />
					</div>
					<div class="grade">
						<input type="button" value="등급" />
					</div>
					<div class="rank">
						<input type="button" value="순위" />
					</div>
					<div class="save"></div>
				</div>
				<div class="gradeinput-info">
					<div class="std-id">2023211001</div>
					<div class="std-name">박창훈</div>
					<div class="major">컴퓨터공학</div>
					<div class="std-grade">1</div>
					<div class="attendance">
						<input type="text" name="attd_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="midterm">
						<input type="text" name="mexam_score" style="width: 20px" />
						<div style="color: gray">/100</div>
					</div>
					<div class="final">
						<input type="text" name="fexam_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="assignment">
						<input type="text" name="assi_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="grade">A+</div>
					<div class="Rank">1</div>
					<div class="save">
						<input type="button" value="수정" /> <input type="button" value="저장" />
					</div>
				</div>
				<div class="gradeinput-info">
					<div class="std-id">2023211002</div>
					<div class="std-name">장준근</div>
					<div class="major">컴퓨터공학</div>
					<div class="std-grade">1</div>
					<div class="attendance">
						<input type="text" name="attd_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="midterm">
						<input type="text" name="mexam_score" style="width: 20px" />
						<div style="color: gray">/100</div>
					</div>
					<div class="final">
						<input type="text" name="fexam_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="assignment">
						<input type="text" name="assi_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="grade">A+</div>
					<div class="Rank">3</div>
					<div class="save">
						<input type="button" value="수정" /> <input type="button" value="저장" />
					</div>
				</div>
				<div class="gradeinput-info">
					<div class="std-id">2023211003</div>
					<div class="std-name">윤영훈</div>
					<div class="major">컴퓨터공학</div>
					<div class="std-grade">1</div>
					<div class="attendance">
						<input type="text" name="attd_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="midterm">
						<input type="text" name="mexam_score" style="width: 20px" />
						<div style="color: gray">/100</div>
					</div>
					<div class="final">
						<input type="text" name="fexam_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="assignment">
						<input type="text" name="assi_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="grade">A+</div>
					<div class="Rank">3</div>
					<div class="save">
						<input type="button" value="수정" /> <input type="button" value="저장" />
					</div>
				</div>
				<div class="gradeinput-info">
					<div class="std-id">2022211001</div>
					<div class="std-name">김찬희</div>
					<div class="major">컴퓨터공학</div>
					<div class="std-grade">2</div>
					<div class="attendance">
						<input type="text" name="attd_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="midterm">
						<input type="text" name="mexam_score" style="width: 20px" />
						<div style="color: gray">/100</div>
					</div>
					<div class="final">
						<input type="text" name="fexam_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="assignment">
						<input type="text" name="assi_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="grade">A+</div>
					<div class="Rank">2</div>
					<div class="save">
						<input type="button" value="수정" /> <input type="button" value="저장" />
					</div>
				</div>
				<div class="gradeinput-info">
					<div class="std-id">2021211001</div>
					<div class="std-name">신진혁</div>
					<div class="major">컴퓨터공학</div>
					<div class="std-grade">3</div>
					<div class="attendance">
						<input type="text" name="attd_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="midterm">
						<input type="text" name="mexam_score" style="width: 20px" />
						<div style="color: gray">/100</div>
					</div>
					<div class="final">
						<input type="text" name="fexam_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="assignment">
						<input type="text" name="assi_score" style="width: 20px"
							disabled="disabled" />
						<div style="color: gray">/100</div>
					</div>
					<div class="grade">C+</div>
					<div class="Rank">5</div>
					<div class="save">
						<input type="button" value="수정" /> <input type="button" value="저장" />
					</div>
				</div>
				<hr />
				<div class="save"
					style="display: flex; justify-content: flex-end; align-items: flex-end;">
					<input type="button" value="초기화" /> <input type="button" value="저장하기" />
				</div>
			</section>
		</div>
	</section>
</body>
</html>


