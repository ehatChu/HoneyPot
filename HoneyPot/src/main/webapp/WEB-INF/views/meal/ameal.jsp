<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<style>
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

			#box1 {
				width: 600px;
				height: 600px;
				display: flex;
				flex-direction: column;
			}

			.box2 {
				margin-left: 13px;
				margin-top: 20px;
				display: flex;
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


			#tit1 {
				font-size: 28px;
				font-weight: bold;
				margin-bottom: 5px;
			}

			#tit2 {
				font-size: 28px;
				font-weight: bold;
				margin-bottom: 20px;
			}

			#calendar {
				display: flex;
				justify-content: center;
				align-items: center;
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

			#calendarImg {
				margin-top: 30px;
				width: 470px;
				height: 440px;
			}

			#mealImg {
				width: 280px;
				height: 280px;
				border-radius: 20px;
			}

			#e01 {
				font-size: 28px;
				font-weight: bold;
				margin-bottom: 30px;
			}

			#e02 {
				display: flex;
				align-items: center;
				font-size: 22px;
			}

			#e03 {
				display: flex;
				align-items: center;
				font-size: 18px;
			}

			#e04 {
				width: 100%;
				height: 35%;
				display: flex;
				align-items: center;
				justify-content: center;
			}

			#d01 {
				margin-left: 50px;
			}

			#f01 {
				width: 70%;
				height: 50%;
				border-radius: 20px;
				border: none;
				background-color: #FAD355;
				font-size: 28px;
			}

			.bbox {
				padding-left: 40px;
				padding-right: 40px;
				padding-top: 30px;
			}

			#board-list {
				width: 85%;
			}

			#board-list td {
				font-size: 22px;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			#tr {
				height: 60px;
				border-bottom: 3px solid #FAD355;
				display: flex;
				align-items: center;
			}

			#tr1 {
				margin-left: 100px;
			}

			#tr2 {
				margin-left: 500px;
			}

			#board-list tr:hover {
				background-color: #fdeaab;
				transition: 0.3s;
				cursor: pointer;
			}

			#semiFloor {
				font-size: 28px;
				font-weight: bold;
				width: 85%;
				margin-left: 215px;
				margin-bottom: -30px;
				margin-top: 50px;
			}

			.page-area {
				width: 100%;
				display: flex;
				justify-content: center;
				align-items: center;
				margin-top: 15px;
			}

			.page-area button {
				display: inline-block;
				font-weight: bold;
				font-size: 18px;
				border: none;
				border-radius: 5px;
				padding: 10px 20px;
				cursor: pointer;
				background-color: transparent;
			}

			.page-area button:hover {
				background-color: #FAD355;
				color: white;
			}
		</style>
	</head>

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
					<div id="box1" class="box bbox">
						<div class="box2">
							<img id="mealImg" src="/app/resources/main/rectangle_375.png">
							<div id="d01">
								<div id="e01">오늘의 조식</div>
								<div id="e02"><img id="starImg" src="/app/resources/main/star1.PNG">떡볶이</div>
								<div id="e02"><img id="starImg" src="/app/resources/main/star1.PNG">치킨</div>
								<div id="e02"><img id="starImg" src="/app/resources/main/star1.PNG">감자탕</div>
								<div id="e02"><img id="starImg" src="/app/resources/main/star1.PNG">핫도그</div>
								<div id="e02"><img id="starImg" src="/app/resources/main/star1.PNG">어묵</div>
							</div>
						</div>
						<br>
						<div id="e03">
							<img id="starImg" src="/app/resources/main/star2.PNG">
							영양소 : 열량 642kcal, 당질 97g, 단백질 31g, 지질 13g
						</div>
						<div id="e04">
							<button id="f01">식단 편집</button>
						</div>
					</div>
				</div>

				<div id="semiFloor">2020년 8월 식단</div>
				<div id="floor1">
					<table id="board-list">
						<c:forEach begin="1" end="5">
							<tr id="tr">
								<td id="tr1">2020. 08. 01</td>
								<td id="tr2">차조밥, 조개국, 불고기, 시금치나물, 배추김치</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<br>
				<div class="page-area">
					<button>
						<</button>
							<button>1</button>
							<button>2</button>
							<button>3</button>
							<button>4</button>
							<button>5</button>
							<button>></button>
				</div>
				<br><br><br>
			</main>

	</body>

	</html>

	<script>
		basicSetting(); // 기본 셋팅
		headerName('조식 관리'); // 현재 페이지 이름
	</script>