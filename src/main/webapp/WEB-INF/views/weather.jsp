<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.weatherSub {
    display: flex;
    justify-content: space-between;
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

     	// SKY 값 표시하기
        var skyValue = weatherData["SKY"];
        switch (skyValue) {
            case '1':
                skyValue = '맑음';
                break;
            case '3':
                skyValue = '구름많음';
                break;
            case '4':
                skyValue = '흐림';
                break;
            default:
                break;
        }
        $('#skyValue').text("SKY 값: " + skyValue);

        // PTY 값 표시하기
        var ptyValue = weatherData["PTY"];
        switch (ptyValue) {
            case '0':
                ptyValue = '없음';
                break;
            case '1':
                ptyValue = '비';
                break;
            case '2':
                ptyValue = '비/눈';
                break;
            case '3':
                ptyValue = '눈';
                break;
            case '5':
                ptyValue = '빗방울';
                break;
            case '6':
                ptyValue = '빗방울눈날림';
                break;
            case '7':
                ptyValue = '눈날림';
                break;
            default:
                break;
        }
        $('#ptyValue').text("PTY 값: " + ptyValue);

        // 현재 시간 표시하기
        var currentTime = weatherData["currentTime"];
        $('#currentTime').text(currentTime + "시 기준");
    });
</script>
</head>
<body>
    <dlv class="weatherSub">
	    <div><h4 id="currentTime"></h4></div>
	    <div class="msg1"><h4>출처 : <a href="https://www.weather.go.kr/w/weather/forecast/short-term.do">기상청 날씨누리</a></h4></div>
    </dlv>
    <div style="float: right; font-size: 11pt;">서울시 종로구</div>
    <table id="weatherTable" border="1">
        
    </table>
    <div id="ptyValue"></div>
    <div id="skyValue"></div>
</body>
</html>
