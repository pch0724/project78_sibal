<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<style type="text/css">
*{
   font-family: 'Noto Sans KR', sans-serif;
}
.header{
   background-color: #d1d1d1;
   
   border-collapse: collapse;
   width: 70%;
   height: 20%;
   position: absolute;
}
.header_cell{
   width: 20%;
   height: 25%;
}
.main{
   margin-top: 9.9%;
   background-color: #f5f5f5;
   width: 70%;
   height: 50%;
   position: absolute;
   overflow-y: scroll;
}
.footer{
   margin-top: 37.8%;
   background-color: #f5f5f5;
   width: 70%;
   height: 31.97%;
   position: absolute;
   overflow-y: scroll; 
}
.right{
   
   margin-left: 70%;
   width: 30%;
   height: 100%;
   position: absolute;
   float: right;
}
#login {
   margin-right:5px;
   border-radius: 10px;
   border: 0px;
   width: 100px;
   height:30px;
   background-color:#000087;
   float: right;
   border: 1px solid white;
}
.cell{
   
}
input:focus {outline:none;}
.readonly{
   text-align: center;
   border-radius: 5px;
   border: 1px solid #168; 
   background: white;
}
.lecture-cell {
   
   background-color: #f0f6f9;
}
#timetable{
	width: 100%;
}
.readonly{
	border-radius: 5px;
	border: 1px solid #168; 
	background: white;
}
.choose{
	border-radius: 5px;
	border: 1px solid #168; 
	background: white;
}
</style>
<title>수강신청</title>
<script>
$(document).ready(function() {
   loadEnrolledLectures();
   //선택한 과목을 수강신청 하는 함수
   function enrollLecture(lecture, stdId) {
       // 이 함수에서 lecture 데이터와 학생 ID를 사용하여 서버에 요청을 보내고, 결과를 처리합니다.
       // AJAX 요청을 사용하여 서버에 데이터를 전송하고 결과를 받아옵니다.
	   $.ajax({
	          url: '${root}enrollment/enrollLecture',
	          type: 'POST',
	          data: {
	              stdId: stdId,
	              lecId: lecture.lec_ID,
	              year: 2022,
	              semester: 1
	          },
	          success: function (data) {
	              if (data === 'success') {
	                  alert('수강 신청이 완료되었습니다.');
	                  loadEnrolledLectures();
	              } else if (data === 'daytimeError'){
	            	  alert('이미 동일한 시간대의 강의를 수강하고 있습니다. 다른 강의를 선택해주세요.')  
	              } else if (data === 'capacityError') {
	                  alert('수강인원이 정원을 초과했습니다. 다른 강좌를 선택해주세요.');
	              } else {
	                  alert('수강 신청 중 오류가 발생했습니다.');
	              }
	          },
	          error: function () {
	              alert('수강 신청 중 오류가 발생했습니다.');
	          }
	      });
	       }
   //수강신청 처리 된 과목들을 표시하는 함수
   function loadEnrolledLectures() {
       $.ajax({
           url: '${root}enrollment/getEnrolledLectures',
           type: 'GET',
           dataType: 'json',
           success: function(data) {
              var resultTable = $('section.footer table');
              // 기존 행 삭제
               resultTable.find('tr:not(:first)').remove();
               // 수강 신청한 과목을 표시하는 로직
               data.forEach(function(lecture, index) {
                   // 새로운 행 추가
                   var row = $('<tr>').css({
                       'border': '1px solid #ccc',
                       'align': 'center',
                       'margin-left': '5px',
                       
                       'background-color': '#ffffff'
                     });
                   
                   row.append($('<td style="width: 86px;" align="center">').text(lecture.completion));
                   row.append($('<td align="center">').text(lecture.lec_ID));
                   row.append($('<td style="width: 500.87px;">').text(lecture.lec_name));
                   row.append($('<td align="center">').text(lecture.grade));
                   row.append($('<td align="center">').text(lecture.credits));
                   row.append($('<td align="center" style="width: 100px;">').text(lecture.name));
                   row.append($('<td align="center" style="width: 46px;">').text(lecture.day));
                   row.append($('<td align="center">').text(lecture.starttime + ' - ' + lecture.endtime));
                   row.append($('<td align="center">').text(lecture.c_ID));
                   row.append($('<td align="center">').text(lecture.enroll_count + ' / ' + lecture.capacity));
                   var deleteButton = $('<button>').text('취소').attr('id', 'deleteBtn').css({
                       'border': '1px solid #ccc',
                       'border-radius': '5px', 
                       'border': '1px solid #168',
                       'color':'#168', 
                       'background': 'white'
                       
                     });
                   row.append($('<td>').append(deleteButton));
                   deleteButton.click(function() {
                       deleteLecture('${getTimeTableinfo.ID}',lecture.lec_ID);
                   });
                   resultTable.append(row);
               });
               // 시간표 생성
               createEnrolledLecturesTimetable(data);
               // 수강신청 성공 후에 enroll_count 업데이트
               $('#select').trigger('click');
           },
           error: function() {
               alert('수강 신청한 과목을 불러오는 중 오류가 발생했습니다.');
           }
       });//ajx
       
   }
   
   //수강신청처리된 과목들에서 선택한 과목을 수강신청 취소하는 함수
   function deleteLecture(stdId, lecId) {
       $.ajax({
           url: '${root}enrollment/deleteLecture',
           type: 'POST',
           data: {
               stdId: stdId,
               lecId: lecId
           },
           success: function(data) {
               // 삭제가 성공적으로 처리되었을 때 실행할 코드를 여기에 작성합니다.
               alert('수강 취소가 완료되었습니다.');
              
               loadEnrolledLectures();
            // 수강신청 성공 후에 enroll_count 업데이트
               $('#select').trigger('click');
           },
           error: function() {
               // 요청 처리 중 오류가 발생했을 때 실행할 코드를 여기에 작성합니다.
               alert('수강 취소 중 오류가 발생했습니다.');
           }
       });
   }

   //전공구분과 학년을 선택해서 수강신청진행중인 과목들 리스트를 가져오는 함수
    $('#select').click(function() {
        var completion = $('select[name="completion"]').val();
        var grade = $('select[name="grade"]').val();
        var searchValue = $('input#searchValue').val();

        $.ajax({
            url: '${root}enrollment/searchLectures',
            type: 'POST',
            data: {
                completion: completion,
                grade: grade,
                searchValue: searchValue
            },
            dataType: 'json',
            success: function(data) {
                var resultTable = $('#resultBody');
                
                // 기존 행 삭제
            resultTable.find('tr.result-row').remove();


                // 새로운 행 추가
                data.forEach(function(lecture) {
                   var row = $('<tr>').addClass('result-row').css({
                        'border': '1px solid #ccc',
                        'align': 'center',
                        'margin-left': '5px',
                        
                        'background-color': '#ffffff'
                      });
                   if (lecture.enroll_count >= lecture.capacity) {
                       row.addClass('full-capacity').css({'color':'red'});
                   }
                    row.append($('<td>').text(lecture.completion));
                    row.append($('<td>').text(lecture.lec_ID)); 
                    row.append($('<td>').text(lecture.lec_name)); 
                    row.append($('<td>').text(lecture.grade)); 
                    row.append($('<td>').text(lecture.credits)); 
                    row.append($('<td>').text(lecture.name)); 
                    row.append($('<td>').text(lecture.day)); 
                    row.append($('<td>').text(lecture.starttime + ' - ' + lecture.endtime)); 
                    row.append($('<td>').text(lecture.c_ID)); 
                    row.append($('<td>').text(lecture.enroll_count + ' / ' + lecture.capacity)); 
                    var enrollButton = $('<button>').text('등록').css({
                        'border': '1px solid #ccc',
                        'border-radius': '5px', 
                        'border': '1px solid #168',
                        'color':'#168', 
                        'background': 'white'
                      });
                    enrollButton.click(function() {
                        enrollLecture(lecture, '${getTimeTableinfo.ID}');
                    });
                    row.append($('<td>').append(enrollButton));
                    
                    resultTable.append(row);
                });
            },
            error: function() {
                alert('검색 중 오류가 발생했습니다.');
            }
        });
    });
  //시간표
    function createEnrolledLecturesTimetable(enrolledLectures) {
        var timetable = $('#timetable');

        // 시간표 초기화
        for (var time = 1; time <= 14; time++) {
            for (var dayIndex = 1; dayIndex <= 5; dayIndex++) {
                var row = timetable.find('tr:nth-child(' + (time + 1) + ')');
                var cell = row.find('td:nth-child(' + (dayIndex + 1) + ')');
                if (!cell.length) { // 셀이 없으면 새로 생성
                    cell = $('<td>');
                    row.append(cell);
                }
                cell.text('');
                cell.attr('rowspan', '');
                cell.show(); // 셀을 표시
            }
        }


        // 시간표 생성
        enrolledLectures.forEach(function (lecture) {
            var dayIndex = ['월', '화', '수', '목', '금'].indexOf(lecture.day) + 1;
            var rowspan = lecture.endtime - lecture.starttime + 1;

            for (var time = lecture.starttime; time <= lecture.endtime; time++) {
                var cell = timetable.find('tr:nth-child(' + (time + 1) + ') td:nth-child(' + (dayIndex + 1) + ')');
                if (time === lecture.starttime) {
                    cell.attr('rowspan', rowspan); 
                    cell.text(lecture.lec_name + ' (' + lecture.c_ID + ')');
                } else {
                    cell.hide(); 
                }
            }
        });
  }
});
</script>
</head>
<body style="margin: 0; height: 1px;">
   <table class="header" >
      <tr style="margin-left: 5px; border-top: 2px solid #168; border-bottom: 2px solid #168; background-color: #f0f6f9;">
         <td class="header_cell" style="border-left: 2px solid #168;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름 / 학번 / 학과</td>
         <td class="header_cell" colspan="2">
           &nbsp;<input readonly id="name" class="readonly" size="6" value="${getTimeTableinfo.name }"/>
            <input readonly id="ID" class="readonly" size="6" value="${getTimeTableinfo.ID }"></input>
            <input readonly id="d_name" class="readonly" size="6" value="${getTimeTableinfo.d_name }"></input>
         </td>
         <td class="header_cell" colspan="2">
         	<button id="login" >
               <a href="${root }logout" style="text-decoration: none; color: white;">로그아웃</a>
         	</button>&nbsp;&nbsp;
         	<button id="login" >
               <a href="${root }ma/index" style="text-decoration: none; color: white;">홈페이지</a>
         	</button>&nbsp;&nbsp;
         </td>
         
      </tr>
      
      <tr style="margin-left: 5px; border-top: 2px solid #168; border-bottom: 2px solid #168; background-color: #f0f6f9;">
         <td class="header_cell" colspan="3" style="border-left: 2px solid #168;">
            &nbsp;&nbsp;구분 :&nbsp;<select class="choose" name="completion">
               <option value="전공">전공</option>
               <option value="교양">교양</option>
            </select>
            학년 :&nbsp;<select class="choose" name="grade">
               <option value="1">1학년</option>
               <option value="2">2학년</option>
               <option value="3">3학년</option>
               <option value="4">4학년</option>
            </select>
            
         </td>
         <td class="header_cell"></td>
         <td class="header_cell"></td>
      </tr>
      <tr style="margin-left: 5px; border-top: 2px solid #168; background-color: #f0f6f9;">
         <td class="header_cell" colspan="3" style="border-left: 2px solid #168;">
            &nbsp;&nbsp;교과목명 :&nbsp;<input id="searchValue"  type="text" size="54" style="border-radius: 5px; border: 1px solid #168; ">
            &nbsp;<button id="select" style="border-radius: 5px; border: 1px solid #168; color:#168; background: white;">검색</button>
         </td>
         <td class="header_cell"></td>
         <td class="header_cell"></td>
      </tr>
      <tr style="background-color: #f0f6f9;">
         <td class="header_cell" style="border-left: 2px solid #168;"></td>
         <td class="header_cell"></td>
         <td class="header_cell"></td>
         <td class="header_cell"></td>
         <td class="header_cell"></td>
      </tr>
   </table>
   <section class="main">
      <div>
          <table id="resultTable" style="width: 100%; height:100%; border-collapse: collapse;" >
            <tr style="margin:0px; width:70%; border-top: 2px solid #168; border-bottom: 2px solid #168; background-color: #f0f6f9; position: fixed;">
               <td class="cell" style="width: 42px; margin: 0px;" align="center">구분</td>
               <td class="cell" style="width: 130.87px;" align="center">학과코드</td>
               <td class="cell" style="width: 286.87px;"align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교과목명</td>
               <td class="cell" style="width: 180.2px; padding-left: 2px;"align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학년</td>
               <td class="cell" style="width: 78.2px; padding-left: 2px;"align="center">학점</td>
               <td class="cell" style="width: 66.03px;"align="center">&nbsp;&nbsp;교수명</td>
               <td class="cell" style="width: 76.2px;"align="center">&nbsp;&nbsp;&nbsp;요일</td>
               <td class="cell" style="width: 108.87px;" align="center">강의시간</td>
               <td class="cell" style="width: 104.03px;"align="center">강의실</td>
               <td class="cell" style="width: 118.87px;"align="center">수강인원</td>
               <td class="cell" style="width: 74.2px;padding-right: 14px;" align="center">선택</td>
            </tr>
            <tbody id="resultBody">
             
               <tr align="center">
                  <td class="cell" style="width: 44px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">구분</td>
                  <td class="cell" style="width: 90px;">학과코드</td>
                  <td class="cell" style="width: 276px;">교과목명</td>
                  <td class="cell" style="width: 66px;">학년</td>
                  <td class="cell" style="width: 42px;">학점</td>
                  <td class="cell" style="width: 66px;">교수명</td>
                  <td class="cell" style="width: 52px;">요일</td>
                  <td class="cell" style="width: 70px;">강의시간</td>
                  <td class="cell" style="width: 70px;">강의실</td>
                  <td class="cell" style="width: 66px;">수강인원</td>
                  <td class="cell" style="width: 42px;">선택</td>
               </tr>
               
         </tbody>
            
