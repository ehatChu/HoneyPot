<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<%@ include file="/WEB-INF/views/common/setup.jsp" %>
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

				.header-calling{
					cursor: pointer;
				}

				.header-calling>i {
					position: relative;
				}

				.header-calling>i>div:first-of-type {
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

				/* 채팅 아이콘 스타일 */
				.header-chatting-icon {
					position: relative;
				}

				.header-chatting-icon>i {
					font-size: 25px; /* 아이콘 크기 조정 */
					color: #ffffff;
				}

				.header-chatting-icon>i>div {
					bottom: -15px; /* 아이콘 아래로 이동 */
					left: 50%;
					transform: translateX(-50%); /* 가로 가운데 정렬 */
					height: 15px;
					width: 15px;
					background-color: rgb(255, 58, 58);
					border-radius: 70%;
					color: white;
					display: flex;
					align-items: center;
					justify-content: center;
					z-index: 2;
				}

				/* 채팅 알림 모달 레이아웃 */
				.chat_modal_wrap {
					position: absolute;
					width: 300px;
					height: 230px;
					right: 1px;
					top: 35px;
					border-radius: 10px 10px 0 0;
					display: grid;
					grid-template-rows: 200px 30px;
					align-items: center;
					z-index: 1;
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
					scrollbar-color: transparent transparent;
					/* 스크롤바 색상을 투명하게 설정 */
				}


				.chat_modalBox::-webkit-scrollbar {
					width: 0;
					/* 스크롤바의 너비 설정 */
				}

				.chat_modalBox::-webkit-scrollbar-track {
					background-color: transparent;
					/* 스크롤바 트랙의 배경색을 투명하게 설정 */
				}

				.chat_modalBox::-webkit-scrollbar-thumb {
					background-color: transparent;
					/* 스크롤바 썸의 배경색을 투명하게 설정 */
				}


				.hidden {
					display: none;
				}

				/* 배달 알림창 */
				.alarm-area{
					position: absolute;
					top: 13px;
					left: -265px;
					width: 280px;
					height: 150px;
					background: rgba(255, 255, 255, 0.70);
					border-radius: 6px;
					box-shadow: 3px 3px 3px 0px rgba(0, 0, 0, 0.25);
					overflow-y: auto;
					cursor: auto;
					display: flex;
					flex-direction: column;
					align-items: center;
					border: 1px solid rgba(138, 138, 138, 0.70);
				}

				.ahidden {
					display: none;
				}

				.alarm-area::-webkit-scrollbar {
 					 display: none;
				}

				.alarm-list{
					margin-top: 5px;
					width: 260px;
					height: 60px;
					background: rgba(255, 255, 255, 0.70);
					border: 1px solid rgba(138, 138, 138, 0.70);
					border-radius: 8px;
					display: flex;
					align-items: center;
					position: relative;
					box-shadow: 3px 3px 3px 0px rgba(0, 0, 0, 0.25);
					margin-bottom: 5px;
					
				}

				.alarm-img{
					width: 50px;
					height: 50px;
					overflow: hidden;	
					display: flex;
					justify-content: center;
					align-items: center;
				}

				.alarm-img > img{
					height: 60px;
					object-fit: cover;
					padding-bottom: 5px;
				}

				.alarm-list-content{
					display: flex;
				}

				.alarm-list-text{
					font-size: 12px;
					font-weight: 800;
					color: black;
				}

				.alarm-list-time{
					width: 70px;
					margin-left: 10px;
					font-size: 6px;
					font-weight: 800;
					color: rgb(150, 150, 150);
				}

				#close2{
					position: absolute;
					color: #ff3131b6;
					top: 3px;
					right: 5px;
					font-size: 14px;
					font-weight: 800;
					cursor: pointer;
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

				.contentSpan>span:first-child {
					font-weight: 570;
					font-size: 17px;
				}

				.contentSpan>span:nth-child(2) {
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

				#headerProfileImg {
					width: 230px;
					object-fit: cover;
					border-radius: 70%;
				}

				#admin-delivery-icon{
					font-size: 30px;
					cursor: pointer;
				}

				/* 알람 */
				.s-alarm-window {
					position: fixed;
					top: 80%;
					left: 87.5%;
					/* position: relative; */
					width: 100%;
					height: 100vh;
					/* width: 100%;
					height: 100%; */
					
					
					z-index: 1000;
					
					/* 숨기기 */
					z-index: -1;
					opacity: 0;
				}
				.show {
					opacity: 1;
					z-index: 1000;
					transition: all .5s;
					/* display: block; */
				}

				.s-alarm-popup {
					position: absolute;
					top: 0;
					left: 0;
					transform: translate(-50%, -50%);
					background-color: #fff8be4c;
					box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
					border-radius: 10px;
					
					/* 임시 지정 */
					width: 450px;
					height: 290px;
					
					/* 초기에 약간 아래에 배치 */
					transform: translate(-50%, -40%);
				}

				.show .alarm-popup {
					transform: translate(-50%, -50%);
					transition: all .5s;
				}

				#s-alarm-close{
					font-size: 25px;
					font-weight: 900;
					cursor: pointer;
					color: #ff3131b6;
					margin-right: 10px;
					margin-top: 5px;
				}

				.alarm-header{
					width: 100%;
					display: flex;
					justify-content: end;
					align-items: center;
					height: 30px;
				}

				.alarm-header-text{
					font-size: 20px;
					font-weight: 600;
				}

				.alamr-body-area{
					width: 100%;

				}

				.model-alarm-content{
					margin-left: 40px;
				}

				.model-alarm-img > img{
					width: 110px;
					height: 60px;
				}

				.model-alarm-text{
					font-size: 18px;
					font-weight: 800;
				}

				.model-alarm-date{
					margin-top: 20px;
					margin-bottom: 30px;
					font-size: 12px;
					color: rgb(144, 144, 144);
				}


				.model-alarm-btn{
					display: flex;
					justify-content: center;
					width: 450px;
					height: 60px;
				}

				.model-alarm-btn > button{
					background-color: #fff06da1;
					width: 390px;
					height: 50px;
					font-family: 'Noto Sans KR';
					font-weight: 800;
					font-size: 20px;
					border-radius: 22px;
					border: none;
				}

				.margin-r50{
					margin-right: 50px;
				}

				#check-btn{
					cursor: pointer;
				}

				#check-btn:hover{
					background-color: #fff06dec;
				}

				/* 배달 알람 */
				.delivery-background {
					position: fixed;
					top: 0;
					left: 0;
					width: 100%;
					height: 100vh;
					background-color: rgba(0, 0, 0, 0.3);
					z-index: 1000;
					
					/* 숨기기 */
					z-index: -1;
					opacity: 0;
				}

				.show {
					opacity: 1;
					z-index: 1000;
					transition: all .5s;
				}

				.delivery-window {
					position: relative;
					width: 100%;
					height: 100%;
				}

				.delivery-popup {
					position: absolute;
					top: 50%;
					left: 50%;
					transform: translate(-50%, -50%);
					background-color: #f5f5f5;
					box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
					border-radius: 10px;
					
					/* 임시 지정 */
					width: 700px;
					height: 700px;
					
					/* 초기에 약간 아래에 배치 */
					transform: translate(-50%, -40%);
				}

				.show .delivery-popup {
					transform: translate(-50%, -50%);
					transition: all .5s;
				}

				.delivery-model-header-area{
					width: 700px;
					height: 50px;
					border-top-left-radius: 10px;
					border-top-right-radius: 10px;
					background-color: #FFCE31;
				}

				.delivery-model-header{
					margin-left: 20px;
					width: 660px;
					height: 50px;
					display: flex;
					justify-content: space-between;
					align-items: center;
				}

				#delivery-close{
					font-size: 30px;
					font-weight: 900;
					color: red;
					cursor: pointer;
				}

				.delivery-model-header-text{
					font-size: 20px;
					font-weight: 600;
				}

				.delivery-model-body-area{
					width: 620px;
					margin: auto;
					margin-top: 20px;
				}

				.model-body-content{
					margin-top: 5px;
					margin-left: 3px;
					height: 300px;
					width: 600px;
					resize: none;
					border: 1px solid rgb(173, 173, 173);
					border-radius: 6px;
				}

				.delivery-model-body-first{
					width: 660px;
					display: flex;
					justify-content: space-between;

				}

				.delivery-model-title-text{
					font-size: 19px;
					font-weight: bold;
					color: gray;
				}

				.delivery-content-header{
					height: 50px;
					display: flex;
					align-items: center;
				}

				.delivery-model-search-box{
					margin-left: 20px;
					width: 250px;
					display: flex;
					align-items: center;
					justify-content: space-between;
					
				}

				.delivery-model-search-box > input{
					width: 200px;
					height: 35px;
					border-radius: 15px;
					padding-left: 10px;
					border: 1px solid rgb(173, 173, 173);
				}

				.delivery-model-search-box > button{
					width: 40px;
					height: 30px;
					border: none;
					background-color: #FFCE31;
					font-family: 'Noto Sans KR';
					font-weight: 800;
					cursor: pointer;
					border-radius: 5px;
				}

				.delivery-model-category{
					padding-left: 10px;
					margin-left: 3px;
					margin-top: 5px;
					margin-bottom: 10px;
					width: 260px;
					height: 50px;
					border-radius: 6px;
					border: 1px solid rgb(173, 173, 173);
				}

				.delivery-content-body{
					margin-top: 5px;
					width: 600px;
					height: 400px;
					display: flex;
				}

				.delivery-member-list-area{
					width: 260px;
					background-color: white;
					height: 100%;
					border: 1px solid rgb(173, 173, 173);
					border-radius: 12px;
					overflow-y: scroll;
				}

				.delivery-member-list-area::-webkit-scrollbar {
					display: none;
				}

				.delivery-member-list{
					width: 100%;
					height: 50px;
					display: flex;
					border-bottom: 1px solid rgb(187, 187, 187);
					align-items: center;
					
				}

				.delivery-member-list:hover{
					background-color: #FEFFD0;
				}

				.delivery-member-list-img{
					margin-left: 20px;
					width: 30px;
					height: 30px;
					border-radius: 70%;
					overflow: hidden;
					
				}

				.delivery-member-list-img > img {
					width: 100%;
					height: 100%;
					background-color: black;
					object-fit: cover;
				}

				.delivery-member-list-text{
					margin-left: 10px;
				}

				.delivery-member-list-text > span:first-of-type{
					font-weight: 800;
					font-size: 14px;
				}

				.delivery-member-list-text > span:last-of-type{
					font-size: 12px;
					color: rgb(86, 86, 86);
				}

				.delivery-model-btn{
					width: 300px;
					height: 50px;
					background-color: #FFCE31;
					border: none;
					border-radius: 6px;
					font-family: 'Noto Sans KR';
					font-weight: bold;
					font-size: 18px;
					cursor: pointer;
				}


				.delivery-member-btn-area{
					width: 80px;
					height: 100%;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: center;
				}


				.member-move-btn{
					width: 30px;
					height: 30px;
					border-radius: 70%;
					border: none;
					background-color: #FFCE31;
					font-size: 20px;
					color: white;
				}

				.delivery-model-btn-area{
					margin-top: 10px;
					width: 100%;
					display: flex;
					justify-content: center;
				}

				.delivery-member-btn-area > button:first-of-type{
					margin-bottom: 30px;
				}



				.margin-r50{
					margin-right: 50px;
				}

				.text-bold {
					font-weight: bold;
				}
				
				#text-area > div{
					cursor: pointer;
				}
				
			</style>
		</head>

		<body>
			<div id="wrapper">
				<c:if test="${empty loginAdmin}">
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
									<img id="headerProfileImg" src="/app/resources/member/profile/${loginMember.profile}" height="230px">
									<div id="setting-icon-area">
										<i class="fa-solid fa-gear fa-2xl" style="color: #d9d9d9;"></i>
									</div>
								</div>
								<div id="profile-name">${loginMember.name}</div>
								<div id="name-info">(${loginMember.dongNum}동 ${loginMember.hoNum}호)</div>
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
									<i class="fa-solid fa-dumbbell fa-2x" style="color: #2e2e2e;"></i>
								</div>
								<div>
									<i class="fa-solid fa-map-location-dot fa-2x" style="color: #2e2e2e;"></i>
								</div>
							</div>
							<div id="text-area">
								<div onclick="location.href='/app/calendar/schedule-list'">마이페이지</div>
								<div onclick="location.href='/app/member/friends'">이웃목록</div>
								<div onclick="location.href='/app/notice/list'">게시판</div>
								<div onclick="location.href='/app/innerFac/info?no=1'">편의시설</div>
								<div onclick="location.href='/app/around/showMap'">주변시설</div>
							</div>
						</div>
						<div id="info-qna-area">
							<div onclick="location.href='/app/csc/faq'">고객센터</div>
							<div id="small-text">
								<span onclick="location.href='/app/csc/inquiry'">문의하기</span>
								<span>|</span>
								<span onclick="location.href='/app/csc/faq'">FAQ</span>
							</div>
						</div>
					</div>
				</c:if>

				<c:if test="${not empty loginAdmin}">
					<div id="side-bar">
						<div id="logo-area" onclick="location.href='/app/main/amain'">
							<span> <img id="logo" src="/app/resources/main/logo.png">
								<img id="logo" src="/app/resources/main/honeyPot.png">
							</span>
						</div>
						<div id="all-center">
							<div id="blank01"></div>
							<div id="profile-area">
								<div id="profile-img" onclick="location.href='/app/member/aedit';">
									<img src="/app/resources/member/profile/${loginAdmin.profile}" height="230px">
									<div id="setting-icon-area">
										<i class="fa-solid fa-gear fa-2xl" style="color: #d9d9d9;"></i>
									</div>
								</div>
								<div id="profile-name">${loginAdmin.name}</div>
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
									<i class="fa-solid fa-headphones-simple fa-2x" style="color: #2e2e2e;"></i>
								</div>
								<div>
									<i class="fa-regular fa-pen-to-square fa-2x" style="color: #2e2e2e;"></i>
								</div>
								<div>
									<i class="fa-solid fa-building-user fa-2x" style="color: #2e2e2e;"></i>
								</div>
								<div>
									<i class="fa-solid fa-calendar-days fa-2x" style="color: #2e2e2e;"></i>
								</div>
							</div>
							<div id="text-area">
								<div onclick="location.href='/app/admin/member/member-list'">회원관리</div>
								<div onclick="location.href='/app/admin/csc/inquiry-list'">상담센터</div>
								<div onclick="location.href='/app/notice/list'">게시판</div>
								<div onclick="location.href='/app/fee/admin'">단지관리</div>
								<div onclick="location.href='/app/admin/calendar/schedule-list'">캘린더</div>
							</div>
						</div>
						<div id="info-qna-area">
							<div>꿀단지</div>
							<div id="small-text">
								<span>02-1544-9970</span>
							</div>
						</div>
					</div>
				</c:if>


				<div id="main">
					<div id="header">
						<div id="header-main-text"></div>
						<div id="header-icon-area">
							<div id="header-weather">
								<%@ include file="/WEB-INF/views/data/headerWeather.jsp" %>
							</div>

							<!-- 회원 배달 아이콘 -->
							<c:if test="${not empty loginMember}">
								<div class="header-calling" onclick="showTopAlarm()">
									<i class="fa-regular fa-bell fa-xl" style="color: #ffffff;" id="alarm-btn">
										<div id="alarm-count-area" style="font-size: 7px; font-weight: 800;"></div>
										<div class="alarm-area ahidden" id="alarm-area">
	
										</div>
									</i>
								</div>

							</c:if>

							<!-- 관리자 배달 아이콘 -->
							<c:if test="${not empty loginAdmin}">
								<span class="material-symbols-outlined" id="admin-delivery-icon" onclick="getMemberList()">
									local_post_office
									</span>
							</c:if>


							<div class="header-chatting-icon">
								<i class="fa-regular fa-comments fa-xl" style="color: #ffffff;">
									<!-- <div style="font-size: 7px; font-weight: 800;"></div> -->
								</i>
								<!-- 채팅 알림 모달 -->
								<div class="chat_modal_wrap hidden">
									<div class="chat_modalBox">
										
									</div>
									<div>
										<button class="chat-detail-Btn">
											상세보기
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="nav-area"></div>
					<div id="main-area"></div>
				</div>
			</div>

			<div class="s-alarm-window">
                <div class="s-alarm-popup">
                    <div class="alarm-header">
                        <span class="material-symbols-outlined" id="s-alarm-close">
                            close
                        </span>
                    </div>
                    <div class="alarm-body-area">
                        <div class="model-alarm-img">
                            <img src="" alt="벌사진" id="alarm-model-img">
                        </div>
                        <div class="model-alarm-content">
                            <div class="model-alarm-text" id="alarm-model-name"></div>
                            <div class="model-alarm-text">경비실에서 찾아가세요</div>
                            <div class="model-alarm-date" id="alarm-model-date"></div>
                        </div>
                        <div class="model-alarm-btn">
                            <button id="check-btn">확인</button>
                        </div>
                    </div>
    
                </div>
            </div>

			<!-- 관리자 배달 모달 -->
			<div class="delivery-background">
                <div class="delivery-window">
                    <div class="delivery-popup">
                        <div class="delivery-model-header-area">
                            <div class="delivery-model-header">
                                <div class="delivery-model-header-text">배달 알림 보내기</div>
                                <span class="material-symbols-outlined" id="delivery-close" onclick="deliveryClose()">
                                    close
                                </span>
                            </div>
                        </div>
                        <div class="delivery-model-body-area">
                            <div class="delivery-model-body-first">
                                <div class="delivery-model-sanction-date">
                                    <div class="delivery-model-title-text">알림 유형</div>
                                    <div>
                                        <select name="sendType" id="delivery-model-category" class="delivery-model-category">
                                            <option value="DELIVERY">배달</option>
                                    		<option value="PARCEL">택배</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="delivery-content-header">
                                    <div class="delivery-model-title-text">회원목록</div>
                                    <div class="delivery-model-search-box">
                                        <input type="text" id="delivery-model-input">
                                        <button onclick="searchMemberList();">검색</button>
                                    </div>
                                </div>
                            </div>
                            <div class="delivery-content-body">
                                <div class="delivery-member-list-area" id="member-list-area">
                                
                                    
                                    

                                </div>
                                <div class="delivery-member-btn-area">
                                    <button class="member-move-btn">></button>
                                    <button class="member-move-btn"><</button>
                                </div>
                                <div class="delivery-member-list-area" id="member-list-send-area">

                                </div>
                            </div>

                            <div class="delivery-model-btn-area">
                                <button onclick="sendDelivery ()" class="delivery-model-btn" type="button">보내기</button>
                            </div>

                        </div>
        
                    </div>
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

			// 기본 셋팅 2 (수정) : navMenu1,2에 메뉴를 적어주세요
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

			// 기본 셋팅 3 (수정) : 링크 주소를 적어주세요
			function firstNavLink(linkArr) {
				const choiceElemArr = document.querySelectorAll('.choice-elem');
				for (let i = 0; i < choiceElemArr.length; i++) {
					choiceElemArr[i].addEventListener("click", function() {
						location.href = linkArr[i];
					});
				}
			}
			function secondNavLink(linkArr) {
				const choiceElemArr = document.querySelectorAll('.menu-box');
				for (let i = 0; i < choiceElemArr.length; i++) {
					choiceElemArr[i].addEventListener("click", function() {
						location.href = linkArr[i];
					});
				}
			}


			// 헤더 네임 바꾸기
			function headerName(name) {
				const mainChoice = document.querySelector("#header-main-text");
				mainChoice.innerHTML = name;
			}

		
			// 로그인 정보 출력
			console.log("loginMember : ${loginMember}");
			console.log("loginAdmin : ${loginAdmin}");




			// 배달 알림 모달 사용
			const alarmBox = document.querySelector('#alarm-area');
			// const alarmBtn = document.querySelector('#alarm-btn');

			function showTopAlarm(){
				alarmBox.classList.toggle('ahidden');
			}
			
			// 하단 배달 알람 모달 사용
			function alarmShow () {
				document.querySelector(".s-alarm-window").className = "s-alarm-window show";
			}

			function alarmClose () { 
				document.querySelector(".s-alarm-window").className = "s-alarm-window";
			}

			document.querySelector("#s-alarm-close").addEventListener('click', alarmClose);
			document.querySelector("#check-btn").addEventListener('click', alarmClose);

			// 하단 배달 알람 받는 웹소켓 만들기
			let dsocket = new WebSocket("ws://127.0.0.1:8888/app/delivery");
				dsocket.onopen = deliveryOpen; 
				dsocket.onclose = deliveryClose;
				dsocket.onerror = deliveryError;
				dsocket.onmessage = deliveryMessage;

			function deliveryOpen(){
				console.log("연결 성공");
			}

			function deliveryClose(){
				console.log("소켓 닫힘");
			}

			function deliveryError(){
				console.log("소켓 닫힘");
			}

			function deliveryMessage(e){
				const memberNo = "${loginMember.no}";
				
				const obj = JSON.parse(e.data);
				
				// 날짜
				let today = new Date();
				let year = today.getFullYear();
				let month = ('0' + (today.getMonth() + 1)).slice(-2);
				let day = ('0' + today.getDate()).slice(-2);
				let hours = ('0' + today.getHours()).slice(-2); 
				let minutes = ('0' + today.getMinutes()).slice(-2);
				let dateString = year + '-' + month  + '-' + day + ' ' + hours + '시 ' + minutes + '분 ';
				const dateArea = document.querySelector("#alarm-model-date");
				dateArea.innerHTML = "";
				dateArea.innerHTML = dateString;
				
				// 이름 바꾸기
				const alarmModelName = document.querySelector("#alarm-model-name");
				alarmModelName.innerHTML = ""
				const alarmImg = document.querySelector("#alarm-model-img")
				if(obj[0].sendType === "DELIVERY"){
					alarmModelName.innerHTML = "${loginMember.name}님 배달이 왔습니다.";
					alarmImg.src = "/app/resources/bee/delivery.png";
				}else if(obj[0].sendType === "PARCEL"){
					alarmModelName.innerHTML = "${loginMember.name}님 택배가 왔습니다.";
					alarmImg.src = "/app/resources/bee/parcel.png";
				}
				for(let vo of obj){
					if(memberNo == vo.memberNo){
						alarmShow();
					}
				}
			}

			// 알람 받기
			function receiveAlarm(){
				const memberNo = "${loginMember.no}";
				$.ajax({
					url : "/app/parcel-list",
					method : "POST",
					data : {
						"memberNo" : memberNo
					},
					dataType : "json",
					success : function(data) {
						const alarmArea = document.querySelector("#alarm-area");
						const alarmCount = document.querySelector("#alarm-count-area");
						let str = "";
						let num = 0;
						alarmArea.innerHTML = "";
						alarmCount.innerHTML = "0";
						
						for(let vo of data){
							num++;
							
							str += `<div class="alarm-list">
												<div class="alarm-img">
													<img src="/app/resources/bee/parcel.png" alt="">
												</div>
												<div class="alarm-list-content">
													<div class="alarm-list-text">귀하의 택배가 왔습니다.</div>
													<div class="alarm-list-time">\${vo.arriveDate}</div>
													<div hidden>\${vo.no}</div><span class="material-symbols-outlined" onclick="deleteAlarm(this);" id="close2">
														close
													</span>
												</div>
											</div>`
						}

						alarmArea.innerHTML = str;
						alarmCount.innerHTML= num;



					},
					error : function() {
							alert("실패");
						},
					})
			}

			receiveAlarm();

			// 택배 배달 알림 삭제
			function deleteAlarm(e){
				const pno = e.previousSibling.innerHTML;
				const memberNo = "${loginMember.no}";
				$.ajax({
					url : "/app/parcel-list/delete",
					method : "POST",
					data : {
						"memberNo" : memberNo,
						"pno" : pno
					},
					dataType : "json",
					success : function(data) {
						const alarmArea = document.querySelector("#alarm-area");
						const alarmCount = document.querySelector("#alarm-count-area");
						let str = "";
						let num = 0;
						alarmArea.innerHTML = "";
						alarmCount.innerHTML = "0";
						
						for(let vo of data){
							num++;
							
							str += `<div class="alarm-list">
												<div class="alarm-img">
													<img src="/app/resources/bee/parcel.png" alt="">
												</div>
												<div class="alarm-list-content">
													<div class="alarm-list-text">귀하의 택배가 왔습니다.</div>
													<div class="alarm-list-time">\${vo.arriveDate}</div>
													<div hidden>\${vo.no}</div><span class="material-symbols-outlined" onclick="deleteAlarm(this);" id="close2">
														close
													</span>
												</div>
											</div>`
						}

						alarmArea.innerHTML = str;
						alarmCount.innerHTML= num;

						showTopAlarm();
					},
					error : function() {
							alert("실패");
						},
					})
			}


			// 관리자 배달 모달 보내기
			function sendDelivery (){
				const sendmemberList = document.querySelectorAll("#member-list-send-area > .delivery-member-list");
				let noArr = [];
				const sendType = document.querySelector("#delivery-model-category");
				for(let sendNo of sendmemberList){
					noArr.push(sendNo.firstElementChild.innerText);
				}

				var sendJson = JSON.stringify({
					sendType : sendType.value,
					noArr : noArr,
				})

				dsocket.send(sendJson);
				noArr = [];
				deliveryClose();
			}

			// 관리자 배달 모달 사용
			function deliveryShow () {
				document.querySelector(".delivery-background").className = "delivery-background show";
			}

			function deliveryClose () { 
				const sendListArea = document.querySelector("#member-list-send-area");
				sendListArea.innerHTML = "";
				document.querySelector(".delivery-background").className = "delivery-background";
			}

		    // 관리자 배달 모달 모든 회원 찾기
			function getMemberList() {
				$.ajax({
				url : "/app/csc/report/memberList",
				method : "POST",
				// data : {

				// },
				dataType : "json",
				success : function(data) {
					const area = document.querySelector("#member-list-area");
					area.innerHTML = "";
					let str = "";
					for (let member of data) {
						str += `<div class="delivery-member-list" draggable="true">
										<div hidden>\${member.no}</div>
                                        <div class="delivery-member-list-img">
                                            <img src="/app/resources/member/profile/\${member.profile}" alt="프로필사진">
                                        </div>
                                        <div class="delivery-member-list-text">
                                            <span>\${member.name}</span>
                                            <span>\${member.dongNum}동 \${member.hoNum}</span>
                                        </div>
                                    </div>`

										
					}

					area.innerHTML = str;

					// 드래그앤 드랍
					const draggables = document.querySelectorAll(".delivery-member-list");
					const containers = document.querySelectorAll(".delivery-member-list-area");

					draggables.forEach(draggable => {
					draggable.addEventListener("dragstart", () => {
						draggable.classList.add("dragging");
					});

					draggable.addEventListener("dragend", () => {
						draggable.classList.remove("dragging");
					});
					});

					containers.forEach(container => {
					container.addEventListener("dragover", e => {
						e.preventDefault();
						const afterElement = getDragAfterElement(container, e.clientX);
						const draggable = document.querySelector(".dragging");
						if (afterElement === undefined) {
						container.appendChild(draggable);
						} else {
						container.insertBefore(draggable, afterElement);
						}
					});
					});

					function getDragAfterElement(container, x) {
					const draggableElements = [
						...container.querySelectorAll(".draggable:not(.dragging)"),
					];

					return draggableElements.reduce(
						(closest, child) => {
						const box = child.getBoundingClientRect();
						const offset = x - box.left - box.width / 2;
						// console.log(offset);
						if (offset < 0 && offset > closest.offset) {
							return { offset: offset, element: child };
						} else {
							return closest;
						}
						},
						{ offset: Number.NEGATIVE_INFINITY },
					).element;
					}

					deliveryShow();
				},
				error : function() {
					alert("실패");
				},
			})	


			}

			// 검색한 회원 찾기
			function searchMemberList() {
				const searchValue = document.querySelector("#delivery-model-input").value;
				$.ajax({
					url : "/app/csc/report/memberList",
					method : "POST",
					data : {
						"searchType" : "NAME",
						"searchValue" : searchValue
					},
					dataType : "json",
					success : function(data) {
						console.log(data);

						const area = document.querySelector("#member-list-area");
						area.innerHTML = "";
						let str = "";
						for (let member of data) {
							str += `<div class="delivery-member-list" draggable="true">
										<div hidden>\${member.no}</div>
                                        <div class="delivery-member-list-img">
                                            <img src="/app/resources/member/profile/\${member.profile}" alt="프로필사진">
                                        </div>
                                        <div class="delivery-member-list-text">
                                            <span>\${member.name}</span>
                                            <span>\${member.dongNum}동 \${member.hoNum}</span>
                                        </div>
                                    </div>`
						}

						area.innerHTML = str;

						// 드래그앤 드랍
						const draggables = document.querySelectorAll(".delivery-member-list");
						const containers = document.querySelectorAll(".delivery-member-list-area");

						draggables.forEach(draggable => {
						draggable.addEventListener("dragstart", () => {
							draggable.classList.add("dragging");
						});

						draggable.addEventListener("dragend", () => {
							draggable.classList.remove("dragging");
						});
						});

						containers.forEach(container => {
						container.addEventListener("dragover", e => {
							e.preventDefault();
							const afterElement = getDragAfterElement(container, e.clientX);
							const draggable = document.querySelector(".dragging");
							if (afterElement === undefined) {
							container.appendChild(draggable);
							} else {
							container.insertBefore(draggable, afterElement);
							}
						});
						});

						function getDragAfterElement(container, x) {
						const draggableElements = [
							...container.querySelectorAll(".draggable:not(.dragging)"),
						];

						return draggableElements.reduce(
							(closest, child) => {
							const box = child.getBoundingClientRect();
							const offset = x - box.left - box.width / 2;
							// console.log(offset);
							if (offset < 0 && offset > closest.offset) {
								return { offset: offset, element: child };
							} else {
								return closest;
							}
							},
							{ offset: Number.NEGATIVE_INFINITY },
						).element;
						}
					},
					error : function() {
						alert("실패");
					},
				})
			}
			


		////////////* 채팅 *///////////

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
		chatCon.addEventListener("click", function () {
			location.href = "/app/chat/list";
		});


		



			
		</script>
