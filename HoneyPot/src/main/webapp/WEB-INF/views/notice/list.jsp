<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판</title>
<style>

	/* 검색바 */
	.board-search-area {
		margin-top: 25px;
		display: flex;
		justify-content: end;
		align-items: center;
	}

	select[name=searchType] {
		/* -moz-appearance: none;
		-webkit-appearance: none;
		appearance: none;
		border: none; */
		width: 95px;
		height: 50px;
		background-color: white;
		border: 1px solid rgb(155, 155, 155);
		border-radius: 10px;
		outline: none;
		display: flex;
		justify-self: right;
		margin-right: 10px;
		font-size: 18px;
		text-align: center;
	}

	#board-search {
		width: 400px;
		height: 50px;
		background-color: white;
		border: 1px solid rgb(155, 155, 155);
		border-radius: 10px;
		display: flex;
		justify-self: center;
		align-items: center;
		margin-right: 30px;
	}

	input[name=searchValue] {
		margin-left: 12px;
		border: none;
		width: 330px;
		height: 30px;
		font-size: 18px;
	}

	input[name=searchValue]:focus {outline:none;}

	#search-btn {
		margin-left: 10px;
		font-size: 20px;
		border: none;
		background: none;
		border-radius: 10px;
	}

	#search-btn:hover {
		cursor: pointer;
		background-color: rgb(155, 155, 155);
	}

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

	.important {
		background-color: #ffae00;
		font-weight: bold;
	}

	#board-list td {
		padding: 12px 50px;
		margin-bottom: 20px;
		border-bottom: 3px solid #FAD355;
		text-align: left;
	}

	#board-list td[id=title] {
		width: 700px;
		max-width: 700px;
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

	/* 글쓰기 버튼 */
	.btn-area {
		display: flex;
		justify-content: right;
		align-items: center;
	}

	#btn-box > button {
		width: 100px;
		height: 40px;
		background-color: #FAD355;
		color: black;
		border-radius: 10px;
		border: none;
		text-align: center;
		font-size: 18px;
		font-weight: bold;
		margin-right: 70px;
	}

	#btn-box > button:hover {
		color: white;
		cursor: pointer;
	}

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
	</nav>

	<main>
		<form action="/app/notice/list" method="get">

			<div class="board-search-area">
				<div id="search-type">
					<select name="searchType">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer">글쓴이</option>
					</select>
				</div>

				<div id="board-search">
					<input type="search" name="searchValue" value="${searchVo.searchValue}">
					<span><button type="submit" id="search-btn"><i class="fa-solid fa-magnifying-glass fa-lg"></i></button></span>
				</div>
			</div>

			<div class="list-content-area">
				<div class="list-bg">

					<div class="sort-type-area">
						<div id="sort-type">
							<select name="sortType" onchange="this.form.submit()">
								<option value="date">최신순</option>
								<option value="hit">조회순</option>
							</select>
						</div>
					</div>


					<!-- <table id="important-list">
						<c:forEach items="${voList}" var="vo">
							<c:if test="${vo.importantYn == 'Y'}">
								<tr>
									<td id="important-title">${vo.fullname}</td>
									<td id="important-writer">${vo.writerName}</td>
									<td>${vo.enrollDate}</td>
									<td><i class="fa-solid fa-eye"></i>&nbsp;${vo.hit}</td>
								</tr>
							</c:if>
						</c:forEach>
					</table> -->
					

					<div class="board-list-area">
						<table id="board-list">
							<c:forEach items="${voList}" var="vo">
								<c:choose>
									<c:when test="${vo.importantYn == 'Y'}">
										<tr class="important" id="${vo.no}">
											<td id="title">[중요] ${vo.fullname}</td>
									</c:when>

									<c:otherwise>
										<tr id="${vo.no}">
											<td id="title">${vo.fullname}</td>
									</c:otherwise>
								</c:choose>

									<td id="writer">${vo.writerName}</td>
									<td>${vo.enrollDate}</td>
									<td><i class="fa-solid fa-eye"></i>&nbsp;${vo.hit}</td>
								</tr>

							</c:forEach>
						</table>
					</div>
			
					<div class="btn-area">
						<div id="btn-box">
							<button type="button" id="write-btn" onclick="location.href='/app/notice/write'">글쓰기</button>
						</div>
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
							<button type="button" onclick="location.href='/app/notice/list?p=${pv.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&sortType=${searchVo.sortType}'"> < </button>
						</c:if>
						<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
							<c:if test="${pv.currentPage != i}">
								<button type="button" onclick="location.href='/app/notice/list?p=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&sortType=${searchVo.sortType}'">${i}</button>
							</c:if>
							<c:if test="${pv.currentPage == i}">
								<button type="button" id="current-page-btn">${i}</button>
							</c:if>
						</c:forEach>
						<c:if test="${pv.currentPage < pv.maxPage}">
							<button type="button" onclick="location.href='/app/notice/list?p=${pv.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&sortType=${searchVo.sortType}'"> > </button>
						</c:if>
					</div>
		
				</div>
			</div>

		</form>
	</main>


</body>
</html>

<script>
	basicSetting(); // 기본 셋팅
	headerName('게시판'); // 현재 페이지 이름
	firstNav(['공지 게시판', '자유 게시판', '장터 게시판', '익명 게시판', '칭찬 게시판'], '공지 게시판'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	firstNavLink(['/app/notice/list', '/app/board/free', '/app/board/market', '/app/board/noname', '/app/board/praise',]);


	//검색타입 및 검색어
	const searchType = '${searchVo.searchType}';
	const searchValue = '${searchVo.searchValue}';
	const sortType = '${searchVo.sortType}';

	if(searchType.length > 1){
        initSearchType();
    }

	if(sortType.length > 1){
		initSortType();
	}

    //검색 후 검색타입 유지되도록
    function initSearchType(){
        const x = document.querySelector('select[name=searchType] > option[value="' + searchType + '"]');
	    x.selected = true;
    };

	//정렬 후 정렬타입 유지되도록
	function initSortType(){
		const y = document.querySelector('select[name=sortType] > option[value="' + sortType + '"]');
		y.selected = true;
	};


	// 목록 클릭하여 글번호 얻기
	const trArray = document.querySelectorAll("tr");
	trArray.forEach(getNo);
	
	function getNo(tr) {
		tr.addEventListener('click', function() {
			const no = tr.getAttribute('id');
			location.href = '/app/notice/detail?no=' + no;
		});
	};
   
</script>