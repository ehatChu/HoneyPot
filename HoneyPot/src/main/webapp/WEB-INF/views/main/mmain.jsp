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

		.imgBox {
			width: 100%;
			height: 50%;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			margin-top: 15px;
			margin-bottom: 15px;
		}

		.rank {
			width: 200px;
			height: 180px;
			display: flex;
			justify-content: space-between;
			align-items: end;
		}

		.rankBar {
			width: 65px;
			display: flex;
			flex-direction: column;
			justify-content: end;
		}

		.rankFont {
			margin-top: 5px;
			margin-bottom: 5px;
			font-size: 10px;
			text-align: center;
		}

		.bar1 {
			height: 170px;
		}

		.bar3 {
			height: 140px;
		}

		.bar {
			color: white;
			display: flex;
			justify-content: center;
			font-size: 32px;
		}

		.bar11 {
			background-color: #BDBDBD;
			height: 70px;
		}

		.bar22 {
			background-color: #FFC300;
			height: 90px;
		}

		.bar33 {
			background-color: #884F22;
			height: 50px;
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

		#calendar-container {
			width: 400px;
			height: 380px;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		#calendar {
			width: 350px;
		}

		#schedule {
			width: 300px;
			display: flex;
			align-items: center;
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

		#rankImg1 {
			width: 65px;
			height: 70px;
		}

		#rankImg2 {
			width: 140px;
		}

		.bee {
			height: 80px;
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

		.like {
			width: 100%;
			height: 20%;
			display: flex;
			justify-content: space-evenly;
			align-items: center;
		}

		.blue {
			width: 30px;
			height: 30px;
			border-radius: 90%;
			display: flex;
			justify-content: center;
			align-items: center;
			background-color: blue;
		}

		.red {
			width: 30px;
			height: 30px;
			border-radius: 90%;
			display: flex;
			justify-content: center;
			align-items: center;
			background-color: red;
		}

		.like1 {
			width: 100px;
			display: flex;
			justify-content: space-evenly;
			align-items: center;
			border-radius: 20px;
		}

		.yellow {
			background-color: #FFCE31;
			font-weight: bold;
		}

		.dong {
			display: flex;
			justify-content: space-evenly;
			align-items: center;
			margin-left: -50px;
			width: 100%;
			height: 100px;
		}

		.dong1 {
			display: flex;
			justify-content: space-evenly;
			align-items: center;
		}

		#dongTxt {
			font-size: 24px;
			margin-left: -30px;
			margin-right: -30px;
			font-weight: bold;
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
						<div id='calendar-container'>
							<div id='calendar'></div>
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
						<div id="box2" class="box weatherBox">

							<!-- <img id="weatherImg" src="/app/resources/main/weather.PNG">
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
							</div> -->
						</div>

						<div id="box3" class="box">
							<img id="mealImg" src="/app/resources/main/rectangle_375.png">
							<div id="d01">
								<div id="e01">오늘의 조식</div>
								<div id="e02">떡볶이, 치킨, 감자탕, 핫도그, 어묵</div>
								<div id="e03">
									<button id="f01" onclick="location.href='/app/meal/mmeal'">조식 신청</button>
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
									<div class="rankBar bar1">
										<img id="rankImg1" src="/app/resources/profile/exam_profile.png">
										<div class="rankFont">101동 심원용</div>
										<div class="bar11 bar">2</div>
									</div>
									<div class="rankBar bar2">
										<img id="rankImg1" src="/app/resources/profile/exam_profile.png">
										<div class="rankFont">102동 심원용</div>
										<div class="bar22 bar">1</div>
									</div>
									<div class="rankBar bar3">
										<img id="rankImg1" src="/app/resources/profile/exam_profile.png">
										<div class="rankFont">103동 심원용</div>
										<div class="bar33 bar">3</div>
									</div>
								</div>
							</div>
							<div id="box4" class="box">
								<div id="tit1">동대표</div>
								<div class="imgBox">
									<img id="rankImg2" src="/app/resources/profile/exam_profile.png">
									<div id="rankFont2">101동 심원용</div>
								</div>
								<div class="like">
									<div class="like1 yellow">
										<div class="blue">
											<i class="fa-solid fa-thumbs-up" style="color: #ffffff;"></i>
										</div>
										68%
									</div>
									<div class="like1">
										<div class="red">
											<i class="fa-solid fa-thumbs-down" style="color: #ffffff;"></i>
										</div>
										32%
									</div>
								</div>
							</div>
						</div>
						<div id="zzz02" class="box">
							<div id="tit1">우수 동</div>
							<div class="dong">
								<div class="dong1">
									<img id="bee1" class="bee" src="/app/resources/main/image_12.png">
									<div id="dongTxt">103동</div>
								</div>
								<div class="dong1">
									<img id="bee2" class="bee" src="/app/resources/main/image_13.png">
									<div id="dongTxt">102동</div>
								</div>
								<div class="dong1">
									<img id="bee3" class="bee" src="/app/resources/main/image_14.png">
									<div id="dongTxt">101동</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br><br><br>

			</main>

	</body>

	</html>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script>
		// 함수 실행
		basicSetting(); // 기본 셋팅
		headerName('홈'); // 현재 페이지 이름
		getWeatherInfo();

		// 동대표 선호도 조사
		const like1Elements = document.querySelectorAll('.like1');
		like1Elements.forEach(element => {
			element.addEventListener('click', () => {
				like1Elements.forEach(item => item.classList.remove('yellow'));
				element.classList.toggle('yellow');
			});
		});


		// 날씨 정보 가져오기 (ajax)
		function getWeatherInfo() {
			$.ajax({
				url: '/app/kmsData/weather',
				type: 'get',
				dataType: 'text',
				success: function (data) {
					var jsonObject = JSON.parse(data);
					weather = jsonObject.response.body.items.item;
					applyWeatherInfo(weather);
				},
				error: function () {
					alert("에러");
				}
			});
		}

		// 날씨 정보 헤더에 반영하기
		function applyWeatherInfo(weather) {
			const weatherBox = document.querySelector('.weatherBox');
			let sky = ""; // 하늘 상태
			let pty = ""; // 강수 형태
			let pop = ""; // 강수 확률
			let reh = ""; // 습도
			let tmp = ""; // 기온

			for (let elem of weather) {
				category = elem.category;
				fcstValue = elem.fcstValue;

				switch (category) {
					case "SKY":
						switch (fcstValue) {
							case "1": sky += "맑음"; break;
							case "3": sky += "구름 많음"; break;
							case "4": sky += "흐림"; break;
						}
						break;
					case "PTY":
						switch (fcstValue) {
							case "0": pty += "없음"; break;
							case "1": pty += "비"; break;
							case "2": pty += "비/눈"; break;
							case "3": pty += "눈"; break;
							case "4": pty += "소나기"; break;
						}
						break;
					case "POP": pop += fcstValue; break;
					case "REH": reh += fcstValue; break;
					case "TMP": tmp += fcstValue; break;
				}
			}
			let boxHtml = "<div>하늘상태 : " + sky + "</div><div>강수형태 : " + pty + "</div><div>강수확률 : " + pop + "</div><div>습도 : " + reh + "</div><div>기온 : " + tmp + "</div>";
			weatherBox.innerHTML = boxHtml;
		}


		// 캘린더
		(function () {
			$(function () {
				var calendarEl = $('#calendar')[0];
				// full-calendar 생성
				var calendar = new FullCalendar.Calendar(calendarEl, {
					height: '350px', // calendar 높이 설정
					expandRows: true, // 화면에 맞게 높이 재설정
					// 해더에 표시할 툴바
					headerToolbar: {
						left: 'prev',
						center: 'title',
						right: 'next'
					},
					initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
					navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
					selectable: true, // 달력 일자 드래그 설정가능
					nowIndicator: true, // 현재 시간 마크
					dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
					locale: 'ko',
					eventAdd: function (obj) { // 이벤트가 추가되면 발생하는 이벤트
						console.log(obj);
					},
					eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
						console.log(obj);
					},
					select: function (arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
						var title = prompt('Event Title:');
						if (title) {
							calendar.addEvent({
								title: title,
								start: arg.start,
								end: arg.end,
								allDay: arg.allDay
							})
						}
						calendar.unselect()
					},

					// DB 받아와서 넣어주기
					events: [
						// {
						// 	title: 'All Day Event',
						// 	start: '2023-07-01',
						// },
					]
				});
				// 캘린더 랜더링
				calendar.render();
			});
		})();
	</script>