<%--             <tr>
               <c:forEach var="time" begin="1" end="20">
                  <tr style="border: 1px solid #ccc; background: white;">
                     <td align="center" style="width: 40px; border: 0.5px solid #ccc; background: #f0f6f9;">${time}</td>
                     <c:forEach var="day" items="${day}">
                        <td align="center" style="padding: 0; margin: 0; border: 0.5px solid #ccc;"></td>
                     </c:forEach>
                  </tr>
               </c:forEach>
            </tr> --%>
         </table>
      </div>
   </section>
   
   <section class="footer">
      <div>
         <table id="resultTable" style="width: 100%; height:100%; border-collapse: collapse;" >
            <tr style="margin:0px; width:70%; border-top: 2px solid #168; border-bottom: 2px solid #168; background-color: #f0f6f9;">
               <td class="cell" style="width: 42px; margin: 0px;" align="center">구분</td>
               <td class="cell" style="width: 130.87px;" align="center">학과코드</td>
               <td class="cell" style="width: 286.87px;"align="center">교과목명</td>
               <td class="cell" style="width: 180.2px; padding-left: 2px;"align="center">학년</td>
               <td class="cell" style="width: 78.2px; padding-left: 2px;"align="center">학점</td>
               <td class="cell" style="width: 80.03px;"align="center">교수명</td>
               <td class="cell" style="width: 76.2px;"align="center">요일</td>
               <td class="cell" style="width: 108.87px;" align="center">강의시간</td>
               <td class="cell" style="width: 104.03px;"align="center">강의실</td>
               <td class="cell" style="width: 118.87px;"align="center">수강인원</td>
               <td class="cell" style="width: 50.2px;padding-right: 14px;" align="center">삭제</td>
            </tr>
               
            <tbody id="resultBody">
             
               <tr align="center">
                  <td class="cell" style="width: 44px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">구분</td>
                  <td class="cell" style="width: 90px;">학과코드</td>
                  <td class="cell" style="width: 276px;">교과목명</td>
                  <td class="cell" style="width: 66px;">학년</td>
                  <td class="cell" style="width: 42px;">학점</td>
                  <td class="cell" style="width: 66px;">교수명</td>
                  <td class="cell" style="width: 52px;">요일</td>
                  <td class="cell" style="width: 70px;">강의시간</td>
                  <td class="cell" style="width: 70px;">강의실</td>
                  <td class="cell" style="width: 66px;">수강인원</td>
                  <td class="cell" style="width: 40px;">삭제</td>
               </tr>
               
         </tbody>
