<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<script>
$(document).ready(function() {
    $(".submit-btn").each(function() {
        $(this).on("click", function(e) {
            e.preventDefault();

            // data-* 속성에서 데이터 가져오기 대신 closest를 사용
            const lec_Id = $(this).closest("div").find("[data-lec-id]").data("lec-id");
            const std_Id = $(this).closest("div").find("[data-std-id]").data("std-id");

            // 고정된 year와 g_semester 값
            const year = 2022;
            const g_semester = 1;

            // 같은 열에 있는 입력 값 가져오기
        const at_score = $(this).closest(".gradeinput-info").find("input[name='at_score']").val();
            const m_score = $(this).closest(".gradeinput-info").find("input[name='m_score']").val();
            const f_score = $(this).closest(".gradeinput-info").find("input[name='f_score']").val();
            const a_score = $(this).closest(".gradeinput-info").find("input[name='a_score']").val();

            // 가져온 데이터를 사용하여 서버에 요청을 보내거나 처리하는 코드 작성...
            const gradeBean = {
                lec_ID: lec_Id,
                std_ID: parseInt(std_Id),
                year: year,
                g_semester: g_semester,
                at_score: parseInt(at_score),
                m_score: parseInt(m_score),
                f_score: parseInt(f_score),
                a_score: parseInt(a_score),
            };

            console.log(gradeBean);

            $.ajax({
                type: "POST",
                url: "${root }/grade_input.pro",
                contentType: "application/json",
                data: JSON.stringify(gradeBean),
                success: function() {
                    alert("성공적으로 데이터가 업데이트되었습니다.");
                },
                error: function() {
                    alert("데이터 업데이트 중 오류가 발생했습니다.");
                }
            });
        });
    });
});


</script>
<title>성적 입력</title>
<style>
/*강의 선택*/
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

.lec-sel>div {
   flex-basis: 0;
   flex-grow: 1;
   text-align: center;
   border-right: 2px solid #44f;
   padding: 10px;
   height: 10px;
}

.lec-sel2>div {
   flex-basis: 0;
   flex-grow: 1;
   text-align: center;
   border-right: 1px solid #ccc;
   padding: 5px;
}
/* 교수정보 css  */
.lecture-info {
   display: flex;
   align-items: center;
   justify-content: flex-start;
   padding: 10px;
   border: none;
}

.lecture-info>div {
   text-align: left;
   padding: 0 10px;
   border-right: 2px solid #4444ff;
}

.lecture-id-value {
   border-right: none;
}

/* 성적입력 css  */
.gradeinput-info {
   display: flex;
   align-items: center;
   justify-content: flex-start;
   padding: 10px;
   border: none;
   width: 100%;
   box-sizing: border-box;
}

.gradeinput-info>div {
   flex-grow: 1;
   text-align: center;
   border-left: 1px solid #ccc;
   border-right: 1px solid #ccc;
   padding: 5px;
   width: calc(100%/ 9 - 2px);
}

.gradeinput-info>div>div {
   display: inline;
   vertical-align: middle; /* 추가 */
}

.gradeinput-info>div>div>div {
   display: inline;
}

.gradeinput-info>div:first-child {
   border-left: none;
}

.gradeinput-info>div:last-child {
   border-right: none;
}

.overflow-section {
   max-height: 360px;
   overflow-y: auto;
   box-sizing: border-box;
}
</style>
</head>
<body>

   <script>

   function LecSection(i) {
      //하나씩 열리도록 기존에 열려있는 섹션 닫기
    var openSection = document.querySelector(".open");
       if (openSection) {
           openSection.classList.remove("open");
           openSection.style.display = "none";
       }
    var section = document.getElementById("LecSection"+i);
    section.style.display = "block";
    section.classList.add("open");
    var inputs = document.querySelectorAll("#LecSection" + i + " input.input-field");
    inputs.forEach(function (input) {
      input.disabled = true;
      var buttons = document.querySelectorAll("#LecSection" + i + " input[type='button']");
      buttons.forEach(function (button) {
        button.value = "선택";
      });
    });
   

}

</script>

<c:import url="/WEB-INF/views/academy/base.jsp" />

   <section class="sec">
      <div class="contents">

   <!-- 강의선택  -->
         <div style="text-align: left; font-size: 18px; padding: 5px;">강의 선택</div>
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




         <c:forEach var="i" begin="0" end="${size }">
            <div class="lec-sel2">
               <div class="lec-id">${list.get(i).lec_ID }</div>
               <div class="lec-name">${list.get(i).lec_name }</div>
               <div class="lec-type">${list.get(i).completion }</div>
               <div class="lec-grade">${list.get(i).grade }</div>
               <div class="lec-credit">${list.get(i).credits }</div>
               <div class="lec-class">${list.get(i).c_ID }</div>
               <div class="lec-number">${counts[i] }</div>
               <div class="lec-day">${list.get(i).day }</div>
               <div class="lec-time">${list.get(i).starttime }교시~ ${list.get(i).endtime }교시</div>
               <div>
                  <input type="button" value="선택" onclick="LecSection(${i })" />
               </div>
            </div>
         </c:forEach>
         <hr />
         <p></p>

