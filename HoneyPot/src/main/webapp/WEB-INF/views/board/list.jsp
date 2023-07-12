<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	div {
		border: 1px solid red;
	}

	.board-search-area {
		width: 1560px;
		height: 140px;
		background-color: #EAEAEA;
		display: grid;
		grid-template-columns: 1fr 1fr;
		justify-content: end;
		align-items: center;
	}

	select {
		-moz-appearance: none;
		-webkit-appearance: none;
		appearance: none;
		border: none;
	}

	select[name=searchType]{
		width: 50px;
		height: 50px;
		background-color: white;
		border: 1px solid black;
		border-radius: 10px;
		display: flex;
		justify-self: right;
		align-items: center;
		margin-right: 100px;
		font-size: 18px;
	}

	#board-search {
		width: 400px;
		height: 50px;
		background-color: white;
		border: 1px solid black;
		border-radius: 10px;
		display: flex;
		justify-self: center;
		align-items: center;
		margin-right: 100px;
	}

	input[name=boardSearch] {
		margin-left: 12px;
		border: none;
		width: 330px;
		height: 30px;
	}

	input[name=boardSearch]:focus {outline:none;}

	#board-search-icon {
		margin-left: 10px;
		font-size: 35px;
	}

	table {
		margin: 30px;
		border-collapse: collapse;
		font-size: 18px;
		width: 1350px;
	}

	.board-list-area, .page-area {
		width: 1560px;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#board-list td {
		padding: 12px 50px;
		margin-bottom: 20px;
		border-bottom: 3px solid #FAD355;
	}

	#board-list tr:hover {
		background-color: #fdeaab;
		transition: 0.3s;
		cursor: pointer;
	}

	.fa-heart { color: red; }

	.btn-area {
		margin-bottom: 15px;
		width: 1560px;
		display: flex;
		justify-content: right;
		align-items: center;
	}

	#btn-box {
		margin-right: 200px;
	}

	#btn-box > button {
		width: 80px;
		height: 40px;
		background-color: #FAD355;
		color: black;
		font-weight: bold;
		border-radius: 10px;
		border: none;
		text-align: center;
		margin-right: 7px;
	}

	#btn-box > button:hover {
		color: white;
		cursor: pointer;
	}

	.page-area {
		margin: 15px;
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
	</nav>

	<main>

		<div class="board-search-area">

			<!-- <div id="search-type">
				<select name="searchType">
					<option value="title">제목</option>
					<option value="writer">글쓴이</option>
				</select>
			</div> -->

			<div id="board-search">
				<select name="searchType">
					<option value="title">제목</option>
					<option value="writer">글쓴이</option>
				</select>

				<input type="search" name="boardSearch">
				<span id="board-search-icon" class="material-symbols-outlined">search</span>
			</div>

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

				<tr>
					<td>제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
					<td>관리자</td>
					<td>2023.01.01</td>
					<td><i class="fa-solid fa-heart"></i>좋아요</td>
					<td><i class="fa-solid fa-eye"></i>조회수</td>
				</tr>
				<tr>
					<td>제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
					<td>관리자</td>
					<td>2023.01.01</td>
					<td><i class="fa-solid fa-heart"></i>좋아요</td>
					<td><i class="fa-solid fa-eye"></i>조회수</td>
				</tr>
				<tr>
					<td>제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
					<td>관리자</td>
					<td>2023.01.01</td>
					<td><i class="fa-solid fa-heart"></i>좋아요</td>
					<td><i class="fa-solid fa-eye"></i>조회수</td>
				</tr>
				<tr>
					<td>제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
					<td>관리자</td>
					<td>2023.01.01</td>
					<td><i class="fa-solid fa-heart"></i>좋아요</td>
					<td><i class="fa-solid fa-eye"></i>조회수</td>
				</tr>
				<tr>
					<td>제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
					<td>관리자</td>
					<td>2023.01.01</td>
					<td><i class="fa-solid fa-heart"></i>좋아요</td>
					<td><i class="fa-solid fa-eye"></i>조회수</td>
				</tr>
				<tr>
					<td>제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
					<td>관리자</td>
					<td>2023.01.01</td>
					<td><i class="fa-solid fa-heart"></i>좋아요</td>
					<td><i class="fa-solid fa-eye"></i>조회수</td>
				</tr>
				<tr>
					<td>제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
					<td>관리자</td>
					<td>2023.01.01</td>
					<td><i class="fa-solid fa-heart"></i>좋아요</td>
					<td><i class="fa-solid fa-eye"></i>조회수</td>
				</tr>
				<tr>
					<td>제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
					<td>관리자</td>
					<td>2023.01.01</td>
					<td><i class="fa-solid fa-heart"></i>좋아요</td>
					<td><i class="fa-solid fa-eye"></i>조회수</td>
				</tr>
				<tr>
					<td>제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
					<td>관리자</td>
					<td>2023.01.01</td>
					<td><i class="fa-solid fa-heart"></i>좋아요</td>
					<td><i class="fa-solid fa-eye"></i>조회수</td>
				</tr>
			</table>

		</div>

		<div class="btn-area">
			<div id="btn-box">
				<button id="write-btn" onclick="">글쓰기</button>
			</div>
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

	</main>

</body>
</html>

<script>
	// // 기본 셋팅 (수정x)
	// function basicSetting() {
	// 		const nav = document.querySelector("nav");
	// 		const main = document.querySelector("main");
	// 		const mainArea = document.querySelector("#main-area");
	// 		const navArea = document.querySelector("#nav-area");
	// 		mainArea.innerHTML = main.innerHTML;
	// 		navArea.innerHTML = nav.innerHTML;
	// 		main.innerHTML = "";
	// 		nav.innerHTML = "";
	// 	}

	// 	// 수정1,2 : navMenu1,2에 메뉴를 적어주세요
	// 	function firstNav() {
	// 		const mainChoice = document.querySelector("#main-choice");
	// 		let navMenu1 = ['공지 게시판', '자유 게시판', '장터 게시판', '익명 게시판', '칭찬 게시판', '관리자 게시판'];

	// 		let menus = "";
	// 		for (let menu of navMenu1) {
	// 			menus += "<div class='choice-elem'><div class='title-elem'>" + menu + "</div></div>"
	// 		}
	// 		mainChoice.innerHTML = menus;
	// 	}

	// 	// 함수 실행
	// 	basicSetting();
	// 	firstNav();

	basicSetting(); // 기본 셋팅
	headerName('게시판'); // 현재 페이지 이름
	firstNav(['공지 게시판', '자유 게시판', '장터 게시판', '익명 게시판', '칭찬 게시판', '관리자 게시판'], '공지 게시판'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
</script>