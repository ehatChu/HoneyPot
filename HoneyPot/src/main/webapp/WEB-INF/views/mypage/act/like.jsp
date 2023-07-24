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

	/* 정렬타입 */
	.sort-type-area {
		align-items: center;
		justify-content: center;
		text-align: right;
		font-weight: bold;
	}

	select[name=sortType]{
		border: none;
		outline: none;
		margin-top: 25px;
		margin-right: 30px;
		font-size: 18px;
		font-weight: bold;
	}

	/* 목록 */
	table {
		margin: 30px;
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
		width: 575px;
		max-width: 575px;
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

	.page-area button:hover{
		background-color: #FAD355;
		color: white;
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
						<c:forEach begin="1" end="10">
							<tr>
								<td id="title">제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
								<td id="writer">관리자</td>
								<td>2023.01.01 15:49</td>
								<td><i class="fa-solid fa-heart"></i>좋아요</td>
								<td><i class="fa-solid fa-eye"></i>조회수</td>
							</tr>
						</c:forEach>
					</table>
				</div>
		
				<div class="page-area">
					<button><</button>
					<button>1</button>
					<button>2</button>
					<button>3</button>
					<button>4</button>
					<button>5</button>
					<button>></button>
					<!-- <c:if test="${pv.currentPage > 1}">
						<a class="btn btn-primary btn-sm" href="${root}/board/list?page=${pv.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">이전</a>
					</c:if>
						<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
							<c:if test="${pv.currentPage != i}">
								<a class="btn btn-primary btn-sm" href="${root}/board/list?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">${i}</a>
							</c:if>
							<c:if test="${pv.currentPage == i}">
								<a class="btn btn-primary btn-sm">${i}</a>
							</c:if>
						</c:forEach>
					<c:if test="${pv.currentPage < pv.maxPage}">
						<a class="btn btn-primary btn-sm" href="${root}/board/list?page=${pv.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">다음</a>
					</c:if> -->
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
    secondNav(['내게시글', '내댓글', '좋아요', '상벌점내역'], '좋아요'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>