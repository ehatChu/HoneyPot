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
                            <div>
                                <span>6월</span>
                               <div>관리비 내역</div>                            
                            </div>
                            <form action="/app/fee/admin" method="GET">
                                <div class="searchDiv">
                                    <select name="searchType" id="searchType">
                                        <option value="content">내용</option>
                                        <option value="accountDate">월 별</option>
                                    </select>
                                    <input type="search" placeholder="검색 할 내용을 입력하세요." name="searchValue" value="${searchVo.searchValue}">
                                    <select name="paymentDate" id="" style="display: none;"> 
                                        <option value="">2023-06</option>
                                        <option value="">2023-05</option>
                                        <option value="">2023-04</option>
                                        <option value="">2023-03</option>
                                        <option value="">2023-02</option>
                                    </select>
                                    <button type="submit"><i class="fa-solid fa-magnifying-glass fa-2x" ></i></button>
                                </div>
                            </form>
                        </div>
                        <div>
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
                                            <td>${vo.price }</td>
                                            <td>${vo.paymentDate }</td>
                                            <td>${vo.content }</td>
                                            <td><button id="editBtn" class="openBtn"><i class="fa-solid fa-pen"></i></button></td>
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
                                    <div class="first-area">
                                        <div>
                                            <span>발생일자</span>
                                            <br>
                                            <input type="date" name="paymentDate">
                                        </div>
                                        <div>
                                            <span>카테고리</span>
                                            <br>
                                            <select id="E_afee_category" name="feeCno">
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
                                        <textarea id="E_detailContent" placeholder="상세하게 적을 내용을 작성하세요. 예시 : 공공 요금 (열 요금, 가스 요금 등)" name="content"></textarea>
                                    </div>
                                    <div id="E_submitBtn"><input type="submit" value="등록"></div>
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

        $("#paymentDate").val(paymentDate);
        $("#E_detailContent").text(content);
        $("#price").val(numericPrice || 0);
        $("#no").val(no);
        // 카테고리 선택된 값 가져오기
        $("#feeCno option").filter(function() {
            return $(this).text() === categoryName;
        }).prop('selected', true);

        $(".edit-modal").removeClass("hidden");
        });

        $(".EcloseBtn").on("click", function() {
        $(".edit-modal").addClass("hidden");
        });

        $("#E_submitBtn").on("click", function() {

        var updatedCategoryName = $("#accountCno").val();
        var updatedPaymentDate = $("#paymentDate").val();
        var updatedContent = $("#E_detailContent").val();
        console.log(updatedContent);
        var updatedPrice = $("#price").val();
        var no = $("#no").val();

        var data = new FormData();
        data.append("accountCno", updatedCategoryName);
        data.append("paymentDate", updatedPaymentDate);
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
                    window.location.href = "/app/account/list?p=1";
                }
            },
            error: function(error) {
            }
        });

        $(".edit-modal").addClass("hidden");
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