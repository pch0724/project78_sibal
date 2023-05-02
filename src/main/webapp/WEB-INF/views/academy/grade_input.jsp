<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
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

.gradeinput-info > div {
    flex-grow: 1;
    text-align: center;
    border-left: 1px solid #ccc;
    border-right: 1px solid #ccc;
    padding: 5px;
    width: calc(100% / 9 - 2px); 
}

.gradeinput-info > div > div {
    display: inline;
    vertical-align: middle; /* 추가 */
}

.gradeinput-info > div > div > div {
    display: inline; 
}
    
  .gradeinput-info > div:first-child {
    border-left: none;
  }
  
  .gradeinput-info > div:last-child {
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
 
 document.addEventListener("click", function (event) {
     var target = event.target;

     if (target.tagName === "INPUT" && target.type === "button") {
       var index = target.getAttribute("data-index");
       toggleAllInputs(index);
     }
   });
 function toggleAllInputs(index) {
     var atInput = document.getElementById("at_input" + index);
     var mInput = document.getElementById("m_input" + index);
     var fInput = document.getElementById("f_input" + index);
     var aInput = document.getElementById("a_input" + index);
     var toggleButton = document.getElementById("toggleButton" + index);

     if (atInput && mInput && fInput && aInput) {
       atInput.disabled = !atInput.disabled;
       mInput.disabled = !mInput.disabled;
       fInput.disabled = !fInput.disabled;
       aInput.disabled = !aInput.disabled;

       // 버튼 텍스트 변경
       toggleButton.value = atInput.disabled ? "선택" : "확인";
     } else {
       console.error("Input elements not found");
     }
   }
     
   </script>

   <c:import url="/WEB-INF/views/academy/base.jsp" />

   <section class="sec">
      <div class="contents">

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
               <div class="lec-time">${list.get(i).starttime }교시~
                  ${list.get(i).endtime }교시</div>
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
                  <div class="time-value">${list.get(i).starttime }교시~
                     ${list.get(i).endtime }교시</div>
               </div>



               <!-- 개별성적보기 -->


               <div
                  style="text-align: left; font-size: 18px; padding: 5px; display: flex; justify-content: space-between;">
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
                  <c:forEach var="grade1" items="${stdList[i] }" varStatus="loop">
                     <form:form action="submit_grades" method="post" modelAttribute="grade_input">
                        <div class="gradeinput-info">
                           <div class="std-id">${grade1.std_ID }</div>
                           <div class="std-name">${grade1.name }</div>
                           <div class="major">${grade1.d_name }</div>
                           <div class="std-grade">${grade1.grade }</div>
                           <div class="attendance" style="display: inline-block;">
                              <form:input path="at_score" cssClass="input-field" id="at_input${loop.index } "name="at_input${loop.index }" style="width:20px" disabled="true"  />
                              <div style="color: gray; font-size: 11px;">/20</div>
                           </div>
                           <div class="midterm" style="display: inline-block;">
                              <form:input path="m_score" cssClass="input-field" id="m_input${loop.index }" style="width:20px" name="m_input${loop.index }" disabled="true"  />
                              <div style="color: gray; font-size: 11px;">/30</div>
                           </div>
                           <div class="final" style="display: inline-block;">
                              <form:input path="f_score" cssClass="input-field" id="f_input${loop.index }" style="width:20px" name="f_input${loop.index }" disabled="true"  />
                              <div style="color: gray; font-size: 11px">/30</div>
                           </div>
                           <div class="assignment" style="display: inline-block;">
                              <form:input path="a_score" cssClass="input-field" id="a_input${loop.index }" style="width:20px"  name="a_input${loop.index }"disabled="true"  />
                              <div style="color: gray; font-size: 11px">/30</div>
                           </div>
                           <div class="selection">
                              <div>
<input type="button" id="toggleButton${loop.index}" value="선택" data-index="${loop.index}" />
                     </div>
                           </div>
                        </div>

                     </form:form>
                  </c:forEach>

                  <hr />
               </section>

            </section>
         </c:forEach>
      </div>
   </section>
</body>
</html>