<%--             <tr>
               <c:forEach var="time" begin="1" end="20">
                  <tr style="border: 1px solid #ccc; background: white;">
                     <td align="center" style="width: 40px; border: 0.5px solid #ccc; background: #f0f6f9;">${time}</td>
                     <c:forEach var="day" items="${day}">
                        <td align="center" style="padding: 0; margin: 0; border: 0.5px solid #ccc;"></td>
                     </c:forEach>
                  </tr>
               </c:forEach>
            </tr>  --%>     
         </table>
      </div>
   </section>
   <section class="right">
      <div>
         <table id="timetable" style="border-collapse: collapse;">
            <tr style="border-top: 2px solid #444; border-bottom: 2px solid #168; background-color: #f0f6f9; color: #168; height: 41px;">
               <th style="border: 1px solid #ccc; padding: 5px; border-left: 2px solid #168;"></th>
               <th style="border: 1px solid #ccc; padding: 5px;">월</th>
               <th style="border: 1px solid #ccc; padding: 5px;">화</th>
               <th style="border: 1px solid #ccc; padding: 5px;">수</th>
               <th style="border: 1px solid #ccc; padding: 5px;">목</th>
               <th style="border: 1px solid #ccc; padding: 5px;">금</th>
            </tr>
            <c:forEach var="time" begin="1" end="14">
               <tr style="border: 1px solid #ccc;">
                  <td class="timetable-time" align="center" style="width: 40px; height: 52.3px; border: 2px solid #168; background-color: #f0f6f9; font-weight: bold;">${time}</td>
                  <c:forEach var="day" begin="1" end="5">
                     <c:set var="printed" value="false" />
                     <c:forEach var="lecture" items="${enTimeTableList}">
                        <c:if test="${lecture.day eq day && lecture.starttime == time}">
                           <c:set var="rowspan" value="${lecture.endtime - lecture.starttime + 1}" />
                           <td align="center" style="width: 75px; padding: 0; margin: 0; border: 1px solid #3d3d3d; " rowspan="${rowspan}"><span style="font-size: 11px; ">${lecture.lec_name}&nbsp;(${lecture.c_ID})</span>
                           </td>
                           <c:set var="printed" value="true" />
                        </c:if>
                     </c:forEach>
                     <c:if test="${!printed}">
                        <c:set var="skipCell" value="false" />
                        <c:forEach var="lecture" items="${enTimeTableList}">
                           <c:if test="${lecture.day eq day && lecture.starttime < time && lecture.endtime >= time}">
                              <c:set var="skipCell" value="true" />
                           </c:if>
                        </c:forEach>
                        <c:if test="${!skipCell}">
                           <td align="center" style="width: 75px; padding: 0; margin: 0; border: 1px solid #3d3d3d;"></td>
                        </c:if>
                     </c:if>
                  </c:forEach>
               </tr>
            </c:forEach>


         </table>
      </div>
   </section>
</body>
</html>
</body>
</html>