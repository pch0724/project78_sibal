<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>credits check</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style type="text/css">
    #chart-container {
        width: 50%;
        height: 70%;
        position: relative;
    }

    #creditChart {
        width: 100%;
        height: 100%;
        
    }

    #table-container {
    	
        width: 50%;
    }
    
   	
</style>
</head>
<body>
<h4>&nbsp;&nbsp;학점취득현황</h4>
<div style="display: flex;">
    <div id="chart-container">
        <canvas id="creditChart"></canvas>
    </div>
    <div id="table-container">
        <table style="margin-top: 45px;">
            <tr>
                <th></th>
                <th>취득</th>
                <th>수강</th>
            </tr>
            <tr>
               <td>전공</td>
			    <td id="major-earned"></td>
			    <td id="major-taken"></td>
			</tr>
			<tr>
			    <td>교양</td>
			    <td id="liberal-earned"></td>
			    <td id="liberal-taken"></td>
            </tr>
        </table>
    </div>
</div>
	
<script type="text/javascript">
$(document).ready(function() {
    // 취득학점 그래프
    <%-- 서버에서 취득한 학점 정보를 가져옵니다. --%>
    fetch('${root }ma/credits')
        .then(response => response.json()) <%-- 응답을 JSON으로 변환합니다. --%>
        .then(data => {
        	<%-- 취득한 학점 정보를 이용하여 도넛 차트를 그립니다. --%>
        	<%-- canvas 요소의 2D 렌더링 컨텍스트를 가져옵니다. 
        	'creditChart'라는 ID를 가진 요소의 2D 렌더링 컨텍스트를 ctx 변수에 저장합니다.  --%>
            const ctx = document.getElementById('creditChart').getContext('2d');
            
            <%-- Chart 객체를 생성하여 도넛 차트를 그립니다. 차트의 설정들은 위의 객체 리터럴 형식으로 전달됩니다. 
            설정에는 차트 유형, 레이블, 데이터, 색상, 가로 세로 비율 유지 여부, 범례 표시 여부 등이 포함됩니다 --%>
            const chart = new Chart(ctx, {
                type: 'doughnut', <%-- 차트 유형을 도넛으로 설정합니다. --%>
                data: {
                    labels: ['전공', '교양'],<%-- 차트의 레이블을 설정합니다. --%>
                    datasets: [{
                        data: [data['전공'], data['교양']],<%-- 각 레이블에 대한 데이터를 설정합니다. --%>
                        backgroundColor: ['#4e73df', '#1cc88a']<%-- 차트의 색상을 설정합니다. --%>
                    }]
                },
                options: {
                    maintainAspectRatio: false,<%-- 차트의 가로 세로 비율을 유지하지 않습니다. --%>
                    plugins: {
                        legend: {
                            display: true<%-- 범례를 표시합니다. --%>
                        }
                		
                    }
                }
            });
            <%-- 테이블에 취득한 전공 학점과 교양 학점을 표시합니다. --%>
            document.getElementById("major-taken").textContent = data['전공'];
            document.getElementById("liberal-taken").textContent = data['교양'];
            

            
        });

    // 신청학점 받아오기, 표에 값넣기
    <%-- 서버에서 신청한 학점 정보를 가져옵니다. --%>
    fetch('${root }ma/appliedcredits')
        .then(response => response.json())<%-- 응답을 JSON으로 변환합니다. --%>
        .then(data => {
        	<%-- 테이블에 신청한 전공 학점과 교양 학점을 표시합니다. --%>
            document.getElementById("major-earned").textContent = data['전공'];
            document.getElementById("liberal-earned").textContent = data['교양'];
        })
        .catch(error => {
        	<%-- 데이터를 가져오는 데 실패한 경우 오류를 출력합니다. --%>
            console.log("Error fetching data:", error);
        });
});

</script>
</body>
</html>