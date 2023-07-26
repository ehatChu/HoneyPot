<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- chart.js CDN -->
		<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
		<!-- CSS -->
		<link rel="stylesheet" href="/app/resources/css/member/mypage/fee/list.css">
	</head>

	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav>
				<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
				<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
			</nav>

			<main>
				<div id="wrap">
					<div id="fee-area">
						<div class="total-area">
							<div class="select-area">
								<select name="" id="date-box">
									<!-- 현재 달부터 5개의 달 조회-->
									<option value="2023-02">2023년 02월분</option>
									<option value="2023-03">2023년 03월분</option>
									<option value="2023-04">2023년 04월분</option>
									<option value="2023-05">2023년 05월분</option>
									<option value="2023-06" selected>2023년 06월분</option>
								</select>
							</div>
							<div class="price-area">
								<div class="priceBox"><div class="won" id="memberTotal">${memberTotal}</div> 원</div>
								<span>납부일자 : ${mfvoList[0].paymentDate}</span>
							</div>
							<div class="detail-area"><span>상세내역</span></div>
						</div>
						<div class="detail-content-area">
							<table>
								<thead>
									<tr>
										<th>항목</th>
										<th>금액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${mfvoList}" var="list">
										<tr>
											<td>${list.categoryName}</td>
											<td><div id="listPrice">${list.price}</div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div id="chart-area">
						<div class="title">우리집 관리비 전월/전년 비교</div>
						<div class="bar-chart-area">
							<canvas id="priceChart"></canvas>
						</div>
						<div class="line-chart-area">
							<div>당해 <span class="category_area">일반관리비</span> 추이</div>
							<canvas id="category_Chart"></canvas>
						</div>
					</div>
				</div>
			</main>

	</body>

	</html>

	<script>
		
		// 헤더 함수 실행
		basicSetting();
		firstNav(['내정보', '나의활동', '신청내역', '관리비'],'관리비');
		secondNav(['조회', '납부'],'조회');
    	headerName('마이페이지');

		// 숫자를 3자리마다 쉼표가 있는 문자열로 변환하는 함수
		function addCommasToNumberInElement(element) {
			const text = element.textContent;
			const number = parseFloat(text.replace(/,/g, '')); // 쉼표를 제거한 후 숫자로 변환
			if (!isNaN(number)) {
			const formattedNumber = number.toLocaleString();
			element.textContent = formattedNumber; // 쉼표가 있는 형식으로 변경하여 다시 업데이트
			}
		}

		// 페이지 로드 후 해당 함수를 호출하여 각 요소의 텍스트를 적절하게 포맷팅
		window.onload = function () {
			const priceElements = document.querySelectorAll('#listPrice');
			priceElements.forEach((element) => {
			addCommasToNumberInElement(element);
		});

			const memberTotalElement = document.getElementById('memberTotal');
			if (memberTotalElement) {
			addCommasToNumberInElement(memberTotalElement);
			}
	};


		//////// 관리비 전월/전년 대비 차트 함수 
		function drawChart(chartData) {
		var ctx = document.getElementById("priceChart").getContext('2d');
		var myChart = new Chart(ctx, {
			type: 'bar',
			data: {
			labels: chartData.labels,
			datasets: [{
				data: chartData.data,
				backgroundColor: chartData.backgroundColor,
			}]
			},
			options: {
			legend: {
				display: false
			}}
		});
		}

		// DB 에서 정보 가져오기
		function loadChartData() {
		$.ajax({
			url: '/app/fee/member/bar-chart', 
			method: 'GET',
			dataType: 'json',
			success: function (data) {
			console.log(data);
			drawChart(data);
            },
			error: function (error) {
			console.log(error);
			}
		});
		}

		//데이터 차트 그리기 함수 실행
		$(document).ready(function () {
		loadChartData();
		});



		//////// 관리비 항목별 라인 함수 
		function L_drawChart(chartData) {
		var ctx = document.getElementById("category_Chart").getContext('2d');
		var myChart = new Chart(ctx, {
			type: 'line',
			data: {
			labels: chartData.labels,
			datasets: [{
				data: chartData.data,
				backgroundColor: chartData.backgroundColor,
			}]
			},
			options: {
			legend: {
				display: false
			}}
		});
		}

		// DB 에서 정보 가져오기
		function L_loadChartData() {
		$.ajax({
			url: '/app/fee/member/line-chart', 
			method: 'GET',
			dataType: 'json',
			success: function (data) {
			console.log(data);
			L_drawChart(data);
			
            },
			error: function (error) {
			console.log(error);
			}
		});
		}

		//데이터 차트 그리기 함수 실행
		$(document).ready(function () {
		L_loadChartData();
		});

	</script>