<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.logo img {
   margin-top:10px;
   margin-left:2%;
   width: 145px;
   height: 58px;
}
a{
text-decoration: none;
 color: white
}
ul{
   list-style:none;
   list-style-type: none;
    padding-left:0; 
    margin-left:0;
   }
.collapsible {
            background-color: #424242;
            color: white;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
        }
        .active,
        .collapsible:hover {
            background-color: #555;
        }
        .content {
            padding: 0 18px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
            background-color: .collapsible {
            background-color: #424242;
            color: white;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
        }
        .active,
        .collapsible:hover {
            background-color: #424242;
        }
        .content {
            padding: 0 18px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
            background-color: #424242;
        }
        .collapsible:after {
            content: '\002B';
            color: white;
            font-weight: bold;
            float: right;
            margin-left: 5px;
        }
        .active:after {
            content: "\2212";
        };
        }
        .collapsible:after {
            content: '\002B';
            color: white;
            font-weight: bold;
            float: right;
            margin-left: 5px;
        }
        .active:after {
            content: "\2212";
        }
</style>
<title>Insert title here</title>
</head>
<script>
function collapse(element) {
    var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
    if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
        before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
        before.classList.remove("active");                  // 버튼 비활성화
    }
    element.classList.toggle("active");         // 활성화 여부 toggle

    var content = element.nextElementSibling;
    if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
        content.style.maxHeight = null;         // 접기
    } else {
        content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
    }
}
</script>
<body style="margin: 0;">
   <div style="position: absolute; background-color: navy; width: 100%; height: 8%;">
      <div class="logo"> <img src="${root }images/78_2.png" alt="Logo" /></div>
   </div>
   <div style="width: 100%; height: 734px; float: left; display: flex;">
      <div style="position: absolute; top:8%; width: 15%; height: 100%; background-color: #424242;">
         <ul>
            <li style="margin-bottom: 5px;">
               <button type="button" class="collapsible" onclick="collapse(this);">
                  학적정보
               </button>
               <div class="content">
                  <ul>
                     <li><a href="${root }academy/personal_info">개인정보수정</a></li>
                  </ul>
               </div>
            </li>
            <li style="margin-bottom: 5px;">
              <button type="button" class="collapsible" onclick="collapse(this);">
                  수업
               </button>
              <div class="content">
                  <ul>
                     <li><a href="${root }enrollment/index">수강신청</a></li>
                     <li><a href="${root }academy/enrollment">수강신청현황</a></li>
                     <li><a href="${root }academy/timetable">시간표조회</a></li>
                  </ul>
               </div>
            </li>
            <li style="margin-bottom: 5px;">
              <button type="button" class="collapsible" onclick="collapse(this);">
                  성적
               </button>
               <div class="content">
                  <ul>
                     <li><a href="${root }academy/grade_check">금학기 성적조회</a></li>
                     <li><a href="${root }academy/all_grade_check">전체 성적조회</a></li>
                     <li><a href="${root }academy/grade_input">성적 입력</a></li>
                  </ul>
               </div>
            </li>
            <li style="margin-bottom: 5px;">
               <button type="button" class="collapsible" onclick="collapse(this);">
                  강의평가
               </button>
               <div class="content">
                  <ul>
                     <li><a href="${root }evaluation/mid">중간강의평가</a></li>
                     <li><a href="${root }evaluation/fin">기말강의평가</a></li>
                  </ul>
               </div>
            </li>
         </ul>
      </div>
   
   </div>
</body>
</html>