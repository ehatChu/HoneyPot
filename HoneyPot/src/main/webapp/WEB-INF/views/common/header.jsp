<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://kit.fontawesome.com/794ac64f16.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap')
	;

* {
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
}

body {
	font-family: 'Noto Sans KR';
	color: #2e2e2e;
	overflow: hidden;
	font-weight: 400;
	background-color: #f5f5f5;
}
body::-webkit-scrollbar {
  display: none;
}

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
	height:45px;
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
    background: #4A321F; /* 스크롤바 색상 */
    /* border-radius: 10px; 스크롤바 둥근 테두리 */
}

#main-area::-webkit-scrollbar-track {
    background: #4a321f23;  /*스크롤바 뒷 배경 색상*/
}

#loog-area {
	height: 45px;
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

#weather-info-msg {
	font-size: 13px;
	font-weight: 100;
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
/* 헤더 아래에 초이스 구역 */
.title-elem {
	border: 4px solid #FAD355;
	height: 40px;
	border-radius: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.choice-elem {
	padding-left: 40px;
	padding-top: 15px;
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
	<div id="wrapper">
		<div id="side-bar">
			<div id="logo-area">
				<span> <img src="/app/resources/logo.png" height="45px">
					<span>HONEYPOT</span>
				</span>
			</div>
			<div id="all-center">
				<div id="blank01"></div>
				<div id="profile-area">
					<div id="profile-img">
						<img src="/app/resources/profile/exam_profile.png" height="230px">
						<div id="setting-icon-area">
							<i class="fa-solid fa-gear fa-2xl" style="color: #d9d9d9;"></i>
						</div>
					</div>
					<div id="profile-name">김아름다움</div>
					<div id="name-info">(101동 1306호)</div>
					<div id="logout-info">로그아웃</div>
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
						<i class="fa-regular fa-pen-to-square fa-2x"
							style="color: #2e2e2e;"></i>
					</div>
					<div>
						<i class="fa-solid fa-building-user fa-2x" style="color: #2e2e2e;"></i>
					</div>
					<div>
						<i class="fa-solid fa-map-location-dot fa-2x"
							style="color: #2e2e2e;"></i>
					</div>
				</div>
				<div id="text-area">
					<div>마이페이지</div>
					<div>이웃목록</div>
					<div>게시판</div>
					<div>편의시설</div>
					<div>주변시설</div>
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
				<div id="header-main-text">메인페이지</div>
				<div id="header-icon-area">
					<div id="header-weather">
						<div>
							<img src="/app/resources/temp/weather.png" height="35px">
						</div>
						<div id="weather-info-msg">60ºC 부분적으로 맑음</div>
					</div>
					<div class="header-calling">
						<i class="fa-regular fa-bell fa-xl" style="color: #ffffff;">
							<div style="font-size: 7px; font-weight: 800;">15</div>
						</i>
					</div>
					<div class="header-chatting-icon">
						<i class="fa-regular fa-comments fa-xl" style="color: #ffffff;">
							<div style="font-size: 7px; font-weight: 800;">15</div>
						</i>
					</div>
				</div>
			</div>
			<div id="nav-area"></div>
			<div id="main-area"></div>
		</div>
	</div>
</body>
</html>