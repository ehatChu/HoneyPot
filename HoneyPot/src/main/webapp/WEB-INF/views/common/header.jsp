<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<style>
				#wrapper {
					width: 1920px;
					height: 937px;
					display: flex;
				}

				#side-bar {
					width: 360px;
					height: 937px;
					background-color: white;
				}

				#main {
					width: 1560px;
					height: 45px;
				}

				#header {
					height: 45px;
					width: 1560px;
					left: 360px;
					box-sizing: border-box;
					z-index: 1;
					background-color: #4A321F;
					color: white;
					display: flex;
					align-items: center;
					justify-content: space-between;
					padding-left: 15px;
				}

				#main-area {
					width: 1560px;
					height: 892px;
					max-height: 892px;
					overflow-y: auto;
				}

				/* 스크롤바의 폭 너비 */
				#main-area::-webkit-scrollbar {
					width: 12px;
				}

				#main-area::-webkit-scrollbar-thumb {
					background: #4A321F;
					/* 스크롤바 색상 */
					/* border-radius: 10px; 스크롤바 둥근 테두리 */
				}

				#main-area::-webkit-scrollbar-track {
					background: #4a321f23;
					/*스크롤바 뒷 배경 색상*/
				}

				#logo {
					height: 45px;
					margin-left: 15px;
					margin-top: 5px;
				}

				#logo-area>span {
					font-size: 30px;
					display: flex;
					align-items: center;
				}

				#logo-area>span>span {
					padding-left: 10px;
				}

				#profile-area {
					height: 380px;
				}

				#blank01 {
					height: 20px;
				}

				#profile-img>img {
					width: 230px;
					object-fit: cover;
					border-radius: 70%;
				}

				#all-center {
					text-align: center;
				}

				#profile-name {
					font-weight: 500;
					font-size: 40px;
				}

				#name-info {
					font-size: 20px;
				}

				#logout-info {
					line-height: 50px;
				}

				#menu-area {
					display: grid;
					grid-template-columns: 2fr 1.5fr 5.5fr;
				}

				#icon-area>div {
					height: 75px;
					display: flex;
					align-items: center;
					justify-content: center;
				}

				#text-area>div {
					height: 75px;
					display: flex;
					align-items: center;
					font-size: 25px;
					padding-left: 10px;
				}

				#info-qna-area {
					text-align: center;
					height: 100px;
					padding-top: 30px;
				}

				#small-text {
					font-size: 13px;
					color: gray;
				}

				#profile-img>div {
					height: 45px;
					width: 45px;
					background-color: white;
					position: absolute;
					border-radius: 70%;
					top: 17px;
					left: 240px;
				}

				#profile-img {
					position: relative;
				}

				#setting-icon-area {
					display: flex;
					align-items: center;
					justify-content: center;
				}

				#header-icon-area {
					width: 250px;
					display: flex;
					justify-content: space-around;
					align-items: center;
				}

				#header-weather {
					display: flex;
					align-items: center;
				}

				.header-calling>i {
					position: relative;
				}

				.header-calling>i>div {
					position: absolute;
					top: -15px;
					left: 10px;
					height: 15px;
					width: 15px;
					background-color: rgb(255, 58, 58);
					border-radius: 70%;
					color: white;
					display: flex;
					align-items: center;
					justify-content: center;
				}

				.header-chatting-icon>i {
					position: relative;
				}

				.text-bold {
					font-weight: bold;
				}

				.header-chatting-icon>i>div {
					position: absolute;
					top: -15px;
					left: 17px;
					height: 15px;
					width: 15px;
					background-color: rgb(255, 58, 58);
					border-radius: 70%;
					color: white;
					display: flex;
					align-items: center;
					justify-content: center;
				}
				
				/* 채팅 알림 모달 레이아웃 */
				.chat_modal_wrap{
					position: fixed;
					width: 300px;
					height: 230px;
					right: 5px;
					border-radius: 10px 10px 0 0;
					display: grid;
					grid-template-rows: 200px 30px;
					align-items: center;
					z-index: 9999;
				}

				.chat_modalBox {
					position: relative;
					right: 5px;
					background-color: #fff;
					height: 200px;
					max-height: 250px;
					border-radius: 10px 10px 0 0;
					border: 1px solid #8A8A8A;
					box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.25);
					overflow-y: auto;
					 /* 스크롤바 숨기기 */
  					scrollbar-width: thin;
  					scrollbar-color: transparent transparent; /* 스크롤바 색상을 투명하게 설정 */
				}
				
				
				.chat_modalBox::-webkit-scrollbar {
					width: 0; /* 스크롤바의 너비 설정 */
				}
				
				.chat_modalBox::-webkit-scrollbar-track {
					background-color: transparent; /* 스크롤바 트랙의 배경색을 투명하게 설정 */
				}
				
				.chat_modalBox::-webkit-scrollbar-thumb {
					background-color: transparent; /* 스크롤바 썸의 배경색을 투명하게 설정 */
				}
				
				.hidden {
					display: none;
				}

				/* 채팅 알림 내용 영역 */
				.latest-chat {
					width: 300px;
					height: 50px;
					border: 1px solid rgba(138, 138, 138, 0.7);
					border-radius: 10px;
					background: rgba(255, 255, 255, 0.7);
					display: grid;
					grid-template-columns: 50px 200px 50px;
					cursor: pointer;
				}

				.latest-chat:hover {
					background-color: #fdeaab;
				}

				.contentCon {
					display: flex;
					justify-content: center;
					align-items: center;
				}

				.contentSpan > span:first-child {
					font-weight: 570;
					font-size: 17px;
				}

				.contentSpan > span:nth-child(2){
					font-size: 15px;
				}

				.chat-detail-Btn {
					position: relative;
					right: 5px;
					background-color: #FFCE31;
					height: 30px;
					width: 300px;
					border-radius: 0 0 10px 10px;
					border: none;
					font-size: 18px;
					cursor: pointer;
				}

				/* 헤더 아래에 초이스 구역 */
				.title-elem {
					border: 4px solid #FAD355;
					padding-top: 5px;
					padding-bottom: 5px;
					height: 40px;
					border-radius: 30px;
					display: flex;
					justify-content: center;
					align-items: center;
				}

				.choice-elem {
					display: flex;
					justify-content: center;
					align-items: center;

				}

				/* 서브초이스 */
				#sub-choice {
					border-bottom: 1px solid black;
					padding: 10px 10px 10px 50px;
				}

				#grid-sub-choice {
					display: grid;
					width: 400px;
					grid-template-columns: 1fr 1fr;
				}
			</style>
		</head>

		<body>
			<%@ include file="/WEB-INF/views/common/setup.jsp" %>
				<div id="wrapper">
					<div id="side-bar">
						<div id="logo-area" onclick="location.href='/app/main/mmain'">
							<span> <img id="logo" src="/app/resources/main/logo.png">
								<img id="logo" src="/app/resources/main/honeyPot.png">
							</span>
						</div>
						<div id="all-center">
							<div id="blank01"></div>
							<div id="profile-area">
								<div id="profile-img" onclick="location.href='/app/member/medit';">
									<img src="/app/resources/profile/exam_profile.png" height="230px">
									<div id="setting-icon-area">
										<i class="fa-solid fa-gear fa-2xl" style="color: #d9d9d9;"></i>
									</div>
								</div>
								<div id="profile-name">김아름다움</div>
								<div id="name-info">(101동 1306호)</div>
								<div id="logout-info" onclick="location.href='/app/member/logout';">로그아웃</div>
							</div>
						</div>

						<div id="menu-area">
							<div id="blank02"></div>
							<div id="icon-area">
								<div>
									<i class="fa-regular fa-user fa-2x" style="color: #2e2e2e;"></i>
								</div>
								<div>
									<i class="fa-solid fa-user-group fa-2x" style="color: #2e2e2e;"></i>
								</div>
								<div>
									<i class="fa-regular fa-pen-to-square fa-2x" style="color: #2e2e2e;"></i>
								</div>
								<div>
									<i class="fa-solid fa-building-user fa-2x" style="color: #2e2e2e;"></i>
								</div>
								<div>
									<i class="fa-solid fa-map-location-dot fa-2x" style="color: #2e2e2e;"></i>
								</div>
							</div>
							<div id="text-area">
								<div onclick="location.href=''">마이페이지</div>
								<div onclick="location.href=''">이웃목록</div>
								<div onclick="location.href=''">게시판</div>
								<div onclick="location.href=''">편의시설</div>
								<div onclick="location.href=''">주변시설</div>
							</div>
						</div>
						<div id="info-qna-area">
							<div>고객센터</div>
							<div id="small-text">
								<span>문의하기</span> <span>|</span> <span>FAQ</span> <span>|</span> <span>경비원호출</span>
							</div>
						</div>
					</div>

					<div id="main">
						<div id="header">
							<div id="header-main-text"></div>
							<div id="header-icon-area">
								<div id="header-weather">
									<%@ include file="/WEB-INF/views/data/headerWeather.jsp" %>
								</div>
								<div class="header-calling">
									<i class="fa-regular fa-bell fa-xl" style="color: #ffffff;">
										<div style="font-size: 7px; font-weight: 800;">15</div>
									</i>
								</div>
								<div class="header-chatting-icon">
									<i class="fa-regular fa-comments fa-xl" style="color: #ffffff;">
										<div style="font-size: 7px; font-weight: 800;">4</div>
									</i>
								</div>
							</div>
						</div>
						<!-- 채팅 알림 모달 -->
						<div class="chat_modal_wrap hidden">
							<div class="chat_modalBox">
								<c:forEach begin="1" end="5">
									<div class="latest-chat">
										<div class="contentCon"><i class="fa-regular fa-envelope fa-2x" style="color: #ffce31;"></i></div>
										<div class="contentSpan">
											<span>101동 골프모임</span>
											<br>
											<span>이거봐봐 완전 웃김</span>
										</div>
										<div>pm 6:30</div>
									</div>
								</c:forEach>
							</div>
							<div>
								<button class="chat-detail-Btn">
									상세보기
								</button>
							</div>
						</div>
						<div id="nav-area"></div>
						<div id="main-area"></div>
					</div>
				</div>
		</body>

		</html>

		<script>
			// 기본 셋팅 (수정x)
			function basicSetting() {
				const nav = document.querySelector("nav");
				const main = document.querySelector("main");
				const mainArea = document.querySelector("#main-area");
				const navArea = document.querySelector("#nav-area");

				while (mainArea.firstChild) {
					mainArea.firstChild.remove();
				}

				while (navArea.firstChild) {
					navArea.firstChild.remove();
				}

				while (main.firstChild) {
					mainArea.appendChild(main.firstChild);
				}

				while (nav.firstChild) {
					navArea.appendChild(nav.firstChild);
				}
			}

			// 수정1,2 : navMenu1,2에 메뉴를 적어주세요
			function firstNav(navMenu1, boldMenu) {
				const mainChoice = document.querySelector("#main-choice");

				let menus = "";
				for (let menu of navMenu1) {
					if (menu === boldMenu) {
						menus += "<div class='choice-elem title-elem text-bold'>" + menu + "</div>"
					} else {
						menus += "<div class='choice-elem'>" + menu + "</div>"
					}
				}
				mainChoice.innerHTML = menus;
			}

			function secondNav(navMenu2, boldMenu) {
				const subChoice = document.querySelector("#grid-sub-choice");

				let menus = "";
				for (let menu of navMenu2) {
					if (menu === boldMenu) {
						menus += "<div class='menu-box text-bold'>" + menu + "</div>"
					} else {
						menus += "<div class='menu-box'>" + menu + "</div>"

					}
				}
				subChoice.innerHTML = menus;
			}

			// 헤더 네임 바꾸기
			function headerName(name) {
				const mainChoice = document.querySelector("#header-main-text");
				mainChoice.innerHTML = name;
			}
			
			// 채팅 알림 모달 열기
			const openChatAlertModal = () => {
				document.querySelector(".chat_modal_wrap").classList.remove("hidden");
			};

			// 채팅 알림 닫기
			const closeChatAlertModal = () => {
				document.querySelector(".chat_modal_wrap").classList.add("hidden");
			};


			// 채팅 아이콘 클릭 이벤트 추가
			const chatCon = document.querySelector('.header-chatting-icon');
			chatCon.addEventListener("click", function() {

				// 모달이 이미 열려있는 경우 닫기
				if (!document.querySelector(".chat_modal_wrap").classList.contains("hidden")) {
					closeChatAlertModal();
				} else {
					openChatAlertModal();
				}
			});

			// 채팅 알림 상세보기 버튼 이벤트 추가
			const chatDetail = document.querySelector(".chat-detail-Btn");
			chatDetail.addEventListener('click', function(){
				location.href="/app/chat/list";
			})
			
			// 로그인 정보 출력
			console.log("loginMember : ${loginMember}");
			console.log("loginAdmin : ${loginAdmin}");
		</script>