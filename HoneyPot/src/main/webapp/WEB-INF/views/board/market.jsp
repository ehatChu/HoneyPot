<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장터게시판</title>
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

	input[name=boardSearch] {
		margin-left: 12px;
		border: none;
		width: 330px;
		height: 30px;
		font-size: 18px;
	}

	input[name=boardSearch]:focus {outline:none;}

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
	.gallery-area {
		display: grid;
		place-items: center;
		grid-template-columns: 1fr 1fr 1fr 1fr;
	}

	.product {
		height: 300px;
		width: 270px;
		margin: 20px;
		font-size: 18px;
		font-weight: bold;

		display: grid;
		place-items: center;
	}

	#product-img {
		display: grid;
		place-items: center;
		height: 240px;
		width: 270px;
	}

	#product-img > img {
		max-width: 100%;
		max-height: 100%;
		object-fit: contain;
		border-radius: 30px;
	}

	#like {margin-top: 7px;}

	.fa-heart { color: red; }

	.product:hover { cursor: pointer; }

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
		margin-top: 40px;
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

	.page-area button:hover{
		background-color: #FAD355;
		color: white;
	}

	/* div { border: 1px solid red; } */

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp"%>
	</nav>

	<main>

		<div class="board-search-area">
			<div id="search-type">
				<select name="searchType">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">글쓴이</option>
				</select>
			</div>

			<div id="board-search">
				<input type="search" name="boardSearch">
				<span><button type="button" id="search-btn"><i class="fa-solid fa-magnifying-glass fa-lg"></i></button></span>
			</div>
		</div>

		<div class="list-content-area">
			<div class="list-bg">

				<div class="sort-type-area">
					<div id="sort-type">
						<select name="sortType">
							<option value="date">최신순</option>
							<option value="like">인기순</option>
							<option value="hit">조회순</option>

						</select>
					</div>
				</div>

				<div class="gallery-area">
					<c:forEach items="${voList}" var="vo">
						<div class="product" id="${vo.no}">
							<c:choose>
								<c:when test="${vo.boardImgName != null}">
									<div id="product-img"><img src="/app/resources/board/${vo.boardImgName}" alt="상품사진"></div>
								</c:when>
								<c:otherwise>
									<div id="product-img"><img src="/app/resources/main/logo.png" alt="상품사진"></div>
								</c:otherwise>
							</c:choose>
							<div id="title">${vo.title}</div>
							<div id="like"><i class="fa-solid fa-heart"></i> &nbsp; ${vo.loveCnt}</div>
						</div>
					</c:forEach>
				</div>
		
				<div class="btn-area">
					<div id="btn-box">
						<button type="button" id="write-btn" onclick="location.href='/app/board/write'">글쓰기</button>
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
						<button type="button" onclick="location.href='/app/board/market?p=${pv.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&sortType=${searchVo.sortType}'"> < </button>
					</c:if>
					<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
						<c:if test="${pv.currentPage != i}">
							<button type="button" onclick="location.href='/app/board/market?p=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&sortType=${searchVo.sortType}'">${i}</button>
						</c:if>
						<c:if test="${pv.currentPage == i}">
							<button type="button" id="current-page-btn">${i}</button>
						</c:if>
					</c:forEach>
					<c:if test="${pv.currentPage < pv.maxPage}">
						<button type="button" onclick="location.href='/app/board/market?p=${pv.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&sortType=${searchVo.sortType}'"> > </button>
					</c:if>
				</div>
	
			</div>
		</div>





	</main>

</body>
</html>

<script>
	basicSetting(); // 기본 셋팅
	headerName('게시판'); // 현재 페이지 이름
	firstNav(['공지 게시판', '자유 게시판', '장터 게시판', '익명 게시판', '칭찬 게시판'], '장터 게시판'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
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
    }

	//정렬 후 정렬타입 유지되도록
	function initSortType(){
		const y = document.querySelector('select[name=sortType] > option[value="' + sortType + '"]');
		y.selected = true;
	}
   

   	// 목록 클릭하여 글번호 얻기
	const productArray = document.querySelectorAll(".product");
	productArray.forEach(getNo);
	
	function getNo(div) {
		div.addEventListener('click', function() {
			const no = div.getAttribute('id');
			location.href = '/app/board/detail?no=' + no;
		});
	};



</script>