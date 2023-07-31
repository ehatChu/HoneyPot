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


	/* 좋아요 버튼 */
	.like-btn-area {
		padding: 10px 40px 40px;
		text-align: center;
	}

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
							<td id="title">${vo.title}</td>
							<td id="writer">${vo.writerName}</td>
							<td>${vo.enrollDate}</td>
							<td><i class="fa-solid fa-eye"></i>${vo.hit}</td>
						</tr>
					</table>
				</div>
				
				<!-- 본문 -->
				<div class="detail-content-area">
					<div id="detail-content">
						${vo.content}
					</div>
				</div>

				<!-- 좋아요 버튼 -->
				<div class="like-btn-area">
					<button type="button" id="like-btn" onclick=""><i class="fa-solid fa-heart"></i>&nbsp; 숫자</button>
				</div>

			</div>
		</div>

		<!-- 버튼 -->
		<div class="btn-area">
			<div id="btn-box">
				<button type="button" id="post-report-btn" onclick="location.href=''">신고</button>
				<button type="button" id="post-edit-btn" onclick="location.href='/app/board/edit?no=${vo.no}'">수정</button>
				<button type="button" id="post-del-btn" onclick="location.href='/app/board/delete?no=${vo.no}'">삭제</button>
			</div>
		</div>
		
		<div class="reply-area">
			<div class="bg">
				
				<!-- 댓글 -->
				<div class="user-reply">
					<input type="hidden" name="boardNo" value="${vo.no}">
					<input type="hidden" name="replyNo" value="${rvo.no}">

					<div id="profile">
						<img src="/app/resources/profile/profile04cheese.jpg" alt="프로필사진">
						<!-- <img src="/app/resources/profile/${loginMember.profile}" alt="프로필사진"> -->
					</div>

					<div id="reply-body">
						<div id="reply-writer">
							댓쓴이
							<!-- ${rvo.writerName} -->
						</div>

						<div id="reply-content">
							댓글내용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
							<!-- ${rvo.content} -->
						</div>

						<div id="reply-footer">
							<div id="reply-date">
								2023.08.10 15:49
								<!-- ${rvo.enrollDate} -->
							</div>
							<div id="re-reply-btn" onclick="">답글쓰기</div>
							<div id="reply-edit-btn" onclick="">수정</div>
							<div id="reply-del-btn" onclick="">삭제</div>
							<div id="reply-report-btn" onclick="">신고</div>
						</div>
					</div>
				</div>

								<!-- 댓글 작성란 -->
								<div class="reply-submit-area">
									<div class="reply-write-area">
										<textarea name="" id="reply-write" placeholder="내용을 입력하세요."></textarea>
									</div>
				
									<div><button type="button" id="reply-insert-btn" onclick="writeReply();">댓글쓰기</button></div>
									
									<div id="secret-check">
										<label><input type="checkbox" id="secret" value="y">&nbsp;비밀댓글</label>
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

					<div><button type="button" id="reply-insert-btn" onclick="writeReply();">댓글쓰기</button></div>
					
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


	function writeReply(){
		const replyWriteTag = document.querySelector('#reply-write');
		const replyWriteContent = replyWriteTag.value;
		const replyWriteContentTrim = replyWriteTag.value.trim();
		console.log(replyWriteTag);
		console.log(replyWriteContent);
		console.log(replyWriteContentTrim);

		if(!replyWriteContentTrim) {
			return;
		}

		$.ajax({
			url : '/app/reply' ,
			type : 'post' ,
			data : {
				boardNo : '2' ,
				// boardNo : '${vo.no}' ,
				writerNo : '2' ,
				// writerNo : '${loginMember.no}' ,
				content : replyWriteContent ,
			} ,
			success :function(result) {

				console.log(result);

				if (result == 'success') {
					alert("댓글이 등록되었습니다.");
					location.reload();
					replyWriteContent = '';
					loadReply();
				}else{
					alert("댓글 작성 실패...");
				}
			},
			error : function(fail) {
				console.log(fail);
			},
		})
	}

	function loadReply() {
		
	}


</script>