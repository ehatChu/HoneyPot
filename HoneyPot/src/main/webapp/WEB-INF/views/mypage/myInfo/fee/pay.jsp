<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- chart.js CDN -->
		<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
	</head>

	<style>
		#wrap {
			height: 1000px;
			display: grid;
			grid-template-rows: 210px 800px;
		}

        #total-area {
            display: grid;
            grid-template-rows: 100px 80px;
            margin-top: 30px;
        }

        .monthBox {
            width: 250px;
            height: 60px;
            margin-left: 30px;
            margin-bottom: 10px;
            border: 4px solid #fad355;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 20px;
        }

        .monthBox > select {
            width: 220px;
            height: 50px;
            background-color: transparent;
            border: none;
            font-size: 22px;
            color: #666060;
            font-family: 'Noto Sans KR';
            font-weight: 550;
            cursor: pointer;
        }

        .payBox {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 20px;
            font-weight: 500;
            background-color: rgba(74, 50, 31, 0.8);
        }

        .payBox > div > #payBtn {
            border: none;
            width: 180px;
            height: 50px;
            background-color: #fad355;
            color: #666060;
            border-radius: 10px;
            font-size: 23px;
            font-weight: 550;
            margin-right: 60px;
            cursor: pointer;
        }

        .payBox > div:first-child{
            margin-left: 60px;
            color: #ffffff;
            font-size: 20px;
        }

        .payBox > div > span {
            color: #fad355;
            font-size: 25px;
            margin-left: 20px;
        }

        #detail-area {
            display: grid;
            grid-template-rows: 50px 750px;
        }

        #detail-area > div:first-child {
            background-color: #ffffff;
            font-size: 23px;
            font-weight: 570;
            color: black;
            display: flex;
            align-items: center;
            border-left: 1px solid black;
        }

        #detail-area > div:first-child > span {
            margin-left: 60px;
        }

        #detail-area > table {
            border: none;
            border-collapse: collapse;
        }

        #detail-area > table > thead {
            border-left: 1px solid #4a321f;
            background-color: #4a321f;
            color: #ffffff;
            font-size: 20px;
            text-align: center;
            height: 60px;
            font-weight: 450;
        }

        #detail-area > table > tbody {
            text-align: center;
            font-size: 18px;
            font-weight: 400;
            background-color: #ffffff;
            
        }

        #detail-area > table > tbody > tr {
            border-bottom: 1px solid black;
            border-left: 1px solid black;
        }

        /* 모달 영역 */
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
          height: 700px;
		  border-radius: 30px;
		  display: grid;
		  grid-template-rows: 50px 550px;
        }

        .modalBox button {
          display: block;
          margin: 0 auto;
		  border: none;
		  background-color: #ffce31;
        }

        .hidden {
          display: none;
        }

		/* 모달 디자인 영역 */
		.upper-bar {
			display: grid;
			grid-template-columns: 650px 50px;
			align-items: center;
			background: #ffce31;
			color: black;
			border-radius: 30px 30px 0px 0px;
		}

		.upper-bar > span {
			margin-left: 20px;
			font-size: 20px;
			font-weight: 530;
            font-family: 'Noto Sans KR';
		}
	
		.content-modal {
			display: grid;
			grid-template-rows: 100px 150px 300px;
			color: #464646;
		}

		.first-area {
			display: flex;
			font-size: 25px;
            font-weight: 450;
            align-items: center;
            margin-left: 30px;
            font-family: 'Noto Sans KR';
		}

        .first-area > span:first-child {
            font-weight: 600;
            border-bottom: 7px solid #fff53deb;
            margin-right: 20px;
        }

        .text-area{
            text-align: center;
            margin-top: 10px;
            font-size: 22px;
        }

        .text-area > div > span {
            font-size: 18px;
            color: #a3a2a2;
        }

        .qr-area {
            display: flex;
            justify-content: center;
            align-items: center;   
        }
        .qr-area > img {
            width: 340px;
            height: 300px;
            border: 3px solid #fff53deb;
            border-radius: 20px;
            margin-bottom: 25px;
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
                            <div>납부 금액 : <span>125,350</span> 원</div>
                            <div><button id="payBtn" class="openBtn">납부하기</button></div>
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
                                        <td></td>
                                        <td>${list.price}</td>
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
		
	</script>