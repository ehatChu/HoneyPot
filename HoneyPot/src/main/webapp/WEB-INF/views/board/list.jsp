<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	main {
		height: 100vh;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.board-list-area{
		width: 1560px;
		display: grid;
		justify-content: center;
		align-items: center;
	}

	#board-list td:first {width: 50px;}

	#board-list {
		border-bottom: 3px solid #FAD355;
		border-spacing: 100px 0px;
	}

	/* #board-list td {
		border-bottom: 3px solid #FAD355;
	} */

	table {
		margin: 15px;
	}
	
	.fa-solid fa-heart {color: red;}

	.page-area{
		width: 1560px;
		display: flex;
		justify-content: center;
		align-items: center;
	}



</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp"%>
	</nav>

	<main>
		
		<div id="search-box">
			<input type="search">
		</div>

		<div class="board-list-area">
			<table id="board-list">
				<tr>
					<td>제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
					<td>관리자</td>
					<td>2023.01.01</td>
					<td><i class="fa-solid fa-heart"></i>좋아요</td>
					<td><i class="fa-solid fa-eye"></i>조회수</td>
				</tr>
			</table>
			<!-- <hr> -->
			<table id="board-list">
				<tr>
					<td>제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
					<td>관리자</td>
					<td>2023.01.01</td>
					<td><i class="fa-solid fa-heart"></i>좋아요</td>
					<td><i class="fa-solid fa-eye"></i>조회수</td>
				</tr>
			</table>
		</div>

		<div id="page-area">
			<c:if test="${pv.currentPage > 1}">
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
			</c:if>
		</div>

		<div class="btn-area">
			<div id="btn-box">
				<button id="write-btn" onclick="minusMileage();">글쓰기</button>
			</div>
		</div>
			

	</main>

</body>
</html>

<script>
	const nav = document.querySelector("nav");
	const main = document.querySelector("main");
	const mainArea = document.querySelector("#main-area");
	const navArea = document.querySelector("#nav-area");

	mainArea.innerHTML = main.innerHTML;
	navArea.innerHTML = nav.innerHTML;
	main.innerHTML = "";
	nav.innerHTML = "";
</script>