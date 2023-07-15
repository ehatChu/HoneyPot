<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6793ff7b973d605c93d751f8288336a5"></script>
<style type="text/css">
	* {
		padding: 0px;
		margin: 0px;
	}
	.custom-context-menu {
		position: absolute;
		z-index: 100000;
		box-sizing: border-box;
		border-radius: 10px;
		background-color: #ffffffc6;
		padding: 20px;
		cursor: pointer;
	}
	main {
		position: relative;
	}

	#modal {
		position: fixed;
		z-index: 100;
		/* Map의 중앙에 위치시키기 */
	
		top: 60px;
		left: 455px;

		height: 855px;
		width: 1366px;

		background-color: white;
		border-radius: 10px;

	}

	.visible {
		display: block;
	}

	.hidden {
		display: none;
	}

	.main-box {
		position: fixed;
		top: 0;; left: 0; bottom: 0; right: 0;
		background-color: rgba(172, 172, 172, 0.491);
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<nav>
		
	</nav>
	
	
	
	<main>
		<div id="wrap">
			<div id="map" style="width:1560px;height:892px;"></div>
		</div>
		<!-- 평가등록만들기 -->
		<div id="dochi_context_menu" class="custom-context-menu" style="display: none;">평가등록하기</div>

		<div id="modal" class="hidden modal-overlay">
			<h2>모달</h2>
			<i class="fa-solid fa-xmark fa-3x quit-btn" style="color: #000000;"></i>
			<div class="content">
				여기에 컨텐츠를 입력해주세요.
			</div>
		</div>
	</main>

</body>
</html>
<script type="text/javascript">
	basicSetting(); // 기본 셋팅
	headerName('주변시설평가'); // 현재 페이지 이름
</script>
<script>

	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	// 지도 좌클릭시 작은..버튼뜨게하기
	function handlerCreateContextMenu(event){
		event.preventDefault();

		const ctxMenu = document.querySelector('#dochi_context_menu');
		ctxMenu.style.display = 'block';

		ctxMenu.style.top = event.pageY+'px';
		ctxMenu.style.left = event.pageX+'px';
	}

	function handlerClearContextMenu(event){

		const ctxMenu = document.querySelector('#dochi_context_menu');
		ctxMenu.style.display = 'none';

		ctxMenu.style.top = null;
		ctxMenu.style.left = null;
	}
	document.addEventListener('contextmenu',handlerCreateContextMenu,false);
	document.addEventListener('click',handlerClearContextMenu,false);
	

	// const loremIpsum = document.getElementById("lorem-ipsum")
	// fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
	// 	.then(response => response.text())
	// 	.then(result => loremIpsum.innerHTML = result)

	//모달창띄우기
	const modal = document.querySelector("#modal");
	const openBtn = document.querySelector(".custom-context-menu");

	//이벤트걸기(div를 누르면 발동하게)
	openBtn.addEventListener("click",showModal);


	//함수 
	let main = document.querySelector("main");
	function showModal(){
		modal.style.display="block";
		main.classList.add('main-box');
	}

	//모달영역의 X버튼 누르면 꺼지게 만들기
	const quitBtn = document.querySelector(".quit-btn");
	quitBtn.addEventListener("click",function(){
		modal.style.display="none";
		main.classList.remove('main-box');
	});
	

</script>