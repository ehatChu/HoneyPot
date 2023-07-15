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

        #zzz03 {
            height: 225px;
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

        #dbox {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
        }

        #bbox {
            width: 200px;
            height: 130px;
            border: 1px solid #EAEAEA;
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

        #tit3 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        #tit4 {
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 40px;
            font-weight: bold;
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

        .red1 {
            color: red;
        }
        .blue1 {
            color: blue;
        }
        .green1 {
            color: #03A800;
        }
        .yellow1 {
            color: #FFB800;
        }

        .like1 {
            width: 100px;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            font-weight: bold;
        }

        .like2 {
            width: 100px;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
        }

        .dong {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            width: 100%;
            height: 100px;
        }

        .dong1 {
            font-size: 32px;
        }

        .graph {
            position: relative;
            width: 280px;
            height: 280px;
            border-radius: 50%;
            transition: 0.3s;
            display: flex;
        }

        .graph:after {
            content: '';
            background: #fff;
            position: absolute;
            top: 50%;
            left: 50%;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            transform: translate(-50%, -50%);
        }

        .chart-bar {
            width: inherit;
            height: inherit;
            border-radius: 50%;
            position: relative;
        }

        .chart-total {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: gray;
            width: 100%;
        }

        .chart-total span {
            position: absolute;
            color: #777;
        }

        .chart-total-num {
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #333;
            text-align: center;
        }

        .total_category {
            font-size: 16px;
        }

        .answer_category {
            font-size: 26px;
            font-weight: bold;
        }

        .chart-total-text1 {
            top: -170px;
            right: 20px;
        }

        .chart-total-text2 {
            top: -50px;
            right: -70px;
        }

        .chart-total-text3 {
            top: 140px;
            right: -10px;
        }

        .chart-total-text4 {
            top: 0;
            left: -70px;
        }

        .chart-total-text5 {
            top: -130;
            left: -50px;
        }

        .chart-total-text6 {
            top: -50;
            left: -70px;
        }

        .graph-area {
            position: relative;
            width: 280px;
            height: 280px;
            margin-left: 60px;
            margin-top: 30px;
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
                                <div>아파트 점검</div>
                            </div>
                            <% } %>
                    </div>
                    <div id="box1" class="box">
                        <div id="tit2">관리비 사용 비율</div>
                        <div class="graph-area">
                            <div class="graph">
                                <div class="chart-bar" data-deg="50"></div>
                                <div class="chart-bar" data-deg="100"></div>
                                <div class="chart-bar" data-deg="130"></div>
                                <div class="chart-bar" data-deg="80"></div>
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
                        <div id="zzz03" class="box">
                            <div id="tit2">민원 현황</div>
                            <div id="dbox">
                                <div id="bbox" class="box">
                                    <div id="tit3">신고</div>
                                    <div id="tit4" class="red1">11</div>
                                </div>
                                <div id="bbox" class="box">
                                    <div id="tit3">문의</div>
                                    <div id="tit4" class="yellow1">5</div>
                                </div>
                            </div>
                        </div>
                        <div id="zzz03" class="box">
                            <div id="tit2">입주민 현황</div>
                            <div id="dbox">
                                <div id="bbox" class="box">
                                    <div id="tit3">가입 대기</div>
                                    <div id="tit4" class="green1">3</div>
                                </div>
                                <div id="bbox" class="box">
                                    <div id="tit3">입주민 수</div>
                                    <div id="tit4" class="blue1">476</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <br><br><br>

            </main>

    </body>

    </html>

    <script>
        basicSetting(); // 기본 셋팅
        headerName('홈'); // 현재 페이지 이름

        // 그래프 함수
        var _chart = document.querySelector('.graph');
        var _chartBar = document.querySelectorAll('.chart-bar');
        var color = ['#9986dd', '#fbb871', '#bd72ac', '#f599dc', '#ff7ead', '#47c4ec', '#5f9961', '#e7ffb5'] //색상
        var newDeg = []; //차트 deg

        function insertAfter(newNode, referenceNode) {
            referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
        }

        function chartLabel() {
            var _div = document.createElement('div');
            _div.className = 'chart-total';
            _div.innerHTML = `<span class="chart-total-num"><div class="total_category">최대 지출 카테고리</div><br><div class="answer_category">외식</div><br><div class="cost">375,000 원</div></span>
							<span class="chart-total-text1">문화/예술</span>
							<span class="chart-total-text2">금융/보험</span>
							<span class="chart-total-text3">생활/마트</span>
							<span class="chart-total-text4">의료/건강</span>`;
            insertAfter(_div, _chart);
        }

        function chartDraw() {
            for (var i = 0; i < _chartBar.length; i++) {
                var _num = _chartBar[i].dataset.deg
                newDeg.push(_num)
            }

            var num = newDeg.length - newDeg.length;
            _chart.style.background = 'conic-gradient(#9986dd ' +
                newDeg[num] + 'deg, #fbb871 ' +
                newDeg[num] + 'deg ' + newDeg[num + 1] + 'deg, #bd72ac ' +
                newDeg[1] + 'deg ' + newDeg[2] + 'deg, #f599dc ' +
                newDeg[2] + 'deg)';

            chartLabel();
        }

        chartDraw();

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