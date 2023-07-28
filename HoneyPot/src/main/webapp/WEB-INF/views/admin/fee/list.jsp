<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
        <!-- sweetAlert CDN -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <!-- CSS -->
		<link rel="stylesheet" href="/app/resources/css/admin/fee/list.css">
	</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav>
				<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
				<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
			</nav>

			<main>
				<div id="wrap">
                    <!-- 관리비 등록,수정 -->
                    <div id="list-area">
                        <div id="search-area">
                               <div>관리비 상세 내역</div>                            
                            <form id="adminFeeForm"action="/app/fee/admin" method="GET">
                                <div class="searchDiv">
                                    <select name="searchType" id="searchType">
                                        <option value="content">내용</option>
                                        <option value="paymentDate">월 별</option>
                                    </select>
                                    <input type="search" placeholder="검색 할 내용을 입력하세요." name="searchValue">
                                    <select id="paymentDate" style="display: none;"> 
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
                        <div class="table-body-area">
                            <table class="A_detail">
                                <thead>
                                    <tr class="line">
                                        <th>항목</th>
                                        <th>발생금액</th>
                                        <th>발생일자</th>
                                        <th>비고</th>
                                        <th>수정</th>
                                        <th>삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${avoList }" var="vo">
                                        <tr class="line">
                                            <td hidden>${vo.no}</td>
                                            <td>${vo.categoryName}</td>
                                            <td id="listPrice">${vo.price }</td>
                                            <td>${vo.paymentDate }</td>
                                            <td class="detailBtn Dbtn-click">${vo.content }</td>
                                            <td><button id="editBtn" class="editBtn Ebtn-click"><i class="fa-solid fa-pen"></i></button></td>
                                            <td><button id="delBtn"><i class="fa-solid fa-xmark fa-lg"></i></button></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- 페이지 영역 -->
                        <div id="page-area">
                            <div class="paging">
                                <c:if test="${pv.currentPage > 1}">
                            <button id="pbtn" onclick="location.href='/app/fee/admin?p=${pv.currentPage - 1}'"> < </button>
                        </c:if>
                        <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
                            <c:if test="${pv.currentPage != i}">
                                <button id="pbtn" onclick="location.href='/app/fee/admin?p=${i}'">${i}</button>
                            </c:if>
                            <c:if test="${pv.currentPage == i}">
                                <button id="current-page-btn">${i}</button>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pv.currentPage < pv.maxPage}">
                            <button id="pbtn" onclick="location.href='/app/fee/admin?p=${pv.currentPage + 1}'"> > </button>
                        </c:if>
                        </div>
                            <button id="openBtn" class="openBtn">등록</button>
                            <!-- 등록 모달 영역 -->
                            <div class="A_modal hidden">
                                <div class="bg"></div>
                                    <div class="modalBox">
                                        <div class="upper-bar">
                                            <span>관리비 등록</span>
                                            <button class="A_closeBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
                                        </div>
                                        <form action="/app/fee/admin/add" method="post">
                                        <div class="content-modal">
                                                <div class="first-area">
                                                    <div>
                                                        <span>발생일자</span>
                                                        <br>
                                                        <input type="date" name="paymentDate">
                                                    </div>
                                                    <div>
                                                        <span>카테고리</span>
                                                        <br>
                                                        <select id="A_afee_category" name="feeCno">
                                                            <option value="1">시설 유지보수</option>
                                                            <option value="2">소독 및 청소</option>
                                                            <option value="3">경비원 비용</option>
                                                            <option value="4">정원 가꾸기</option>
                                                            <option value="5">보험</option>
                                                            <option value="6">공공 요금</option>
                                                            <option value="7">일반 관리비</option>
                                                            <option value="8">기타</option>
                                                          </select>
                                                    </div>
                                                </div>
                                                <div class="second-area">
                                                    <span>금액</span>
                                                    <br>
                                                    <input type="text" dir="rtl" maxlength="10" name="price"> 원
                                                </div>
                                                <div class="third-area">
                                                    <span>비고 작성란</span>
                                                    <br>
                                                    <textarea id="A_detailContent" placeholder="상세하게 적을 내용을 작성하세요. 예시 : 공공 요금 (열 요금, 가스 요금 등)" name="content"></textarea>
                                                </div>
                                                <div id="A_submitBtn"><input type="submit" value="등록"></div>
                                            </div>
                                        </form>
                                    </div>
                            </div>

                    </div>

                    <!-- 관리비 월별 총괄표-->
                    <div id="month-total-area">
                        <div id="title-area">
                            <div>
                                <select name="" id="date-box">
									<option value="2023-02">02월</option>
									<option value="2023-03">03월</option>
									<option value="2023-04">04월</option>
									<option value="2023-05">05월</option>
									<option value="2023-06" selected>06월</option>
								</select>
                               <div>관리비 총괄표</div>                            
                            </div>
                            <div>
                                <div><img src="/app/resources/temp/excel.png" alt="" width="40px" height="40px" class="excel"></div>
                            </div>
                        </div>
                        <div>
                            <table class="A_detail">
                                <thead>
                                    <tr class="line">
                                        <th>항목</th>
                                        <th>당월 발생금액</th>
                                        <th>전월 발생금액</th>
                                        <th>비고</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- <c:forEach begin="1" end="5"> -->
                                        <tr class="line" id="test">
                                            <td>일반관리비</td>
                                            <td>21,750,840</td>
                                            <td>21,640,330</td>
                                            <td></td>
                                        </tr>
                                        <tr class="line" id="test">
                                            <td>감가상각비</td>
                                            <td>490,000</td>
                                            <td>490,000</td>
                                            <td>일반관리비에서 분리</td>
                                        </tr>
                                        <tr class="line" id="subTotal">
                                            <td>소계</td>
                                            <td>55,740,840</td>
                                            <td>55,740,840</td>
                                            <td></td>
                                        </tr>
                                    <!--</c:forEach>-->
                                </tbody>
                            </table>
                        </div>
                        </div>

                        <!-- 수정 모달 영역 -->
                        <div class="edit-modal hidden">
                            <div class="bg"></div>
                            <div class="modalBox">
                                <div class="upper-bar">
                                    <span>관리비 수정</span>
                                    <button class="EcloseBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
                                </div>
                                <div class="content-modal">
                                    <input type="text" id="E_no" name="no" hidden>
                                    <div class="first-area">
                                        <div>
                                            <span>발생일자</span>
                                            <br>
                                            <input type="date" name="paymentDate" id="E_paymentDate">
                                        </div>
                                        <div>
                                            <span>카테고리</span>
                                            <br>
                                            <select class="E_afee_category" name="feeCno" id="E_feeCno">
                                                <option value="1">시설 유지보수</option>
                                                <option value="2">소독 및 청소</option>
                                                <option value="3">경비원 비용</option>
                                                <option value="4">정원 가꾸기</option>
                                                <option value="5">보험</option>
                                                <option value="6">공공 요금</option>
                                                <option value="7">일반 관리비</option>
                                                <option value="8">기타</option>
                                              </select>
                                        </div>
                                    </div>
                                    <div class="second-area">
                                        <span>금액</span>
                                        <br>
                                        <input type="text" dir="rtl" maxlength="10" name="price" id="E_price"> 원
                                    </div>
                                    <div class="third-area">
                                        <span>비고 작성란</span>
                                        <br>
                                        <textarea id="E_detailContent" placeholder="상세하게 적을 내용을 작성하세요. 예시 : 공공 요금 (열 요금, 가스 요금 등)" name="content" ></textarea>
                                    </div>
                                    <div id="E_submitBtn"><input type="submit" value="등록"></div>
                            </div>
                        </div>
                    </div>

                    <!-- 상세조회 -->
					<div class="detail-modal hidden">
                        <div class="bg"></div>
                            <div class="modalBox">
                                <div class="upper-bar">
                                    <span>관리비 조회</span>
                                    <button class="DcloseBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
                                </div>
                                <div class="content-modal">
                                        <div class="first-area">
                                            <div>
                                                <span>발생일자</span>
                                                <br>
                                                <input type="date" name="paymentDate" id="D_paymentDate">
                                            </div>
                                            <div>
                                                <span>카테고리</span>
                                                <br>
                                                <select class="D_afee_category" name="feeCno" id="D_feeCno">
                                                    <option value="1">시설 유지보수</option>
                                                    <option value="2">소독 및 청소</option>
                                                    <option value="3">경비원 비용</option>
                                                    <option value="4">정원 가꾸기</option>
                                                    <option value="5">보험</option>
                                                    <option value="6">공공 요금</option>
                                                    <option value="7">일반 관리비</option>
                                                    <option value="8">기타</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="second-area">
                                            <span>금액</span>
                                            <br>
                                            <input type="text" dir="rtl" maxlength="10" name="price" id="D_price"> 원
                                        </div>
                                        <div class="third-area">
                                            <span>비고 작성란</span>
                                        <br>
                                        <textarea id="D_detailContent" name="content" ></textarea>
                                        </div>
                                </div>
                            </div>
                    </div>

				</div>
			</main>

	</body>

	</html>

	<script>
		
		// 헤더 함수 실행
		basicSetting();
		firstNav(['회원관리', '상담센터', '게시판', '단지관리', '캘린더'],'단지관리');
		secondNav(['관리비', '비품관리', '편의시설관리', '리뷰관리'],'관리비');
    	headerName('관리자');

        $(document).ready(function() {
            function inputVisibility() {
            var selectedOption = $("#searchType").val();
            if (selectedOption === "content") {
                $("select[name='paymentDate']").hide();
                $("input[name='searchValue']").show();
            } else if (selectedOption === "accountDate") {
                $("input[name='searchValue']").hide();
                $("select[name='paymentDate']").show();
            }
            }

            inputVisibility();

            $("#searchType").on("change", function() {
                inputVisibility();
            });
        });

        // 숫자를 3자리마다 쉼표가 있는 문자열로 변환하는 함수
		function addCommasToNumberInElement(element) {
			const text = element.textContent;
			const number = parseFloat(text.replace(/,/g, '')); 
			if (!isNaN(number)) {
			const formattedNumber = number.toLocaleString();
			element.textContent = formattedNumber; 
			}
		}

		window.onload = function () {
			const priceElements = document.querySelectorAll('#listPrice');
			priceElements.forEach((element) => {
			addCommasToNumberInElement(element);
		});
	};

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
		var accountDateSelect = document.querySelector("#paymentDate");
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
	var accountDateSelect = document.querySelector("#paymentDate");
	accountDateSelect.addEventListener("change", function () {
		var selectedDate = accountDateSelect.value;
	});


    /////// 검색 카테고리 선택 시 input 영역 변경
	$(document).ready(function () {
    function inputVisibility() {
        var selectedOption = $("#searchType").val();
        if (selectedOption === "content") {
            $("#paymentDate").hide();
            $("input[name='searchValue']").show();
        } else if (selectedOption === "paymentDate") {
            $("input[name='searchValue']").hide();
            $("#paymentDate").show();
        }
    }

    inputVisibility();

    $("#searchType").on("change", function () {
        inputVisibility();
    });

    //검색 후 검색타입과 검색value 유지되도록
	const searchTypeTagArr = document.querySelectorAll("#searchType > option");
	const contentValue = document.querySelector("input[name=searchValue]");
	const dateSelect = document.querySelectorAll("#paymentDate > option");
  	const searchValue = '${paramMap.searchValue}';
	
	contentValue.value = '${paramMap.searchValue}';

	const x = "${paramMap.searchType}"; 

	if(x === 'content'){
		searchTypeTagArr[0].selected = true;
	}else if(x === 'paymentDate'){
		searchTypeTagArr[1].selected = true;
	}

    // form 제출할 때 값 보내주기 
    $("#adminFeeForm").submit(function (e) {
        e.preventDefault();

        var selectedOption = $("#searchType").val();
        if (selectedOption === "paymentDate") {
            var selectedDate = $("#paymentDate").val();
            window.location.href = "/app/fee/admin?searchType=" + selectedOption + "&searchValue=" + selectedDate;
        } else {
            this.submit();
        }
    });
});

        ////// 등록 모달

        // 모달 열기
        const openModal = () => {
        document.querySelector(".A_modal").classList.remove("hidden");
        };

        // 모달 닫기
        const closeModal = () => {
        document.querySelector(".A_modal").classList.add("hidden");
        };

        const openBtns = document.querySelectorAll(".openBtn");
        openBtns.forEach((btn) => {
        btn.addEventListener("click", openModal);
        });

        // 모달 닫기 버튼에 이벤트 추가
        document.querySelector(".A_closeBtn").addEventListener("click", closeModal);

        // 모달 배경 클릭 시 모달 닫기
        document.querySelector(".bg").addEventListener("click", closeModal);

        ///////// 수정 모달
        $(document).ready(function() {
        $(".editBtn").on("click", function() {
        var no = $(this).closest("tr").find("td:nth-child(1)").text().trim();
        var categoryName = $(this).closest("tr").find("td:nth-child(2)").text().trim();
        var paymentDate = $(this).closest("tr").find("td:nth-child(4)").text().trim();
        var content = $(this).closest("tr").find("td:nth-child(5)").text().trim();
        var price = $(this).closest("tr").find("td:nth-child(3)").text().trim();
        // 가격 원 붙은 거 떼기
        var numericPrice = parseInt(price.replace(/\D/g, ""));

        $("#E_paymentDate").val(paymentDate);
        $("#E_detailContent").text(content);
        $("#E_price").val(numericPrice || 0);
        $("#E_no").val(no);
        // 카테고리 선택된 값 가져오기
        $("#E_feeCno option").filter(function() {
            return $(this).text() === categoryName;
        }).prop('selected', true);

        $(".edit-modal").removeClass("hidden");
        });

        $(".EcloseBtn").on("click", function() {
        $(".edit-modal").addClass("hidden");
        });

        $("#E_submitBtn").on("click", function() {

        var updatedCategoryName = $("#E_feeCno").val();
        var updatedPaymentDate = $("#E_paymentDate").val();
        var updatedContent = $("#E_detailContent").val();
        console.log(updatedContent);
        var updatedPrice = $("#E_price").val();
        var no = $("#E_no").val();

        var data = new FormData();
        data.append("feeCno", updatedCategoryName);
        data.append("paymentDate", updatedPaymentDate);
        data.append("content", updatedContent);
        data.append("price", updatedPrice);
        data.append("no", no);

        $.ajax({
            type: "POST",
            url: "/app/fee/admin/edit",
            data: data,
            contentType: false, 
            processData: false,
            success: function(response) {
                console.log(response);
                if(response == 'success'){
                    window.location.href = "/app/fee/admin";
                }
            },
            error: function(error) {
            }
        });

        $(".edit-modal").addClass("hidden");
        });
    });


        // 상세조회 ajax
        $(document).ready(function() {
        $(".Dbtn-click").on("click", function() {
        var categoryName = $(this).closest("tr").find("td:nth-child(2)").text().trim();
        var paymentDate = $(this).closest("tr").find("td:nth-child(4)").text().trim();
        var content = $(this).closest("tr").find("td:nth-child(5)").text().trim();
        var price = $(this).closest("tr").find("td:nth-child(3)").text().trim();
        // 가격 원 붙은 거 떼기
        var numericPrice = parseInt(price.replace(/\D/g, ""));

        $("#D_paymentDate").val(paymentDate);
        $("#D_detailContent").text(content);
        $("#D_price").val(numericPrice || 0);
        // 카테고리 선택된 값 가져오기
        $("#D_feeCno option").filter(function() {
            return $(this).text() === categoryName;
        }).prop('selected', true);

        $(".detail-modal").removeClass("hidden");
        });

        $(".DcloseBtn").on("click", function() {
        $(".detail-modal").addClass("hidden");
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

        // 삭제 모달
        $().ready(function () {
        $("#delBtn").click(function () { 
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
                        url: '/app/fee/admin/del',  
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