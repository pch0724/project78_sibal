<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 <%request.setCharacterEncoding("UTF-8");%>
$(document).ready(function(){
   
   $.ajaxSetup({
      success:function(result){
         alert(result);   
      },
      error:function(jqXHR){
         alert("jqXHR status code:"+jqXHR.status+" message:"+jqXHR.responseText);
      }//error
   });//ajaxSetup
}); //document.ready

   var currentSection = null;

    function selectSection(index, button) {
        var section = document.getElementById("test" + index);

        if (currentSection && currentSection !== section) {
            currentSection.style.display = "none";
        }

        if (section.style.display == "none") {
            section.style.display = "block";
            currentSection = section;
            loadSectionData(index, button);
        } else {
            section.style.display = "none";
            currentSection = null;
        }
    }

    function loadSectionData(index, button) {
        var year = Number(button.getAttribute("data-year"));
        var g_semester = Number(button.getAttribute("data-g_semester"));

        $.ajax({
            type: "GET",
            url: "${root}/all_grade_check.do",
            data: {
                "year": year,
                "g_semester": g_semester
            },
            dataType: "json",
            success: function (data) {
               updateTable(index, data);
                var sectionTitle = document.getElementById("section-title-" + index);
                sectionTitle.textContent = year + "년 " + g_semester + "학기 성적조회";
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error: " + textStatus + " " + errorThrown);
            }
        });
    }
    function updateTable(index, data) {
        var section = $("#test" + index);
        var table = section.find("table");

        // 테이블 초기화
        table.find("tr:gt(0)").remove();

        // 테이블에 데이터 추가
        $.each(data, function (i, grade) {
            var row = $("<tr style='text-align:center'>");
            row.append($("<td>").text(grade.year));
            row.append($("<td>").text(grade.g_semester));
            row.append($("<td>").text(grade.lec_ID));
            row.append($("<td>").text(grade.lec_name));
            row.append($("<td>").text(grade.completion));
            row.append($("<td>").text(grade.credits));
            row.append($("<td>").text(grade.gpa));
            row.append($("<td>").text(grade.gradeLetter));
            table.append(row);
        });
    }

</script>
<title>전체 성적 조회</title>
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
   overflow: auto;
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
   .gradeinput-info>div.final, .gradeinput-info>div.save, .gradeinput-info>div.assignment
   {
   display: inline-flex;
   flex-wrap: nowrap;
   align-items: center;
   justify-content: center;
}

table{
   border-collapse: collapse;
    border-top: 3px solid #168;
    width: 100%;
    
}
table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
}
table th, table td {
  padding: 10px;
  border: 1px solid #ddd;
}
table th:first-child, table td:first-child {
  border-left: 0;
}
table th:last-child, table td:last-child {
  border-right: 0;
}
table tr td:first-child{
  text-align: center;
}
table caption{caption-side: bottom; display: none;}
</style>

</head>
<body>

   <c:import url="/WEB-INF/views/academy/base.jsp" />

   <section class="sec">
      <div class="contents">
         <p>
              <span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;"><b>년도/학기별취득학점</b></span>
          </p>
         <table class="credits-table">
            <tr>
               <th rowspan=2>학년도</th>
               <th rowspan=2>학기</th>
               <th colspan=3>신청학점</th>
               <th colspan=3>취득학점</th>
               <th rowspan=2>평점</th>
               <th rowspan=2>상세보기</th>
            </tr>
            <tr>
               <th>전공</th>
               <th>교양</th>
               <th width=80px>총신청학점</th>
               <th>전공</th>
               <th>교양</th>
               <th width=80px>총취득학점</th>
            </tr>
            <c:forEach var="i" begin="0" end="${size1}">
               <tr style='text-align:center'>
                  <td>${totalGPA.get(i).year}</td>
                  <td>${totalGPA.get(i).g_semester}</td>
                  <td>${totalGPA.get(i).en_a }</td>
                  <td>${totalGPA.get(i).en_b }</td>
                  <td>${totalGPA.get(i).en_all }</td>
                  <td>${totalGPA.get(i).ac_a }</td>
                  <td>${totalGPA.get(i).ac_b }</td>
                  <td>${totalGPA.get(i).ac_all }</td>
                  <td>${totalGPA.get(i).avg_grade }</td>
                  <td>
                     <input type="button" value="조회" onclick="selectSection(${i}, this)" data-year="${totalGPA.get(i).year}" data-g_semester="${totalGPA.get(i).g_semester}" />
                  </td>
               </tr>
            </c:forEach>
            
            <tr style="border-top : double 5px #ddd">
            
            <th colspan="2">총합계</th>
            <th>${totalBean.en_a }</th>
            <th>${totalBean.en_b }</th>
            <th>${totalBean.en_all }</th>
            <th>${totalBean.ac_a }</th>
            <th>${totalBean.ac_b }</th>
            <th>${totalBean.ac_all }</th>
            <th>평균평점</th>
            <th>${totalBean.avg_grade }</th>
            </tr>
            
         </table>
      

         <c:forEach var="i" begin="0" end="${size1}">
            <section id="test${i}" style="display: none">
               
               <p>
                 <b><span style="padding: 0.5em 0.6em; color: #168; font-size: 16pt;" id="section-title-${i}">${year }년${g_semester }학기 성적조회</span></b>
             </p>
               <table>
                  <tr>
                     <th>학년도</th>
                     <th>학기</th>
                     <th>학수번호</th>
                     <th>강의명</th>
                     <th>이수구분</th>
                     <th>학점</th>
                     <th>성적</th>
                     <th>등급</th>
                  </tr>
                
               </table>

            </section>

         </c:forEach>
      </div>
   </section>
</body>
</html>