<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>

	/* 배경 구역 */
	.board-detail-area {
		padding: 25px;
		/* text-align: center; */
	}

	.bg {
		background: white;
		border-radius: 20px;
	}


	/* 제목 */
	table {
		border-collapse: collapse;
		width: 1450px;
		font-size: 20px;
	}

	.detail-title-area {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#detail-title td {
		padding: 20px 50px;
		border-bottom: 5px solid #FAD355;
	}

	#detail-title td[id=title] { text-align: left; }

	#detail-title td:not(:first-of-type) { text-align: right;}


	/* 본문 */
	/* #detail-content {
		width: 100%;
		resize: none;
		padding: 50px;
		border: none;
		outline: none;
		overflow-y: hidden;
	} */
	#detail-content {
		margin: 100px;
		padding-bottom: 100px;
	}


	/* 버튼 */
	.btn-area {
		display: flex;
		justify-content: right;
		align-items: center;
		padding: 0px 30px 20px;
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
	}

	#btn-box > button { margin-right: 20px; }

	#btn-box > button:hover {
		color: white;
		cursor: pointer;
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

				<!-- 제목 -->
				<div class="detail-title-area">
					<table id="detail-title">
						<tr>
							<td id="title">${vo.fullName}</td>
							<td id="writer">${vo.writerName}</td>
							<td>${vo.enrollDate}</td>
							<td><i class="fa-solid fa-eye"></i>&nbsp;${vo.hit}</td>
						</tr>
					</table>
				</div>
				
				<!-- 본문 -->
				<div class="detail-content-area">
					<!-- <textarea name="" id="detail-content" readonly> -->
					<div id="detail-content">
						${vo.content}
					</div>
					<!-- </textarea> -->
				</div>

			</div>
		</div>

		<!-- 버튼 -->
		<div class="btn-area">
			<div id="btn-box">
				<button type="button" id="post-report-btn" onclick="location.href=''">신고</button>
				<button type="button" id="post-edit-btn" onclick="location.href='/app/notice/edit?no=${vo.no}'">수정</button>
				<button type="button" id="post-del-btn" onclick="location.href='/app/notice/delete?no=${vo.no}'">삭제</button>
			</div>
		</div>

	</main>

</body>
</html>

<script>
	basicSetting(); // 기본 셋팅
	headerName('게시판'); // 현재 페이지 이름
	firstNav(['공지 게시판', '자유 게시판', '장터 게시판', '익명 게시판', '칭찬 게시판', '관리자 게시판'], '공지 게시판'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴

	// textarea 높이 자동 조절
	// window.addEventListener('DOMContentLoaded', function() {
	// 	const textarea = document.querySelector('#detail-content');
	// 	textarea.style.height = textarea.scrollHeight + 'px';
	// });

</script>