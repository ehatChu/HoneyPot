<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6793ff7b973d605c93d751f8288336a5"></script>
<style type="text/css">
	.custom-context-menu {
		position: absolute;
		z-index: 100000;
		box-sizing: border-box;
		border-radius: 10px;
		background-color: #ffffffc6;
		padding: 20px;
		cursor: pointer;
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
		<!-- 검색창만들기 -->
		<div id="dochi_context_menu" class="custom-context-menu" style="display: none;">평가등록하기</div>

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
	
</script>