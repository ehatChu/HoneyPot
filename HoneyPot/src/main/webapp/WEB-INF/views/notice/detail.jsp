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
		padding: 25px 25px 0px 25px;
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
		padding: 20px 50px 10px;
		border-bottom: 5px solid #FAD355;
	}

	#detail-title td[id=title] {
		width: 700px;
		max-width: 700px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		text-align: left;
	}

	#detail-title td:not(:first-of-type) { text-align: right;}

	#detail-content {
		margin: 100px 100px 0px 100px;
		padding-bottom: 100px;
	}


	/* 버튼 */
	.vote-submit-btn-area, .btn-area {
		display: flex;
		justify-content: right;
		align-items: center;
		padding: 20px 30px;
	}

	.vote-submit-btn-area {
		justify-content: center;
		padding: 0px;
		margin-top: 15px;
	}

	#vote-submit-btn, #btn-box > button {
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

	#vote-submit-btn {
		width: 80px;
		height: 30px;
		font-size: 15px;
	}


	#btn-box > button { margin-right: 20px; }

	#vote-submit-btn:hover, #btn-box > button:hover {
		color: white;
		cursor: pointer;
	}


    /* 투표 UI */
	.vote-area {
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 200px 100px 0px 100px;
	}

    .vote-wrap {
        border: 3px solid #4A321F;
        border-radius: 20px;
        /* margin: 10px 0px; */
        padding: 10px;
        background: white;
        width: 350px;
        overflow-x: auto;
    }

    #vote-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    #vote-title {
        font-size: 18px;
        font-weight: bold;
    }

    #vote-end-date {
        /* margin-right: 40px; */
        font-size: 15px;
        color: #5F5F5F;
        color: rgb(156, 156, 156);;
    }

    #vote-body {
        display: grid;
        grid-template-columns: 1fr;
        overflow:auto;
        white-space: nowrap;
        /* text-overflow: ellipsis; */
		margin-top: 10px;
    }

	.vote-article {
		margin: 5px 0px;
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
							<td id="title">${vo.fullname}</td>
							<td id="writer">${vo.writerName}</td>
							<td>${vo.enrollDate}</td>
							<td><i class="fa-solid fa-eye"></i> &nbsp; ${vo.hit}</td>
						</tr>
					</table>
				</div>
				
				<!-- 본문 -->
				<div class="detail-content-area">
					<div id="detail-content">
						${vo.content}

						<!-- 투표 ui -->
						<c:if test="${voteVo != null}">
	
							<div class="vote-area">
								
								<!-- 투표 전 -->
								<div class="vote-wrap">
									<div id="vote-header">
										<input type="hidden" id="vote-title-hidden" name="voteTitle" value="${voteVo.voteTitle}">
										<div id="vote-title">${voteVo.voteTitle}</div>
										<input type="hidden" id="vote-end-date-hidden" name="endDate" value="${voteVo.endDate}">
										<div id="vote-end-date">종료일 : ${voteVo.endDate}</div>
									</div>
			
									<div id="vote-body">
										<c:forEach items="${vcvo}" var="vcvo">
											<div class="vote-article">
												<label>
													<input type="hidden" name="voteCandidateNo" value="${vcvo.no}">
													<input type="hidden" name="voteCandidateName" value="${vcvo.name}">
													<input class="vote-target" id="vote-target" type="radio" name="voteCandidateNo" value="${vcvo.no}">&nbsp;<span name="voteCandidateName">${vcvo.name}</span>
												</label>
											</div>
										</c:forEach>
									</div>

									<div class="vote-submit-btn-area">
										<button type="button" id="vote-submit-btn">투표하기</button>
									</div>
								</div>


								<!-- 투표 후 -->
								<div class="vote-wrap">
									<div id="vote-header">
										<input type="hidden" id="vote-title-hidden" name="voteTitle" value="${voteVo.voteTitle}">
										<div id="vote-title">${voteVo.voteTitle}</div>
										<input type="hidden" id="vote-end-date-hidden" name="endDate" value="${voteVo.endDate}">
										<div id="vote-end-date">종료일 : ${voteVo.endDate}</div>
									</div>
			
									<div id="vote-body">
										<c:forEach items="${vcvo}" var="vcvo">
											<div class="vote-article">
												<input type="hidden" name="voteCandidateNo" value="${vcvo.no}">
												<input type="hidden" name="voteCandidateName" value="${vcvo.name}">
												<span name="voteCandidateName">${vcvo.name}</span>&nbsp;<input class="vote-target" id="vote-target" name="voteCandidateNo" value="">&nbsp;<span>33% (3표)</span>
											</div>
										</c:forEach>

										<span id="vote-total">총 투표수 : 10표</span>
									</div>

									<div class="vote-submit-btn-area">
										<button type="button" id="vote-submit-btn">재투표</button>
									</div>
								</div>								
								

							</div>
	
						</c:if>

					</div>
				</div>

			</div>
		</div>

		<!-- 버튼 -->
		<div class="btn-area">
			<div id="btn-box">
				<!-- <button type="button" id="post-report-btn" onclick="window.history.back()">목록으로</button> -->
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
	firstNav(['공지 게시판', '자유 게시판', '장터 게시판', '익명 게시판', '칭찬 게시판'], '공지 게시판'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	firstNavLink(['/app/notice/list', '/app/board/free', '/app/board/market', '/app/board/noname', '/app/board/praise',]);


	//투표하기
	function submitVote(){
		const voteSubmitBtn = document.querySelector("#vote-submit-btn");
		const voteArea = document.querySelector(".vote-area");

		$.ajax({
			url : '/app/notice/detail/vote',
			type : 'post',
			data : {
				// voteNoticeNo : '${vo.no}',
				// voteListNo : '${vcvo.no}',
				// memberNo : '${loginMember.no}',
				memberNo : '2',
			},
			success : function(result) {
				console.log(result);

				if (result == 'success') {
					voteArea.innerHTML = '';
					let str = '';
					

				}

			},
			error : function() {

			},
		})

	}

</script>