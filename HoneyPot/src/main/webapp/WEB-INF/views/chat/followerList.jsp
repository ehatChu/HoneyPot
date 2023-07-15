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

		.newChat-area{
			display: grid;
			grid-template-rows: 730px 80px;
		}

		.openChat {
			background-color: #ffce31;
			display: flex;
			justify-content: center;
			align-items: center;
			font-size: 22px;
			border: none;
			cursor: pointer;
		}

		.list-wrap {
			display: flex;
			align-items: center;
			flex-direction: column;
			margin-top: 40px;
		}

		.list-wrap > div > img {
			width: 60px;
			height: 60px;
			border-radius: 70%;
		}

		.list-wrap > div {
			display: flex;
			align-items: center;
			padding-bottom: 30px;
		}

		.list-wrap > div > span {
			font-size: 20px;
			margin-left: 20px;
		}

		.list-wrap > div > label > input[name=checkMember]{
			display: flex;
			align-items: center;
			border-radius: 70%;
			width: 35px;
			height: 35px;
			background-color: #d9d9d9;
			border: none;
			appearance: none;
			cursor: pointer;
			transition: background 0.2s;
			margin-left: 40px;
		}

		.list-wrap > div > label > input[name="checkMember"]:checked {
			background: #ffce31;
			border: none;
		}

		/* 채팅 영역 */
		#chat-area {
			display: grid;
			grid-template-rows: 750px 140px;
		}

		#chat-area > .input-area{
			border-top: 1px solid black;
			display: flex;
			align-items: center;
			justify-content: space-between;
		}

		#chat-area > .input-area > textarea{
			border-radius: 10px;
			width: 700px;
			height: 100px;
			margin-left: 50px;
			font-size: 20px;
			resize: none;
			padding: 10px;
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



	</style>

	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav>
				
			</nav>

			<main>
				<div id="wrap">
					<div id="left-area">
						<div class="upper-area">
							<span>친구 목록</span>
						</div>
						<div class="content-area">
							<div class="icon-area">
								<div class="icon-wrap">
									<button><i class="fa-solid fa-user-group fa-2x"></i></button>
									<button class="moveChatList"><i class="fa-solid fa-comment fa-2x" style="color: #858181;"></i></button>
								</div>
							</div>
							<div class="newChat-area">
								<div class="list-wrap">
									<div>
										<img src="/app/resources/profile/profile04cheese.jpg" alt="프로필사진">
										<span>홍다빈</span>
										<label for="addMember"><input type="checkbox" name="checkMember"></label>
									</div>
									<div>
										<img src="/app/resources/profile/profile02ddonge.jpg" alt="프로필사진">
										<span>김지연</span>
										<label for="addMember"><input type="checkbox" name="checkMember"></label>
									</div>
									<div>
										<img src="/app/resources/profile/profile03sponge.jpg" alt="프로필사진">
										<span>이정민</span>
										<label for="addMember"><input type="checkbox" name="checkMember"></label>
									</div>
									<div>
										<img src="/app/resources/profile/profile01daram.png" alt="프로필사진">
										<span>문성빈</span>
										<label for="addMember"><input type="checkbox" name="checkMember"></label>
									</div>
									<div>
										<img src="/app/resources/profile/profile04cheese.jpg" alt="프로필사진">
										<span>주영훈</span>
										<label for="addMember"><input type="checkbox" name="checkMember"></label>
									</div>
									<div class="checkedBox hidden"><i class="fa-solid fa-check" style="color: #ffffff;"></i></div>
								</div>
								<!-- 채팅 만들기 버튼 함수 추가~~ -->
								<button class="openChat"> + 새로운 채팅</button>
							</div>
						</div>
					</div>
					<div id="chat-area">
						<div></div>
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

		// 체크 박스 체크
        const changeBox = () => {
        document.querySelector(".checkedBox").classList.remove("hidden");
        };

        // 체크 박스 해제
        const backBox = () => {
        document.querySelector(".checkedBox").classList.add("hidden");
        };

        const checkBox = document.querySelectorAll(".checkBox");
        checkBox.forEach((btn) => {
        btn.addEventListener("click", changeBox);
        });

		// 채팅 아이콘 클릭 시 이동
		const chatIcon = document.querySelector(".moveChatList");
		chatIcon.addEventListener("click", function(){
			location.href="/app/chat/list";
		})

	</script>