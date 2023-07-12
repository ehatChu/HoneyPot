<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
	#main-wrapper {
		display: grid;
		grid-template-columns: 6fr 4fr;
	}
	#main-wrapper > div {
		height: 812px;
	
		padding: 30px;
		background-clip: content-box;
		border-radius: 30px;
	}
	textarea[name="infoTextarea"] {
		padding: 10px;
		margin-top: 10px;
		margin-left: 10px;
		border-radius: 10px;
		font-size: 16px;
	}
	input[type="time"] {
		margin:10px;
		padding: 5px;
	}
	input[type="datetime-local"] {
		margin:10px;
		padding: 5px;
	}
	select[name="available"] {
		padding: 10px 5px 10px 20px;
		margin: 10px;
	}
	input[type="number"] {
		padding: 10px 5px 10px 20px;
		width: 108px;
		margin-left: 10px;
	}

	#info-span {
		margin-top: 5px;
		display: flex;
		align-items: center;
	}
	#picture-area {
		width: 400px;
		height: 300px;
		background-color: gray;
	}
	#choice-picture {
		padding: 15px;
	}
	input[type="submit"] {
		height: 50px;
		padding: 10px 30px;
		background-color: #D9D9D9;
		margin-left: 10px;
		border: 0;
		font-size: 20px;
		font-weight: 800;
		background-color: #FAD355;
		
	}
	/* first-area */
	#first-area {
		display: grid;
		grid-template-rows: 2fr 1fr 1fr 1fr;
	}

	/* 파일부분 커스터마이징 */
	.filebox .upload-name {
		display: inline-block;
		height: 40px;
		padding: 0 10px;
		vertical-align: middle;
	}
	.filebox label {
		display: inline-block;
		padding: 10px 20px;
		vertical-align: middle;
		cursor: pointer;
		height: 40px;
		margin-left: 10px;
		background-color: #D9D9D9 ;
	}
	.filebox input[type="file"] {
		position: absolute;
		width: 0;
		height: 0;
		padding: 0;
		overflow: hidden;
		border: 0;
	}
	.filebox button {
		height: 40px;
		padding: 0 10px;
		background-color: #D9D9D9;
		margin-left: 10px;
		border: 0;
		font-size: 16px;

	}
	/* second-area */
	#second-area {
		display: grid;
		grid-template-rows:11fr 1fr;
		height: 812px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
	</nav>
	<main>
		<form action="/app/facilities/library/editInfo" method="post">
			<div id="main-wrapper">
				<div id="first-area">
					<div>
						<h1>안내문구 변경</h1>
						<textarea name="infoTextarea" id="" rows="10" placeholder="휴가나 리모델링으로 인해 사용이 불가능 한 경우 반드시 안내문구를 변경하여 주민들에게 공지해주세요." style="width: 800px; resize: none;""></textarea>
					</div>
					
					<div>
						<h1>오픈/마감 시간 변경</h1>
						<input type="time" name="startTime"> ~ <input type="time" name="endTime" placeholder="마감시간">
					</div>
					<div>
						<h1>이용불가 일시설정</h1>
						<input type="datetime-local" name="startTime"> ~ <input type="datetime-local" name="endTime">

					</div>
					
					<div>
						<h1>최대 인원 수 변경</h1>
						<input type="number" name="maxNum">명<br>
						<span id="info-span">
							<span class="material-symbols-outlined">info</span>
							상태변경 시 해당일시에 예약한 사람들 모두 강제취소해주세요.
						</span>
					</div>
					
				</div>
				<div id="second-area">
					<div>
						<h1>시설사진등록</h1>
						<div>등록된 사진 목록</div>
						<div id="picture-area">
							
						</div>
						<div id="choice-picture">
							<label><input type="checkbox" name="picture" value="1">수영장내부1.png</label> <br>
							<label><input type="checkbox" name="picture" value="2">수영장내부2.png</label> <br>
							<label><input type="checkbox" name="picture" value="3">수영장내부3.png</label> <br>
							<label><input type="checkbox" name="picture" value="4">수영장외관1.png</label> <br>
							<label><input type="checkbox" name="picture" value="5">수영장프론트1.png</label> <br>

						</div>
						<div class="filebox">
							<button>삭제하기</button>
							<label for="file">파일찾기</label> 
   							<input type="file" id="file">
							<input class="upload-name" value="첨부파일" placeholder="첨부파일">
						</div>
					</div>
					<div>
						<input type="submit" value="변경">
					</div>
				</div>
			</div>
		</form>
				
			
			
		
	</main>
</body>
</html>

<script>
	basicSetting(); // 기본 셋팅
	headerName('편의시설 정보변경'); // 현재 페이지 이름
	firstNav(['도서관', '수영장', '헬스장'], '도서관'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['시설소개', '예약하기'], '예약하기'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>