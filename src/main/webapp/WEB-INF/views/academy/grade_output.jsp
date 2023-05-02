<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

.gradeinput-info>div.attendance, .gradeinput-info>div.midterm,
   .gradeinput-info>div.final, .gradeinput-info>div.save, .gradeinput-info>div.assignment,
   .gradeinput-info>div.total, .gradeinput-info>div.gpa, .gradeinput-info>div.rank
   {
   display: inline-flex;
   flex-wrap: nowrap;
   align-items: center;
   justify-content: center;
}
.overflow-section {
  height: 360px; /* 스크롤이 필요한 높이 */
  overflow-y: auto; /* 세로축 스크롤바를 자동으로 추가합니다 */
}
</style>
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
}
 
   </script>
</head>
<body>

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
                  <input type="button" value="선택" onclick="LecSection(${i})" />
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
                  <div class="std-id">
                     <input type="button" value="학번"
                        style="width: 100%; height: 100%;" />
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
                  <div class="total">
                     <input type="button" value="총점" />
                  </div>
                  <div class="gpa">
                     <input type="button" value="점수" />
                  </div>
                  <div class="gradeletter">
                     <input type="button" value="등급" />
                  </div>
                  <div class="rank">
                     <input type="button" value="순위" />
                  </div>
               </div>
               <section class="overflow-section">
               <c:forEach var="grade1" items="${stdList[i] }">
                  <div class="gradeinput-info">
                     <div class="std-id">${grade1.std_ID }</div>
                     <div class="std-name">${grade1.name }</div>
                     <div class="major">${grade1.d_name }</div>
                     <div class="std-grade">${grade1.grade }</div>
                     <div class="attendance">
                        <div>${grade1.at_score }</div>
                        <div style="color: gray; font-size: 11px;">/20</div>
                     </div>
                     <div class="midterm">
                        <div>${grade1.m_score }</div>
                        <div style="color: gray; font-size: 11px;">/30</div>
                     </div>
                     <div class="final">
                        <div>${grade1.f_score }</div>
                        <div style="color: gray; font-size: 11px">/30</div>
                     </div>
                     <div class="assignment">
                        <div>${grade1.a_score }</div>
                        <div style="color: gray; font-size: 11px">/30</div>
                     </div>
                     <div class="total">
                        <div>${grade1.at_score + grade1.m_score +grade1.f_score + grade1.a_score}</div>
                        <div style="color: gray; font-size: 11px">/100</div>
                     </div>
                     <div class="gpa">${grade1.gpa }</div>
                     <div class="gpa">${grade1.gradeLetter }</div>
                     <div class="rank">
                        <div>${grade1.rank }</div>
                        <div style="color: gray; font-size: 11px">/${counts[i] }</div>
                     </div>
                  </div>
               </c:forEach>
            <hr />
               </section>

         </section>
         </c:forEach>
      </div>
   </section>
</body>
</html>
