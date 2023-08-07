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
		<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
	</nav>
	<main>
		<form action="/app/admin/innerFac/modifyImg?facNo=1" method="post">
			<div id="main-wrapper">
				<div id="first-area">
					<img src="/app/resources/innerFac/${imgVoList.get(0).originName}" style="height: 700px; width: 800px;" alt="">
				</div> 
				
				<form action="">
					<div id="second-area">
						<div>
							<h1>시설사진등록</h1>
							<div>등록된 사진 목록</div>
							
							<c:forEach items="${imgVoList}" var="img">
								<div id="choice-picture">
									<label><input type="checkbox" name="picture" value="${img.no}">${img.originName}</label><br>
								</div>
							</c:forEach>
							
							
							<div class="filebox">
								<button>삭제하기</button> 
								<input type="file" id="file">
								
							</div>
						</div>
					
						
					</div>
				</form>
				
				
			</div>
			
		</form>
				
		
				
			
			
		
	</main>
</body>
</html>

<script>
	basicSetting(); // 기본 셋팅
	headerName('도서관 사진변경'); // 현재 페이지 이름
	firstNav(['도서관', '수영장', '헬스장','골프장','예약자통합관리'], '도서관'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['정보수정', '이용불가','시설사진'], '시설사진'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
	// firstNavLink(['/app/facilities/library/reserve','/app/facilities/pool/reserve','/app/facilities/health/reserve']);
	// secondNavLink(['/app/innerFac/info?no=1','/app/facilities/library/reserve'],);
</script>

<script>
	//파일 업로드를 ajax로 바로바로 업로드하면 바로 db에 insert되게 하기 //이미지 미리보기 지원X
	
	//로드되면
	const fileTag = document.querySelector("#file");

	// const fr = new FileReader();
	// fr.readAsDataURL(fileTag.files[0]);
	
	// fr.addEventListener("load",function(event){
	// 	preview.src = event.target.result;
	// 	preview.width ="100%"
	// 	preview.height ="100%"
	// 	// Thumnail.style.visibility='hidden';
	// });
	fileTag.addEventListener('change',function(){
		
		const fr = new FileReader();
		fr.readAsDataURL(fileTag.files[0]);
		fr.addEventListener("load",function(event){
			$.ajax({
				url : '/app/admin/innerFac/modifyImg',
				type : "post",
				processData : false,
				contentType: false,
				data : {
					file : ,
					facNo : "1",
				},
				success : function(){
					console.log("성공!DB에 이미지넣기 성공!");
				},
				error : function(e){
					console.log(e);
					console.log("통신쉴패~!");
				}

			});
	

		});
	})


	


</script>