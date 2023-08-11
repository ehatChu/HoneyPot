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
		height: 750px;
	
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

	
	/* second-area */
	#second-area {
		display: grid;
		grid-template-rows:8fr 3fr;
		height: 750px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
		<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
	</nav>
	<main>
		
		<div id="main-wrapper">
			<div id="first-area">
				<img src="/app/resources/innerFac/${imgVoList.get(0).changeName}" id="imgUpload" style="height: 700px; width: 800px;" alt="">
			</div> 

			<div id="second-area">
			<form action="/app/admin/innerFac/deleteImg" method="post">
				
				<div>
					<h1>시설사진삭제</h1>
					<div>등록된 사진 목록</div>
					<input type="hidden" value="2" name="facNo">
					<c:forEach items="${imgVoList}" var="img">
						<div id="choice-picture">
							<label id="${img.no}" class="label"><input type="hidden" class="change-name" value="${img.changeName}"><input type="checkbox" name="no" value="${img.no}">${img.originName}</label><br>
						</div>
					</c:forEach>
					<input type="submit" value="삭제하기">
				</div>

			</form>
							
			<form action="/app/admin/innerFac/regiImg" method="post" enctype="multipart/form-data">
				<div class="filebox">
					<h1>시설사진등록</h1>
					<input type="hidden" value="2" name="facNo">
					<input type="file" id="imgFiles" name="fList" multiple>
				
					<input type="submit" value="등록하기">
					
				</div>
			</form>			
		</div>
			
	
				
		
				
			
			
		
	</main>
</body>
</html>

<script>
	basicSetting(); // 기본 셋팅
	headerName('단지관리'); // 현재 페이지 이름
	firstNav(['관리비', '편의시설관리', '조식관리'],'편의시설관리'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['도서관','수영장','헬스장','골프장','예약자통합조회'], '도서관'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
	firstNavLink(['/app/fee/admin','/app/admin/innerFac/editInfo?facNo=1','/app/meal/ameal']);
	secondNavLink(['/app/admin/innerFac/editInfo?facNo=1','/app/admin/innerFac/editInfo?facNo=2','/app/admin/innerFac/editInfo?facNo=3','/app/admin/innerFac/editInfo?facNo=4','/app/admin/innerFac/reservation?p=1'],);
</script>

<script>
	//라벨을 누르면
	const label = document.querySelectorAll(".label");
	for(let lb of label){
		lb.addEventListener("click",function(){
			const changeNameInput = lb.querySelector(".change-name");
			const value = changeNameInput.value;

			//changeName추출해옴
			console.log(value);

			//img태그의 src를 변경하기
			const imgUpload = document.querySelector("#imgUpload");
			imgUpload.src = "/app/resources/innerFac/"+value;
		})
	}

</script>