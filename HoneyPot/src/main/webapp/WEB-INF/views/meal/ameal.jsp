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

			#calendar-container {
				width: 550px;
				height: 530px;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			#calendar {
				width: 500px;
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
				font-size: 18px;
				margin-bottom: 5px;
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
				justify-content: space-between;
			}

			#d01 {
				margin-left: 50px;
			}

			#f01 {
				width: 45%;
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

			.page-area>button {
				display: inline-block;
				font-weight: bold;
				font-size: 20px;
				border: none;
				border-radius: 5px;
				padding: 10px 20px;
				cursor: pointer;
				background-color: transparent;
			}

			.page-area button:hover,
			#current-page-btn {
				background-color: #FAD355;
				color: white;
			}

			#current-page-btn:hover {
				background-color: #FAD355;
				color: white;
				cursor: default;
			}

			.modal {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100vh;
				background-color: rgba(0, 0, 0, 0.3);
				z-index: -1;
				opacity: 0;
			}

			.show {
				opacity: 1;
				z-index: 1000;
				transition: all .5s;
				/* display: block; */
			}

			.qna-popup {
				position: absolute;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background-color: #f5f5f5;
				box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
				border-radius: 10px;

				/* 임시 지정 */
				width: 700px;

				/* 초기에 약간 아래에 배치 */
				transform: translate(-50%, -40%);
			}

			.show .qna-popup {
				transform: translate(-50%, -50%);
				transition: all .5s;
			}

			.qna-model-header-area {
				width: 700px;
				height: 50px;
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
				background-color: #FFCE31;
			}

			.qna-model-header {
				margin-left: 20px;
				width: 660px;
				height: 50px;
				display: flex;
				justify-content: space-between;
				align-items: center;

			}

			#qna-close {
				font-size: 30px;
				font-weight: 900;
				cursor: pointer;

			}

			.qna-model-header-text {
				font-size: 20px;
				font-weight: 600;
			}

			.qna-model-body-area {
				width: 600px;
				margin: auto;
				margin-top: 20px;
			}

			.qna-model-body-first {
				width: 600px;
				display: flex;
				flex-direction: column;

			}

			.qna-model-title-area {
				display: flex;
				width: 560px;
				justify-content: space-between;
				align-items: center;

			}

			.qna-model-title-text {
				font-size: 26px;
				font-weight: bold;
				/* color: gray; */
				color: black;
			}

			.qna-model-member-area {
				display: flex;
				height: 100%;
				align-items: center;
			}

			.qna-model-member-target {
				font-size: 22px;
				font-weight: 800;
				margin-right: 20px;
			}

			.qna-model-member-name {
				font-weight: 800;
				margin-right: 10px;
			}

			.qna-model-member-profile {
				width: 50px;
				height: 50px;
				border-radius: 5px;
				border: 1px solid black;
				overflow: hidden;
			}

			.qna-model-member-profile>img {
				width: 100%;
				height: 100%;
				object-fit: cover;
			}

			.qna-model-question-area {
				margin-left: 10px;
				margin-top: 10px;
				display: flex;
				width: 550px;
			}

			.qna-model-question-title {
				margin-left: 20px;
				margin-top: 10px;
				font-size: 24px;
				font-weight: bold;
			}

			.qna-model-question-icon {
				width: 50px;
				height: 50px;
				border-radius: 70%;
				display: flex;
				justify-content: center;
				align-items: center;
				background-color: #FFCE31;
				font-weight: 800;
				font-size: 14px;

			}

			.qna-model-question-text {
				margin-left: 10px;
				border-radius: 6px;
				padding: 15px;
				width: 500px;
				background-color: #fff5d6;
				font-weight: bold;
			}


			.qna-model-answer-text-area {
				margin-top: 20px;
				width: 600px;
				display: flex;
			}

			.qna-model-answer-text {
				margin-left: 10px;
				border-radius: 6px;
				padding: 15px;
				width: 500px;
				background-color: #fff5d6;
				font-weight: bold;
			}

			.qna-model-answer-icon {
				width: 50px;
				height: 50px;
				border-radius: 70%;
				display: flex;
				justify-content: center;
				align-items: center;
				background-color: #885d3b;
				font-weight: 800;
				font-size: 14px;
			}

			.qna-model-btn-area {
				margin-top: 30px;
				width: 100%;
				display: flex;
				justify-content: center;
				margin-bottom: 30px;
			}
		</style>
	</head>

	<body>
		<div class="modal">
			<input type="text" name="no" style="display: none;">
			<div class="qna-popup">
				<div class="qna-model-header-area">
					<div class="qna-model-header">
						<div class="qna-model-header-text"></div>
						<span class="material-symbols-outlined" id="qna-close">
							close
						</span>
					</div>
				</div>
				<div class="qna-model-body-area">
					<div class="qna-model-body-first">
						<div class="qna-model-title-area">
							<div class="qna-model-title-text"></div>
							<div class="qna-model-member-area">
								<div class="qna-model-member-profile">
									<img id="qna-model-member-profile" src="" alt="식단 사진">
								</div>
							</div>
						</div>
						<div class="qna-model-question-title" id="qna-model-question"></div>
						<div class="qna-model-question-area">
							<div class="qna-model-question-icon">메뉴</div>
							<select name="menu" onchange="handleOptionChange()" class="qna-model-question-text"
								id="qna-model-question-content">

							</select>
						</div>
					</div>

					<div class="qna-model-answer-text-area">
						<div class="qna-model-question-area">
							<div class="qna-model-answer-icon">영양소</div>
							<input class="qna-model-answer-text" id="qna-model-answer" readonly>
						</div>
					</div>

					<div class="qna-model-btn-area">

					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav>
				<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
			</nav>

			<main>
				<div id="floor1">
					<div id="box1" class="box">
						<div id="tit1">캘린더</div>
						<div id='calendar-container'>
							<div id='calendar'></div>
						</div>
					</div>
					<div id="box1" class="box bbox">
						<div class="box2">
							<img id="mealImg" src="/app/resources/meal/${todayMeal.img}">
							<div id="d01">
								<div id="e01">${todayMeal.breakfastDate.substring(0, 10)}</div>
								<div id="e011"></div>
							</div>
						</div>
						<br>
						<div id="e03">
							<img id="starImg" src="/app/resources/main/star2.PNG">
							영양소 : ${todayMeal.nutrient}
						</div>
						<div id="e04">
							<button id="f01" onclick="breakFastApply('${todayMeal.no}');">조식
								수정</button>
							<button id="f01" onclick="breakFastPlus();">조식
								추가</button>
						</div>
					</div>
				</div>

				<div id="semiFloor"></div>
				<div id="floor1">
					<table id="board-list">
						<c:forEach items="${mealList}" var="vo">
							<tr id="tr" onclick="selectMeal('${vo.no}')">
								<td id="tr1">${vo.breakfastDate.substring(0, 10)}</td>
								<td id="tr2">${vo.menu}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<br>
				<div class="page-area">
					<c:if test="${pv.currentPage > 1}">
						<button type="button" onclick="location.href='/app/meal/ameal?p=${pv.currentPage - 1}'">
							< </button>
					</c:if>
					<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
						<c:if test="${pv.currentPage != i}">
							<button type="button" onclick="location.href='/app/meal/ameal?p=${i}'">${i}</button>
						</c:if>
						<c:if test="${pv.currentPage == i}">
							<button type="button" id="current-page-btn">${i}</button>
						</c:if>
					</c:forEach>
					<c:if test="${pv.currentPage < pv.maxPage}">
						<button type="button" onclick="location.href='/app/meal/ameal?p=${pv.currentPage + 1}'"> >
						</button>
					</c:if>
				</div>
				<br><br><br>
			</main>
	</body>

	</html>

	<script>
		basicSetting(); // 기본 셋팅
		headerName('조식 관리'); // 현재 페이지 이름
		todayMenu('${todayMeal.menu}');
		firstNav(['관리비', '편의시설 관리', '조식 관리'], '조식 관리');
		firstNavLink(['/app/fee/admin','/app/admin/innerFac/editInfo?facNo=1','/app/meal/mypage','/app/meal/ameal']);


		const tr1Arr = document.querySelectorAll("#tr1");
		for (let tr1 of tr1Arr) {
			const originalDate = tr1.innerHTML.trim();
			const datePart = originalDate.split(" ")[0];
			tr1.innerHTML = datePart;
		}

		var semiFloor = document.querySelector('#semiFloor');
		var currentDate = new Date();
		var currentYear = currentDate.getFullYear();
		var currentMonth = currentDate.getMonth() + 1;
		semiFloor.innerHTML = currentYear + "년 " + currentMonth + "월 식단";


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

		(function () {
			$(function () {
				var calendarEl = $('#calendar')[0];
				// full-calendar 생성
				var calendar = new FullCalendar.Calendar(calendarEl, {
					height: '450px', // calendar 높이 설정
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
					displayEventTime: false, // 이벤트 시간 안보이게
					dayMaxEvents: false, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
					locale: 'ko',
					eventAdd: function (obj) { // 이벤트가 추가되면 발생하는 이벤트
					},
					eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
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
						<c:forEach items="${mealListTotal}" var="vo">
							{
								title: '${vo.menu}',
								start: '${vo.breakfastDate.substring(0, 10)}' + ' 00:00:00',
								end: '${vo.breakfastDate.substring(0, 10)}' + ' 24:00:00',
								backgroundColor: getRandomColor()
							},
						</c:forEach>
					]
				});

				// 캘린더 랜더링
				calendar.render();
			});
		})();

		// 오늘의 식단
		function todayMenu(menu) {
			let tempStr = "";
			let arr = menu.split(",");
			const e011 = document.querySelector('#e011');
			for (let x of arr) {
				tempStr += '<div id="e02"><img id="starImg" src="/app/resources/main/star1.PNG">' + x + '</div>';
			}
			e011.innerHTML = tempStr;
		}

		// 목록 클릭이벤트
		function selectMeal(no) {
			const bbox = document.querySelector(".bbox");
			let str = "";

			$.ajax({
				url: '/app/meal/selectMeal?no=' + no,
				type: 'get',
				success: function (data) {
					str += '<div class="box2">'
						+ '<img id="mealImg" src="/app/resources/meal/' + data.img + '">'
						+ '<div id="d01">'
						+ '<div id="e01">' + data.breakfastDate.substring(0, 10) + '</div>'
						+ '<div id="e011"></div>'
						+ '</div></div><br>'
						+ '<div id="e03">'
						+ '<img id="starImg" src="/app/resources/main/star2.PNG">'
						+ '영양소 : ' + data.nutrient
						+ '</div>'
						+ '<div id="e04">'
						+ '<button id="f01" onclick="breakFastApply(' + data.no + ');">조식 수정</button>'
						+ '<button id="f01" onclick="breakFastPlus();">조식 추가</button>'
						+ '</div>'
					bbox.innerHTML = str;
					todayMenu(data.menu);
				},
				error: function () {
					alert("selectMeal error");
				}
			});
		}

		// 조식 수정(모달창 띄우기)
		function breakFastApply(no) {
			$.ajax({
				url: '/app/meal/selectMeal?no=' + no,
				type: 'get',
				success: function (data) {
					const modal = document.querySelector(".modal");
					const menu = document.querySelector('#qna-model-question-content');

					modal.classList.add("show");
					document.querySelector('.qna-model-header-text').innerHTML = '조식 수정';
					document.querySelector('input[name=no]').value = data.no;
					document.querySelector('#qna-model-member-profile').src = "/app/resources/meal/" + data.img;
					document.querySelector('.qna-model-title-text').innerHTML = data.breakfastDate.substring(0, 10);
					document.querySelector('#qna-model-answer').value = data.nutrient;

					tempMenu = "<option img-name='" + data.img + "' data-name='" + data.nutrient + "' value='" + data.no + "'>" + data.menu + "</option>";
					<c:forEach items="${dietList}" var="vo">
						if(data.no != '${vo.no}') {
							tempMenu += '<option img-name="${vo.img}" data-name="${vo.nutrient}" value="${vo.no}">${vo.menu}</option>'
						}
					</c:forEach>
					menu.innerHTML = tempMenu;
					document.querySelector("#qna-close").addEventListener('click', qnaclose1);
				},
				error: function () {
					alert("selectMeal error");
					return;
				}
			});
		}

		// 조식 추가(모달창 띄우기)
		function breakFastPlus() {
			const modal = document.querySelector(".modal");
			const menu = document.querySelector('#qna-model-question-content');
			
			modal.classList.add("show");
			document.querySelector('.qna-model-header-text').innerHTML = '조식 추가';
			document.querySelector('#qna-model-member-profile').src = "/app/resources/meal/" + 'menu1.PNG';
			document.querySelector('.qna-model-title-text').innerHTML = '<input type="date" name="date">';
			document.querySelector('#qna-model-answer').value = '${dietList[0].nutrient}';

			tempMenu = "";
			<c:forEach items="${dietList}" var="vo">
				tempMenu += '<option img-name="${vo.img}" data-name="${vo.nutrient}" value="${vo.no}">${vo.menu}</option>'
			</c:forEach>
			menu.innerHTML = tempMenu;
			document.querySelector("#qna-close").addEventListener('click', qnaclose2);
		}

		// 셀렉트바
		function handleOptionChange() {
			const selectElement = document.querySelector(".qna-model-question-text");
			const selectedOption = selectElement.options[selectElement.selectedIndex];
			document.querySelector('#qna-model-answer').value = selectedOption.getAttribute("data-name");
			document.querySelector('#qna-model-member-profile').src = "/app/resources/meal/" + selectedOption.getAttribute("img-name");
		}

		// 수정 x 버튼
		function qnaclose1() {
			const selectElement = document.querySelector(".qna-model-question-text");
			const selectedOption = selectElement.options[selectElement.selectedIndex];
			let breakFastNo = document.querySelector('input[name=no]').value;
			let dietNo = selectedOption.value;

			$.ajax({
				url: '/app/meal/editMeal',
				type: 'get',
				data: { "no": breakFastNo, "dietNo" : dietNo },
				success: function (data) {
					if(data == "success") {
						alert("조식 수정이 완료되었습니다");
					} else {
						alert("조식 수정을 실패하였습니다");
					}
					location.reload();
				},
				error: function () {
					alert("조식 수정 중 오류가 발생했습니다");
				}
			});

			document.querySelector(".modal").className = "modal";
		}

		// 추가 x 버튼
		function qnaclose2() {
			const selectElement = document.querySelector(".qna-model-question-text");
			const selectedOption = selectElement.options[selectElement.selectedIndex];
			const selectDate = document.querySelector("input[name=date]");
			let dietNo = selectedOption.value;
			
			if(selectDate.value == '') {
				alert("날짜를 선택해주세요");
				location.reload();
				return;
			}
			if(selectDate.value <= '${todayMeal.breakfastDate.substring(0, 10)}') {
				alert("현재 날짜 이후로만 추가 가능합니다");
				location.reload();
				return;
			}
			for (let date of dateArr) {
				if(selectDate.value == date) {
					alert("이미 추가된 날짜입니다");
					location.reload();
					return;
				}
			}

			$.ajax({
				url: '/app/meal/plusMeal',
				type: 'get',
				data: { "breakfastDate": selectDate.value, "dietNo" : dietNo },
				success: function (data) {
					if(data == "success") {
						alert("조식 추가가 완료되었습니다");
					} else {
						alert("조식 추가를 실패하였습니다");
					}
					location.reload();
				},
				error: function () {
					alert("조식 추가 중 오류가 발생했습니다");
				}
			});

			document.querySelector(".modal").className = "modal";
		}

		var dateArr = [];
		<c:forEach items="${mealListTotal}" var="vo">
			dateArr.push('${vo.breakfastDate.substring(0, 10)}');
		</c:forEach>
	</script>