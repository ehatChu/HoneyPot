<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>

	/* 목록 구역 */
	.list-content-area {
		text-align: center;
		padding: 25px;
	}

	.list-bg {
		background: white;
		border-radius: 20px;
	}

	/* 목록 */
	table {
		margin: 45px 30px 30px;
		border-collapse: collapse;
		font-size: 18px;
		width: 1350px;
	}

	.board-list-area, .page-area {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#board-list td {
		padding: 12px 50px;
		margin-bottom: 20px;
		border-bottom: 3px solid #FAD355;
		text-align: left;
	}

	#board-list td[id=title] {
		width: 650px;
		max-width: 650px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	#board-list td:not(:first-of-type) { padding-right: 20px; }

	#board-list tr:hover {
		background-color: #fdeaab;
		transition: 0.3s;
		cursor: pointer;
	}

	.fa-heart { color: red; }

	/* 페이지 버튼 */
	.page-area {
		margin-top: 10px;
		padding-bottom: 15px;
	}

	.page-area > button {
		display: inline-block;
		font-weight: bold;
		font-size: 20px;
		border: none;
		border-radius: 5px;
		padding: 10px 20px;
		cursor: pointer;
		background-color: transparent;
	}

	.page-area button:hover, #current-page-btn {
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
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp"%>
		<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
	</nav>

	<main>

		<div class="list-content-area">
			<div class="list-bg">

				<div class="board-list-area">
					<table id="board-list">
						<c:forEach items="${voList}" var="vo">
							<tr id="${vo.no}">
								<td id="title">${vo.title}</td>
								<td>${vo.boardCname}</td>
								<td>${vo.enrollDate}</td>
								<td><i class="fa-solid fa-heart"></i> &nbsp; ${vo.loveCnt}</td>
								<td><i class="fa-solid fa-eye"></i> &nbsp; ${vo.hit}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
		
				<div class="page-area">
					<!-- <button><</button>
					<button>1</button>
					<button>2</button>
					<button>3</button>
					<button>4</button>
					<button>5</button>
					<button>></button> -->

					<c:if test="${pv.currentPage > 1}">
						<button type="button" onclick="location.href='/app/mypage/act/board?p=${pv.currentPage - 1}'"> < </button>
					</c:if>
					<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
						<c:if test="${pv.currentPage != i}">
							<button type="button" onclick="location.href='/app/mypage/act/board?p=${i}'">${i}</button>
						</c:if>
						<c:if test="${pv.currentPage == i}">
							<button type="button" id="current-page-btn">${i}</button>
						</c:if>
					</c:forEach>
					<c:if test="${pv.currentPage < pv.maxPage}">
						<button type="button" onclick="location.href='/app/mypage/act/board?p=${pv.currentPage + 1}'"> > </button>
					</c:if>
				</div>
	
			</div>
		</div>

	</main>

</body>
</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('마이페이지'); // 현재 페이지 이름
    firstNav(['내정보', '나의활동', '신청내역','관리비'], '나의활동'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	firstNavLink(['/app/calendar/schedule-list', '/app/mypage/act/board', '/app/meal/mypage', '/app/fee/member']);
    secondNav(['내게시글', '내댓글', '좋아요', '상벌점내역'], '내게시글'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
	secondNavLink(['/app/mypage/act/board', '/app/mypage/act/reply', '/app/mypage/act/like', '/app/mypage/act/point-list']);


   	// 목록 클릭하여 글번호 얻기
	const trArray = document.querySelectorAll("tr");
	trArray.forEach(getNo);
	
	function getNo(tr) {
		tr.addEventListener('click', function() {
			const no = tr.getAttribute('id');
			location.href = '/app/board/detail?no=' + no;
		});
	};
</script>