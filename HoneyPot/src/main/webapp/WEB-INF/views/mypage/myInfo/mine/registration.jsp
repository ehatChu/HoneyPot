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

	#mine-header {
		font-size: 24px;
		font-weight: 700;
		padding-left: 10px;
	}
	/* 등록창 모달 */
	#modal-top {
		width: 900px;
		height: 50px;
		background-color: #FFCE31;
		border-radius: 20px 20px 0px 0px;
		display: flex;
		align-items: center;
		justify-content: space-between;
	}

	#registration{
		width: 900px;
		height: 400px;
		background-color: white;
		position: fixed;
		top: 200px;
		left: 600px;
		border-radius: 30px 30px 0px 0px;
	}
	.margin-right {
		margin-right: 10px;
	}
	#img {
		width: 400px;
		height: 300px;
		background-color: gray;
	}
	#img-area {
		display: flex;
		justify-content: ;
		align-items: center;
		height: 350px;
	}
	#regi-content {
		width: 450px;
		display: grid;
		grid-template-columns: 1fr 2fr;
	}
	#regi-content > div {
		border: 1px solid black;
	}
	#regi-content >div:first-child{
		grid-column: span 2;
	}
	.margin15 {
		margin-left: 15px;
	}
	#regi-content >div:last-child{
		grid-column: span 2;
	}
	.big-mine-text {
		font-size: 30px;
		font-weight: 800;
	}
	.margin-top{
		margin-top: 20px;
	}
	.bold-text {
		font-weight: 800;
		font-size: 20px;
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
		
		<div id="registration">
			<div id="modal-top">
				<span id="mine-header">사유물등록</span><span><i class="fa-solid fa-xmark fa-2xl margin-right" style="color: #000000;"></i></span>
			</div>
			<form action="">
				<div id="img-area">
					<div id="img" class="margin15"></div>
					<div id="regi-content" class="margin15">
	
						<div class="big-mine-text">사유물등록</div>
						<div class="margin-top bold-text">사유물 종류</div> <div>111</div>
						<div>사유물 이름</div> <div>111</div>
						<div>사유물 번호판</div> <div>111</div>
						<div><input type="button" value="등록"></div>					
					</div>
		
				</div>
			</form>
			
			
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