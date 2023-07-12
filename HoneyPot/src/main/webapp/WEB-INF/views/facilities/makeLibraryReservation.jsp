<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#temp-main-wrapper{
		display: grid;
		grid-template-columns: 10fr 3fr;
		height: 2000px; /*임시*/
	}
	#reservation-area{
		background-color: aquamarine;
		background-clip: content-box;
		padding: 20px 0px 20px 20px;	

		display: grid;
		grid-template-columns: 1fr 1fr;
		grid-template-rows: 0.7fr 1.5fr 0.7fr;
		height: 1300px;
	}
	#reservation-area > div {
		border: 1px solid red;
	}
	#today-area {
		background-color: plum;
		background-clip: content-box;
		padding: 20px 20px 20px 20px;
	}

	#span-area {
		grid-column: span 2;
	}

	input[type="date"] {
		padding: 5px 10px 5px 10px;
		margin-left: 20px;
		margin-top: 10px;;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
		<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
	</nav>

	<main>
		<div id="temp-main-wrapper">
			<div id="reservation-area">
				<div>
					<h1>1.날짜선택</h1>
					<input type="date">
				</div>
				<div></div>
				<div id="span-area"></div>
				<div></div>
				<div></div>
			</div>
			<div id="today-area">

			</div>
		</div>
	</main>
</body>
</html>
<script>
		// 기본 셋팅 (수정x)
		function basicSetting() {
			const nav = document.querySelector("nav");
			const main = document.querySelector("main");
			const mainArea = document.querySelector("#main-area");
			const navArea = document.querySelector("#nav-area");
			mainArea.innerHTML = main.innerHTML;
			navArea.innerHTML = nav.innerHTML;
			main.innerHTML = "";
			nav.innerHTML = "";
		}

		// 수정1,2 : navMenu1,2에 메뉴를 적어주세요
		function firstNav() {
			const mainChoice = document.querySelector("#main-choice");
			let navMenu1 = ['도서관', '수영장', '헬스장'];

			let menus = "";
			for (let menu of navMenu1) {
				if(menu==="도서관"){
					menus += "<div class='choice-elem title-elem'>" + menu + "</div>"					
				}else{
					menus += "<div class='choice-elem'>" + menu + "</div>"					
				}
			}
			mainChoice.innerHTML = menus;
		}
		function secondNav() {
			const subChoice = document.querySelector("#grid-sub-choice");
			let navMenu2 = ['시설소개', '예약하기'];

			let menus = "";
			for (let menu of navMenu2) {
				if(menu==="예약하기"){
					menus += "<div class='menu-box text-bold'>" + menu + "</div>"	
				}else {
					menus += "<div class='menu-box'>" + menu + "</div>"	
					
				}
			}
			subChoice.innerHTML = menus;
		}
		// 헤더 네임 바꾸기
		function headerName() {
			const mainChoice = document.querySelector("#header-main-text");
			mainChoice.innerHTML = '';
			let menus = '고객센터';

			mainChoice.innerHTML = menus;
    	}

		
		// 함수 실행
		basicSetting();
		firstNav();
		secondNav();
    	headerName();
	</script>