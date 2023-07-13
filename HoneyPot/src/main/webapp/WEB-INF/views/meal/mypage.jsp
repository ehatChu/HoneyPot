<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<style>
			#tit {
				margin-top: 50px;
				margin-bottom: 50px;
				font-size: 44px;
				font-weight: bold;
				margin-left: 5%;
			}

			#floor1 {
				display: flex;
				justify-content: space-evenly;
			}
			#board-list {
				width: 85%;
			}

			#board-list td {
				font-size: 22px;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			#tr {
				height: 60px;
				border-bottom: 3px solid #FAD355;
				display: flex;
				justify-content: space-between;
				align-items: center;
			}

			.tr{
				display: flex;
				justify-content: center;
				align-items: center;
			}

			#tr1{
				width: 200px;
			}

			#tr2{
				width: 1000px;
			}

			#tr3{
				width: 200px;
			}

			#board-list tr:hover {
				background-color: #fdeaab;
				transition: 0.3s;
				cursor: pointer;
			}

			#board-list tr:first-child {
				background-color: #FAD355;
			}

			#board-list th {
				font-size: 22px;
			}

			#board-list button {
				width: 100px;
				height: 35px;
				border-radius: 20px;
				border: none;
				background-color: #4A321F;
				color: white;
				font-size: 18px;
			}

			.page-area {
				width: 100%;
				display: flex;
				justify-content: center;
				align-items: center;
				margin-top: 15px;
			}

			.page-area button {
				display: inline-block;
				font-weight: bold;
				font-size: 18px;
				border: none;
				border-radius: 5px;
				padding: 10px 20px;
				cursor: pointer;
				background-color: transparent;
			}

			.page-area button:hover {
				background-color: #FAD355;
				color: white;
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
				<div id="tit">조식 신청 내역</div>
				<div id="floor1">
					<table id="board-list">
						<tr id="tr">
							<th id="tr1" class="tr">예약 날짜</th>
							<th id="tr2" class="tr">메뉴</th>
							<th id="tr3" class="tr">취소</th>
						</tr>
						<c:forEach begin="1" end="10">
							<tr id="tr">
								<td id="tr1" class="tr">2020. 08. 01</td>
								<td id="tr2" class="tr">차조밥, 조개국, 불고기, 시금치나물, 배추김치</td>
								<td id="tr3" class="tr"><button>신청취소</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<br>
				<div class="page-area">
					<button>
						<</button>
							<button>1</button>
							<button>2</button>
							<button>3</button>
							<button>4</button>
							<button>5</button>
							<button>></button>
				</div>
				<br><br><br>
			</main>

	</body>

	</html>

	<script>
		basicSetting(); // 기본 셋팅
    	headerName('마이페이지'); // 현재 페이지 이름
		firstNav(['내정보', '나의활동', '신청내역', '관리비'], '신청내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
		secondNav(['조식예약', '편의시설예약'], '조식예약'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
	</script>