<!-- 과목정보  -->
         <c:forEach var="i" begin="0" end="${size }">
            <section id="LecSection${i }" style="display: none">
               <div style="text-align: left; font-size: 18px; padding: 5px;">과목정보</div>
                  <div class="lecture-info">
                     <div class="name-label" style="font-weight: bold">과목명</div>
                     <div class="name-value">${list.get(i).lec_name }</div>
                     <div class="lecture-id-label" style="font-weight: bold">학수번호</div>
                     <div class="lecture-id-value">${list.get(i).lec_ID }</div>
                  </div>
                  <div class="lecture-info">
                     <div class="class-label" style="font-weight: bold">강의실</div>
                     <div class="class-value">${list.get(i).c_ID }</div>
                     <div class="day-label" style="font-weight: bold">요일</div>
                     <div class="day-value">${list.get(i).day }</div>
                     <div class="time-label" style="font-weight: bold">시간</div>
                     <div class="time-value">${list.get(i).starttime }교시~ ${list.get(i).endtime }교시</div>
                  </div>

<!-- 개별성적보기 -->
                  <div style="text-align: left; font-size: 18px; padding: 5px; display: flex; justify-content: space-between;">
                     <div>성적입력</div>
                  </div>
                  <div class="gradeinput-info" style="font-weight: bold">
                     <div class="std-id">&nbsp;학번&nbsp;</div>
                     <div class="std-name">이름</div>
                     <div class="major">&nbsp;&nbsp;학과&nbsp;&nbsp;</div>
                     <div class="std-grade">학년</div>
                     <div class="attendance">출석</div>
                     <div class="midterm">중간</div>
                     <div class="final">기말</div>
                     <div class="assignment">과제</div>
                     <div class="selection">비고</div>
                  </div>
                  <section class="overflow-section">
                     <input type="hidden" name="lec_ID" value="${list.get(i).lec_ID}" />
                     <input type="hidden" name="year" value="2022" />
                     <input type="hidden" name="g_semester" value="1" />
                     <form:form modelAttribute="grade_input" action="#">
                     
                     <c:forEach var="grade1" items="${stdList[i] }" varStatus="loop">
                        <div class="gradeinput-info"> 
                           <div class="std_ID">${grade1.std_ID }</div>
                           <div class="std-name">${grade1.name }</div>
                           <div class="major">${grade1.d_name }</div>
                           <div class="std-grade">${grade1.grade }</div>
                           <div class="attendance" style="display: inline-block;">
                              <form:input path="at_score"  style="width: 20px" disabled="true" />
                              <div style="color: gray; font-size: 11px;">/20</div>
                           </div>
                           <div class="midterm" style="display: inline-block;">
                              <form:input path="m_score"  style="width: 20px" disabled="true" />
                              <div style="color: gray; font-size: 11px">/30</div>
                           </div>
                           <div class="final" style="display: inline-block;">
                              <form:input path="f_score" style="width: 20px" disabled="true" />
                              <div style="color: gray; font-size: 11px">/30</div>
                           </div>
                           <div class="assignment" style="display: inline-block;">
                              <form:input path="a_score"  style="width: 20px" disabled="true" />
                              <div style="color: gray; font-size: 11px">/20</div>
                           </div>
                           <div class="selection">
                              <div>
                                  <input type="button" onclick="toggleInput(this)" value="선택" />
                                  <form:button class="submit-btn" data-lec-id="${list.get(i).lec_ID}" data-std-id="${grade1.std_ID}">제출</form:button>
                
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                     </form:form>
                  </section>
               </section>
            </c:forEach>
            <hr />
         </div>
   </section>
</body>
<script>
	function toggleInput(button) {
	     // 선택 버튼의 상위 요소인 div.gradeinput-info를 찾습니다.
	     var gradeInfoDiv = button.parentElement.parentElement.parentElement;
	
	     // 상위 요소에서 입력란을 찾습니다.
	     var inputs = gradeInfoDiv.querySelectorAll("input[type='text']");
	
	     // 입력란의 readonly 속성을 반전시킵니다.
	     inputs.forEach(input => {
	     <%--  input.readOnly = !input.readOnly; --%>
	       input.disabled = !input.disabled
	     });
	}      
</script>
</html>