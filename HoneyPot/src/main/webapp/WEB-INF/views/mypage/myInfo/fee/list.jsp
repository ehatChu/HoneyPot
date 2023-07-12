<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- chart.js CDN -->
		<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
	</head>

	<style>
		#wrap {
			height: 1000px;
			display: grid;
			grid-template-columns: 750px 792px;
		}

		#fee-area {
			display: grid;
			grid-template-rows: 250px 550px;
		}

		.total-area {
			background-color: #4A321f;
			color: #ffffff;
			display: grid;
			grid-template-rows: 40px 170px 40px;
		}

		.select-area {
			margin-left: 20px;
		}

		.select-area > #date-box {
			width: 200px;
			height: 35px;
			border: none;
			background-color: #4A321f;
			color: #ffffff;
			font-size: 25px;
			font-weight: 530;
			margin-top: 10px;
		}

		.price-area{
			display: flex;
			justify-content: space-around;
			align-items: center;
			font-size: 22px;
		}

		.priceBox {
			display: flex;
			align-items: center;
			font-size: 30px;
		}

		.price-area > div > .won {
			color: #fad355;
			font-size: 35px;
			font-weight: 600;
			margin-right: 10px;
		}

		.detail-area {
			display: flex;
			justify-content: center;
			align-items: center;
			font-size: 23px;
			margin-bottom: 10px;
		}

		.detail-content-area > table{
			height: 500px;
			width: 100%;
			border: 1px solid black;
			text-align: center;
			border-collapse: collapse;
		}

		.detail-content-area > table > thead> tr > th {
			background-color: #d9d9d9;
			font-weight: 500;
			font-size: 23px;
			border-right: 1px solid black;
			height: 40px;
		}

		.detail-content-area > table > tbody > tr > td {
			background-color: #ffffff;
			font-weight: 500;
			font-size: 23px;
			padding: 10px;
		}

		.detail-content-area > table > tbody > tr:first-child > td {
			border-top: 1px solid black;
		}

		.detail-content-area > table > tbody > tr > td:last-child {
			border-right: none; 
		}

		.detail-content-area > table > tbody > tr:last-child > td {
			border-bottom: none; 
		}

		/* 차트 영역 */
		#chart-area  {
			display: grid;
			grid-template-rows: 100px 500px 400px;
			width: 100%;
		}
		
		.bar-chart-area {
			display: grid;
			grid-template-rows: 400px 40px;
			background: #ffffff;
			width: 730px;
			height: 500px;
			margin: auto;
		}

		.title {
			height: 50px;
			width: 320px;
			background-color: #4A321f;
			color: #ffffff;
			border-radius: 10px 10px 0 0;
			padding-left: 15px;
			padding-top: 5px;
			margin-top: 50px;
			margin-left: 30px;
			font-size: 23px;
		}

		.bar-chart-area > .bar {
			display: flex;
			justify-content: space-evenly;
			align-items: flex-end;
		}

		.bar-chart-area > .bar > div {
			width: 120px;
			height: 220px;
			display: flex;
			align-items: center;
			justify-content: center;
			background-color: #fad355;
			color: black;
			font-weight: 600;
		}

		.bar-chart-area > .bar > div:first-child {
			width: 120px;
			height: 300px;
		}

		.bar-chart-area > .text {
			display: flex;
			justify-content: space-evenly;
			align-items: center;
			font-size: 20px;
			margin-top: 20px;
		}

		.bar-chart-area > .text > div:nth-child(1){
			margin-right: 30px;
		}

		.bar-chart-area > .text > div:nth-child(1) > div{
			color: #00A3FF;
		}

		.bar-chart-area > .text > div:nth-child(3){
			margin-left: 45px;
		}

		.bar-chart-area > .text > div:nth-child(3) > div{
			color: #EB2114;
		}

		.line-chart-area {
			display: grid;
			grid-template-rows: 40px 200px;
			font-weight: 500;
			font-size: 23px;
			margin-top: 50px;
			margin-left: 30px;
			margin-right: 30px;
		}

		.line-chart-area > div {
			height: 50px;
			width: 250px;
			background-color: #4A321f;
			color: #ffffff;
			border-radius: 10px 10px 0 0;
			padding-bottom: 10px;
			padding-left: 15px;
		}

		#myChart {
			width: 200px;
			height: 300px;
			background: #ffffff;
		}

	</style>

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
									<option value="2023-02">2023년 02월분</option>
									<option value="2023-03">2023년 03월분</option>
									<option value="2023-04">2023년 04월분</option>
									<option value="2023-05">2023년 05월분</option>
									<option value="2023-06" selected>2023년 06월분</option>
								</select>
							</div>
							<div class="price-area">
								<div class="priceBox"><div class="won">258,440 </div> 원</div>
								<span>납부일자 : 2023년 6월 17일</span>
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
									<c:forEach begin="1" end="15">
										<tr>
											<td>일반관리비</td>
											<td>19,390</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div id="chart-area">
						<div class="title">우리집 관리비 전월/전년 비교</div>
						<div class="bar-chart-area">
							<div class="bar">
								<div>275,500원</div>
								<div>260,500원</div>
								<div>260,500원</div>
							</div>
							<div class="text">
								<div>
									전월대비
									<br>
									<div>-2,060</div>
								</div>
								<div>이번 달</div>
								<div>
									전년대비
									<br>
									<div>+7,700</div>
								</div>
							</div>
						</div>
						<div class="line-chart-area">
							<div>당해 일반관리비 추이</div>
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

		// 라인 차트 함수
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