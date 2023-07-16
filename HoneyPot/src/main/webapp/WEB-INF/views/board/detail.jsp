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
		text-align: center;
	}

	.bg {
		background: white;
		border-radius: 20px;
	}


	/* 제목 */
	table {
		border-collapse: collapse;
		width: 1450px;
		margin-top: 5px;
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
	#detail-content {
		width: 100%;
		resize: none;
		padding: 50px;
		border: none;
		outline: none;
		overflow-y: hidden;
	}


	/* 좋아요 버튼 */
	.like-btn-area { padding: 10px 40px 40px; }

	#like-btn {
		width: 90px;
		height: 90px;
		background-color: #FAD355;
		color: black;
		border-radius: 45px;
		border: none;
		text-align: center;
		font-size: 18px;
		font-weight: bold;
	}

	.fa-heart { color: red; }


	/* 버튼 */
	.btn-area {
		display: flex;
		justify-content: right;
		align-items: center;
		padding: 0px 30px 20px;
	}

	#btn-box > button , #reply-insert-btn {
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

	#reply-insert-btn { height: 50px; }

	#like-btn:hover, #btn-box > button:hover, #reply-insert-btn:hover {
		color: white;
		cursor: pointer;
	}


	/* 댓글 */
	.reply-area { padding: 25px; }

	.user-reply {
		display: flex;
		padding: 15px;
		border-bottom: 3px solid #FAD355;
	}
	
	#profile > img {
		width: 60px;
		height: 60px;
		border-radius: 45px;
	}

	.user-reply > div:first-of-type { margin-right: 15px; }

	#reply-body > div:not(:last-of-type) { margin-bottom: 2px;}

	#reply-writer { font-weight: bold; }

	#reply-footer { display: flex; }

	#reply-footer > div:not(:last-of-type) { margin-right: 15px; }

	#reply-footer > div:hover:not(:first-of-type) {
		cursor: pointer;
		color: rgb(155, 155, 155);
	}


	/* 대댓글 */
	.user-re-reply {
		display: flex;
		padding: 15px 15px 15px 80px;
		border-bottom: 3px solid #FAD355;
	}

	.user-re-reply > div:first-of-type { margin-right: 15px; }


	/* 댓글작성란 */
	.reply-submit-area {
		display: flex;
		align-items: center;
		padding: 20px 35px;
	}
	
	.reply-write-area {
		display: flex;
		align-items: center;
	}

	#reply-write {
		border-radius: 10px;
		width: 1000px;
		height: 50px;
		border: 1px solid rgb(155, 155, 155);
		font-size: 18px;
		resize: none;
		padding: 10px;
		font-family: 'Noto Sans KR';
	}

	#reply-insert-btn { margin: 0px 25px; }

	#secret-check { font-size: 18px; }

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
							<td id="title">제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
							<td id="writer">관리자</td>
							<td>2023.01.01 15:49</td>
							<td><i class="fa-solid fa-eye"></i>조회수</td>
						</tr>
					</table>
				</div>
				
				<!-- 본문 -->
				<div class="detail-content-area">
					<textarea name="" id="detail-content" readonly>
						이마가 훤히 보이게 뒤로 묶은 머리카락
						걸을 때마다 찰랑찰랑
						매끈한 다리를 감싼 바지 끝단 아래로 가벼운 운동화
						모든 게 심플하지만 아름다움이 풍겨와
						또 어딜 가든 예의 바른 행동과
						미소와 말툰 내 거친 생각마저 상냥하게
						만들어 넌 마치
						내 심장 위에 타투
						숨통이 막히도록 차있어 내 가슴 가득
						우리 함께 밤을 보낸 다음 이불 끝자락에 남은
						너의 향기에 난 취해 잠을 자
						새하얀 너의 살을 부드러운 뺨을 마음껏 품은 다음
						밤새도록 괴롭히고파
						돈 보다 자기 삶을 즐기며 살 줄 아는
						평범치 않은 아름다운 매력의 소유자
						사람냄새가 나 이 복잡한 세상 넌 마치 때 타지 않은 자연산
						사람냄새가 나서 니가 너무 좋아져
						어설픈 외모가 왠지 더 끌려 난
						우물쭈물 하다가 너를 놓칠까 봐
						난 미칠 것 만 같아
						진흙탕을 달리는 마차처럼 막 살아
						왠지 거칠어 보이지만 막상
						뜯어보면 상처 많은 남자
						공장 굴뚝의 연기처럼
						흘러가는 대로 살아왔지 혼자
						땀내나게 일해 쌀과 돈은 넘쳐났지만
						함께 나누고픈 사랑을 못 찾았지 난
						하지만 넌 좀 달라
						마치 LP처럼 사람 손을 그리워할 줄 아는 여자
						힘든 하루하루 나는 너를 알고 난 후
						모든 것들이 다시 제자리로 돌아가
						힘든 하루하루 나는 너를 알고 난 후
						모든 것이 다 숨을 쉬며 살아가
						사람냄새가 나서 니가 너무 좋아져
						어설픈 외모가 왠지 더 끌려 난
						우물쭈물 하다가 너를 놓칠까 봐
						난 미칠 것 만 같아
						하늘이 하늘답게 보여지듯이
						바람이 바람답게 느껴지듯이
						있는 그대로의 니 모습
						꾸며지지 않은 니 모습
						그 아름다움에 빠져들어
						사람냄새가 나서 니가 너무 좋아져
						어설픈 외모가 왠지 더 끌려 난
						우물쭈물 하다가 너를 놓칠까 봐
						난 미칠 것 만 같아
					</textarea>
				</div>

				<!-- 좋아요 버튼 -->
				<div class="like-btn-area">
					<button type="button" id="like-btn" onclick=""><i class="fa-solid fa-heart"></i>&nbsp;좋아요</button>
				</div>

			</div>
		</div>

		<!-- 버튼 -->
		<div class="btn-area">
			<div id="btn-box">
				<button type="button" id="post-report-btn" onclick="">신고</button>
				<button type="button" id="post-edit-btn" onclick="">수정</button>
				<button type="button" id="post-del-btn" onclick="">삭제</button>
			</div>
		</div>
		
		<div class="reply-area">
			<div class="bg">
				
				<!-- 댓글 -->
				<div class="user-reply">
					<div id="profile">
						<img src="/app/resources/profile/profile04cheese.jpg" alt="프로필사진">
					</div>

					<div id="reply-body">
						<div id="reply-writer">
							댓쓴이
						</div>

						<div id="reply-content">
							댓글내용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
						</div>

						<div id="reply-footer">
							<div id="reply-date">
								2023.08.10 15:49
							</div>
							<div id="re-reply-btn">답글쓰기</div>
							<div id="reply-edit-btn">수정</div>
							<div id="reply-del-btn">삭제</div>
							<div id="reply-report-btn">신고</div>
						</div>
					</div>
				</div>

				<!-- 대댓글 -->
				<div class="user-re-reply">
					<div id="profile">
						<img src="/app/resources/profile/profile04cheese.jpg" alt="프로필사진">
					</div>

					<div id="reply-body">
						<div id="reply-writer">
							댓쓴이
						</div>

						<div id="reply-content">
							댓글내용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
						</div>

						<div id="reply-footer">
							<div id="reply-date">
								2023.08.10 15:49
							</div>
							<div id="re-reply-btn">답글쓰기</div>
							<div id="reply-edit-btn">수정</div>
							<div id="reply-del-btn">삭제</div>
							<div id="reply-report-btn">신고</div>
						</div>
					</div>
				</div>

				<!-- 댓글 작성란 -->
				<div class="reply-submit-area">
					<div class="reply-write-area">
						<textarea name="" id="reply-write" placeholder="내용을 입력하세요."></textarea>
					</div>

					<div><button type="button" id="reply-insert-btn" onclick="">댓글쓰기</button></div>
					
					<div id="secret-check">
                        <label><input type="checkbox" id="secret" value="y">&nbsp;비밀댓글</label>
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

	// textarea 높이 자동 조절
	window.addEventListener('DOMContentLoaded', function() {
		const textarea = document.querySelector('#detail-content');
		textarea.style.height = textarea.scrollHeight + 'px';
	});

	// 입력에 맞게 textarea 높이 자동 조절
	// const textarea = document.querySelector('#detail-content');
	// textarea.addEventListener('input', function() {
	// 	this.style.height = 'auto'; // Reset the height to auto
	// 	this.style.height = this.scrollHeight + 'px'; // Set the height to match the content
	// });

</script>