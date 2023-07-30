<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/app/resources/css/chat/followerList.css">
	</head>

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
						<div id="chatArea"><div id="chatMessageArea"></div></div>
						<div class="input-area">
							<textarea name="" id="message" placeholder="내용을 입력하세요."></textarea>
							<button id="sendBtn" onclick="f01();">보내기</button>
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