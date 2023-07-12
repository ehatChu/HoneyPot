<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
		background-clip: content-box;
		padding: 20px 0px 20px 20px;	

		display: grid;
		grid-template-columns: 1fr 2fr;
		grid-template-rows: 0.2fr 0.4fr 0.5fr;
		height: 750px;
	}
	#reservation-area > div {
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
	.small-box {
		width: 80px;
		height: 50px;
		display: inline-flex;
		margin-top: 20px;
		margin-left: 20px;
		align-items: center;
		justify-content: center;
	}
	.middle-size {
		font-size: 25px;
	}
	h1 {
		font-size: 40px;
		font-weight: 500;
	}
	.big-size {
		font-size: 60px;
		font-weight: 800;
		display: inline-block;
	}
	#count-people {
		padding-left: 20px;
	}
	input[type="checkbox"] {
	}
	.btn-box {
		width: 150px;
		height: 60px;
		font-size: 20px;
		font-weight: 600;
		margin: 20px;
		border: none;
	}
	.orange-color {
		background-color: #FAD355 ;
	}
	.brown-color {
		background-color: #4A321F ;
		color: white;
	}
	.orange-font-color {
		color: #FAD355;
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
				<div id="span-area">
					<h1>2.시간선택</h1>
					<c:forEach var="i" begin="1" end="18">
						<!-- small-box이용하면 label을 박스형태로 바꿀 수 있음. -->
						<label for="i" class="small-box orange-color">07:00<input type="checkbox" name="startTime" id="i" value="i"></label>
							
					</c:forEach>
				</div>
				<div id="count-people">
					<div class="middle-size">선택한 시간대의 예약자는 현재</div>
					<div class="big-size orange-font-color">23</div><span class="middle-size">/50명입니다.</span>
				</div>
				<div>
					<h1>3.신청하시겠습니까?</h1>
					<button class="orange-color btn-box">예약하기</button> <button class="brown-color btn-box">예약취소</button>
				</div>
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