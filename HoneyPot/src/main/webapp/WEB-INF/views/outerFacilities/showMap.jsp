<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<style>
			*::-webkit-scrollbar {
			width: 12px;
			}

			*::-webkit-scrollbar-thumb {
				background: #4A321F;
			}

			*::-webkit-scrollbar-track {
				background: #4a321f23;
			}

			.map_wrap {
				position: relative;
				width: 100%;
				height: 350px;
			}

			.title {
				font-weight: bold;
				display: block;
			}

			.hAddr {
				position: absolute;
				left: 10px;
				top: 10px;
				border-radius: 2px;
				background: #fff;
				background: rgba(255, 255, 255, 0.8);
				z-index: 1;
				padding: 5px;
			}

			.bAddr {
				padding: 5px;
				text-overflow: ellipsis;
				overflow: hidden;
				white-space: nowrap;
			}

			.placeinfo_wrap {
				position: absolute;
				bottom: 28px;
				left: -150px;
				width: 300px;
			}

			.placeinfo {
				position: relative;
				width: 100%;
				border-radius: 6px;
				border: 1px solid #ccc;
				border-bottom: 2px solid #ddd;
				padding-bottom: 10px;
				background: #fff;
			}

			.placeinfo:nth-of-type(n) {
				border: 0;
				box-shadow: 0px 1px 2px #888;
			}

			.placeinfo_wrap .after {
				content: '';
				position: relative;
				margin-left: -12px;
				left: 50%;
				width: 22px;
				height: 12px;
				background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
			}

			.placeinfo a,
			.placeinfo a:hover,
			.placeinfo a:active {
				color: #fff;
				text-decoration: none;
			}

			.placeinfo a,
			.placeinfo span {
				display: block;
				text-overflow: ellipsis;
				overflow: hidden;
				white-space: nowrap;
			}

			.placeinfo span {
				margin: 5px 5px 0 5px;
				cursor: default;
				font-size: 13px;
			}

			.placeinfo .title {
				font-weight: bold;
				font-size: 14px;
				border-radius: 6px 6px 0 0;
				margin: -1px -1px 0 -1px;
				padding: 10px;
				color: #fff;
				background: #d95050;
				background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
			}

			.placeinfo .tel {
				color: #0f7833;
			}

			.placeinfo .jibun {
				color: #999;
				font-size: 11px;
				margin-top: 0;
			}

			
			#modal {
				z-index: 10000;
				height: 500px;
				width: 1200px;
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
				top: 0;
				left: 0;
				bottom: 0;
				right: 0;
				background-color: rgba(172, 172, 172, 0.491);
			}

			/* 오른쪽에 나가기버튼 */
			.quit-btn {
				float: right;
			}

			.content {
				display: grid;
				grid-template-columns: 0.7fr 1fr;
			}

			#store-name {
				font-size: 25px;
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
				margin-right: 10px;
			}

			#store-kind {
				margin-top: 5px;
			}

			#facility-info-area {
				padding: 10px;
			}

			.review-profile-area {
				display: flex;
				justify-content: center;
				align-items: baseline;
			}

			.review-profile-area>div {
				margin-right: 3px;
				width: 30px;
				height: 20px;
				border-radius: 70%;
			}

			.review {
				margin-top: 20px;
				display: grid;
				grid-template-columns: 1fr 9fr;
			}

			.font-color-gray {
				color: #7D7D7D;
				font-weight: 300;
			}

			#review-box {
				margin-top: 20px;
				overflow: auto;
				height: 350px;
			}

			.star-big-size {
				font-size: 50px;
			}

			#facility-img-area {
				margin-top: 40px;
				font-size: 20px;
				padding-left: 15px;
				padding-right: 15px;
			}

			.font-bold {
				font-weight: 800;
			}

			#review-text {
				margin-top: 10px;
				resize: none;
				font-size: 20px;
				background-color: #ECECEC;
				border: none;
				padding: 28px;
				border-radius: 20px;
				outline: none;
				height: 250px;
			}

			.review-content {
				outline: none;
				box-sizing: border-box;
				resize: none;
				width: 400px;
				height: 50px;
				font-family: 'Noto Sans KR';
				font-size: 16px;
				border: none;
				font-weight: 300;
			}

			#map>div>div div {
				font-size: 14px;
			}
		</style>
	</head>

	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav>

			</nav>

			<main>
				<div class="map_wrap">
					<div id="map" style="width:1560px;height:892px;"></div>
				</div>
			</main>
	</body>

	</html>
	<script>
		basicSetting(); // 기본 셋팅
		headerName('주변시설평가'); // 현재 페이지 이름
	</script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6793ff7b973d605c93d751f8288336a5&libraries=services"></script>
	<script>
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({ zIndex: 1 }),
			contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
			markers = [], // 마커를 담을 배열입니다
			currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center: new kakao.maps.LatLng(37.4991586565927, 127.0327786585211), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		contentNode.className = 'placeinfo_wrap';

		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);

		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
			if (target.addEventListener) {
				target.addEventListener(type, callback);
			} else {
				target.attachEvent('on' + type, callback);
			}
		}


		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function (result, status) {
				if (status === kakao.maps.services.Status.OK) {
					ps.keywordSearch(result[0].address.address_name, placesSearchCB, { useMapBounds: true });
				}
			});
		});

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				displayPlaceInfo(data[0]);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
			} else if (status === kakao.maps.services.Status.ERROR) {
				// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
			}
		}

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 리뷰 작성
		function writeReview(addressName) {
			const content = document.querySelector("textarea[name=review-content]");

			$.ajax({
				url: '/app/around/write',
				type: 'get',
				data: {
					"addressName": addressName,
					"content": content.value,
					"score": submitScore
				},
				success: function (data) {
					if (data == 'success') {
						alert("리뷰 등록 완료");
						location.reload();
					} else {
						alert("리뷰 등록 실패");
					}
				},
				error: function () {
					alert("리뷰 등록 오류");
				}
			});
		}

		// 업체 등록
		function enrollFacility(place) {
			$.ajax({
				url: '/app/around/enroll',
				type: 'get',
				data: {
					"placeName": place.place_name,
					"addressName": place.address_name,
					"roadAddressName": place.road_address_name,
					"categoryGroupName": place.category_group_name,
					"phone": place.phone,
				},
				success: function (data) {
					if (data == 'success') {
						console.log("시설 등록 완료");
					} else {
						console.log("시설 등록 실패");
					}
				},
				error: function () {
					console.log("이미 등록된 시설");
				}
			});
		}

		// 모달 닫기
		function closeModal() {
			const modal = document.querySelector("#modal");
			modal.classList.add("hidden");
			map.setZoomable(true);
		}

		// scoreStar
		let submitScore = 5;
		function scoreStar(score) {
			submitScore = score;
			for (let i = 1; i <= score; i++) {
				const scoreStar = document.querySelector("#scoreStar" + (i));
				scoreStar.innerHTML = '<i class="fa-solid fa-star" style="color: #ffc800;"></i>';
			}

			for (let i = score; i < 5; i++) {
				const scoreStar = document.querySelector("#scoreStar" + (i + 1));
				scoreStar.innerHTML = '<i class="fa-solid fa-star" style="color: #ababab;"></i>';
			}
		}


		// 클릭한데 마커 생성
		function displayPlaceInfo(place) {
			var coords = new kakao.maps.LatLng(place.y, place.x);

			var imageSrc = '/app/resources/main/image_12.png', // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(170, 100), // 마커이미지의 크기입니다
			imageOption = {offset: new kakao.maps.Point(100, 70)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map: map,
				position: coords,
				image: markerImage,
				clickable: true
			});

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				position: coords,
				content: place.place_name
			});
			infowindow.open(map, marker);

			kakao.maps.event.addListener(marker, 'click', function () {
			var content = '<div id="modal" class="modal-overlay"><div class="content">'
							+ '<div id="facility-img-area">리뷰를 작성해주세요! <br>'
							+ '<span class="font-bold">' + place.place_name + '</span>에 대한 평점과 내용을 솔직하게 남겨주세요.'
							+ '<div class="star-big-size"><span id="scoreStar1" onclick="scoreStar(1)"><i class="fa-solid fa-star" style="color: #ffc800;"></i></span><span id="scoreStar2" onclick="scoreStar(2)"><i class="fa-solid fa-star" style="color: #ffc800;"></i></span><span id="scoreStar3" onclick="scoreStar(3)"><i class="fa-solid fa-star" style="color: #ffc800;"></i></span><span id="scoreStar4" onclick="scoreStar(4)"><i class="fa-solid fa-star" style="color: #ffc800;"></i></span><span id="scoreStar5" onclick="scoreStar(5)"><i class="fa-solid fa-star" style="color: #ffc800;"></i></span></div>'
							+ '<textarea maxlength="50" name="review-content" id="review-text" cols="50" rows="20"></textarea>'
							+ '<button onclick="writeReview(\'' + place.address_name + '\');" class="right-btn">리뷰 남기기</button></div>'
							+ '<div id="facility-info-area"><div id="store-info-area">'
							+ '<span id="store-name">' + place.place_name + '</span> <span id="total-star">' + "<i class=\"fa-solid fa-star\" style=\"color: #ababab;\"></i>".repeat(5)
							+ '</span><i onclick="closeModal();" class="fa-solid fa-xmark fa-3x quit-btn" style="color: #000000;"></i></div>'
							+ '<div id="store-kind">' + place.road_address_name + '&nbsp;(' + place.address_name + ')</div>'
							+ '<div id="map-btn-area"><span><span id="phone-num">' + place.phone + '</span></span></div>'
							+ '<div id ="review-box" style="font-size: 32px; font-weight: bold;">등록된 리뷰가 없습니다</div></div></div></div>';
				contentNode.innerHTML = content;
				placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
				placeOverlay.setMap(map);
				map.setZoomable(false);
				map.setLevel(3);
				var newCoords = new kakao.maps.LatLng(coords.Ma + 0.002, coords.La + 0.005);
    			map.panTo(newCoords);
				enrollFacility(place);
			});
		}
	</script>

	<!-- 디비 데이터 조회 -->
	<c:forEach items="${aroundList}" var="vo" varStatus="loop">
		<script>
			geocoder.addressSearch('${vo.addressName}', function (result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					var imageSrc = '/app/resources/member/profile/basic.png', // 마커이미지의 주소입니다    
					imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
					imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
					
					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords,
						image: markerImage,
						clickable: true
					});

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
						position: coords,
						content: '${vo.placeName}'
					});
					infowindow.open(map, marker);

					kakao.maps.event.addListener(marker, 'click', function () {
						var content = '<div id="modal" class="modal-overlay"><div class="content">'
							+ '<div id="facility-img-area">리뷰를 작성해주세요! <br>'
							+ '<span class="font-bold">${vo.placeName}</span>에 대한 평점과 내용을 솔직하게 남겨주세요.'
							+ '<div class="star-big-size"><span id="scoreStar1" onclick="scoreStar(1)"><i class="fa-solid fa-star" style="color: #ffc800;"></i></span><span id="scoreStar2" onclick="scoreStar(2)"><i class="fa-solid fa-star" style="color: #ffc800;"></i></span><span id="scoreStar3" onclick="scoreStar(3)"><i class="fa-solid fa-star" style="color: #ffc800;"></i></span><span id="scoreStar4" onclick="scoreStar(4)"><i class="fa-solid fa-star" style="color: #ffc800;"></i></span><span id="scoreStar5" onclick="scoreStar(5)"><i class="fa-solid fa-star" style="color: #ffc800;"></i></span></div>'
							+ '<textarea name="review-content" id="review-text" cols="50" rows="20"></textarea>'
							+ '<button onclick="writeReview(\'${vo.addressName}\');" class="right-btn">리뷰 남기기</button></div>'
							+ '<div id="facility-info-area"><div id="store-info-area">'
							+ '<span id="store-name">${vo.placeName}</span> <span id="total-star">${"<i class=\"fa-solid fa-star\" style=\"color: #ffc800;\"></i>".repeat(scoreList[loop.index].score.substring(0, 1))}'
							+ '${"<i class=\"fa-solid fa-star\" style=\"color: #ababab;\"></i>".repeat(5 - scoreList[loop.index].score.substring(0, 1))}'
							+ '</span><i onclick="closeModal();" class="fa-solid fa-xmark fa-3x quit-btn" style="color: #000000;"></i></div>'
							+ '<div id="store-kind">${vo.roadAddressName} &nbsp;(${vo.addressName})</div>'
							+ '<div id="map-btn-area"><span><span id="phone-num">${vo.phone}</span></span></div>'
							+ '<div id="review-box">';

						<c:forEach items="${evaluationList}" var="evalVo">
							if('${vo.addressName == evalVo.addressName}' == 'true') {
								content	+= '<div class="review"><div class="review-profile-area">${evalVo.name.substring(0, 1)}**<div></div></div>'
									+ '<div class="review-area"><div class="total-star">${"<i class=\"fa-solid fa-star\" style=\"color: #ffc800;\"></i>".repeat(evalVo.score)}${"<i class=\"fa-solid fa-star\" style=\"color: #ababab;\"></i>".repeat(5 - evalVo.score)}</div>'
									+ '<div class="id-date-report font-color-gray"><span class="review-id"></span><span class="review-date"></span><span class="review-report"></span></div>'
									+ '<textarea readonly class="review-content">${evalVo.content}</textarea></div></div>'
							}
						</c:forEach>
						
						content += '</div></div></div></div>';
						contentNode.innerHTML = content;
						placeOverlay.setPosition(new kakao.maps.LatLng(result[0].y, result[0].x));
						placeOverlay.setMap(map);
						map.setZoomable(false);
						map.setLevel(3);
						var newCoords = new kakao.maps.LatLng(coords.Ma + 0.002, coords.La + 0.005);
    					map.panTo(newCoords);
					});
				}
			});
		</script>
	</c:forEach>