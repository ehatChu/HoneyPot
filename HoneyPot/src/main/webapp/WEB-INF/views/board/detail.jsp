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
		/* justify-content: end; */
		align-items: center;
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

	/* 내용 구역 */
	.board-detail-area, .reply-area {
		text-align: center;
		padding: 25px;
	}

	.bg {
		background: white;
		border-radius: 20px;
	}

	/* 목록 */
	table {
		margin: 30px;
		border-collapse: collapse;
		font-size: 18px;
		width: 1350px;
	}

	.board-content, .page-area {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#board-list td {
		padding: 12px 50px;
		margin-bottom: 20px;
		border-bottom: 3px solid #FAD355;
	}

	#board-list td[id=title] { text-align: left; }

	#board-list tr:hover {
		background-color: #fdeaab;
		transition: 0.3s;
		cursor: pointer;
	}

	.fa-heart { color: red; }

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


		<div class="board-detail-area">
			<div class="bg">

				<div class="board-content">
					<table id="board-list">
							<tr>
								<td id="title">제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
								<td id="writer">관리자</td>
								<td>2023.01.01 15:49</td>
								<td><i class="fa-solid fa-heart"></i>좋아요</td>
								<td><i class="fa-solid fa-eye"></i>조회수</td>
							</tr>
					</table>
				</div>
		
				<div class="btn-area">
					<div id="btn-box">
						<button type="button" id="report-btn" onclick="">신고</button>
						<button type="button" id="edit-btn" onclick="">수정</button>
						<button type="button" id="del-btn" onclick="">삭제</button>
					</div>
				</div>
		
	
			</div>
		</div>

		<div class="reply-area">
			<div class="bg">

				<div>
					<img src="/app/resources/profile/profile04cheese.jpg" alt="프로필사진">
					<span>치삼제</span>
					<span>월요ㅣㄹ좋아</span>
				</div>


				<div class="board-search-area">
		
					<div id="board-search">
						<input type="search" name="boardSearch">
					</div>

					<div><button type="button" id="reply-btn" onclick="">등록</button></div>
					<div id="secret-checkbox">
                        <label for="secret">
                            <input type="checkbox" id="secret" value="y">
                            비밀댓글
                        </label>
					</div>
				</div>
				
			</div>
		</div>





	</main>

</body>
</html>

<script>
	basicSetting(); // 기본 셋팅
	headerName('게시판'); // 현재 페이지 이름
	firstNav(['공지 게시판', '자유 게시판', '장터 게시판', '익명 게시판', '칭찬 게시판', '관리자 게시판'], '공지 게시판'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
</script>