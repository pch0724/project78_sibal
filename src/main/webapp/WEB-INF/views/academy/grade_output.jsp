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


.info-button {
   width: 100%;
   height: 100%;   
   margin: 0;
   padding: 0;
   border: none;
   background-color: #f0f6f9;
   color: #168;
   font-weight: bold;
   font-size: 12pt;
   
}



.overflow-section {
  height: 360px; /* 스크롤이 필요한 높이 */
  overflow-y: auto; /* 세로축 스크롤바를 자동으로 추가합니다 */
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
            <tr class="lec-sel2" style="text-align: center;">
               <td class="lec-id">${list.get(i).lec_ID }</td>
               <td class="lec-name">${list.get(i).lec_name }</td>
               <td class="lec-type">${list.get(i).completion }</td>
               <td class="lec-grade">${list.get(i).grade }</td>
               <td class="lec-credit">${list.get(i).credits }</td>
               <td class="lec-class">${list.get(i).c_ID }</td>
               <td class="lec-number">${counts[i] }</td>   
               <td class="lec-day">${list.get(i).day }</td>
               <td class="lec-time">${list.get(i).starttime }교시~
                  ${list.get(i).endtime }교시</td>
               <td>
                  <input type="button" value="선택" onclick="LecSection(${i})" />
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
                  <th class="name-label" style="width: 5%">과목명</th>
                  <td class="name-value" style="width: 26%">${list.get(i).lec_name }</td>
                  <th class="lecture-id-label" style="width: 8%">학수번호</th>
                  <td class="lecture-id-value" style="width: 13%">${list.get(i).lec_ID }</td>
               

               
                  <th class="class-label" style="width: 5%">강의실</th>
                  <td class="class-value" style="width: 10%">${list.get(i).c_ID }</td>
                  <th class="day-label" style="width: 5%">요일</th>
                  <td class="day-value" style="width: 8%">${list.get(i).day }</td>
                  <th class="time-label" style="width: 5%">시간</th>
                  <td class="time-value" style="width: 15%">${list.get(i).starttime }교시~
                     ${list.get(i).endtime }교시</td>
               </tr>

         </table>

               <!-- 개별성적보기 -->
               
               
               <div
                  style="text-align: left; font-size: 18px; display: flex; justify-content: space-between;">
                  <p>
                   <span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;"><b>성적 조회</b></span>
                  </p>
               </div>
               
            <div class="input-info-tbl">
            
               <div class="gradeinput-info" id="tr" style="font-weight: bold">
                  <div class="std-id" id="th" style="width: 12%">
                     <input class="info-button" type="button" value="학번"
                        style="width: 100%; height: 100%;" />
                  </div>
                  <div class="std-name" id="th" style="width: 8%">
                     <input class="info-button" type="button" value="이름" />
                  </div>
                  <div class="major" id="th" style="width: 8%">
                     <input class="info-button" type="button" value="학과" />
                  </div>
                  <div class="std-grade" id="th" style="width: 8.1%">
                     <input class="info-button" type="button" value="학년" />
                  </div>
                  <div class="attendance" id="th" style="width: 8%">
                     <input class="info-button" type="button" value="출석" />
                  </div>
                  <div class="midterm" id="th" style="width: 8%">
                     <input class="info-button" type="button" value="중간점수" />
                  </div>
                  <div class="final" id="th" style="width: 8%">
                     <input class="info-button" type="button" value="기말점수" />
                  </div>
                  <div class="assignment" id="th" style="width: 8%">
                     <input class="info-button" type="button" value="과제점수" />
                  </div>
                  <div class="total" id="th" style="width: 8%">
                     <input class="info-button" type="button" value="총점" />
                  </div>
                  <div class="gpa" id="th" style="width: 8%">
                     <input class="info-button" type="button" value="점수" />
                  </div>
                  <div class="gradeletter" id="th" style="width: 8.15%">
                     <input class="info-button" type="button" value="등급" />
                  </div>
                  <div class="rank" id="th" style="width: 8%">
                     <input class="info-button" type="button" value="순위" />
                  </div>
                  <div id="th"style="width: 1%"></div>
               </div>
               </div>
               <div class="input-info-tbl">
               <section class="overflow-section">
               
               <c:forEach var="grade1" items="${stdList[i] }">
                  <div class="gradeinput-info" id="tr" >
                     <div class="std-id" id="td" style="width: 4%">${grade1.std_ID }</div>
                     <div class="std-name" id="td" style="width: 4%">${grade1.name }</div>
                     <div class="major" id="td" style="width: 4%">${grade1.d_name }</div>
                     <div class="std-grade" id="td" style="width: 4%">${grade1.grade }</div>
                     <div class="attendance" id="td" style="width: 4%">
                        <div>${grade1.at_score }</div>
                        <div style="color: gray; font-size: 11px;">/20</div>
                     </div>
                     <div class="midterm" id="td" style="width: 4%">
                        <div>${grade1.m_score }</div>
                        <div style="color: gray; font-size: 11px;">/30</div>
                     </div>
                     <div class="final" id="td" style="width: 4%">
                        <div>${grade1.f_score }</div>
                        <div style="color: gray; font-size: 11px">/30</div>
                     </div>
                     <div class="assignment" id="td" style="width: 4%">
                        <div>${grade1.a_score }</div>
                        <div style="color: gray; font-size: 11px">/30</div>
                     </div>
                     <div class="total" id="td" style="width: 4%">
                        <div>${grade1.at_score + grade1.m_score +grade1.f_score + grade1.a_score}</div>
                        <div style="color: gray; font-size: 11px">/100</div>
                     </div>
                     <div class="gpa" id="td" style="width: 4%">${grade1.gpa }</div>
                     <div class="gpa" id="td" style="width: 4%">${grade1.gradeLetter }</div>
                     <div class="rank" id="td" style="width: 4%">
                        <div>${grade1.rank }</div>
                        <div style="color: gray; font-size: 11px">/${counts[i] }</div>
                     </div>
                  </div>
               </c:forEach>
               
                  <hr />
               </section>

            </div>
         </section>
         </c:forEach>
   </div>
   </section>
</body>
</html>