<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.weatherSub {
    display: flex;
    justify-content: space-between;
}
#weatherImage{
   width: 50%;
   height: 50%;
   padding-left: 10%;
   padding-right: 10%;
}

#weatherTable{
   position: relative;
   width: 50%;
   border: 1;

}


</style>
<meta charset="UTF-8">
<title>Weather Information</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var weatherData = JSON.parse('${weatherData}');

    $(document).ready(function() {
        // 테이블에 행 추가하기
        var categories = ["T1H", "RN1", "REH"];
        var categoryLabels = {"T1H": "온도","RN1": "강수량" ,"REH": "습도"};
   
        for (var i = 0; i < categories.length; i++) {
            var category = categories[i];
            var fcstValue = weatherData[category];
         
            // 온도(T1H) 값 뒤에 '℃' 붙이기
            if (category === 'T1H') {
                fcstValue += '℃';
            }

            // 습도(REH) 값 뒤에 '%' 붙이기
            if (category === 'REH') {
                fcstValue += '%';
            }
            
            // 강수량(RN1) 값에 조건 붙이기
            if (category === 'RN1') {
                if (fcstValue === null || fcstValue === '-' || fcstValue === 0 || fcstValue === '강수없음') {
                    fcstValue = '강수없음';
                } else {
                    var f = parseFloat(fcstValue);
                    if (f < 1.0) {
                        fcstValue = '1.0mm미만';
                    } else if (f >= 1.0 && f < 30.0) {
                        fcstValue = '1.0~29.0mm';
                    } else if (f >= 30.0 && f < 50.0) {
                        fcstValue = '30.0~50.0mm';
                    } else {
                        fcstValue = '50.0mm이상';
                    }
                }
            }
            
            var newRow = '<tr>'
                       + '<td>' + categoryLabels[category] + '</td>'
                       + '<td>' + fcstValue + '</td>'
                       + '</tr>';

            $('#weatherTable').append(newRow);
        }

        

        // 현재 시간 표시하기
        var currentTime = weatherData["currentTime"];
        $('#currentTime').text(currentTime + "시 기준");
        
        // 이미지 출력하기
        var skyValue = weatherData["SKY"];
        var ptyValue = weatherData["PTY"];
        var weatherImageSrc = '';

        if (ptyValue === '0' || ptyValue === null) {
            switch (skyValue) {
                case '1':
                    weatherImageSrc = '${root }images/sun.png';
                    break;
                case '3':
                    weatherImageSrc = '${root }images/cloudy-day.png';
                    break;
                case '4':
                    weatherImageSrc = '${root }images/cloud.png';
                    break;
                default:
                    break;
            }
        } else {
            switch (ptyValue) {
                case '1':
                case '2':
                case '5':
                case '6':
                    weatherImageSrc = '${root }images/raining.png';
                    break;
                case '3':
                case '7':
                    weatherImageSrc = '${root }images/snow.png';
                    break;
                default:
                    break;
            }
        }

        $('#weatherImage').attr('src', weatherImageSrc);
    });
</script>
</head>
<body>
    <dlv class="weatherSub">
       <div style="padding-left: 3%;"><h4 id="currentTime"></h4></div>
       <div class="msg1"><h4>출처 : <a href="https://www.weather.go.kr/w/weather/forecast/short-term.do">기상청 날씨누리</a>&nbsp;&nbsp;&nbsp;</h4></div>
    </dlv>
    <div style="float: right; font-size: 11pt;">서울시 종로구&nbsp;&nbsp;&nbsp;</div>
    <p><p>
    <div style="display: flex; padding-top: 5%; justify-content: space-between; width: 90%">
       <img id="weatherImage" src="" alt="날씨 이미지" />
       <table id="weatherTable">
       </table>
    </div>
    <div id="ptyValue"></div>   
    <div id="skyValue"></div>
</body>
</html>