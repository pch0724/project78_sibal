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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
                    swal('성공',"성적 입력이 완료 되었습니다.",'success');
                },
                error: function() {
                    swal('실패',"데이터 업데이트 중 오류가 발생했습니다.",'error');
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


/* 교수정보 css  */

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

.lec-tbl{
   border-collapse: collapse;
    border-top: 3px solid #168;
    width: 100%;
    
}
.lec-tbl th {
  color: #168;
  background: #f0f6f9;
  text-align: center;
}
.lec-tbl th, .lec-tbl td {
  padding: 10px;
  border: 1px solid #ddd;
}
.lec-tbl th:first-child, .lec-tbl td:first-child {
  border-left: 0;
}
.lec-tbl th:last-child, .lec-tbl td:last-child {
  border-right: 0;
}
.lec-tbl tr td:first-child{
  text-align: center;
}
.lec-tbl caption{caption-side: bottom; display: none;}

.input-info-tbl{
   display: table;
   border-collapse: collapse;
    border-top: 3px solid #168;
    width: 100%;
    
}

#tr{
   display: table-row;
}
#td{
   display: table-cell;
}
#th{
  color: #168;
  background: #f0f6f9;
  text-align: center;
  display: table-cell;
}
#th, #td{
  padding: 10px;
  border: 1px solid #ddd;
}
#th:first-child, #td:first-child {
  border-left: 0;
}
#th:last-child, #td:last-child {
  border-right: 0;
}
#tr #td:first-child{
  text-align: center;
}
.input-info-tbl caption{caption-side: bottom; display: none;}
#choose{
	border-radius: 5px; 
	border: 1px solid #168; 
	color:#168; 
	background: #f0f6f9;"
}
input:focus {outline:none;}
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
         <p>
           <span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;"><b>강의 선택</b></span>
        </p>
        <table class="lec-tbl">
         <tr class="lec-sel" style="font-weight: bold">
            <th class="lec-id">학수번호</th>
            <th class="lec-name">과목명</th>
            <th class="lec-type">이수구분</th>
            <th class="lec-grade">학년</th>
            <th class="lec-credit">학점</th>
            <th class="lec-class">강의실</th>
            <th class="lec-number">수강인원</th>
            <th class="lec-day">요일</th>
            <th class="lec-time">시간</th>
            <th>비고</th>
         </tr>




         <c:forEach var="i" begin="0" end="${size }">
            <tr class="lec-sel2">
               <td class="lec-id">${list.get(i).lec_ID }</td>
               <td class="lec-name">${list.get(i).lec_name }</td>
               <td class="lec-type">${list.get(i).completion }</td>
               <td class="lec-grade">${list.get(i).grade }</td>
               <td class="lec-credit">${list.get(i).credits }</td>
               <td class="lec-class">${list.get(i).c_ID }</td>
               <td class="lec-number">${counts[i] }</td>
               <td class="lec-day">${list.get(i).day }</td>
               <td class="lec-time">${list.get(i).starttime }교시~ ${list.get(i).endtime }교시</td>
               <td align="center">
                  <input type="button" value="선택" onclick="LecSection(${i })" style="border-radius: 5px; border: 1px solid #168; color:#168; background: #f0f6f9;"/>
               </td>
            </tr>
         </c:forEach>
         </table>
       
         <p></p>

<!-- 과목정보  -->
         <c:forEach var="i" begin="0" end="${size }">
            <section id="LecSection${i }" style="display: none">
               <p>
                 <span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;"><b>과목 정보</b></span>
              </p>
              <table class="lec-tbl">
                  <tr class="lecture-info">
                     <th class="name-label" style="font-weight: bold">과목명</th>
                     <td class="name-value">${list.get(i).lec_name }</td>
                     <th class="lecture-id-label" style="font-weight: bold">학수번호</th>
                     <td class="lecture-id-value">${list.get(i).lec_ID }</td>
                  
                     <th class="class-label" style="font-weight: bold">강의실</th>
                     <td class="class-value">${list.get(i).c_ID }</td>
                     <th class="day-label" style="font-weight: bold">요일</th>
                     <td class="day-value">${list.get(i).day }</td>
                     <th class="time-label" style="font-weight: bold">시간</th>
                     <td class="time-value">${list.get(i).starttime }교시~ ${list.get(i).endtime }교시</td>
                  </tr>
            </table>
<!-- 개별성적보기 -->
                  <p>
                   <span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;"><b>성적 입력</b></span>
                  </p>
                  
                 <div class="input-info-tbl">
                  
                  <div class="gradeinput-info" id="tr" style="font-weight: bold">
                     <div class="std-id" id="th" style="width:14%;">&nbsp;학번&nbsp;</div>
                     
                     <div class="std-name" id="th" style="width:10.7%;">이름</div>
                     <div class="major" id="th" style="width:10.7%;">&nbsp;&nbsp;학과&nbsp;&nbsp;</div>
                     <div class="std-grade" id="th" style="width:10.6%;">학년</div>
                     <div class="attendance" id="th" style="width:10.7%;">출석</div>
                     <div class="midterm" id="th" style="width:10.7%;">중간</div>
                     <div class="final" id="th" style="width:10.6%;">기말</div>
                     <div class="assignment" id="th" style="width:10.7%;">과제</div>
                     <div class="selection" id="th" style="width:10.7%;">비고</div>
                     <div id="th" style="width: 1%;"></div>
                  </div>
                 </div>
                  <div class="input-info-tbl">
                  <section class="overflow-section">
                     <input type="hidden" name="lec_ID" value="${list.get(i).lec_ID}" />
                     <input type="hidden" name="year" value="2022" />
                     <input type="hidden" name="g_semester" value="1" />
                     <form:form modelAttribute="grade_input" action="#">
                     
                     <c:forEach var="grade1" items="${stdList[i] }" varStatus="loop">
                        <div class="gradeinput-info" id="tr"> 
                           <div class="std_ID" id="td" style="width:4.5%;">${grade1.std_ID }</div>
                           <div class="std-name" id="td" style="width:4.5%;">${grade1.name }</div>
                           <div class="major" id="td" style="width:4.5%;">${grade1.d_name }</div>
                           <div class="std-grade" id="td" style="width:4.5%;">${grade1.grade }</div>
                           <div class="attendance" id="td" style="width:4.5%;">
                              <form:input path="at_score"  style="width: 20px" disabled="true" />
                              <div style="color: gray; font-size: 11px;">/20</div>
                           </div>
                           <div class="midterm" id="td" style="width:4.5%;">
                              <form:input path="m_score"  style="width: 20px" disabled="true" />
                              <div style="color: gray; font-size: 11px">/30</div>
                           </div>
                           <div class="final" id="td" style="width:4.5%;">
                              <form:input path="f_score" style="width: 20px" disabled="true" />
                              <div style="color: gray; font-size: 11px">/30</div>
                           </div>
                           <div class="assignment" id="td" style="width:4.5%;">
                              <form:input path="a_score"  style="width: 20px" disabled="true" />
                              <div style="color: gray; font-size: 11px">/20</div>
                           </div>
                           <div class="selection" id="td" style="width:4.5%;">
                              <div>
                                  <input id="choose" type="button" onclick="toggleInput(this)" value="선택" />
                                  <form:button id="choose" class="submit-btn" data-lec-id="${list.get(i).lec_ID}" data-std-id="${grade1.std_ID}">제출</form:button>
                
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                     </form:form>
                  </section>
                 </div>
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