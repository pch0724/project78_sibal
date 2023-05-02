<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <title>GPA Check</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
    
<style type="text/css">
    #chart-container {
        width: 60%;
        height: 60%;
    }

    #gpaChart {
        width: 100%;
        height: 100%;
    }

   	h4 {
        margin-bottom: 2%;
    }
    
    #all{
    	display: flex;
    }
    
    #grade-table{
    	padding-top: 1%;
    }
    
</style>
</head>
<body>
<h4>누적 성적 현황</h4>
<div id="all">
    <div id="chart-container">
        <canvas id="gpaChart"></canvas>
    </div>
    <div id="grade-table">
	  <table>
	    <thead>
	      <tr>
	        <th>성적</th>
	        <th>과목 수</th>
	      </tr>
	    </thead>
	    <tbody id="grade-tbody">
	    </tbody>
	  </table>
	</div>
</div>

    <script type="text/javascript">
    $.getScript("https://cdn.jsdelivr.net/npm/chart.js", function() {
    	$.getScript("https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels", function() {
    	$(document).ready(function () {
        	const gradeDistribution = {
        	        A_plus: ${gradeDistribution.A_PLUS},
        	        A: ${gradeDistribution.A},
        	        B_plus: ${gradeDistribution.B_PLUS},
        	        B: ${gradeDistribution.B},
        	        C_plus: ${gradeDistribution.C_PLUS},
        	        C: ${gradeDistribution.C},
        	        D_plus: ${gradeDistribution.D_PLUS},
        	        D: ${gradeDistribution.D},
        	        F: ${gradeDistribution.F}
        	    }; <%-- 서버로부터 전달받은 학점 분포 데이터 --%>
            const ctx = document.getElementById("gpaChart").getContext("2d");

            const chart = new Chart(ctx, {
            	plugins: [ChartDataLabels],
                type: "pie",
                data: {	
                    labels: ["A+", "A", "B+", "B", "C+", "C", "D+", "D", "F"],
                    datasets: [{
                        data: [
                            gradeDistribution.A_plus,
                            gradeDistribution.A,
                            gradeDistribution.B_plus,
                            gradeDistribution.B,
                            gradeDistribution.C_plus,
                            gradeDistribution.C,
                            gradeDistribution.D_plus,
                            gradeDistribution.D,
                            gradeDistribution.F
                        ],	
                        backgroundColor: [
                        	"#CC0000",  <%--A+--%>
                            "#FF0000",  <%--A--%>
                            "#FFCE56",  <%--B+--%>
                            "#CCCC00",  <%--B--%>
                            "#00CC00",  <%--C+--%>
                            "#00FF00",  <%--C--%>
                            "#0000CC",  <%--D+--%>
                            "#0000FF",  <%--D--%>
                            "#A0A0A0"   <%--F--%>
                        ]
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                    	datalabels: {
                            display: function(context) {
                                return context.dataset.data[context.dataIndex] !== 0;
                            },
                            color: 'black',
                            align: 'center',
                            anchor: 'center',
                            formatter: function(value, context) {
                                return value;
                            }
                    	},
                        legend: {
                            display: true,
                            position: 'right'
                        }
                    }
                }
            });
            updateGradeTable(gradeDistribution);
        });
        function updateGradeTable(gradeDistribution) {
        	  const gradeLabels = ["A+", "A", "B+", "B", "C+", "C", "D+", "D", "F"];
        	  const gradeValues = [
        	    gradeDistribution.A_plus,
        	    gradeDistribution.A,
        	    gradeDistribution.B_plus,
        	    gradeDistribution.B,
        	    gradeDistribution.C_plus,
        	    gradeDistribution.C,
        	    gradeDistribution.D_plus,
        	    gradeDistribution.D,
        	    gradeDistribution.F
        	  ];

        	  const tbody = document.getElementById("grade-tbody");
        	  tbody.innerHTML = "";

        	  gradeLabels.forEach((label, index) => {
        	    if (gradeValues[index] !== 0) {
        	      const row = document.createElement("tr");

        	      const gradeCell = document.createElement("td");
        	      gradeCell.textContent = label;
        	      row.appendChild(gradeCell);

        	      const countCell = document.createElement("td");
        	      countCell.textContent = gradeValues[index] + "개";
        	      row.appendChild(countCell);

        	      tbody.appendChild(row);
        	    }
        	  });
        	}
    	});
    });
    </script>
</body>
</html>