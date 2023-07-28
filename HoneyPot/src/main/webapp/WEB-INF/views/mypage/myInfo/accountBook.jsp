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
		<!-- chart.js CDN -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script>
		<!-- CSS -->
		<link rel="stylesheet" href="${root}/resources/css/member/mypage/accountBook.css">
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
								<canvas id="myChart" style="display: block;height: 500px;width: 730px;" class="chartjs-render-monitor"></canvas>
								<div class="chart-category">
									<ul class="chart-legend clearfix" id="legend">
									  <li>카테고리 이름</li>
									</ul>
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
						<form id="accountForm" action="/app/account/list" method="GET">
							<div class="searchDiv">
								<select name="searchType" id="searchType">
									<option value="content">내용</option>
									<option value="accountCno">카테고리</option>
									<option value="accountDate">월 별</option>
								</select>
								<input type="search" placeholder="검색 할 내용을 입력하세요." name="searchValue">
								<select id="search_category" style="display: none;">
										<option value="2">생활/마트</option>
										<option value="3">의료/건강</option>
										<option value="4">문화/예술</option>
										<option value="5">경조사/회비</option>
										<option value="1">금융/보험</option>
										<option value="6">교통/차량</option>
										<option value="7">뷰티/미용</option>
										<option value="8">기타지출</option>
									</select>
								<select id="accountDate" style="display: none;"> 
									<option value=""></option>
									<option value=""></option>
									<option value=""></option>
									<option value=""></option>
									<option value=""></option>
								</select>
								<button type="submit"><i class="fa-solid fa-magnifying-glass fa-2x" ></i></button>
							</div>
						</form>
						</div>
					<div id="table-area">
						<div class="cal-area">
							
						</div>
						<div class="table-body-area">
							<table class="A_detail">
								<thead>
									<tr id="line">
										<th>카테고리</th>
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
											<td hidden>${vo.accountCno}</td>
											<td>${vo.categoryName}</td>
											<td>${vo.accountDate }</td>
											<td class="detailBtn Dbtn-click">${vo.content}</td>
											<td>${vo.price} 원</td>
											<td><button id="editBtn" class="editBtn Ebtn-click"><i class="fa-solid fa-pen"></i></button></td>
											<td><button class="delBtn"><i class="fa-solid fa-xmark"></i></button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 페이지 영역 -->
					<div id="page-area">
						<div class="paging">
							<c:if test="${pv.currentPage > 1}">
						<button id="pbtn" onclick="location.href='/app/account/list?p=${pv.currentPage - 1}'"> < </button>
					</c:if>
					<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
						<c:if test="${pv.currentPage != i}">
							<button id="pbtn" onclick="location.href='/app/account/list?p=${i}'">${i}</button>
						</c:if>
						<c:if test="${pv.currentPage == i}">
							<button id="current-page-btn">${i}</button>
						</c:if>
					</c:forEach>
					<c:if test="${pv.currentPage < pv.maxPage}">
						<button id="pbtn" onclick="location.href='/app/account/list?p=${pv.currentPage + 1}'"> > </button>
					</c:if>
							
						</div>
						<button id="openBtn" class="openBtn">등록</button>
						<div class="add-modal hidden">
							<div class="bg"></div>
								<div class="modalBox">
									<div class="upper-bar">
										<span>가계부 등록</span>
										<button class="closeBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
									</div>
									<form action="/app/account/add" method="post">
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
												<input type="text" name="price" maxlength="10"> 원
											</div>
											<div class="third-area">
												<span>내용</span>
												<br>
												<textarea name="content" id="detailContent" placeholder="상세 내용을 입력하세요. 예시:저녁 장보기"></textarea>
											</div>
											<div id="A_submitBtn"><input type="submit" value="등록"></div>
										</div>
									</form>
								</div>
						</div>
					</div>
				</div>
			</div>
				<!-- 수정 모달 -->
				<div class="edit-modal hidden">
					<div class="bg"></div>
					<div class="modalBox">
						<div class="upper-bar">
							<span>가계부 수정</span>
							<button class="EcloseBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
						</div>
						<div class="content-modal">
							<div class="first-area">
								<input hidden type="text" name="no" id="E_no">
								<div>
									<span>일자</span>
									<br>
									<input type="date" id="E_accountDate" name="accountDate">
								</div>
								<div>
									<span>카테고리</span>
									<br>
									<select id="E_accountCno" name="accountCno">
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
								<input type="text" id="E_price" name="price" maxlength="10"> 원
							</div>
							<div class="third-area">
								<span>내용</span>
								<br>
								<textarea id="E_detailContent" name="content" placeholder="상세 내용을 입력하세요. 예시:저녁 장보기"></textarea>
							</div>
							<div id="submitBtn"><button id="E_submitBtn">수정</button></div>
						</div>
					</div>
				</div>
				
					<!-- 상세조회 -->
					<div class="detail-modal hidden">
								<div class="bg"></div>
									<div class="modalBox">
										<div class="upper-bar">
											<span>가계부 조회</span>
											<button class="DcloseBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
										</div>
										<div class="content-modal">
												<div class="first-area">
													<div>
														<span>일자</span>
														<br>
														<div id="D_accountDate"></div>
													</div>
													<div>
														<span>카테고리</span>
														<br>
														<div id="D_categoryName"></div>
													</div>
												</div>
												<div class="second-area">
													<span>금액</span>
													<br>
													<div id="D_price"></div>
												</div>
												<div class="third-area">
													<span>내용</span>
													<br>
													<div class="D_detailContent"></div>
												</div>
										</div>
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
		firstNavLink(['','','','/app/fee/member']);
        secondNavLink(['','/app/account/list','']);

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

		//// 차트
		function drawChart(chartData) {
		var ctx = document.getElementById("myChart").getContext('2d');
		var myChart = new Chart(ctx, {
			type: 'doughnut',
			data: {
			labels: chartData.labels,
			datasets: [{
				data: chartData.data,
				backgroundColor: chartData.backgroundColor,
			}]
			},
			options: {
			cutoutPercentage: 40,
			legend: {
				display: false
			}}
		});
		}

		// DB 에서 정보 가져오기
		function loadChartData() {
		$.ajax({
			url: '/app/account/chart', 
			method: 'GET',
			dataType: 'json',
			success: function (data) {
			console.log(data);
			drawChart(data);
			var legendElement = $("#legend");
                legendElement.empty(); // 기존 내용 초기화

                if (data.labels && data.data) {
                    for (var i = 0; i < data.labels.length; i++) {
                        var label = data.labels[i];
                        var price = data.data[i];
						
						console.log(price);

                        var li = $("<li>").text(label + " : " + comma(price) + "원"); // 카테고리 이름과 가격을 합쳐서 생성
                        legendElement.append(li);
                    }
                } else {
                    var li = $("<li>").text("데이터가 없습니다.");
                    legendElement.append(li);
                }
            },
			error: function (error) {
			console.log(error);
			}
		});
		}

		// 데이터 차트 그리기 함수 실행
		$(document).ready(function () {
		loadChartData();
		});
			

		// 캘린더
		document.addEventListener('DOMContentLoaded', function () {
            $(function () {
                var request = $.ajax({
                    url: "/app/account/calendar", 
                    method: "GET",
                    dataType: "json"
                });
 
                request.done(function (data) {
                    console.log(data); // log 로 데이터 찍어주기.
 
                    var calendarEl = document.getElementById('calendar');
 
                    var calendar = new FullCalendar.Calendar(calendarEl, {
						height: 580,
                        initialDate: new Date(),
                        initialView: 'dayGridMonth',
                        headerToolbar: {
							left: 'prev,next',
							center: 'title',
							right: 'dayGridMonth,timeGridWeek,timeGridDay'
                        },
                        editable: false,
						dayMaxEventRows: 2,
						eventDisplay: 'auto',
						locale: 'ko',
                        droppable: true, 
                        drop: function (arg) {
                            if (document.getElementById('drop-remove').checked) {
                                arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                            }
                        },
						events: data,
						eventContent: function(info) {
						var price = info.event.extendedProps.price;
						var content = '';

						if (price !== undefined && price !== null) {
							content = '<div>' + info.event.title + '</div><div class="price">가격: ' + price + '</div>';
						} else {
							content = info.event.title;
						}

						return { html: content };
						},
						eventDidMount: function(info) {
							var title = info.event.title;
							var eventElement = info.el;
							var mainElement = eventElement.querySelector('.fc-event-main');

							if (title < 0) {
								mainElement.style.color = 'red'; // title 값이 0보다 작은 경우 빨간색으로 설정
							} else {
								mainElement.style.color = 'blue'; // title 값이 0보다 큰 경우 파란색으로 설정
							}
							}
					});

					calendar.render();
					});

					request.fail(function(jqXHR, textStatus) {
					alert("Request failed: " + textStatus);
					});
				});
				});

	/////// 검색 카테고리 선택 시 input 영역 변경
	$(document).ready(function() {
    function inputVisibility() {
      var selectedOption = $("#searchType").val();
      if (selectedOption === "content") {
        $("#search_category").hide();
        $("#accountDate").hide();
        $("input[name='searchValue']").show();
      } else if (selectedOption === "accountCno") {
        $("input[name='searchValue']").hide();
        $("#accountDate").hide();
        $("#search_category").show();
      } else if (selectedOption === "accountDate") {
        $("input[name='searchValue']").hide();
        $("#search_category").hide();
        $("#accountDate").show();
      }
    }

    inputVisibility();

    $("#searchType").on("change", function() {
		inputVisibility();
    });

	$("#accountForm").submit(function(e) {
        e.preventDefault(); 

        var selectedOption = $("#searchType").val();
        if (selectedOption === "accountCno") {
            var selectedCategory = $("#search_category").val();
            window.location.href = "/app/account/list?searchType=" + selectedOption + "&searchValue=" + selectedCategory;
        } else if (selectedOption === "accountDate") {
            var selectedDate = $("#accountDate").val();
            window.location.href = "/app/account/list?searchType=" + selectedOption + "&searchValue=" + selectedDate;
        } else {
            this.submit();
        }
    });
  });

 

	//검색 후 검색타입과 검색value 유지되도록
	const searchTypeTagArr = document.querySelectorAll("#searchType > option");
	const contentValue = document.querySelector("input[name=searchValue]");
	const categorySelect = document.querySelectorAll("#search_category > option");
	const dateSelect = document.querySelectorAll("#accountDate > option");
  	const searchValue = '${paramMap.searchValue}';
	
	if(searchValue === '1'){
		categorySelect[4].selected = true;
	}else if(searchValue === '2'){
		categorySelect[0].selected = true;
	}else if(searchValue === '3'){
		categorySelect[1].selected = true;
	}else if(searchValue === '4'){
		categorySelect[2].selected = true;
	}else if(searchValue === '5'){
		categorySelect[3].selected = true;
	}else if(searchValue === '6'){
		categorySelect[5].selected = true;
	}else if(searchValue === '7'){
		categorySelect[7].selected = true;
	}else if(searchValue === '8'){
		categorySelect[8].selected = true;
	}

	contentValue.value = '${paramMap.searchValue}';

	const x = "${paramMap.searchType}"; 

	if(x === 'content'){
		searchTypeTagArr[0].selected = true;
	}else if(x === 'accountCno'){
		searchTypeTagArr[1].selected = true;
	}else if(x === 'accountDate'){
		searchTypeTagArr[2].selected = true;
	}


	// 이번 달부터 5개의 달 생성
	function makeCurrentMonths() {
		var currentDate = new Date();
		var recentMonths = [];

		for (var i = 0; i < 5; i++) {
			var year = currentDate.getFullYear();
			var month = currentDate.getMonth() + 1;
			if (month < 10) {
				month = "0" + month;
			}
			var formattedDate = year + "-" + month;
			recentMonths.push(formattedDate);

			currentDate.setMonth(currentDate.getMonth() - 1);
		}

		return recentMonths;
	}

	// 날짜 검색란에 옵션 추가 함수
	function addOptionsToAccountDateSelect() {
		var accountDateSelect = document.querySelector("#accountDate");
		var recentMonths = makeCurrentMonths();
		var optionsHTML = "";

		for (var i = 0; i < recentMonths.length; i++) {
			optionsHTML += '<option value="' + recentMonths[i] + '">' + recentMonths[i].replace("-", "년 ") + '월</option>';
		}

		accountDateSelect.innerHTML = optionsHTML;

   
}

	// 날짜 검색 푸쉬 함수 호출
	addOptionsToAccountDateSelect();

	// #accountDate의 change 이벤트에 대한 처리
	var accountDateSelect = document.querySelector("#accountDate");
	accountDateSelect.addEventListener("change", function () {
		var selectedDate = accountDateSelect.value;
	});


	////// 등록 모달
	// 모달 열기
	const openModal = () => {
	document.querySelector(".add-modal").classList.remove("hidden");
	};
	
	// 모달 닫기
	const closeModal = () => {
	document.querySelector(".add-modal").classList.add("hidden");
	};

	const openBtns = document.querySelectorAll(".openBtn");
	openBtns.forEach((btn) => {
	btn.addEventListener("click", openModal);
	});

	// 모달 닫기 버튼에 이벤트 추가
	const closeBtn = document.querySelector(".closeBtn");
	closeBtn.addEventListener("click", closeModal);

	///////// 수정 모달
	$(document).ready(function() {
    $(".editBtn").on("click", function() {
	  var no = $(this).closest("tr").find("td:nth-child(1)").text().trim();
      var categoryName = $(this).closest("tr").find("td:nth-child(3)").text().trim();
      var accountDate = $(this).closest("tr").find("td:nth-child(4)").text().trim();
      var content = $(this).closest("tr").find("td:nth-child(5)").text().trim();
      var price = $(this).closest("tr").find("td:nth-child(6)").text().trim();
	  // 가격 원 붙은 거 떼기
      var numericPrice = parseInt(price.replace(/\D/g, ""));

      $("#E_accountDate").val(accountDate);
      $("#E_detailContent").text(content);
      $("#E_price").val(numericPrice || 0);
	  $("#E_no").val(no);
	  // 카테고리 선택된 값 가져오기
	  $("#accountCno option").filter(function() {
        return $(this).text() === categoryName;
      }).prop('selected', true);

      $(".edit-modal").removeClass("hidden");
    });

    $(".EcloseBtn").on("click", function() {
      $(".edit-modal").addClass("hidden");
    });

    $("#E_submitBtn").on("click", function() {

	  var updatedCategoryName = $("#E_accountCno").val();
      var updatedAccountDate = $("#E_accountDate").val();
      var updatedContent = $("#E_detailContent").val();
	  console.log(updatedContent);
      var updatedPrice = $("#E_price").val();
	  var no = $("#E_no").val();

	  var data = new FormData();
      data.append("accountCno", updatedCategoryName);
      data.append("accountDate", updatedAccountDate);
      data.append("content", updatedContent);
      data.append("price", updatedPrice);
	  data.append("no", no);

      $.ajax({
        type: "POST",
        url: "/app/account/edit",
        data: data,
		contentType: false, 
        processData: false,
        success: function(response) {
			console.log(response);
			if(response == 'success'){
				window.location.href = "/app/account/list";
			}
        },
        error: function(error) {
        }
      });

      $(".edit-modal").addClass("hidden");
    });
  });

	//////// 글 번호 전달하면서 상세 조회
	$(document).ready(function() {
    $('.Dbtn-click').on('click', function() {
		const row = $(this).closest('tr');

		const ano = row.find('td:nth-child(1)').text();

		const detailModal = document.querySelector(".detail-modal");
		const dcloseBtn = document.querySelector(".DcloseBtn");
		const accountDateInput = document.querySelector("#D_accountDate");
		const	categoryNameInput = document.querySelector("#D_categoryName");
		const	contentInput = document.querySelector(".D_detailContent");
		const	priceInput = document.querySelector("#D_price");
		detailModal.classList.remove("hidden");

	  	$.ajax({
			type: 'get', 
			url: '/app/account/detail', 
			dataType : "json",
			data: { no: ano },
			success: function(voJson) {
				console.log(voJson);
				// 받아온 vo로 상세내용 채워주기
				const accountDate = voJson.accountDate;
				const categoryName = voJson.categoryName;
				const content = voJson.content;
				const price = voJson.price;
				accountDateInput.innerHTML = accountDate;
				categoryNameInput.innerHTML = categoryName;
				contentInput.innerHTML = content;
				priceInput.innerHTML = price;
			},
			error: function(error) {
				console.error('Error:', error);
			}
		});

		dcloseBtn.addEventListener("click", function(){
			detailModal.classList.add("hidden");
		});

	  
	});

});


	// 삭제 알림창
	$().ready(function () {
	$(".delBtn").click(function () { 
		const row = $(this).closest('tr');
		const ano = row.find('td:nth-child(1)').text();
        Swal.fire({
            title: '삭제하시겠습니까?',
            text: "다시 되돌릴 수 없습니다.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#ffce31',
            cancelButtonColor: '#ffce31',
            confirmButtonText: '승인',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'POST', 
                    url: '/app/account/del',  
                    data: { no: ano }, 
                    success: function (response) {
							location.reload();
                    },
                    error: function (error) {
                        console.error('AJAX 요청 실패:', error);
                    }
                });
			}
        });
    });
});
	</script>