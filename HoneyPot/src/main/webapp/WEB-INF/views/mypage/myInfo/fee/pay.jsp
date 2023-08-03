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
                           <span id="currentDate"></span>
                        </div>
                        <div class="payBox">
                            <div>납부 금액 : <span id="totalPrice">${totalPrice}</span> 원</div>
                            <div><button id="payBtn" onclick="iamport()">납부하기</button></div>
                        </div>
                    </div>
					<div id="detail-area">
                        <div><span>상세 내역</span></div>
                        <input type="hidden" value="${mvoList[0].memberNo}" id="memberNo">
                        <input type="hidden" value="${mvoList[0].memberName}" id="memberName">
                        <input type="hidden" value="${mvoList[0].dong}" id="dong">
                        <input type="hidden" value="${mvoList[0].ho}" id="ho">
                        <table>
                            <thead>
                                <tr>
                                    <td>항목</td>
                                    <td>내용</td>
                                    <td>금액</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${currentMonthData}" var="currentData">
                                    <tr>
                                        <td>${currentData.categoryName}</td>
                                        <td>${currentData.content}</td>
                                        <td>${currentData.price}</td>
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
        firstNavLink(['','','','/app/fee/member']);
        secondNavLink(['/app/fee/member','/app/fee/member/pay']);

        // 이번 달 넣어주기
        document.addEventListener("DOMContentLoaded", function () {
        const currentDateElement = document.getElementById("currentDate");
        const currentDate = new Date();
        const year = currentDate.getFullYear();
        const month = currentDate.getMonth() ; 
        const formattedDate = year + "년 " + month + "월분";
        currentDateElement.textContent = formattedDate;
    });

        // 숫자를 3자리마다 쉼표가 있는 문자열로 변환하는 함수
		function addCommasToNumberInElement(element) {
			const text = element.textContent;
			const number = parseFloat(text.replace(/,/g, '')); // 쉼표를 제거한 후 숫자로 변환
			if (!isNaN(number)) {
			const formattedNumber = number.toLocaleString();
			element.textContent = formattedNumber; // 쉼표가 있는 형식으로 변경하여 다시 업데이트
			}
		}

		// 페이지 로드 후 해당 함수를 호출하여 각 요소의 텍스트를 적절하게 포맷팅
		window.onload = function () {
			const price = document.querySelector('#totalPrice');
			addCommasToNumberInElement(price);
		};

		
        // 결제 함수
        function iamport(){

            const price = document.querySelector('#totalPrice');
            const priceText = price.innerText
            const number = parseFloat(priceText.replace(/,/g, '')); 
            console.log(number);
            const nameInput = document.querySelector("#memberName");
            const memberName = nameInput.value;
            console.log(memberName);
            const noInput = document.querySelector("#memberNo");
            const memberNo = noInput.value;
            console.log(memberNo);
            const dongInput = document.querySelector("#dong");
            const dong = dongInput.value;
            const hoInput = document.querySelector("#ho");
            const ho = hoInput.value;

            //가맹점 식별코드
            IMP.init('imp81480717');
            IMP.request_pay({
                pg : 'kakaopay',
                pay_method : 'card',
                merchant_uid : 'merchant_' + new Date().getTime(), // 주문번호
                name : '푸리미엄관리비' , //결제창에서 보여질 이름
                amount : number, //실제 결제되는 가격 totalPrice 로 채워주기
                buyer_name : memberName, // 회원이름
                buyer_addr : dong + '동 ' + ho + '호', // 아파트 동/호 넣어주기
            }, function(rsp) {
                console.log(rsp);
                // 결제검증 status paid 되면 결제하기 버튼 결제완료로 바뀌고, disabled
                $.ajax({
                    type: "POST",
                    url: "/app/fee/member/payment/" + rsp.imp_uid,
                    contentType: "application/json",
                    data: JSON.stringify({ memberNo: memberNo }),
                    success: function (response) {
                        console.log('서버에서 결제 상태를 업데이트했습니다.');
                        const payBtnBox = document.querySelector("#payBtn");
                            payBtnBox.innerText = '납부완료';
                            payBtnBox.style.cursor = 'default';
                            payBtnBox.disabled = true;
                      
                    },
                    error: function (xhr, status, error) {
                        console.error('결제 상태 업데이트 오류:', error);
                    },
                });
            }
        )};

		
	</script>