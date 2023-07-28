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
								<select id="paymentDate"> 
									<option value=""></option>
									<option value=""></option>
									<option value=""></option>
									<option value=""></option>
									<option value=""></option>
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
		firstNavLink(['','','','/app/fee/member']);
        secondNavLink(['/app/fee/member','/app/fee/member/pay']);

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


	// 이번 달부터 5개의 달 생성
	function makeCurrentMonths() {
		var currentDate = new Date();
		var recentMonths = [];

		for (var i = 0; i < 5; i++) {
			var year = currentDate.getFullYear();
			var month = currentDate.getMonth() + 1;
			if (month < 10) {
				month = "0" + month;
			}
			var formattedDate = year + "-" + month;
			recentMonths.push(formattedDate);

			currentDate.setMonth(currentDate.getMonth() - 1);
		}

		return recentMonths;
	}

	// 날짜 검색란에 옵션 추가 함수
	function addOptionsToAccountDateSelect() {
		var accountDateSelect = document.querySelector("#paymentDate");
		var recentMonths = makeCurrentMonths();
		var optionsHTML = "";

		for (var i = 0; i < recentMonths.length; i++) {
			optionsHTML += '<option value="' + recentMonths[i] + '">' + recentMonths[i].replace("-", "년 ") + '월</option>';
		}

		accountDateSelect.innerHTML = optionsHTML;

    
}

	// 날짜 검색 푸쉬 함수 호출
	addOptionsToAccountDateSelect();

	// #accountDate의 change 이벤트에 대한 처리
	var accountDateSelect = document.querySelector("#paymentDate");
	accountDateSelect.addEventListener("change", function () {
		var selectedDate = accountDateSelect.value;
	});



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



		////// 관리비 항목별 라인 함수 
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