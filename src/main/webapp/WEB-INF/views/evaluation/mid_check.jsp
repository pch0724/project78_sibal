<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>중간 강의평가 조회</title>
<style>
* {
   font-family: 'Noto Sans KR', sans-serif;
}
* {
   font-family: 'Noto Sans KR', sans-serif;
}
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
    
    
 .lecture-sel{
   border-collapse: collapse;
    border-top: 3px solid #168;
    width: 100%;
    
}
.lecture-sel th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    .lecture-sel th, .lecture-sel td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .lecture-sel th:first-child, .lecture-sel td:first-child {
      border-left: 0;
    }
    .lecture-sel th:last-child, .lecture-sel td:last-child {
      border-right: 0;
    }
    .lecture-sel tr td:first-child{
      text-align: center;
    }
    .lecture-sel caption{caption-side: bottom; display: none;}
    
.lecsub{
   border-collapse: collapse;
   border-top: 3px solid #168;
   width: 100%;
    
}
.lecsub th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
}
.lecsub th, .lecsub td {
  padding: 10px;
  border: 1px solid #ddd;
}
.lecsub th:first-child, .lecsub td:first-child {
  border-left: 0;
}
.lecsub th:last-child, .lecsub td:last-child {
  border-right: 0;
}
.lecsub tr td:first-child{
  text-align: center;
}
.lecsub caption{caption-side: bottom; display: none;}
    
.student-info-table{
   border-collapse: collapse;
    border-top: 3px solid #168;
    border-bottom: 3px solid #168;
    width: 100%;
    
}
.student-info-table td{
   border: 1px solid #ddd;
} 

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function inputg(lec_id, year, semester) {
    var section = document.getElementById("inputg");

    if (section.style.display === "none") {
        $.ajax({
            url: "${root}evaluation/get_evaluation_statistics",
            type: "GET",
            data: { "lec_ID": lec_id,
                   "year": year,
                   "semester": semester 
               },
            dataType: "json",
            success: function (data) {
               console.log(data);
                
                console.log($("#grade_std_count"));
                $("#grade_std_count").text((data.GRADE_STD_COUNT || "-") + (data.GRADE_STD_COUNT ? "명" : ""));
                $("#evaluation_std_count").text((data.EVALUATION_STD_COUNT || "-")+ (data.EVALUATION_STD_COUNT ? "명" : ""));
                $("#avg_items1").text((data.AVG_ITEMS1 || "-")+ (data.AVG_ITEMS1 ? "점" : ""));
                $("#avg_items2").text((data.AVG_ITEMS2 || "-")+ (data.AVG_ITEMS2 ? "점" : ""));
                $("#avg_items3").text((data.AVG_ITEMS3 || "-")+ (data.AVG_ITEMS3 ? "점" : ""));
                $("#avg_items4").text((data.AVG_ITEMS4 || "-")+ (data.AVG_ITEMS4 ? "점" : ""));
                $("#total_sum").text((data.TOTAL_SUM || "-")+ (data.TOTAL_SUM ? "점" : ""));
                $("#total_avg").text((data.TOTAL_AVG || "-")+ (data.TOTAL_AVG ? "점" : ""));
            
                section.style.display = "block";
            },
            error: function (error) {
                console.log("Error: " + error);
            }
        });
    } else {
        section.style.display = "none";
    }
    loadFeedbackList(lec_id);
}
function loadFeedbackList(lec_id) {
    $.ajax({
        url: "${root}evaluation/get_feedback_list",
        type: "GET",
        data: { 
           "lec_ID": lec_id
            },
        dataType: "json",
        success: function (data) {
            var feedbackContainer = $("#feedback-container");
            feedbackContainer.empty();

            if (data.length > 0) {
                $.each(data, function (index, feedback) {
                    feedbackContainer.append("<p>" + feedback + "</p>");
                });
            } else {
                feedbackContainer.append("<p>피드백이 없습니다.</p>");
            }
        },
        error: function (error) {
            console.log("Error: " + error);
        }
    });
}


