<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<style>
		#boardTxt {
			display: flex;
			justify-content: space-between;
			font-size: 20px;
			margin-top: 5px;
			margin-bottom: 5px;
		}

		#floor1 {
			margin-top: 50px;
			display: flex;
			justify-content: space-evenly;
		}

		.box {
			background-color: rgb(255, 255, 255);
			border-radius: 20px;
			padding-top: 15px;
			padding-bottom: 15px;
			padding-left: 25px;
			padding-right: 25px;
			box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.25);
		}

		#boxf2 {
			width: 850px;
			height: 480px;
		}

		#boxf3 {
			width: 545px;
			height: 480px;
			display: flex;
			flex-direction: column;
			justify-content: space-between;
		}

		#zzz01 {
			height: 250px;
			display: flex;
			justify-content: space-between;
		}
		#zzz02 {
			height: 200px;
			background-color: #EAEAEA;
		}

		#box1 {
			width: 450px;
			height: 450px;
			display: flex;
			flex-direction: column;
		}

		#box2 {
			width: 450px;
			height: 235px;
			display: flex;
			margin-bottom: 20px;
			flex-direction: column;
			align-items: center;
			justify-content: space-evenly;
		}

		#box3 {
			width: 450px;
			height: 195px;
			display: flex;
			align-items: center;
			justify-content: space-between;
		}

		#box4 {
			width: 250px;
			height: 250px;
		}

		.rank {
			display: flex;
			justify-content: space-between;
		}

		.rankBar {
			width: 55px;
			height: 200px;
		}

		#tit1 {
			font-size: 24px;
			font-weight: bold;
			margin-bottom: 5px;
		}

		#tit2 {
			font-size: 24px;
			font-weight: bold;
			margin-bottom: 20px;
		}

		#calendar {
			height: 400px;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		#schedule {
			width: 300px;
			display: flex;
			align-items: center;
		}

		#calendarImg {
			width: 370px;
			height: 340px;
		}

		#starImg {
			width: 30px;
			height: 30px;
			margin-right: 20px;
		}

		#weatherImg {
			width: 200px;
			height: 90px;
		}

		#mealImg {
			width: 150px;
			height: 150px;
			border-radius: 20px;
		}

		#scheTxt {
			font-size: 20px;
			font-weight: bold;
		}

		#weatherTxt {
			width: 100%;
			display: flex;
			align-items: center;
		}

		#weatherTxt2 {
			width: 100%;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}

		#grayCircle {
			width: 20px;
			height: 20px;
			margin-right: 10px;
			border-radius: 90%;
			background-color: #D9D9D9;
		}

		#grayCircle2 {
			width: 25px;
			height: 25px;
			display: flex;
			justify-content: center;
			align-items: center;
			font-size: 12px;
			margin-right: 10px;
			border-radius: 90%;
			background-color: #D9D9D9;
		}

		#bar {
			width: 100px;
			height: 10px;
			background-color: #FFCE31;
		}

		#d01 {
			width: 210px;
			height: 150px;
			display: flex;
			flex-direction: column;
			justify-content: space-between;
		}

		#e01 {
			font-size: 24px;
			font-weight: bold;
		}

		#e02 {
			font-size: 16px;
			width: 150px;
		}

		#e03 {
			width: 200px;
			height: 80px;
			display: flex;
			align-items: end;
		}

		#f01 {
			width: 150px;
			height: 60px;
			border-radius: 20px;
			border: none;
			font-size: 18px;
			font-weight: bold;
			background-color: #FFCE31;
		}

		.fl {
			width: 200px;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}

		.pub {
			width: 320px;
			display: flex;
			justify-content: space-between;
		}

		.el {
			font-size: 20px;
			width: 150px;
			height: 60px;
			border: 4px solid #FAD355;
			border-radius: 20px;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	</style>

	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav>

			</nav>

			<main>
				<div id="floor1">
					<div id="box1" class="box">
						<div id="tit1">캘린더</div>
						<div id="calendar">
							<img id="calendarImg" src="/app/resources/main/image_11.png">
						</div>
					</div>
					<div id="box1" class="box">
						<div id="tit2">8월 일정</div>

						<% for(int i=0; i < 5; i++) { %>
							<div id="schedule">
								<img id="starImg" src="/app/resources/main/star1.PNG">
								<div id="scheTxt">8월 4일 ~ 8월 10일</div>
							</div>
							<div id="schedule">
								<div id="starImg"></div>
								<div>친구들과 여행</div>
							</div>
							<% } %>
					</div>
					<div id="box1">
						<div id="box2" class="box">
							<img id="weatherImg" src="/app/resources/main/weather.PNG">
							<div id="weatherTxt">
								<div id="grayCircle"></div>
								<div>미세먼지</div>
							</div>
							<div id="weatherTxt2">
								<div id="bar"></div>
								<div id="bar"></div>
								<div id="bar"></div>
							</div>
							<div id="weatherTxt">
								<div id="grayCircle"></div>
								<div>초미세먼지</div>
							</div>
							<div id="weatherTxt2">
								<div id="bar"></div>
								<div id="bar"></div>
								<div id="bar"></div>
							</div>
						</div>

						<div id="box3" class="box">
							<img id="mealImg" src="/app/resources/main/rectangle_375.png">
							<div id="d01">
								<div id="e01">오늘의 조식</div>
								<div id="e02">떡볶이, 치킨, 감자탕, 핫도그, 어묵</div>
								<div id="e03">
									<button id="f01">조식 신청</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="floor1">
					<div id="boxf2" class="box">
						<div id="tit2" class="fl">
							<div>통합게시판</div>
							<div id="grayCircle2"> ▶ </div>
						</div>
						<div class='pub'>
							<div class='el'>
								공지사항
							</div>
							<div class='el'>
								인기글 모음
							</div>
						</div>
						<br>

						<% for(int i=0; i < 7; i++) { %>
							<div id="boardTxt">
								<div>[공지] 편의시설 등록 관련 질문에 대한 FAQ등록을 위한 개정안</div>
								<div>2023.06.01</div>
							</div>
							<hr>
							<% } %>
					</div>
					<div id="boxf3">
						<div id="zzz01">
							<div id="box4" class="box">
								<div id="tit1">우수이웃</div>
								
								<div class="rank">
									<div class="rankBar">
										<div>101동 심원용</div>
										<div>2</div>
									</div>
									<div class="rankBar">
										<div>102동 심원용</div>
										<div>1</div>
									</div>
									<div class="rankBar">
										<div>103동 심원용</div>
										<div>3</div>
									</div>
								</div>
							</div>
							<div id="box4" class="box">
								<div id="tit1">동대표</div>
							</div>
						</div>
						<div id="zzz02" class="box">
							<div id="tit1">우수 동</div>
						</div>
					</div>
				</div>
				<br><br><br>

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
			let navMenu1 = ['도서관', '수영장', '헬스장'];

			let menus = "";
			for (let menu of navMenu1) {
				menus += "<div class='choice-elem'><div class='title-elem'>" + menu + "</div></div>"
			}
			mainChoice.innerHTML = menus;
		}
		function secondNav() {
			const subChoice = document.querySelector("#grid-sub-choice");
			let navMenu2 = ['시설소개', '예약하기'];

			let menus = "";
			for (let menu of navMenu2) {
				menus += "<div class='menu-box'>" + menu + "</div>"
			}
			subChoice.innerHTML = menus;
		}

		// 함수 실행
		basicSetting();
		firstNav();
		secondNav();
	</script>