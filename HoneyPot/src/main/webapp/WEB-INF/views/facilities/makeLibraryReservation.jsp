<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
		<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
	</nav>

	<main>
		<div style="height: 2000px;">
			안녕하살법? 
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
			menus += "<div class='choice-elem'><div class='title-elem'>" + menu + "</div></div>"
		}
		mainChoice.innerHTML = menus;
	}
	function secondNav() {
		const subChoice = document.querySelector("#grid-sub-choice");
		let navMenu2 = ['시설소개', '예약하기'];

		let menus = "";
		for (let menu of navMenu2) {
			menus += "<div class='menu-box'>" + menu + "</div>"
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