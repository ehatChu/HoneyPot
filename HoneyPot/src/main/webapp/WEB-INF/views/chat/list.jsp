<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<style>
		#wrap {
			height: 890px;
			display: grid;
			grid-template-columns: 400px 1160px;
		}

		#left-area{
			display: grid;
			grid-template-rows: 80px 810px;
		}

		.upper-area{
			background-color: #ffce31;
			box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.326);
			font-weight: 500;
			font-size: 24px;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.content-area{
			display: grid;
			grid-template-columns: 100px 300px;
			border-right: 1px solid rgba(0,0,0,0.25);
		}
       
		.content-area > div:first-child{
			background-color: #d9d9d9ce;
		}

		.icon-wrap {
			display: flex;
			align-items: center;
			flex-direction: column;
			margin-top: 30px;
		}

		.icon-wrap > button {
			border: none;
			background-color: #d9d9d9ce;
			cursor: pointer;
		}

		.icon-wrap > button:first-child {
			margin-bottom: 70px;
		}

		/* 채팅방 상세 */
		.room-list-area{
			display: grid;
			grid-template-rows: 110px 700px;
            justify-content: center;
		}

		.room-list-area img {
			width: 60px;
			height: 60px;
			border-radius: 70%;
		}

		.inviteMember {
			border: none;
			outline: none;
			background-color: transparent;
			cursor: pointer;
			width: 100%;
			height: 100%;
			display: flex;
			align-items: center;
		}

		.invite-area {
			width: 60px;
			height: 60px;
			border-radius: 70%;
			background-color: #d9d9d9ce;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.inviteMember > span {
			margin-left: 30px;
			font-size: 18px;
			font-family: 'Noto Sans KR';
		}

		.room-name {
			display: flex;
			justify-content: center;
			border-bottom: 1px solid #7e7e7e;
			width: 300px;
			align-items: center;
		}

		.room-list-area > div > span {
			font-size: 20px;
            font-weight: 510;
			margin-left: 20px;
            display: flex;
            align-items: center;
		}

        .room-list-area > div > span >.memberCnt {
            color: #7e7e7e;
            margin-left: 10px;
        }

		.room-member-list {
			width: 300px;
			display: flex;
			flex-direction: column;
			font-size: 18px;
		}

		.room-member-list > div {
			margin-bottom: 20px;
			display: flex;
			align-items: center;
			margin-top: 20px;
			margin-left: 30px;
		}

		.room-member-list > div > span {
			margin-left: 30px;
		}

		#chat-area {
            display: grid;
			grid-template-rows: 80px 730px 80px;
		}
        
        /* 채팅 상단 영역 */
        #chat-area > .room-name-area {
            display: flex;
            background-color: rgba(255, 207, 49, 0.482);
            justify-content: space-between;
            align-items: center;
            box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.326);
        }

        .room-name-area > div:first-child{
            font-size: 20px;
            font-weight: 500;
            margin-left: 40px;
        }

        .room-name-area > div:first-child > .openBtn {
            background-color: transparent;
            border: none;
            cursor: pointer;
        }

        .room-name-area > div:first-child > span {
            margin-right: 10px;
        }

        .quitBtn {
            margin-right: 30px;
            font-size: 18px;
            cursor: pointer;
            border: none;
            background-color: transparent;
        }

        .quitBtn > span {
            margin-right: 10px;
        }

        /* 채팅 영역 */
		#chat-area > .input-area{
			border-top: 1px solid black;
			display: flex;
			align-items: center;
			justify-content: space-between;
		}

		#chat-area > .input-area > textarea{
			border-radius: 10px;
			width: 700px;
			height: 50px;
			margin-left: 50px;
			font-size: 18px;
			resize: none;
			padding: 10px;
            font-family: 'Noto Sans KR';
		}

		#sendBtn {
			width: 150px;
			height: 45px;
			cursor: pointer;
			border-radius: 10px;
			font-size: 18px;
			margin-right: 30px;
			background-color: #ffce31;
			border: none;
		}

		/* 채팅 내용 영역 */
		.chat-content-area {
			display: grid;
			grid-template-columns: 660px 500px;
		}


        /* 등록 모달 영역 */
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
          width: 500px;
          height: 500px;
		  border-radius: 30px;
		  display: grid;
		  grid-template-rows: 50px 450px;
        }

        .modalBox button {
          display: block;
          margin: 0 auto;
		  border: none;
		  background-color: #ffce31;
          cursor: pointer;
        }

        .hidden {
          display: none;
        }

		/* 모달 디자인 영역 */
		.upper-bar {
			display: grid;
			grid-template-columns: 450px 50px;
			align-items: center;
			background: #ffce31;
			color: black;
			border-radius: 30px 30px 0px 0px;
		}

		.upper-bar > span {
			margin-left: 20px;
			font-size: 20px;
			font-weight: 530;
		}

		.first-area {
            display: grid;
            grid-template-rows: 120px 230px 50px;
            align-items: center;
			font-size: 20px;
		}

        .first-area > div {
            margin-left: 20px;
        }

        .nameBox{
            display: flex;
            flex-direction: column;
        }

        .picBox > input[type=file] {
            margin-left: 10px;
        }

        .nameBox > input, .picBox > input {
            width: 270px;
            height: 40px;
            margin-top: 20px;
            font-family: 'Noto Sans KR';
            font-size: 18px;
        }

		#submitBtn {
			display: flex;
			justify-content: center;
			align-items: center;
           
		}

		#submitBtn > input{
			background-color: #ffce31;
			width: 120px;
			height: 40px;
			font-size: 18px;
			font-weight: 600;
			color: black;
			border: none;
			border-radius: 10px;
            cursor: pointer;
		}

		/* 우클릭 시 강퇴 버튼 */
		.kick-area {
			display: none;
			position: absolute;
			width: 80px;
			height: 30px;
			right: 0;
			z-index: 9999;
			background: #FFFFFF;
			opacity: 0.8;
			border: 1px solid #545454;
			box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.15);
			border-radius: 10px;
		}

		.kick-area li {
			list-style: none;
			padding-left: 20px;
		}

		.kick-area li a {
			color: #000;
			font-family: 'Noto Sans KR';
			font-size: 18px;
			text-decoration-line: none;
		}

		#modal {
			position: fixed;
			display: none;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background-color: #fff;
			width: 300px;
			padding: 20px;
			text-align: center;
			z-index: 9999;
		}

		#modal h2 {
			margin: 0;
		}

		#modal p {
			margin: 20px 0;
		}

		#modal button {
			margin-right: 10px;
		}
					

	</style>

	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav>
				
			</nav>

			<main>
				<div id="wrap">
                    <!-- 채팅방 목록 영역 -->
					<div id="left-area">
						<div class="upper-area">
							<span>채팅방 목록</span>
						</div>
						<div class="content-area">
							<div class="icon-area">
								<div class="icon-wrap">
									<button><i class="fa-solid fa-user-group fa-2x" style="color: #858181;"></i></button>
									<button class="moveChatList"><i class="fa-solid fa-comment fa-2x" ></i></button>
                                    
								</div>
							</div>
							<div class="room-list-area">
								<div class="room-name">
									<img src="/app/resources/profile/profile02ddonge.jpg" alt="프로필사진">
									<span>101동 골프모임 <div class="memberCnt">6</div></span>
								</div>
								<div class="room-member-list">
									<div>
										<button class="inviteMember">
											<div class="invite-area"><i class="fa-solid fa-plus fa-2x"></i></div>
											<span>대화상대 초대</span>
										</button>
									</div>
									<!-- 방장만 강퇴 우클릭 이벤트 보이게  -->
									<div>
										<img src="/app/resources/profile/profile04cheese.jpg" alt="프로필사진">
										<span>홍다빈</span>
									</div>
									<div class="kick-out">
										<img src="/app/resources/profile/profile03sponge.jpg" alt="프로필사진">
										<span>이정민</span>
										<ul class="kick-area">
											<li><a href="#">강퇴</a></li>
										</ul>
									</div>
									<div class="kick-out">
										<img src="/app/resources/profile/profile01daram.png" alt="프로필사진">
										<span>문성빈</span>
										<ul class="kick-area">
											<li><a href="#">강퇴</a></li>
										</ul>
									</div>
									<div class="kick-out">
										<img src="/app/resources/profile/profile02ddonge.jpg" alt="프로필사진">
										<span>김지연</span>
										<ul class="kick-area">
											<li><a href="#">강퇴</a></li>
										</ul>
									</div>
									<div class="kick-out">
										<img src="/app/resources/profile/profile04cheese.jpg" alt="프로필사진">
										<span>주영훈</span>
										<ul class="kick-area">
											<li><a href="#">강퇴</a></li>
										</ul>
									</div>
									<!-- 강퇴 모달 -->
									<div id="modal" style="display: none;">
										<h2>강퇴</h2>
										<p>이 유저를 강퇴하시겠습니까?</p>
										<button id="confirm-btn">확인</button>
										<button id="cancel-btn">취소</button>
									</div>
								</div>
							</div>
						</div>
					</div>
                    <!-- 채팅 영역 -->
					<div id="chat-area">
                        <div class="room-name-area">
                            <div><span>101동 골프 모임</span><button class="openBtn"><i class="fa-solid fa-pen fa-sm" style="color: #000000;"></i></button></div>
                            <!-- 모달 영역 -->
                            <div class="modal hidden">
                                <div class="bg"></div>
                                <div class="modalBox">
                                    <div class="upper-bar">
                                        <span>채팅방 정보 수정</span>
                                        <button class="closeBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
                                    </div>
                                    <form action="/app/chat/edit" method="post" enctype="multipart/form-data">
                                        <div class="first-area">
                                            <div class="nameBox">
                                                채팅방 이름
                                                <input type="text" id="name" value="${vo.name}">
                                            </div>
                                            <div class="picBox">
                                                채팅방 사진
                                                <input type="file" name="img" multiple accept=".jpg, .png, .jpeg">
                                            </div>
                                            <div id="submitBtn"><input type="submit" value="수정"></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div><button class="quitBtn"><span>나가기</span><i class="fa-solid fa-arrow-right-from-bracket fa-lg" style="color: #000000;"></i></button></div>
                        </div>
                        <div class="chat-content-area">
							<div class="well" id="chatdata">
								<!-- 대화내용 출력 -->
								<!-- <c:forEach items="${conlist}" var="list">
								<div class="well">
								<c:if test="${list.usersdto.uname ne uname}">
									<div class="otehr-content">
										<div class="other-content-info">
												<strong> ${list.usersdto.uname}</strong><br>
										</div>
										<p class="other-content-wrap"> ${list.content}</p> 
										<span class="other-content-date">${list.fdate }</span>
									</div>
								</c:if>
								<c:if test="${list.usersdto.uname eq uname}">
									<div class="mycontent">
										<div class="mycontent-info">
										</div>
										<p class="mycontent-wrap"> ${list.content}</p> 
									</div>
								</c:if>
								</div>
								</c:forEach> -->
							</div>
						</div>
                        <div class="input-area">
                            <textarea name="" id="" placeholder="내용을 입력하세요."></textarea>
                            <button id="sendBtn">보내기</button>
                        </div>
                    </div>
				</div>
			</main>

	</body>

	</html>

	<script>
		
		// 헤더 함수 실행
		basicSetting();
    	headerName('채팅');

		// 모달 열기
        const openModal = () => {
        document.querySelector(".modal").classList.remove("hidden");
        };

        // 모달 닫기
        const closeModal = () => {
        document.querySelector(".modal").classList.add("hidden");
        };

        const openBtn = document.querySelector(".openBtn");
        openBtn.addEventListener("click", openModal);

        // 모달 닫기 버튼에 이벤트 추가
        document.querySelector(".closeBtn").addEventListener("click", closeModal);

        // 모달 배경 클릭 시 모달 닫기
        document.querySelector(".bg").addEventListener("click", closeModal);


		// 채팅멤버 우클릭 시 강퇴 실행 함수
		// 우클릭 이벤트 핸들러
		function handleRightClick(event) {
			// 기본 우클릭 메뉴 방지
			event.preventDefault(); 

			// 해당 kick-out div의 위치 가져오기
			var div = this;
			var rect = div.getBoundingClientRect();
			var divTop = rect.top + window.pageYOffset;
			var divLeft = rect.left + window.pageXOffset;

			// 해당 kick-out div에 속한 kick-area 요소 가져오기
			var kickArea = div.querySelector(".kick-area");

			// span 요소의 위치 가져오기
			var span = div.querySelector("span");
			var spanRect = span.getBoundingClientRect();
			var spanTop = spanRect.top + window.pageYOffset;
			var spanRight = spanRect.right + window.pageXOffset;

			// kick-area 요소의 위치 설정
			kickArea.style.top = spanTop + span.offsetHeight + "px";
			kickArea.style.left = spanRight + "px";

			// kick-area 요소 표시
			kickArea.style.display = "block";

			// 배경 클릭 시 삭제 이벤트 
			document.addEventListener("click", handleBackgroundClick);
		}

		// 배경 클릭 이벤트 핸들러
		function handleBackgroundClick(event) {
			// kick-area 숨기기
			var kickAreas = document.querySelectorAll(".kick-area");
			kickAreas.forEach(function (kickArea) {
				kickArea.style.display = "none";
			});

			// 배경 클릭 이벤트 제거
			document.removeEventListener("click", handleBackgroundClick);
		}

		// 강퇴 버튼 클릭 이벤트 핸들러
		function handleKickOutClick() {
			// 모달 표시
			var modal = document.getElementById("modal");
			modal.style.display = "block";
		}

		// 확인 버튼 클릭 이벤트 핸들러
		function handleConfirmClick() {
			// 강퇴 함수 추가 예정
			alert("강퇴되었습니다.");

			// 모달 닫기
			var modal = document.getElementById("modal");
			modal.style.display = "none";
		}

		// 취소 버튼 클릭 이벤트 핸들러
		function handleCancelClick() {
			// 모달 닫기
			var modal = document.getElementById("modal");
			modal.style.display = "none";
		}

		// 우클릭 이벤트를 모든 kick-out에 추가
		var kickOutDivs = document.querySelectorAll(".kick-out");
		kickOutDivs.forEach(function (div) {
			div.addEventListener("contextmenu", handleRightClick);

			// kick-area 요소의 클릭 이벤트 추가
			var kickArea = div.querySelector(".kick-area");
			var kickButton = kickArea.querySelector("a");
			kickButton.addEventListener("click", handleKickOutClick);
		});

		// 확인 버튼 클릭 이벤트를 추가
		var confirmBtn = document.getElementById("confirm-btn");
		confirmBtn.addEventListener("click", handleConfirmClick);

		// 취소 버튼 클릭 이벤트를 추가
		var cancelBtn = document.getElementById("cancel-btn");
		cancelBtn.addEventListener("click", handleCancelClick);

	</script>