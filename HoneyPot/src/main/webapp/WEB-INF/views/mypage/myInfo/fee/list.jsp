<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- chart.js CDN -->
		<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script>
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
								<form id="memberFeeForm" action="/app/fee/member" method="GET">
									<select id="paymentDate" name="searchValue"> 
										<option value="" selected></option>
										<option value=""></option>
										<option value=""></option>
										<option value=""></option>
										<option value=""></option>
									</select>
									<button type="submit" id="searchBtn"><i class="fa-solid fa-magnifying-glass fa-2x" style="color:#ffffff" ></i></button>
								</form>
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
											<td onclick="showCategoryName('${list.categoryName}')">${list.categoryName}</td>
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
							<div>당해 <span id="display_category_name"></span> 추이</div>
							<div id="categoryC"><canvas id="category_Chart"></canvas></div>
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

		// 페이지 로드 후 금액에 포맷팅
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
			plugins:[ChartDataLabels],
			data: {
			labels: chartData.labels,
			datasets: [{
				data: chartData.data,
				backgroundColor: chartData.backgroundColor,
			}]
			},
			options: {
			plugins:{
				legend: { // 범례 사용 안 함
				display: false,
				},
				tooltip: { // 기존 툴팁 사용 안 함
				enabled: false
				},
				animation: { // 차트 애니메이션 사용 안 함 (옵션)
				duration: 0,
				},
				datalabels: { // datalables 플러그인 세팅
				formatter: function (value, context) {
					var idx = context.dataIndex; // 각 데이터 인덱스

					// 출력 텍스트
					return value.toLocaleString() + '원';
					},
					font: { // font 설정
					weight: 'bold',
					size: '22px',
				},
				color: '#222', // font color
				}
			}
		}
	}
)};
		
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

		var myChart;

		////// 관리비 항목별 라인 함수 
		function L_drawChart(chartData) {

			var ctx = document.getElementById("category_Chart").getContext('2d');

			// 이전 차트가 존재하는지 확인하고 있다면 데이터만 업데이트
			if (myChart) {
				myChart.data = {
					labels: chartData.labels,
					datasets: [{
						data: chartData.data,
						backgroundColor: chartData.backgroundColor,
						borderColor : '#fad355'
					}]
				};
				myChart.update();
			} else {
				myChart = new Chart(ctx, {
					type: 'line',
					plugins: [ChartDataLabels],
					data: {
						labels: chartData.labels,
						datasets: [{
							data: chartData.data,
							backgroundColor: chartData.backgroundColor,
							borderColor : '#fad355'
						}]
					},
					options: {
						plugins: {
							legend: { display: false },
							tooltip: { enabled: false },
							animation: { duration: 0 },
							datalabels: {
								formatter: function (value) {
									// 데이터 레이블의 값에 콤마 추가하여 반환
									return value.toLocaleString() + '원';
								},
								anchor: 'center', // 데이터 레이블의 중앙 기준으로 정렬
								align: 'start', // 데이터 레이블의 왼쪽 기준으로 정렬
								offset: 5, // 데이터 레이블의 위치를 아래쪽으로 조정 (5px 아래로)
								font: {
									weight: 'bold',
									size: '13px',
								},
								color: '#222',
							}
						},
						responsive: true,
						maintainAspectRatio: false, 
						scales: {
							x: {
								ticks: {
									padding: 30 // labels 영역을 아래로 30px 내림
								}
							},
							y: {
								ticks: {
									padding: 20 // labels 영역을 아래로 20px 내림
								}
							}
						}
					}
				});
			}
		}

		// 카테고리 이름 차트 함수에 전달
		$(document).ready(function () {
		$('table tbody tr').on('click', function () {
			var categoryName = $(this).find('td:first').text(); 
			L_loadChartData(categoryName); 
		});
	});

		// DB에서 정보 가져오기
		function L_loadChartData(categoryName) {
		$.ajax({
			url: '/app/fee/member/line-chart',
			method: 'GET',
			dataType: 'json',
			data: { categoryName: categoryName },
			success: function (data) {
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

		// 선택한 카테고리 이름 삽입
		function showCategoryName(categoryName) {
	document.getElementById('display_category_name').innerText = categoryName;
	}

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

		// 가장 최신 날짜를 기본 선택으로 설정
		accountDateSelect.value = recentMonths[0];
		}

		// 날짜 검색 푸쉬 함수 호출
		addOptionsToAccountDateSelect();


		

	
	</script>