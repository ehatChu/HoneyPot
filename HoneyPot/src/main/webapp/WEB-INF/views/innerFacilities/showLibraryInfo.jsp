<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#innerFacWrap {
		padding: 30px;
		display: flex;
	}
	#innerFac-img-area {
		width: 998px;
	}
	#innerFacWrap > div {
		border: 1px solid black;
		box-sizing: border-box;
	}
	#info-content {
		width: 500px;
		background-color: #F5F5F5;
		border: none;
		font-size: 18px;
		outline: none;
		resize: none;
	}
	#big-title {
		font-size: 50px;
		font-weight: 600;
	}
	#innerFac-info-detail {
		font-size: 18px;
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
		<div id="innerFacWrap">
			<div id="innerFac-text-area">
				<div id="big-title">푸리미엄 도서실</div>
				<textarea id="info-content" readonly>${fvo.content}</textarea>
				<div id="innerFac-info-detail">
					수용가능인원 : <span>${fvo.maxNum}</span>명 <br>
					오픈시간 : <span>${fvo.openTime}</span> <br>
					마감시간 : <span>${fvo.closeTime}</span> <br>
				</div>
			</div>
			<div id="innerFac-img-area">
				<div>시설사진</div>
				<div>${fimgList}</div>
			</div>
		</div>
		
	</main>

</body>
</html>
<script>
	basicSetting(); // 기본 셋팅
   	headerName('고객센터'); // 현재 페이지 이름
	firstNav(['도서관', '수영장', '헬스장'], '도서관'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

	resize();
	//textarea길이를 알맞게 조절
	function resize() {
		let ta = document.querySelector("#info-content");
		console.log("리사이즈 실행됨, 온로드에서");

		ta.style.height = "0px";

		let scrollHeight = ta.scrollHeight;
		let style = window.getComputedStyle(ta);
		let borderTop = parseInt(style.borderTop);
		let borderBottom = parseInt(style.borderBottom);

		ta.style.height = (scrollHeight + borderTop + borderBottom)+"px";
		
		
	}

</script>