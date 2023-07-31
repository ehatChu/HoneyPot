<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	

	#modal {
		position: fixed;
		z-index: 100;
		/* Map의 중앙에 위치시키기 */
	
		top: 60px;
		left: 455px;

		/* 모델창의 크기 */
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
		top: 0; left: 0; bottom: 0; right: 0;
		background-color: rgba(172, 172, 172, 0.491);
	}

	/* 오른쪽에 나가기버튼 */
	.quit-btn {
		float: right;
		/* border: 1px solid red; */
	}

	.content {
		display: grid;
		grid-template-columns: 0.7fr 1fr;
		/* border: 2px solid mediumspringgreen; */
		height: 2000px;
		
	}

	.content > div {
		/* border: 2px solid black; */
	}
	#store-name {
		font-size: 35px;
		font-weight: 600;
	}

	#total-star {
		font-size: 35px;
		font-weight: 600;
	}

	/* 리뷰남기기버튼 */
	.right-btn {
		float: right;
		background-color: #FFD601;
		border-radius: 5px;
		border: none;
		padding: 10px;
		/* 오른쪽마진줘서 창과 크기맞추기 */
		margin-right: 10px;
	}
	#store-kind {
		margin-top: 5px;
	}
	#facility-info-area > div{
		/* border: 1px solid blue; */
	}

	#facility-info-area {
		padding: 10px;
	}

	.review-profile-area {
		display: flex;
		justify-content: center;
	}
	.review-profile-area > div {
		/* 좌우 균형을 맞춰 프로필을 가운데로 정렬 */
		margin-right: 3px;

		margin-top: 5px;
		width: 50px;
		height: 50px;
		border-radius: 70%;
		background-color: lightgray;
	}
	.review {
		/* 리뷰와 리뷰사이 거리 */
		margin-top: 20px;
		display: grid;
		grid-template-columns: 1fr 9fr;
	}

	.review > div{
		/* border: 1px solid violet; */
	}
	.font-color-gray {
		color: #7D7D7D;
		font-weight: 300;
	} 
	#review-box {
		margin-top: 20px;
		overflow: auto;
		height: 685px;
	}
	.star-big-size {
		font-size: 50px;
	}

	/* 모달창 맨위와 첫번재페이지의 간격 */
	#facility-img-area {
		margin-top: 40px;
		font-size: 25px;
		/* 리뷰남기기구역 */
		padding-left: 15px;
		padding-right: 15px;
	}
	.font-bold {
		font-weight: 800;
	}

	/* 리뷰남기기 텍스트 */
	#review-text {
		/* 마진줘서 별과의 간격조정 */
		margin-top: 10px;
		resize: none;
		font-size: 20px;
		background-color: #ECECEC;
		border: none;
		padding: 28px;
		border-radius: 20px;
		outline: none;
	}

	/* 리뷰보기 텍스트 */
	.review-content {
		/* 포커스시 생기는 아웃라인 없애기 */
		outline: none;
		box-sizing: border-box;
		resize: none;
		/* 리뷰볼때 좌우사이즈 */
		width: 600px;
		font-family: 'Noto Sans KR';
		font-size: 16px;
		border: none;
		font-weight: 300;
	}
	.option > div{
		position: fixed;
		top: 60px;
		left: 370px;
		z-index: 100000;
	}

	/* 지도관련 */
	#map {
		position: fixed;
		top: 45px;
		left: 360px;
	}

	#placesList {
		position: fixed;
		top: 80px;
		left: 360px;
		z-index: 10000;
	}

	/* 지도 검색 결과 목록 */
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;} 
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;} 
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;} 
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<nav>
		
	</nav>
	
	
	
	<main>

		<div class="map_wrap">
			<div id="map" style="width:1560px;height:892px;"></div>
		
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							키워드 : <input type="text" value="세화빌라트" id="keyword" size="15"> 
							<button type="submit">검색하기</button> 
						</form>
					</div>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>
		<!-- <div id="wrap">
			<div id="map" style="width:1560px;height:892px;"></div>
		</div>

		<div class="search-area">
				
			<form onsubmit="searchPlaces(); return false;">
				키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
				<button type="submit">검색하기</button> 
			</form>
			
		</div> -->

		<!-- 평가등록만들기 -->
		<div id="dochi_context_menu" class="custom-context-menu" style="display: none;">평가등록하기</div>

		<div id="modal" class="hidden modal-overlay">
			
			
			<div class="content">
				<div id="facility-img-area">
					아직 리뷰를 남기지 않으셨네요. <br>
					<span class="font-bold">뮈향</span>에 대한 평점과 내용을 솔직하게 남겨주세요.
					<div class="star-big-size">⭐⭐⭐⭐⭐</div>
					<textarea name="review-content" id="review-text" cols="50" rows="20"></textarea>
					<button class="right-btn">리뷰남기기</button>
				</div>

				<div id="facility-info-area">
					<div id="store-info-area">
						<span id="store-name">뮈향</span> <span id="total-star">⭐⭐⭐⭐⭐</span><i class="fa-solid fa-xmark fa-3x quit-btn" style="color: #000000;"></i>
					</div>
					<div id="store-kind">시설소개 : <span>분식집</span></div>
					<div id="map-btn-area">
						<span>연락처 : <span id="phone-num">010-2311-2341</span></span>
					</div>


					<div id="review-box">
						<!-- forEach로 개수만큼 불러오기 -->
						<c:forEach var="i" begin="1" end="5">
							<div class="review">
								<div class="review-profile-area"><div></div></div>
								<div class="review-area">
									<div class="total-star">⭐⭐⭐⭐⭐</div>
									<div class="id-date-report font-color-gray">
										<span class="review-id">ehatchu0527</span> | <span class="review-date">20.07.12</span>
										| <span class="review-report">신고</span> | <span class="review-modify">수정</span> | <span class="review-delete">삭제</span> 
									</div>
									
									<textarea class="review-content">리뷰이벤트한다고 했는데 왜 어째서 제게 마약콘치즈를 주시지 않으신건지 해명부탁드립니다 
