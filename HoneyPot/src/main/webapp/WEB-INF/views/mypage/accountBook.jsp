<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- full calendar lib-->
		<!-- jquery CDN -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<!-- fullcalendar CDN -->
		<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
		<!-- fullcalendar 언어 CDN -->
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	</head>
	
	<style>
		#wrap{
			height: 1500px;
			display: grid;
			grid-template-rows: 1fr 2fr;
			margin-left: 20px;
		}

		#showStatistics-area{
			display: grid;
			grid-template-columns: 800px 710px;
			margin-top: 40px;
		}

		#A_graph-area{
			border: 1px solid #FFFFFF;
			box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.25);
			border-radius: 20px;
			background: #FFFFFF;
			display: grid;
			grid-template-rows: 100px 400px;
			margin-top: 20px;
			margin-right: 20px;
			height: 600px;
		}

		.A_title{
			font-size: 35px;
			text-align: left;
			margin-left: 50px;
			margin-top: 25px;
		}
		
		.graph-area{
			position: relative;
			width: 350px;
			height: 350px;
			margin:80px;
		}
		.graph {
			position: relative;
			width: 350px;
			height: 350px;
			border-radius: 50%;
			transition: 0.3s;
			display:inline-block;
		}
		.graph:after{
			content:'';
			background: #fff;
			position: absolute;
			top:50%; left:50%;
			width:200px; height:200px;
			border-radius: 50%;
			transform: translate(-50%, -50%);
		}
		.chart-bar{
			width: inherit;
			height: inherit;
			border-radius: 50%;
			position: relative;
		}

		.chart-total{
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background:gray;
			width:100%;
		}
		.chart-total span{
			position: absolute;
			color:#777;
		}
		.chart-total-num{
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			color:#333;
			text-align: center;
		}
		.total_category {
			font-size: 18px;
		}

		.answer_category {
			font-size: 26px;
			font-weight: bold;
		}

		.chart-total-text1{
			top:-170px;right:20px;
		}
		.chart-total-text2{
			top:-50px;right:-70px;
		}
		.chart-total-text3{
			top:140px;right:-10px;
		}
		.chart-total-text4{
			top:0;left:-70px;
		}
		.chart-total-text5{
			top:-130;left:-50px;
		}
		.chart-total-text6{
			top:-50;left:-70px;
		}

		.A_content {
			display: grid;
			grid-template-columns: 1fr 1fr;
		}

		.text-area{
			display: grid;
			grid-template-columns: 1fr 1fr;
			font-size: 20px;
			font-weight: 300;
			justify-items: center;
			align-content: center;
			line-height: 50px;
		}

		.text-area > span:first-child {
			font-weight: 500;
		}

		#calendar {
			margin-top: 20px;
		}

		.fc-header-toolbar {
			padding-top: 1em;
			padding-left: 1em;
			padding-right: 1em;
		}

		.fc-event-title-container {
			background: #f6b341;
			color: black;
		}

		/* 상세내역 */
		#detail-area {
			display: grid;
			grid-template-rows: 100px 500px 80px;
			margin-top: 40px;
			margin-right: 10px;
		}

		#search-area {
			display: flex;
			justify-content: space-between;
			align-items: center;

		}

		#search-area > span {
			font-weight: 500;
			font-size: 35px;
			color: #4A321F;
		}

		#search-area > div > input{
			width: 300px;
			height: 40px;
			border-radius: 20px;
			margin-right: 15px;
			font-size: 15px;
			padding: 20px;
		}

		#table-area {
			display:  grid;
			grid-template-rows: 50px 450px;
		}

		.cal-area {
			background-color: #FAD355;
			color: black;
			display: flex;
			justify-content: space-between;
			align-items: center;
			font-size: 20px;
		}

		.cal-area > .left {
			margin-left: 20px;
		}

		.cal-area > .right {
			margin-right: 20px;
		}

		.cal-area > span {
			margin-right: 50px;
		}

		.A_detail {
			width: 1518px;
			height: 450px;
			text-align: center;
			vertical-align: middle;
			border-collapse: collapse;
			background: #FFFFFF;
		}

		.line{border-bottom:1px solid black;}
		
		.A_detail > thead > tr {
			font-size: 18px;
			height: 40px;
		}

		.A_detail > thead > tr >th:first-child > i {
			margin-left: 10px;
		}

		#page-area {
			display: grid;
			grid-template-columns: 950px 564px;
			justify-items: end;
			align-items: center;
			margin-top: 10px;
		}
		
		.paging {
			display: flex;
			align-items: baseline;
		}

		.paging > div {
			width: 20px;
			height: 20px;
			margin-right: 40px;
		}

		.openBtn {
			background-color: #ffce31;
			color: black;
			width: 150px;
			height: 40px;
			font-size: 18px;
			font-weight: 550;
			text-align: center;
			border-radius: 12px;
			border: none;
		}

		.modal {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
        }

        .modal .bg {
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.6);
        }

        .modalBox {
          position: absolute;
          background-color: #fff;
          width: 700px;
          height: 500px;
          padding: 15px;
		  border-radius: 20px;
        }

        .modalBox button {
          display: block;
          width: 80px;
          margin: 0 auto;
        }

        .hidden {
          display: none;
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
					<div id="showStatistics-area">
						<div id="A_graph-area">
							<div class="A_title">
								분류별 지출
							</div>
							<div class="A_content">
								<div class="graph-area">
									<div class="graph">
										<div class="chart-bar" data-deg="50"></div>
										<div class="chart-bar" data-deg="100"></div>
										<div class="chart-bar" data-deg="130"></div>
										<div class="chart-bar" data-deg="80"></div>
									</div>
								</div>
								<div class="text-area">
									<span>
										금융/보험
										<br>
										생활/마트
										<br>
										의료/건강
										<br>
										문화/예술
										<br>
										경조사/회비
										<br>
										교통/차량
										<br>
										뷰티/미용
										<br>
										기타지출
									</span>
									<span>
										210,000 원
										83,000 원
										50,000 원
										47,200 원
										35,100 원
										20,000 원
										15,000 원
										7,500 원
									</span>
								</div>
							</div>
						</div>
						<div id='calendar-container'>
							<div id='calendar'></div>
						</div> 			
				</div> 
				<div id="detail-area">
					<div id="search-area">
						<span>상세내역</span>
						<div><input type="text" placeholder="검색 할 내용을 입력하세요."><i class="fa-solid fa-magnifying-glass fa-lg" ><a href=""></a></i></div>
					</div>
					<div id="table-area">
						<div class="cal-area">
							<div class="left"><i class="fa-solid fa-chevron-left"></i></div>
							<span>2023년 7월</span>
							<div class="right"><i class="fa-solid fa-chevron-right"></i></div>
						</div>
						<div>
							<table class="A_detail">
								<thead>
									<tr class="line">
										<th>카테고리<i class="fa-solid fa-caret-down fa-lg"></i></th>
										<th>일자</th>
										<th>내용</th>
										<th>금액</th>
										<th>수정</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach begin="1" end="10">
										<tr class="line">
											<td>금융/보험</td>
											<td>11일</td>
											<td>우체국 운전자 보험</td>
											<td>55,000 원</td>
											<td><i class="fa-solid fa-pen"></i></td>
											<td><i class="fa-solid fa-xmark"></i></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div id="page-area">
						<div class="paging">
							<div><i class="fa-solid fa-angle-left fa-lg" style="color: #ffce31;"></i></div>
							<c:forEach begin="1" end="5">
								<div class="num-area">1</div>
							</c:forEach>
							<div><i class="fa-solid fa-angle-right fa-lg" style="color: #ffce31;"></i></div>
						</div>
						<button class="openBtn">등록</button>
						<div class="modal hidden">
							<div class="bg"></div>
								<div class="modalBox">
								<input type="text">
								<button class="closeBtn">✖</button>
								</div>
						</div>
					</div>
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
				menus += "<div class='choice-elem'><div class='title-elem'>" + menu + "</div></div>"
			}
			mainChoice.innerHTML = menus;
		}
		function secondNav() {
			const subChoice = document.querySelector("#grid-sub-choice");
			let navMenu2 = ['캘린더', '가계부', '사유물'];

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

		var _chart = document.querySelector('.graph');
		var _chartBar = document.querySelectorAll('.chart-bar');
		var color = ['#9986dd','#fbb871','#bd72ac','#f599dc','#ff7ead','#47c4ec','#5f9961','#e7ffb5'] //색상
		var newDeg = []; //차트 deg

		function insertAfter(newNode, referenceNode) {
			referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
		}

		function chartLabel(){
		var _div = document.createElement('div');
		_div.className = 'chart-total';
		_div.innerHTML = `<span class="chart-total-num"><div class="total_category">최대 지출 카테고리</div><br><div class="answer_category">외식</div><br><div class="cost">375,000 원</div></span>
							<span class="chart-total-text1">문화/예술</span>
							<span class="chart-total-text2">금융/보험</span>
							<span class="chart-total-text3">생활/마트</span>
							<span class="chart-total-text4">의료/건강</span>`;
		insertAfter(_div,_chart);
		}

		function chartDraw(){ 
		for( var i=0;i<_chartBar.length;i++){
			var _num = _chartBar[i].dataset.deg
			newDeg.push( _num )
		}

		var num = newDeg.length - newDeg.length;
		_chart.style.background = 'conic-gradient(#9986dd '+
														newDeg[num]+'deg, #fbb871 '+
														newDeg[num]+'deg '+newDeg[num+1]+'deg, #bd72ac '+
														newDeg[1]+'deg '+newDeg[2]+'deg, #f599dc '+
														newDeg[2]+'deg)';
		
		chartLabel();
		}

		chartDraw();

		// 캘린더
		(function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '600px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', 
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
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
		events: [
          {
            title: 'All Day Event',
            start: '2023-07-01',
          },
          {
            title: '-20000',
            start: '2023-07-02',
          },
          {
            title: '-1500',
            start: '2023-07-03'
          },
          {
            title: '-15000',
            start: '2023-07-03'
          },
          {
			title: '-10000',
            start: '2023-07-05'
          },
          {
            title: '-35000',
            start: '2023-07-07'
          },
          {
            title: '-153000',
            start: '2023-07-15'
          }
        ]
      });
      // 캘린더 랜더링
      calendar.render();
    });
  })();

  // 등록 모달
  const open = () => {
    document.querySelector(".modal").classList.remove("hidden");
  }

  const close = () => {
    document.querySelector(".modal").classList.add("hidden");
  }

  document.querySelector(".openBtn").addEventListener("click", open);
  document.querySelector(".closeBtn").addEventListener("click", close);
  document.querySelector(".bg").addEventListener("click", close);

	</script>