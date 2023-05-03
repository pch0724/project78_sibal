<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = 'root' value = "${pageContext.request.contextPath }/"/> <!-- 절대경로 설정 : -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중간 강의평가 입력</title>
<style type="text/css">
.contents {
   background: url("${root }images/blue.jpg");
   background-size: 100%;
   background-repeat: no-repeat;
   min-height: 1300px;
   padding-top: 30px;
}
body {
        /*background-color: #05c46b;*/
        font-family: Verdana;
        text-align: center;
    }

form {
        background-color: #fff;
        max-width: 500px;
        margin: 50px auto;
        padding: 30px 20px;
        box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);
        }

button {
        background-color: skyblue;
        border: 1px solid #777;
        border-radius: 2px;
        font-family: inherit;
        font-size: 21px;
        display: block;
        width: 100%;
        margin-top: 50px;
        margin-bottom: 20px;
        }
        

 .form-control input,
 .form-control select,
 .form-control textarea {
     border: 1px solid #777;
     border-radius: 2px;
     font-family: inherit;
     padding: 10px;
     display: block;
     width: 95%;
 }
        

 .form-control input[type="radio"],
 .form-control input[type="checkbox"] {
     display: inline-block;
     width: auto;
 }
        
/* Styling form-control Class */
 .form-control {
     text-align: left;
     margin-bottom: 25px;
 }

 /* Styling form-control Label */
 .form-control label {
     display: block;
     margin-bottom: 10px;
 }
 h4{
    font-size: 11pt;
 }

</style>
</head>
<body>
<!-- 강의평가 입력 -->
   <div class = "contents">
   
   <form:form action="${root }evaluation/mid_eval_pro" method="post" modelAttribute="writeEvalBean" onsubmit="return validateForm()">
   
   <form:hidden path="lec_ID"/>
   <form:hidden path="std_ID"/>
   <div class="form-control">
      <div class="subtitle" style="display: flex; justify-content: space-between;">
      <div><h2>강의평가</h2></div>
      <div>
         <h4>학수번호 : ${lec_ID }</h4>
         <h4>교과목명 : ${lec_name }</h4>
         <h4>교수명 : ${name }</h4>
      </div>
      </div>
      <label><b>Q1.나는 이 교과목에 흥미를 가지고 적극적으로 참여하였다</b><br>
①매우그렇다 ②그렇다 ③보통 ④그렇지않다 ⑤전혀그렇지않다<br> (*전문항동일)</label>
      <form:radiobutton path="items1" value="1" />1
      <form:radiobutton path="items1" value="2" />2
      <form:radiobutton path="items1" value="3" />3
      <form:radiobutton path="items1" value="4" />4
      <form:radiobutton path="items1" value="5" />5
      <p>
      
      <label><b>Q2.교수님은 규정된 수업시간(결강, 휴보강 관련)을 준수하였습니까?</b></label>
      <form:radiobutton path="items2" value="1" />1
      <form:radiobutton path="items2" value="2" />2
      <form:radiobutton path="items2" value="3" />3
      <form:radiobutton path="items2" value="4" />4
      <form:radiobutton path="items2" value="5" />5
      <p>
      <label><b>Q3.교수님은 수업에 학생의 관심과 참여를 유도하기 위해 노력하였습니까?</b></label>
      <form:radiobutton path="items3" value="1" />1
      <form:radiobutton path="items3" value="2" />2
      <form:radiobutton path="items3" value="3" />3
      <form:radiobutton path="items3" value="4" />4
      <form:radiobutton path="items3" value="5" />5
      <p>
      <label><b>Q4.강의내용이 평가(이론시험, 실습, 구두평가, 보고서 등)에 적절히 반영되었습니까?</b></label>
      <form:radiobutton path="items4" value="1" />1
      <form:radiobutton path="items4" value="2" />2
      <form:radiobutton path="items4" value="3" />3
      <form:radiobutton path="items4" value="4" />4
      <form:radiobutton path="items4" value="5" />5
      <p>
      <form:label path="feedback"><h4>교수님께 하고 싶은 말이 있다면 적어주세요(최대 400자)</h4></form:label><br />
      <form:textarea path="feedback" rows="4" cols="50" />
   </div>
   <form:button type = "submit">제출</form:button>
   </form:form>
   </div>
   <script>
    function validateForm() {
        var items1 = document.getElementsByName("items1");
        var items2 = document.getElementsByName("items2");
        var items3 = document.getElementsByName("items3");
        var items4 = document.getElementsByName("items4");
        var feedback = document.getElementById("feedback");

        var items1_checked = false;
        var items2_checked = false;
        var items3_checked = false;
        var items4_checked = false;

        for (var i = 0; i < items1.length; i++) {
            if (items1[i].checked) {
                items1_checked = true;
                break;
            }
        }

        for (var i = 0; i < items2.length; i++) {
            if (items2[i].checked) {
                items2_checked = true;
                break;
            }
        }

        for (var i = 0; i < items3.length; i++) {
            if (items3[i].checked) {
                items3_checked = true;
                break;
            }
        }

        for (var i = 0; i < items4.length; i++) {
            if (items4[i].checked) {
                items4_checked = true;
                break;
            }
        }

        if (!items1_checked || !items2_checked || !items3_checked || !items4_checked) {
            alert("선택하지 않은 항목이 있습니다.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>