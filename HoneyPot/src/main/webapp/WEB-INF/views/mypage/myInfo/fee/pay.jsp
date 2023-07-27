<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- chart.js CDN -->
		<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        <!-- CSS -->
		<link rel="stylesheet" href="/app/resources/css/member/mypage/fee/pay.css">
        <!-- iamport.payment.js -->
        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	</head>

	<style>
		



	</style>

	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav>
				<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
				<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
			</nav>

			<main>
				<div id="wrap">
					<div id="total-area">
                        <div class="monthBox">
                            <select name="" id="date-box">
                                <option value="2023-02">2023년 02월분</option>
                                <option value="2023-03">2023년 03월분</option>
                                <option value="2023-04">2023년 04월분</option>
                                <option value="2023-05">2023년 05월분</option>
                                <option value="2023-06" selected>2023년 06월분</option>
                            </select>
                        </div>
                        <div class="payBox">
                            <div>납부 금액 : <span id="totalPrice">125,350</span> 원</div>
                            <div><button id="payBtn" onclick="iamport()">납부하기</button></div>
                            <div class="modal hidden">
                                <div class="bg"></div>
                                    <div class="modalBox">
                                        <div class="upper-bar">
                                            <span>카카오페이 아이콘</span>
                                            <button class="closeBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
                                        </div>
                                        <form action="/app/fee/member/pay" method="post">
                                        <div class="content-modal">
                                                <div class="first-area">
                                                  <span>QR결제</span>
                                                  <span>카톡결제</span>
                                                </div>
                                                <div class="text-area">
                                                    <div>
                                                        휴대폰으로 스캔하면
                                                        <br>
                                                        결제 화면으로 이동합니다.
                                                        <br>
                                                        <span>스마트폰 카메라 및 모든 QR스캐너로 가능</span>
                                                    </div>
                                                </div>
                                                <div class="qr-area">
                                                    <img src="/app/resources/temp/qr.png" alt="임시사진">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                            </div>
                        </div>
                    </div>
					<div id="detail-area">
                        <div><span>상세 내역</span></div>
                        <table>
                            <thead>
                                <tr>
                                    <td>항목</td>
                                    <td>내용</td>
                                    <td>전월</td>
                                    <td>당월</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${mvoList}" var="list">
                                        <tr>
                                            <td>${list.categoryName}</td>
                                            <td>${list.content}</td>
                                            <td id="payDate" hidden>${list.paymentDate}</td>
                                            <td id="prevPrice">${list.price}</td>
                                            <td id="currentPrice">${list.price}</td>
                                        </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
				</div>
			</main>

	</body>

	</html>

	<script>
		
		// 헤더 함수 실행
		basicSetting();
		firstNav(['내정보', '나의활동', '신청내역', '관리비'],'관리비');
		secondNav(['조회', '납부'],'납부');
    	headerName('마이페이지');

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

        // 모달 배경 클릭 시 모달 닫기
        document.querySelector(".bg").addEventListener("click", closeModal);


        function iamport(){

            //가맹점 식별코드
            IMP.init('imp81480717');
            IMP.request_pay({
                pg : 'kakaopay',
                pay_method : 'card',
                merchant_uid : 'merchant_' + new Date().getTime(), // 주문번호,, 필요 없을 듯
                name : '푸리미엄관리비' , //결제창에서 보여질 이름
                amount : 100, //실제 결제되는 가격 totalPrice 로 채워주기
                buyer_name : '구매자이름', // 회원이름
                buyer_addr : '서울 강남구 도곡동', // 아파트 동/호 넣어주기
            }, function(rsp) {
                console.log(rsp);
                console.log(rsp);
                // 결제검증
                $.ajax({
                    type : "POST",
                    url : "/app/fee/member/payment/" + rsp.imp_uid 
                });
                }
                )};

		
	</script>