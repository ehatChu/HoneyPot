<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                            <td><button class="delBtn"><i class="fa-solid fa-xmark fa-lg"></i></button></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- 페이지 영역 -->
                        <div id="page-area">
                            <div class="paging">
                                <c:if test="${pv.currentPage > 1}">
                            <button id="pbtn" onclick="location.href='/app/fee/admin?p=${pv.currentPage - 1}&searchType=${paramMap.searchType}&searchValue=${paramMap.searchValue}'"> < </button>
                        </c:if>
                        <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
                            <c:if test="${pv.currentPage != i}">
                                <button id="pbtn" onclick="location.href='/app/fee/admin?p=${i}&searchType=${paramMap.searchType}&searchValue=${paramMap.searchValue}'">${i}</button>
                            </c:if>
                            <c:if test="${pv.currentPage == i}">
                                <button id="current-page-btn">${i}</button>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pv.currentPage < pv.maxPage}">
                            <button id="pbtn" onclick="location.href='/app/fee/admin?p=${pv.currentPage + 1}&searchType=${paramMap.searchType}&searchValue=${paramMap.searchValue}'"> > </button>
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
                                        <form id="addFeeForm" action="/app/fee/admin/add" method="post">
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
                                                            <option value="3">경비용역비</option>
                                                            <option value="4">승강기유지비</option>
                                                            <option value="5">보험료</option>
                                                            <option value="6">공공 요금</option>
                                                            <option value="7">일반 관리비</option>
                                                            <option value="8">입주자대표운영비</option>
                                                            <option value="9">위탁관리수수료</option>
                                                            <option value="10">장기수선충당금</option>
                                                            <option value="11">기타</option>
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
                            <script>
                                // 폼 제출 전 유효성 검사
                                function validateForm() {
                                    const paymentDate = document.querySelector('input[name="paymentDate"]');
                                    const price = document.querySelector('input[name="price"]');
                                    
                                    if (!paymentDate.value) {
											alert("일자를 선택해주세요.");
											return false;
										}

                                    if (!price.value) {
                                        alert("금액을 입력해주세요.");
                                        return false;
                                    }

                                    return true;
                                }
                                document.getElementById('addFeeForm').addEventListener('submit', function(e) {
                                    if (!validateForm()) {
                                        e.preventDefault();
                                        e.stopPropagation();
                                    }
                                });

                            </script>

                    </div>

                    <!-- 관리비 월별 총괄표-->
                    <div id="month-total-area">
                        <div id="title-area">
                            <div>
                                <select name="" id="date-box">
									<option value="2023-03">03월</option>
									<option value="2023-04">04월</option>
									<option value="2023-05">05월</option>
									<option value="2023-06">06월</option>
									<option value="2023-07" selected>07월</option>
								</select>
                               <div>관리비 총괄표</div>                            
                            </div>
                            <div class="toMember">
                                <button class="sendBtn">관리비 고지</button>
                            </div>
                            <div class="excel">
                                <a href="<c:url value='/fee/excelDown' />" class="btn  btn-sm btn-default" target="_blank" id="excelDown"><img src="/app/resources/temp/excel.png" alt="" width="40" height="40"></a>
                            </div>
                            <script>
                                $(document).ready(function() {
                                    $("#excelDown").click(function() {
                                        event.preventDefault();
        
                                        // select 엘리먼트에서 name 속성이 "paymentDate"인 값을 가져옵니다.
                                        const selectedMonth = $("#date-box").val();
                                        console.log(selectedMonth);

                                        const newURL = $(this).attr("href") + `?paymentDate=` + selectedMonth;
                                        console.log(newURL);

                                        window.location.href = newURL;
                                    });
                                });
                            </script>
                        </div>

                        <!-- 관리비 고지 모달 -->
                        <div class="send-modal hidden">
                            <div class="bg"></div>
                            <div class="s_modalBox">
                                <div class="upper-bar">
                                    <span>관리비 고지</span>
                                    <button class="EcloseBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
                                </div>
                                <div class="s_content-modal">
                                    <div class="s_first-area">
                                        <div>
                                            <div class="memberText">고지 대상</div>
                                            <br>
                                            <form action="/app/fee/admin/toMember" method="POST">
                                                <select id="dong-num" name="dong">
                                                    <option value="101">101</option>
                                                    <option value="102">102</option>
                                                    <option value="103">103</option>
                                                    <option value="201">201</option>
                                                    <option value="202">202</option>
                                                    <option value="203">203</option>
                                                    <option value="301">301</option>
                                                    <option value="302">302</option>
                                                    <option value="303">303</option>
                                                </select>
                                                동
                                                 <input type="text" name="ho" id="ho-num" dir="rtl">
                                                호
                                            </div>
                                        </div>
                                        <div class="s_second-area">
                                            <div class="priceText">고지 금액 <div>세대 수 기준(단, 공공요금 제외)</div></div> 
                                            <br>
                                            <div id="price-content">
                                                <div class="left">
                                                    <div><input type="text" value="시설 유지보수" name="categoryName" id="categoryName" readonly> <input type="text" id="price" name="price" value="15000"></div>
                                                    <br/>
                                                    <div><input type="text" value="소독 및 청소"name="categoryName" id="categoryName" readonly>  <input type="text" id="price" name="price" value="20000"></div>
                                                    <br/>
                                                    <div><input type="text" value="경비용역비"name="categoryName" id="categoryName" readonly>  <input type="text" id="price"name="price" value="250000"></div>
                                                    <br/>
                                                    <div><input type="text" value="승강기유지비"name="categoryName" id="categoryName" readonly>  <input type="text" id="price"name="price" value="30000"></div>
                                                    <br/>
                                                    <div><input type="text" value="기타"name="categoryName" id="categoryName" readonly>  <input type="text" id="price"name="price" value="1000"></div>
                                                    <br/>
                                                    <div><input type="text" value="전기료"name="categoryName" id="categoryName" readonly>  <input type="text" id="price" name="price"></div>
                                                    <br/>
                                                    <div><input type="text" value="난방비"name="categoryName" id="categoryName" readonly>  <input type="text" id="price" name="price"></div>
                                                </div>
                                                <div class="right">
                                                    <div><input type="text" value="보험료"name="categoryName" id="categoryName" readonly>  <input type="text" id="price"name="price" value="25020"></div>
                                                    <br/>
                                                    <div><input type="text" value="일반 관리비"name="categoryName" id="categoryName" readonly>  <input type="text" id="price"name="price" value="147000"></div>
                                                    <br/>
                                                    <div><input type="text" value="입주자대표운영비"name="categoryName" id="categoryName" readonly>  <input type="text" id="price"name="price" value="3000"></div>
                                                    <br/>
                                                    <div><input type="text" value="위탁관리수수료"name="categoryName" id="categoryName" readonly>  <input type="text" id="price" name="price"value="2010"></div>
                                                    <br/>
                                                    <div><input type="text" value="장기수선충당금"name="categoryName" id="categoryName" readonly>  <input type="text" id="price"name="price" value="14200"></div>
                                                    <br/>
                                                    <div><input type="text" value="수도 및 온수비"name="categoryName" id="categoryName" readonly>  <input type="text" id="price"name="price" ></div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div id="submitBtn"><button id="submitBtn" type="submit">고지하기</button></div>
                                        </form>
                                </div>
                            </div>
                        </div>
                        <script>
                            $(document).ready(function() {
                                $(".sendBtn").on("click", function() {
                                
                                $(".send-modal").removeClass("hidden");
                                });

                                $(".EcloseBtn").on("click", function() {
                                $(".send-modal").addClass("hidden");
                                });

                                $("submitBtn").on("click", function() {

                                $(".edit-modal").addClass("hidden");
                                });
                            });

                        </script>

                        <div>
                            <table class="Ad_detail">
                                <thead>
                                    <tr class="line">
                                        <th>항목</th>
                                        <th>비고</th>
                                        <th>당월 발생금액</th>
                                        <th>처리 일자</th>
                                    </tr>
                                </thead>
                                <tbody id="table-body">
                                   
                                </tbody>
                            </table>
                        </div>
                        </div>

                        <!-- 총괄 조회 ajax  -->
                        <script>
                           $().ready(function () {
                            const defaultDate = "2023-07";
                            getDataFromServer(defaultDate);

                            $("#date-box").on("change", function () {
                                const selectedDate = $(this).val();
                                getDataFromServer(selectedDate);
                            });
                        });

                        function getDataFromServer(date) {

                            
                            $.ajax({
                                url: '/app/fee/admin/getAllVoList',
                                type: 'GET',
                                data: { paymentDate: date },
                                dataType: 'json',
                                success: function (data) {
                                    const tbody = $("#table-body");
        
                                    tbody.empty();
                                    data.forEach(item => {
                                        const tr = $("<tr>").addClass("line");
                                        tr.append($("<td>").text(item.categoryName)); 
                                        tr.append($("<td>").text(item.content)); 
                                        const formattedPrice = parseInt(item.price).toLocaleString(); 
                                        tr.append($("<td>").text(formattedPrice));
                                        const paymentDate = item.paymentDate.substring(0, 10);
                                        tr.append($("<td>").text(paymentDate));

                                        tbody.append(tr);                                 
                                })
                            },
                                error: function (xhr, status, error) {
                                    console.error('AJAX 요청 실패:', error);
                                }
                            });
                        }

                        </script>

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
                                            <select class="E_afee_category" name="feeCno" id="E_categoryName">
                                                <option value="1">시설 유지보수</option>
                                                <option value="2">소독 및 청소</option>
                                                <option value="3">경비용역비</option>
                                                <option value="4">승강기유지비</option>
                                                <option value="5">보험료</option>
                                                <option value="6">공공 요금</option>
                                                <option value="7">일반 관리비</option>
                                                <option value="8">입주자대표운영비</option>
                                                <option value="9">위탁관리수수료</option>
                                                <option value="10">장기수선충당금</option>
                                                <option value="11">기타</option>
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
                                                <select class="D_afee_category" name="categoryName" id="D_categoryName">
                                                    <option value="1">시설 유지보수</option>
                                                    <option value="2">소독 및 청소</option>
                                                    <option value="3">경비용역비</option>
                                                    <option value="4">승강기유지비</option>
                                                    <option value="5">보험료</option>
                                                    <option value="6">공공 요금</option>
                                                    <option value="7">일반 관리비</option>
                                                    <option value="8">입주자대표운영비</option>
                                                    <option value="9">위탁관리수수료</option>
                                                    <option value="10">장기수선충당금</option>
                                                    <option value="11">기타</option>
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
        secondNavLink(['/app/fee/admin','', '','']);

        

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
                var formattedDate = recentMonths[i].replace("-", "년 ") + "월";
                optionsHTML += '<option value="' + recentMonths[i] + '">' + formattedDate + '</option>';
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

            // 검색타입 바뀔 때 value 영역 변경
            $("#searchType").on("change", function () {
                inputVisibility();
            });

            const initialSearchType = "${paramMap.searchType}";
            const initialSearchValue = "${paramMap.searchValue}";

            $("#searchType").val(initialSearchType).change(); 

            if (initialSearchType === "content") {
                $("input[name='searchValue']").val(initialSearchValue);
            } else if (initialSearchType === "paymentDate") {
                $("#paymentDate option[value='" + initialSearchValue + "']").prop("selected", true);
            }
            
            // 검색 제출
            $("#adminFeeForm").submit(function (e) {
                e.preventDefault();

                const selectedOption = $("#searchType").val();
                const selectedValue = selectedOption === "paymentDate" ? $("#paymentDate").val() : $("input[name='searchValue']").val();

                let searchUrl = "/app/fee/admin?searchType=" + selectedOption;
                if (selectedValue) {
                    searchUrl += "&searchValue=" + selectedValue;
                }

                window.location.href = searchUrl;
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
        var categoryNo = $(this).closest("tr").find("td:nth-child(2)").val();
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
        $("#E_categoryName option").filter(function() {
            return $(this).val() === categoryNo;
        }).prop('selected', true);

        $(".edit-modal").removeClass("hidden");
        });

        $(".EcloseBtn").on("click", function() {
        $(".edit-modal").addClass("hidden");
        });

        $("#E_submitBtn").on("click", function() {

        var updatedCategoryName = $("#E_categoryName").val();
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
        $("#D_categoryName option").filter(function() {
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

        // 삭제 버튼 클릭 이벤트 처리
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


		
	</script>