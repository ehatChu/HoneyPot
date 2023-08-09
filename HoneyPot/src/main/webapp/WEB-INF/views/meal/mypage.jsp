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

			.page-area>button {
				display: inline-block;
				font-weight: bold;
				font-size: 20px;
				border: none;
				border-radius: 5px;
				padding: 10px 20px;
				cursor: pointer;
				background-color: transparent;
			}

			.page-area button:hover,
			#current-page-btn {
				background-color: #FAD355;
				color: white;
			}

			#current-page-btn:hover {
				background-color: #FAD355;
				color: white;
				cursor: default;
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
						<c:forEach items="${applyList}" var="vo">
							<tr id="tr">
								<td id="tr1" class="tr">${vo.breakfastDate.substring(0,10)}</td>
								<td id="tr2" class="tr">${vo.menu}</td>
								<td id="tr3" class="tr"><button onclick="cancelApply('${vo.no}')">신청취소</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<br>
				<div class="page-area">
					<c:if test="${pv.currentPage > 1}">
						<button type="button" onclick="location.href='/app/meal/mypage?p=${pv.currentPage - 1}'">
							< </button>
					</c:if>
					<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
						<c:if test="${pv.currentPage != i}">
							<button type="button" onclick="location.href='/app/meal/mypage?p=${i}'">${i}</button>
						</c:if>
						<c:if test="${pv.currentPage == i}">
							<button type="button" id="current-page-btn">${i}</button>
						</c:if>
					</c:forEach>
					<c:if test="${pv.currentPage < pv.maxPage}">
						<button type="button" onclick="location.href='/app/meal/mypage?p=${pv.currentPage + 1}'"> >
						</button>
					</c:if>
				</div>
				<br><br><br>
			</main>

	</body>

	</html>

	<script>
		basicSetting(); // 기본 셋팅
    	headerName('마이페이지'); // 현재 페이지 이름
		firstNav(['내정보', '나의활동', '신청내역', '관리비'], '신청내역');
		secondNav(['조식', '편의시설'], '조식');
		firstNavLink(['/app/calendar/schedule-list','/app/mypage/act/board','/app/meal/mypage','/app/fee/member']);
		secondNavLink(['/app/meal/mypage','/app/innerFac/personalReservation?p=1']);

		function cancelApply(no) {
			$.ajax({
				url: '/app/meal/cancelApply?no=' + no,
				type: 'get',
				success: function (data) {
					alert("신청이 취소되었습니다");
					location.reload();
				},
				error: function () {
					alert("editMeal error");
				}
			});
		}
	</script>