<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<style>
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

			#centerAddr {
				display: block;
				margin-top: 2px;
				font-weight: normal;
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
		</style>
	</head>

	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav>

			</nav>

			<main>
				<div class="map_wrap">
					<div id="map" style="width:1560px;height:892px;"></div>
					<div class="hAddr">
						<span class="title">지도중심기준 행정동 주소정보</span>
						<span id="centerAddr"></span>
					</div>
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

		// 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		var infowindow = new kakao.maps.InfoWindow({ zindex: 1 });

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

		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo(place) {
			var content = '<div class="placeinfo">' +
				'<a class="title" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';
			if (place.road_address_name) {
				content += '<span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
					'<span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
			} else {
				content += '<span title="' + place.address_name + '">' + place.address_name + '</span>';
			}
			content += '<span class="tel">' + place.phone + '&nbsp;&nbsp;&nbsp; <button onclick="writeReview(\'' + place.address_name +'\');">리뷰 작성</button></span></span>'
				+ '</div>'
				+ '<div class="after"></div>';
			contentNode.innerHTML = content;
			placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
			placeOverlay.setMap(map);
			enrollFacility(place);
		}

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function () {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}

		// 리뷰 작성
		function writeReview(addressName) {
			console.log(addressName);
			const content = prompt('리뷰를 작성해주세요');
			const score = prompt('점수를 작성해주세요(1~5)');
			$.ajax({
				url: '/app/around/write',
				type: 'get',
				data: {
					"addressName": addressName,
					"content": content,
					"score": score
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
	</script>

	<c:forEach items="${aroundList}" var="vo">
		<script>
			geocoder.addressSearch('${vo.addressName}', function (result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords,
						clickable: true
					});

					kakao.maps.event.addListener(marker, 'click', function () {
						var content = '<div class="placeinfo">' +
							'<a class="title" target="_blank" title="${vo.placeName}">${vo.placeName}</a>';
						if (true) {
							content += '<span title="${vo.roadAddressName}">${vo.roadAddressName}</span>' +
								'<span class="jibun" title="${vo.addressName}">(지번 : ${vo.addressName})</span>';
						} else {
							content += '<span title="${vo.addressName}">${vo.addressName}</span>';
						}
						content += '<span class="tel">${vo.phone}&nbsp;&nbsp;&nbsp; <button onclick="writeReview(\'${vo.addressName}\');">리뷰 작성</button></span>';

						<c:forEach items="${evaluationList}" var="evalVo">
							if('${vo.addressName == evalVo.addressName}' == 'true') {
								content += '<span>${evalVo.name.substring(0, 1)}** : ${evalVo.content} (${evalVo.score}점)</span>';
							}
						</c:forEach>

						content += '</div>'
							+ '<div class="after"></div>';
						contentNode.innerHTML = content;
						placeOverlay.setPosition(new kakao.maps.LatLng(result[0].y, result[0].x));
						placeOverlay.setMap(map);
					});
				}
			});
		</script>
	</c:forEach>