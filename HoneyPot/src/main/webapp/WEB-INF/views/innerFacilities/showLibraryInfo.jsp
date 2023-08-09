<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	#innerFacWrap {
		padding: 30px;
		display: flex;
	}
	#innerFac-img-area {
		width: 998px;
	}

	#info-content {
		width: 500px;
		background-color: #F5F5F5;
		border: none;
		font-size: 18px;
		outline: none;
		resize: none;
	}
	#big-title {
		font-size: 50px;
		font-weight: 600;
	}
	#innerFac-info-detail {
		font-size: 18px;
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
		<div id="innerFacWrap">
			<div id="innerFac-text-area">
				<div id="big-title">푸리미엄 도서실</div>
				<textarea id="info-content" readonly>${fvo.content}</textarea>
				<div id="innerFac-info-detail">
					수용가능인원 : <span>${fvo.maxNum}</span>명 <br>
					오픈시간 : <span>${fvo.openTime}</span> <br>
					마감시간 : <span>${fvo.closeTime}</span> <br>
				</div>
			</div>
			<div id="innerFac-img-area">
				<div id="big-title">시설사진</div>
				<div id="carouselExampleControls" class="carousel slide">
		
					<div class="carousel-inner">
						
						<c:forEach items ="${fimgList}" var="item" varStatus ="loop"> 
							<c:if test="${loop.index == 0}">
								<div class="carousel-item active">
							</c:if>
							<c:if test="${loop.index != 0}">
								<div class="carousel-item">
							</c:if> 
								<img src="/app/resources/innerFac/${item}" class="d-block w-100" style="height: 600px;" alt="${item}">
							</div>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
		
	</main>

</body>
</html>
<script>
	basicSetting(); // 기본 셋팅
   	headerName('편의시설'); // 현재 페이지 이름
	firstNav(['도서관', '수영장', '헬스장' ,'골프장'], '도서관'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
	firstNavLink(['/app/innerFac/info?no=1','/app/innerFac/info?no=2','/app/innerFac/info?no=3','/app/innerFac/info?no=4']);
	secondNavLink(['/app/innerFac/info?no=1','/app/facilities/library/reserve'],);

	resize();
	//textarea길이를 알맞게 조절
	function resize() {
		let ta = document.querySelector("#info-content");
		console.log("리사이즈 실행됨, 온로드에서");

		ta.style.height = "0px";

		let scrollHeight = ta.scrollHeight;
		let style = window.getComputedStyle(ta);
		let borderTop = parseInt(style.borderTop);
		let borderBottom = parseInt(style.borderBottom);

		ta.style.height = (scrollHeight + borderTop + borderBottom)+"px";
		
		
	}

</script>