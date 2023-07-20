<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	
	<c:set value="${pageContext.request.contextPath}" var="root" />
	
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
		<!-- sweetAlert CDN -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<link rel="stylesheet" href="${root}/resources/css/mypage/accountBook.css">
	</head>
	
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
									<tr id="line">
										<th>카테고리<i class="fa-solid fa-caret-down fa-lg"></i></th>
										<th>일자</th>
										<th>내용</th>
										<th>금액</th>
										<th>수정</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${avoList}" var="vo">
										<tr id="line">
											<td hidden>${vo.no}</td>
											<td>${vo.categoryName}</td>
											<td>${vo.accountDate }</td>
											<td class="detailBtn btn-click">${vo.content}</td>
											<td>${vo.price} 원</td>
											<td><button id="editBtn" class="editBtn"><i class="fa-solid fa-pen"></i></button></td>
											<td><button id="delBtn"><i class="fa-solid fa-xmark"></i></button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div id="page-area">
						<div class="paging">
							<button class="pageBtn">
								<c:if test="${pv.currentPage > 1}">
								<a href="/app/account/list?p=${pv.currentPage-1 }">이전</a>
								</c:if>
							</button>

							<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage }" >
							<button class="pageBtn">
							<a href="/app/account/list?p=${i}">${i}</a>
							</button>
							
							</c:forEach>
							
							<c:if test="${pv.currentPage < pv.maxPage }">
							<button class="pageBtn">
							<a href="/app/account/list?p=${pv.currentPage+1 }">다음</a>
							</button>
							</c:if>
							
						</div>
						<button id="openBtn" class="openBtn">등록</button>
						<div class="modal hidden">
							<div class="bg"></div>
								<div class="modalBox">
									<div class="upper-bar">
										<span>가계부 등록</span>
										<button class="closeBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
									</div>
									<form action="/app/account/add" method="post">
									<div class="content-modal">
											<div class="first-area">
											<input type="hidden" name="ano">
												<div>
													<span>일자</span>
													<br>
													<input type="date" name="accountDate">
												</div>
												<div>
													<span>카테고리</span>
													<br>
													<select id="acnt_category" name="accountCno">
														<option value="2">생활/마트</option>
														<option value="3">의료/건강</option>
														<option value="4">문화/예술</option>
														<option value="5">경조사/회비</option>
														<option value="1">금융/보험</option>
														<option value="6">교통/차량</option>
														<option value="7">뷰티/미용</option>
														<option value="8">기타지출</option>
													  </select>
												</div>
											</div>
											<div class="second-area">
												<span>금액</span>
												<br>
												<input type="text" name="price" dir="rtl" maxlength="10""> 원
											</div>
											<div class="third-area">
												<span>내용</span>
												<br>
												<textarea name="content" id="detailContent" placeholder="상세 내용을 입력하세요. 예시:저녁 장보기"></textarea>
											</div>
											<div id="submitBtn"><input type="submit" value="등록"></div>
										</div>
									</form>
								</div>
						</div>
					</div>
				</div>
			</div>
				<!-- 수정 -->
				<div class="edit-modal hidden">
							<div class="bg"></div>
								<div class="modalBox">
									<div class="upper-bar">
										<span>가계부 수정</span>
										<button class="closeBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
									</div>
									<form action="/app/account/edit" method="post">
									<div class="content-modal">
											<div class="first-area">
												<div>
													<span>일자</span>
													<br>
													<input type="date" name="accountDate">
												</div>
												<div>
													<span>카테고리</span>
													<br>
													<select id="acnt_category" name="accountCno">
														<option value="2">생활/마트</option>
														<option value="3">의료/건강</option>
														<option value="4">문화/예술</option>
														<option value="5">경조사/회비</option>
														<option value="1">금융/보험</option>
														<option value="6">교통/차량</option>
														<option value="7">뷰티/미용</option>
														<option value="8">기타지출</option>
													  </select>
												</div>
											</div>
											<div class="second-area">
												<span>금액</span>
												<br>
												<input type="text" name="price" dir="rtl" maxlength="10"> 원
											</div>
											<div class="third-area">
												<span>내용</span>
												<br>
												<textarea name="content" id="detailContent" placeholder="상세 내용을 입력하세요. 예시:저녁 장보기"></textarea>
											</div>
											<div id="submitBtn"><input type="submit" value="수정"></div>
									</div>
									</form>
							</div>
					</div>
					<!-- 상세조회 -->
				<div class="detail-modal hidden">
							<div class="bg"></div>
								<div class="modalBox">
									<div class="upper-bar">
										<span>가계부 조회</span>
										<button class="closeBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
									</div>
									<form action="/app/account/detail" method="post">
									<div class="content-modal">
											<div class="first-area">
												<div>
													<span>일자</span>
													<br>
													<input type="date" name="accountDate" value="2023-07-16">
												</div>
												<div>
													<span>카테고리</span>
													<br>
													<input id="acnt_category" name="accountCno" value="dd">
												</div>
											</div>
											<div class="second-area">
												<span>금액</span>
												<br>
												<input type="text" name="price" dir="rtl" maxlength="10" value="hhh"> 원
											</div>
											<div class="third-area">
												<span>내용</span>
												<br>
												<textarea name="content" id="detailContent" placeholder="상세 내용을 입력하세요. 예시:저녁 장보기" value="ee"></textarea>
											</div>
									</div>
									</form>
							</div>
					</div>
			</main>
	</body>

	</html>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	
		// 헤더 함수 실행
		basicSetting();
		firstNav(['내정보', '나의활동', '신청내역', '관리비'],'내정보');
		secondNav(['캘린더', '가계부', '사유물'],'가계부');
		headerName('마이페이지');

		// 그래프 함수
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
			var calendarEl = $('#calendar')[0];
			// full-calendar 생성
			var calendar = new FullCalendar.Calendar(calendarEl, {
				height: '560px', // calendar 높이 설정
				expandRows: true, // 화면에 맞게 높이 재설정
				// 해더에 표시할 툴바
				headerToolbar: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay'
				},
				initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
				selectable: true, // 달력 일자 드래그 설정가능
				nowIndicator: true, // 현재 시간 마크
				dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
				locale: 'ko', 
				eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
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
				// DB 받아와서 넣어주기
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

	////// 등록 모달
	// 모달 열기
	const openModal = () => {
	document.querySelector(".modal").classList.remove("hidden");
	};
	
	// 모달 닫기
	const closeModal = () => {
	document.querySelector(".modal").classList.add("hidden");
	};

	const openBtns = document.querySelectorAll(".openBtn");
	openBtns.forEach((btn) => {
	btn.addEventListener("click", openModal);
	});

	// 모달 닫기 버튼에 이벤트 추가
	document.querySelector(".closeBtn").addEventListener("click", closeModal);

	///// 수정 모달
	
	
	// 상세 조회 모달
	

	
	// 글 번호 전달하면서 상세 조회
	$(document).ready(function() {
    $('.btn-click').on('click', function() {
      const row = $(this).closest('tr');

      const ano = row.find('td:nth-child(1)').text();

	  $.ajax({
		type: 'GET', 
		url: '/app/account/detail', 
		dataType : "json",
		data: { no: ano },
		success: function(vo) {
			// 받아온 x로 상세내용 채워주기
			accountDateInput = document.querySelector("input[name='accountDate']");
			categoryNameInput = document.querySelector("input[name='categoryName']");
			contentInput = document.querySelector("input[name='content']");
			priceInput = document.querySelector("input[name='price']");

			accountDateInput = "";
			categoryNameInput= "";
			contentInput = "";
			priceInput = "";

			vo.categoryName

	},
	error: function(error) {
		console.error('Error:', error);
	}
	});

		});

	});

	

   
	

	
	// 금액칸 콤마 정규식
	function comma(str) {
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
  	

  	// 

	// 삭제 알림창
	// 백엔드 작업 시 삭제 버튼에 del 함수 걸어주기
	$().ready(function () {
    $("#delBtn").click(function () {
        Swal.fire({
            title: '삭제하시겠습니까?',
            text: "다시 되돌릴 수 없습니다.",
            icon: 'warning',
            showCancelButton: true,
			color: '#333',
            confirmButtonColor: '#ffce31',
            cancelButtonColor: '#ffce31',
            confirmButtonText: '승인',
			confirmButtonTextColor: '#333',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '삭제가 완료되었습니다.',
                )
            }
        })
    });
});

	</script>