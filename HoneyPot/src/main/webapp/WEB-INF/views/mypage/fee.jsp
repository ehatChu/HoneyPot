<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<style>
		#wrap {
			height: 1000px;
			display: grid;
			grid-template-columns: 820px 722px;
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
		}

		.detail-content-area > table > tbody > tr > td {
			background-color: #ffffff;
			font-weight: 500;
			font-size: 23px;
			border-bottom: 1px solid black;
		}

		/* 차트 영역 */
		#chart-area  {
			display: grid;
			grid-template-rows: 600px 400px;
			width: 100%;
		}
		
		.bar-chart-area {
			display: grid;
			grid-template-rows: 50px 500px 50px;
			align-items: stretch;
		}

		.bar-chart-area > .title {
			font-size: 28px;
			font-weight: 530;
			text-align: center;
			margin-top: 100px;
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
									<c:forEach begin="1" end="20">
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
						<div class="bar-chart-area">
							<div class="title">우리집 관리비 전월/전년 비교</div>
							<div class="bar">
								<div>260,500원</div>
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
									<div>-7,700</div>
								</div>
							</div>
						</div>
						<div class="line-chart-area"></div>
					</div>
				</div>
			</main>

	</body>

	</html>

	<script>
		// 기본 셋팅 (수정x)
		function basicSetting() {
			const nav = document.querySelector("nav");
			const main = document.querySelector("main");
			const mainArea = document.querySelector("#main-area");
			const navArea = document.querySelector("#nav-area");
			mainArea.innerHTML = main.innerHTML;
			navArea.innerHTML = nav.innerHTML;
			main.innerHTML = "";
			nav.innerHTML = "";
		}

		// 수정1,2 : navMenu1,2에 메뉴를 적어주세요
		function firstNav() {
			const mainChoice = document.querySelector("#main-choice");
			let navMenu1 = ['내정보', '나의활동', '신청내역', '관리비'];

			let menus = "";
			for (let menu of navMenu1) {
				if(menu==="관리비"){
					menus += "<div class='choice-elem title-elem'>" + menu + "</div>"					
				}else{
					menus += "<div class='choice-elem'>" + menu + "</div>"					
				}
			}
			mainChoice.innerHTML = menus;
		}
		function secondNav() {
			const subChoice = document.querySelector("#grid-sub-choice");
			let navMenu2 = ['조회', '납부'];

			let menus = "";
			for (let menu of navMenu2) {
				if(menu==="조회"){
					menus += "<div class='menu-box text-bold'>" + menu + "</div>"	
				}else {
					menus += "<div class='menu-box'>" + menu + "</div>"	
				}
			}
			subChoice.innerHTML = menus;
		}
		// 헤더 네임 바꾸기
		function headerName() {
			const mainChoice = document.querySelector("#header-main-text");
			mainChoice.innerHTML = '';
			let menus = '마이페이지';

			mainChoice.innerHTML = menus;
    	}

		
		// 함수 실행
		basicSetting();
		firstNav();
		secondNav();
    	headerName();
	</script>