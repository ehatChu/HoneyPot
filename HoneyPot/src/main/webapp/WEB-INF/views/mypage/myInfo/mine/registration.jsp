<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.car-img{
		width: 300px;
		height: 200px;
		background-color: gray;
	}
	.small-btn {
		padding: 5px 10px;
		border: none;
		margin-left: 10px;
	}
	.big-text {
		font-size: 25px;
		font-weight: 700;
		margin-left: 10px;
	}
	.color-main {
		background-color: #FFCE31;
	}
	.color-gray {
		background-color: #D9D9D9;
	}
	#list-area {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr;
	}
	#list-area {
		padding: 10px;
	}
	.middle-text {
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
		<div>
			<span class="big-text">사유물목록</span><button class="small-btn color-gray">삭제하기</button><button class="small-btn color-main">등록하기</button>
		</div>
		<div id="list-area">
		<c:forEach var="i" begin="1" end="8">
			<div class="mine-list">
				<div><span><input type="checkbox" id="${i}"><label for="${i}"  class="middle-text">람보르기니 센데나리오</label></span></div>
				<div class="car-img"></div>
			</div>
		</c:forEach>
			
		</div>
		

	</main>

</body>
</html>
<script>
	basicSetting(); // 기본 셋팅
	headerName('사유물 등록 및 변경'); // 현재 페이지 이름
	firstNav(['내정보', '나의활동', '신청내역','관리비'], '내정보'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['캘린더', '가계부','사유물 등록 및 변경'], '사유물 등록 및 변경'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>