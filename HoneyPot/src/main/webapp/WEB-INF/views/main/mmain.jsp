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
			width: 100%;
			margin-top: 5px;
			height: 110px;
			display: flex;
			justify-content: center;
			align-items: center;
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

		#weatherTxt1 {
			width: 100%;
			display: flex;
			justify-content: space-between;
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

		.pub>div {
			font-size: 20px;
			width: 150px;
			height: 60px;
			border-radius: 20px;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.el {
			border: 4px solid #FAD355;
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

		.love {
			width: 100px;
			display: flex;
			justify-content: space-evenly;
			align-items: center;
			border-radius: 20px;
		}

		.hate {
			width: 100px;
			display: flex;
			justify-content: space-evenly;
			align-items: center;
			border-radius: 20px;
		}

		.gray {
			background-color: #D9D9D9;
		}

		.green {
			background-color: rgb(23, 236, 23);
		}

		.yellow {
			background-color: #FFCE31;
			font-weight: bold;
		}

		.redd {
			background-color: red;
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

		.scheduleBox {
			overflow-y: auto;
		}

		*::-webkit-scrollbar {
			width: 12px;
		}

		*::-webkit-scrollbar-thumb {
			background: #4A321F;
		}

		*::-webkit-scrollbar-track {
			background: #4a321f23;
		}
	</style>

	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav></nav>

			<main>
				<div id="floor1">
					<div id="box1" class="box">
						<div id="tit1">캘린더</div>
						<div id='calendar-container'>
							<div id='calendar'></div>
						</div>
					</div>
					<div id="box1" class="box scheduleBox">
						<div id="tit2" class="scheTit"></div>

						<c:forEach items="${memberCalendarList}" var="vo">
							<div id="scsc${vo.no}">
								<div id="schedule">
									<c:if test="${vo.love == 'Y'}">
										<img id="starImg" src="/app/resources/main/star1.PNG">
									</c:if>
									<c:if test="${vo.love == 'N'}">
										<img id="starImg" src="/app/resources/main/star2.PNG">
									</c:if>

									<div id="scheTxt">${vo.startDate.substring(0, 11)}~
										${vo.endDate.substring(0,
										11)}</div>
								</div>
								<div id="schedule">
									<div id="starImg"></div>
									<div>${vo.name}</div>
								</div>
							</div>

							<script>
								var scheTit = document.querySelector('.scheTit');
								var currentDate = new Date();
								var currentYear = currentDate.getFullYear();
								var currentMonth = currentDate.getMonth() + 1;
								var startDateStr = "${vo.startDate.substring(0, 11)}";
								var startDate = new Date(startDateStr);
								var startYear = startDate.getFullYear();
								var startMonth = startDate.getMonth() + 1;

								scheTit.innerHTML = currentMonth + "월 일정";

								if (currentYear != startYear || currentMonth != startMonth) {
									var scsc = document.getElementById("scsc${vo.no}");
									scsc.remove();
								}
							</script>
						</c:forEach>
					</div>
					<div id="box1">
						<div id="box2" class="box weatherBox">
							<div id="weatherImg"></div>
							<div id="weatherTxt">
								<i class="fa-regular fa-circle-xmark" style="color: #ff841f; margin-right: 5px;"></i>
								<div id="pm10"></div>
							</div>
							<div id="weatherTxt1"></div>
							<div id="weatherTxt">
								<i class="fa-regular fa-circle-xmark" style="color: #ff841f; margin-right: 5px;"></i>
								<div id="pm25"></div>
							</div>
							<div id="weatherTxt2"></div>
						</div>

						<div id="box3" class="box">
							<img id="mealImg" src="/app/resources/main/rectangle_375.png">
							<div id="d01">
								<div id="e01">오늘의 조식</div>
								<div id="e02">떡볶이, 치킨, 감자탕, 핫도그, 어묵</div>
								<div id="e03">
									<button id="f01" onclick="location.href='/app/meal/mmeal'">조식
										신청</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="floor1">
					<div id="boxf2" class="box">
						<div id="tit2" class="fl">
							<div>통합게시판</div>
							<div id="grayCircle2" onclick="location.href='/app/board/list'">▶</div>
						</div>
						<div class='pub'>
							<div id="pub1" onclick="getNoticeList();">공지사항</div>
							<div id="pub2" onclick="getPopularList();">인기글 모음</div>
						</div>
						<br>
						<div class="boxff2"></div>
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
										<div class="rankFont">${memberPointList[0].dongNum}동 ${memberPointList[0].name}</div>
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
									<div id="rankFont2">${captain.name}</div>
								</div>
								<div class="like">
									<div class="love" onclick="voteCaptainLove('L');">
										<div class="blue">
											<i class="fa-solid fa-thumbs-up" style="color: #ffffff;"></i>
										</div>
										<span id="love"></span>
									</div>
									<div class="hate" onclick="voteCaptainLove('H');">
										<div class="red">
											<i class="fa-solid fa-thumbs-down" style="color: #ffffff;"></i>
										</div>
										<span id="hate"></span>
									</div>
								</div>
							</div>
						</div>
						<div id="zzz02" class="box">
							<div id="tit1">우수 동</div>
							<div class="dong">
								<div class="dong1">
									<img id="bee1" class="bee" src="/app/resources/main/image_12.png">
									<div id="dongTxt">${dongPointList[0].dongNum}동</div>
								</div>
								<div class="dong1">
									<img id="bee2" class="bee" src="/app/resources/main/image_13.png">
									<div id="dongTxt">103동</div>
								</div>
								<div class="dong1">
									<img id="bee3" class="bee" src="/app/resources/main/image_14.png">
									<div id="dongTxt">101동</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br> <br> <br>
			</main>

	</body>

	</html>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script>
		// 변수 선언
		const today = new Date();
		const pub1 = document.querySelector("#pub1");
		const pub2 = document.querySelector("#pub2");
		const loveBox = document.querySelector(".love");
		const hateBox = document.querySelector(".hate");
		const boxff2 = document.querySelector('.boxff2');

		// 함수 실행
		basicSetting(); // 기본 셋팅
		headerName('홈'); // 현재 페이지 이름
		getNoticeList();
		getCaptainLove();
		applyWeatherInfo(JSON.parse(sessionStorage.getItem("weather")));
		applyNanoDustInfo();

		// 게시판 선택 1
		function getNoticeList() {
			pub1.classList.add('el');
			pub2.classList.remove('el');

			$.ajax({
				url: '/app/main/noticeList',
				type: 'get',
				dataType: 'json',
				success: function (noticeList) {
					let str = "";
					for (let vo of noticeList) {
						str += '<div id="boardTxt">'
							+ '<div style="width: 150px; height: 30px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">' + vo.title + '</div>'
							+ '<div>' + vo.writerName + '</div>'
							+ '<div>' + vo.enrollDate + '</div>'
							+ '<div>' + vo.hit + '</div>'
							+ '</div> <hr>'
					}
					boxff2.innerHTML = str;
				},
				error: function () {
					alert("getNoticeList error");
				}
			});
		}


		// 게시판 선택 2
		function getPopularList() {
			pub2.classList.add('el');
			pub1.classList.remove('el');

			$.ajax({
				url: '/app/main/popularList',
				type: 'get',
				dataType: 'json',
				success: function (popularList) {
					let str = "";
					for (let vo of popularList) {
						str += '<div id="boardTxt">'
							+ '<div style="width: 150px; height: 30px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">' + vo.title + '</div>'
							+ '<div>' + vo.writerNo + '</div>'
							+ '<div>' + vo.enrollDate + '</div>'
							+ '<div>' + vo.hit + '</div>'
							+ '</div> <hr>'
					}
					boxff2.innerHTML = str;
				},
				error: function () {
					alert("에러");
				}
			});
		}


		// 동대표 선호도 조회
		function getCaptainLove() {
			$.ajax({
				url: '/app/main/captainLove',
				type: 'get',
				dataType: 'json',
				success: function (arr) {
					const love = document.querySelector('#love');
					const hate = document.querySelector('#hate');
					let loveCnt = arr[0];
					let hateCnt = arr[1];
					let myLove = arr[2];
					let total = parseInt(loveCnt) + parseInt(hateCnt);

					if (myLove == 'L') {
						loveBox.classList.add("yellow");
						hateBox.classList.remove("yellow");
					} else if (myLove == 'H') {
						hateBox.classList.add("yellow");
						loveBox.classList.remove("yellow");
					}
					love.innerHTML = (loveCnt / total * 100).toFixed(0) + "%";
					hate.innerHTML = (hateCnt / total * 100).toFixed(0) + "%";
				},
				error: function () {
					alert("getCaptainLove error");
				}
			});
		}


		// 동대표 투표하기
		function voteCaptainLove(love) {
			$.ajax({
				url: '/app/main/vote?love=' + love,
				type: 'get',
				dataType: 'json',
				success: function () {
					getCaptainLove();
				},
				error: function () {
					alert("voteCaptainLove error");
				}
			});
		}


		// 날씨 정보 메인페이지 반영
		function applyWeatherInfo(weather) {
			const weatherImg = document.querySelector('#weatherImg');

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
							case "1": sky = '<div style="height: 100px; display: flex; flex-direction: column; justify-content:space-between; align-items:center;"><i class="fa-regular fa-sun fa-4x" style="color: #fe5739;"></i>'; break;
							default: sky = '<div style="height: 100px; display: flex; flex-direction: column; justify-content:space-between; align-items:center;"><i class="fa-solid fa-cloud fa-4x" style="color: #838fa5;"></i>';
						}
						break;
					case "PTY":
						switch (fcstValue) {
							case "0": pty = "없음"; break;
							case "1": pty = '<div style="height: 100px; display: flex; flex-direction: column; justify-content:space-between; align-items:center;"><i class="fa-solid fa-cloud-rain fa-4x" style="color: #a5adbb;"></i>'; break;
							case "2": pty = '<div style="height: 100px; display: flex; flex-direction: column; justify-content:space-between; align-items:center;"><i class="fa-solid fa-snowflake fa-4x" style="color: #a5c2f8;"></i>'; break;
							case "3": pty = '<div style="height: 100px; display: flex; flex-direction: column; justify-content:space-between; align-items:center;"><i class="fa-solid fa-snowflake fa-4x" style="color: #a5c2f8;"></i>'; break;
							case "4": pty = '<div style="height: 100px; display: flex; flex-direction: column; justify-content:space-between; align-items:center;"><i class="fa-solid fa-cloud-showers-heavy fa-4x" style="color: #0058f0;"></i>'; break;
						}
						break;
					case "POP": pop = fcstValue; break;
					case "REH": reh = fcstValue; break;
					case "TMP": tmp = fcstValue; break;
				}
			}

			if (pty == '없음') {
				pty = sky;
			}

			pty += '<div><i class="fa-solid fa-cloud-showers-heavy" style="color: #616161; margin-right: 5px;"></i>확률: ' + pop + "%</div></div>";
			weatherImg.innerHTML = pty + "<div style='height: 100px; display: flex; flex-direction: column; justify-content:space-between; margin-left: 20px;'><div style='font-size: 44px;'>" + tmp + "℃</div><div><i class='fa-solid fa-droplet fa-lg' style='color: #6da2fd; margin-right: 5px;'></i>습도: " + reh + "%</div></div>";
		}


		// 미세먼지 정보 메인페이지 반영
		function applyNanoDustInfo() {
			const pm10 = document.querySelector('#pm10');
			const pm25 = document.querySelector('#pm25');
			const weatherTxt1 = document.querySelector('#weatherTxt1');
			const weatherTxt2 = document.querySelector('#weatherTxt2');
			var nanoDust = JSON.parse(sessionStorage.getItem("nanoDust"));

			if (nanoDust[0].pm10Value < 15) {
				weatherTxt1.innerHTML = '<div class="green" id="bar"></div><div class="gray" id="bar"></div><div class="gray" id="bar"></div>';
			} else if (nanoDust[0].pm10Value < 50) {
				weatherTxt1.innerHTML = '<div class="yellow" id="bar"></div><div class="yellow" id="bar"></div><div class="gray" id="bar"></div>';
			} else {
				weatherTxt1.innerHTML = '<div class="redd" id="bar"></div><div class="redd" id="bar"></div><div class="redd" id="bar"></div>';
			}

			if (nanoDust[0].pm25Value < 15) {
				weatherTxt2.innerHTML = '<div class="green" id="bar"></div><div class="gray" id="bar"></div><div class="gray" id="bar"></div>';
			} else if (nanoDust[0].pm10Value < 50) {
				weatherTxt2.innerHTML = '<div class="yellow" id="bar"></div><div class="yellow" id="bar"></div><div class="gray" id="bar"></div>';
			} else {
				weatherTxt2.innerHTML = '<div class="redd" id="bar"></div><div class="redd" id="bar"></div><div class="redd" id="bar"></div>';
			}

			pm10.innerHTML = "미세먼지 " + nanoDust[0].pm10Value + "㎍/㎥"
			pm25.innerHTML = "초미세먼지 " + nanoDust[0].pm25Value + "㎍/㎥"
		}


		// 랜덤 색상 생성
		function getRandomColor() {
			var letters = '0123456789ABCDEF';
			var color = '#';
			for (var i = 0; i < 6; i++) {
				color += letters[Math.floor(Math.random() * 16)];
				if (color == '#ffffff') {
					return color;
				}
			}
			return color;
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
					editable: false,
					selectable: true, // 달력 일자 드래그 설정가능
					nowIndicator: true, // 현재 시간 마크
					dayMaxEvents: false, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
					locale: 'ko',
					eventAdd: function (obj) { // 이벤트가 추가되면 발생하는 이벤트
						console.log(obj);
					},
					eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
						console.log(obj);
					},
					select: function (arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
						// var title = prompt('Event Title:');
						// if (title) {
						// 	calendar.addEvent({
						// 		title: title,
						// 		start: arg.start,
						// 		end: arg.end,
						// 		allDay: arg.allDay
						// 	})
						// }
						// calendar.unselect()
					},

					// DB 받아와서 넣어주기
					events: [
						<c:forEach items="${memberCalendarList}" var="vo">
							{
								title: '${vo.name}',
								start: '${vo.startDate}',
								end: '${vo.endDate}',
								backgroundColor: getRandomColor()
							},
						</c:forEach>
					]
				});
				// 캘린더 랜더링
				calendar.render();
			});
		})();
	</script>