</script>
</head>
<body>

   <c:import url="/WEB-INF/views/academy/base.jsp"/>
   <!-- 
    -->
   <section class="sec">
   
      <div class = "contents">
      
      <form action="${root}evaluation/mid_check" method="GET">
      <table class="student-info-table">
         <tr>
            <th style="font-weight: bold">년도</th>
            <td>
                <select name="year">
                    <option ${year == 2022 ? 'selected' : ''}>2022</option>
                    <option ${year == 2023 ? 'selected' : ''}>2023</option>
                </select>
            </td>
              <th style="font-weight: bold">학기</th>
              <td>
                <select name="semester">
                    <option ${semester == 1 ? 'selected' : ''}>1</option>
                    <option ${semester == 2 ? 'selected' : ''}>2</option>
                </select>
            </td>
              <td>
                 <input type="submit" value="조회" style="border-radius: 5px; border: 1px solid #168; margin-left: 10px; color:#168; background: #f0f6f9;">
              </td>
              
         </tr>
      
      </table>
      </form>
         <!-- 강의선택  -->
         <p>
               <span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;"><b>강의 선택</b></span>
               <span style="color: red; padding: 0.5em 0.6em; color: #168; font-size: 16pt;">${noData}</span>
            </p>
            <table class="lecture-sel">
         <tr class="lec-sel" style="font-weight: bold">
            <th class="lec-id">학수번호</th>
            <th class="lec-name">과목명</th>
            <th class="lec-type">이수구분</th>
            <th class="lec-grade">학년</th>
            <th class="lec-credit">학점</th>
            <th class="lec-class">강의실</th>
            <th class="lec-day">요일</th>
            <th class="lec-time">시간</th>
            <th>비고</th>
         </tr>
         <c:if test="${not empty list}">
         <c:forEach var = "i" begin="0" end="${size }">
            <tr class="lec-sel2">
               <td class="lec-id">${list.get(i).lec_ID }</td>
               <td class="lec-name">${list.get(i).lec_name }</td>
               <td class="lec-type">${list.get(i).completion }</td>
               <td class="lec-grade">${list.get(i).grade }</td>
               <td class="lec-credit">${list.get(i).credits }</td>
               <td class="lec-class">${list.get(i).c_ID }</td>
               <td class="lec-day">${list.get(i).day }</td>
               <td class="lec-time">${list.get(i).starttime }교시 ~ ${list.get(i).endtime }교시</td>
               <td>
                  <input type="button" value="선택" onclick="inputg('${list.get(i).lec_ID}', ${year}, ${semester})" style="border-radius: 5px; border: 1px solid #168; color:#168; background: #f0f6f9;"/>
                  
               </td>
            </tr>
         </c:forEach>
         </c:if>
            </table>
         
         <p></p>
         <!-- 과목정보  -->
         <section id="inputg" style="display: none">
            
            <!-- 강의평가내용 -->
            <p>
                  <span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;"><b>강의평가 내용</b></span>
               </p>
            
            <table class="lecsub">
            <tr>
               <th rowspan="2">수강인원</th>
               <th rowspan="2">응답인원</th>
               <th colspan="4">문항별 평균점수(1번~4번)</th>
               <th rowspan="2">총점</th>
               <th rowspan="2">평점 평균</th>
            </tr>
            <tr>
               <td style="text-align: center; color: gray; font-size: 12pt;">①</td>
               <td style="text-align: center; color: gray; font-size: 12pt;">②</td>
               <td style="text-align: center; color: gray; font-size: 12pt;">③</td>
               <td style="text-align: center; color: gray; font-size: 12pt;">④</td>
            </tr>
            <tr>
                <td id="grade_std_count"></td>
                <td id="evaluation_std_count"></td>
                <td id="avg_items1"></td>
                <td id="avg_items2"></td>
                <td id="avg_items3"></td>
                <td id="avg_items4"></td>
                <td id="total_sum"></td>
                <td id="total_avg"></td>
            </tr>

            
            
            </table>
            
                  
                  
            <p>
                  <span style="padding: 0.5em 0.6em; color: #168; font-size: 14pt;"><b>강의평가 항목</b></span>
               </p>
            <table class="evalsub" style="border: none;">
               <tr >
                  <td style="border: none; font-size: 11pt;">Q1.나는 이 교과목에 흥미를 가지고 적극적으로 참여하였다</td>
               </tr>
               <tr>
                  <td style="border: none; font-size: 11pt;">Q2.교수님은 규정된 수업시간(결강, 휴보강 관련)을 준수하였습니까?</td>
               </tr>
               <tr>
                  <td style="border: none; font-size: 11pt;">Q3.교수님은 수업에 학생의 관심과 참여를 유도하기 위해 노력하였습니까?</td>
               </tr>
               <tr>
                  <td style="border: none; font-size: 11pt;">Q4.강의내용이 평가(이론시험, 실습, 구두평가, 보고서 등)에 적절히 반영되었습니까?</td>
               </tr>
            </table>
            
            
            <hr />
            
            <div style="text-align: left; font-size: 18px; padding: 5px;">
                <p style="margin: 7px 0px;">
                     <span style="padding: 0.1em 0.1em; color: #168; font-size: 16pt;"><b>피드백 내용</b></span>
                  </p>
                  
               <section class="overflow-section" style="max-height: 150px; overflow-y: scroll;">
                   <div id="feedback-container" style="margin-top:5px; font-size: 12pt">
                   </div>
               </section>

            </div>
         </section>
      </div>
   </section>

</body>
</html>