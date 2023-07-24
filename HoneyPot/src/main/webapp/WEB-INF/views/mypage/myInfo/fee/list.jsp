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
								<div class="priceBox"><div class="won">${memberTotal }</div> 원</div>
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
											<td>${list.price}원</td>
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
							<canvas id="myChart"></canvas>
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

		// 금액칸 콤마 정규식
		function comma(price) {
				str = String(str);
				return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			}

		function uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, '');
		} 

		function inputNumberFormat(obj) {
			obj.value = comma(uncomma(obj.value));
		}

		// 금액들 콤마 처리
		const priceDiv = document.querySelector(".won");
		const price = priceDiv.innerHTML;
		console.log(price);


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
			var legendElement = $("#legend");
                legendElement.empty(); // 기존 내용 초기화

               
            },
			error: function (error) {
			console.log(error);
			}
		});
		}

		// 데이터 차트 그리기 함수 실행
		$(document).ready(function () {
		loadChartData();
		});



		//////// 라인 차트 함수
		function addZero(i) {
		var rtn = i + 100;
		return rtn.toString().substr(1, 3);
		}

		var monthList = [];
		// DB에서 꺼내온 걸로 바꿔주기
		var monthData = [21000,19500,20500,18700,23050,21590, 22750];

		var dt = new Date();
		var year = dt.getFullYear();
		var mon = addZero(eval(dt.getMonth()+1));
		console.log(addZero(dt.getMonth()+1));		
		var now = mon;

		// 날짜 범위
		for(var i = (now - 6); i <= now; i++){
			var format =  i;
			monthList.push(format);
		}

		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx, {
			type: 'line',
			data: {
				labels: monthList,
				datasets: [{
					data: monthData,
					borderColor:'rgba(250, 211, 85)',
					borderWidth: 1
				}]
			},

			options: {
			responsive: true,
			plugins: {
				legend: {
				display: false
				}
			}
			}
		});
	</script>