저번에 리뷰이벤트해서 리뷰잘적은거 같은데 혹시 제가 리뷰한다해놓고 안적었나요? 
일단 오늘먹은거 리뷰하자면 훌륭했어요. 맛있는 피자였습니다. 
치즈싫어하시는분들도 치즈는 잘 안느껴져서 .. 전 좋았어요. 
다만 배달비가 너무 쎄네요 요즘시대에 5천원은 선넘은거아닌가요?</textarea>
									
								</div>
							</div>
						</c:forEach>
					</div>
					
					
					
				

				</div>
				

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
	

	function handlerClearContextMenu(event){
		//안보이게하기
		const ctxMenu = document.querySelector('#dochi_context_menu');
		ctxMenu.style.display = 'none';

		//안보이게하기
		ctxMenu.style.top = null;
		ctxMenu.style.left = null;
	}
	// document.addEventListener('contextmenu',handlerCreateContextMenu,false);
	document.addEventListener('click',handlerClearContextMenu,false);
	


	//모달창띄우기
	const modal = document.querySelector("#modal");
	const openBtn = document.querySelector(".custom-context-menu");

	//이벤트걸기(div를 누르면 발동하게)
	openBtn.addEventListener("click",showModal);
	openBtn.addEventListener("click",resize);



	//함수 
	let main = document.querySelector("main");
	function showModal(){
		modal.style.display="block";
		//뒤쪽에 백그라운드 색상 회색으로 변하는 효과
		main.classList.add('main-box');
	}

	//모달영역의 X버튼 누르면 꺼지게 만들기
	const quitBtn = document.querySelector(".quit-btn");
	quitBtn.addEventListener("click",function(){
		modal.style.display="none";
		main.classList.remove('main-box');
	});
	
	//textarea길이를 알맞게 조절
	function resize() {
        let textarea = document.querySelectorAll(".review-content");
		console.log("리사이즈 실행됨, 온로드에서");
		for(let ta of textarea){
			ta.style.height = "0px";

			let scrollHeight = ta.scrollHeight;
			let style = window.getComputedStyle(ta);
			let borderTop = parseInt(style.borderTop);
			let borderBottom = parseInt(style.borderBottom);

			ta.style.height = (scrollHeight + borderTop + borderBottom)+"px";
		}
       
    }
    
   
	window.onresize = resize;
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6793ff7b973d605c93d751f8288336a5&libraries=services"></script>
<script>
	// 마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

		var keyword = document.getElementById('keyword').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch( keyword, placesSearchCB); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		console.log("data : "+data+",status : "+status+",pagination:"+pagination);
		/*
		data : 검색결과나오는 데이터들
		status : 검색결과 상태
		paination : #id가 page인 구역도 있고
					검색결과 나온 정보중 하나로 추정됨
		*/
		if (status === kakao.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces(data);

			// 페이지 번호를 표출합니다
			displayPagination(pagination);

		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === kakao.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	/*검색결과로 나온 데이터들로 목록과 마커를 생성함.*/
	function displayPlaces(places) {
		/*id가 리스트인 요소를 가져와서 그 요소에 ...*/
		var listEl = document.getElementById('placesList'), 
		menuEl = document.getElementById('menu_wrap'),
		fragment = document.createDocumentFragment(), 
		bounds = new kakao.maps.LatLngBounds(), 
		listStr = '';
		
		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();
		
		for ( var i=0; i<places.length; i++ ) {

			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
				marker = addMarker(placePosition, i), 
				itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);

			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다
			(function(marker, title) {
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});

				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

				itemEl.onmouseover =  function () {
					displayInfowindow(marker, title);
				};

				itemEl.onmouseout =  function () {
					infowindow.close();
				};
			})(marker, places[i].place_name);

			fragment.appendChild(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

		var el = document.createElement('li'),
		itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
					'<div class="info">' +
					'   <h5>' + places.place_name + '</h5>';

		if (places.road_address_name) {
			itemStr += '    <span>' + places.road_address_name + '</span>' +
						'   <span class="jibun gray">' +  places.address_name  + '</span>';
		} else {
			itemStr += '    <span>' +  places.address_name  + '</span>'; 
		}
					
		itemStr += '  <span class="tel">' + places.phone  + '</span>' +
					'</div>';           

		el.innerHTML = itemStr;
		el.className = 'item';

		return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
			imgOptions =  {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			},
			markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
				marker = new kakao.maps.Marker({
				position: position, // 마커의 위치
				image: markerImage 
			});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for ( var i = 0; i < markers.length; i++ ) {
			markers[i].setMap(null);
		}   
		markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
		var paginationEl = document.getElementById('pagination'),
			fragment = document.createDocumentFragment(),
			i; 

		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild (paginationEl.lastChild);
		}

		for (i=1; i<=pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i===pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
		var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

		infowindow.setContent(content);
		infowindow.open(map, marker);
	}

	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
		while (el.hasChildNodes()) {
			el.removeChild (el.lastChild);
		}
	}

	//클릭한 곳의 위도 경도를 가져오기 
	kakao.maps.event.addListener(map,"rightclick",function(mouseEvent){
		// 클릭한 위도, 경도 정보를 가져옵니다 
		var latlng = mouseEvent.latLng;
		//console.log(latlng.La); latlng.Ma
		var markerPosition  = new kakao.maps.LatLng(latlng.La, latlng.Ma);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});
		
		//여기에 우클릭시 그게뜨게하고 그걸누르면 마커가 생성이 되도록하게하기
		//원래 우클릭시 나오던 효과지우기
		event.preventDefault();

		//모달같은거 띄우기
		const ctxMenu = document.querySelector('#dochi_context_menu');
		ctxMenu.style.display = 'block';

		//위에 것의 위치정하기
		ctxMenu.style.top = event.pageY+'px';
		ctxMenu.style.left = event.pageX+'px';

		

		marker.setMap(map);
	});
</script>