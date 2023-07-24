<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/app/resources/css/chat/list.css">
	</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav>
				
			</nav>

			<main>
				<!-- 채팅방 친구 초대 모달 영역 -->
				<div class="invite-modal hidden">
					<div class="bg"></div>
					<div class="invite-modalBox">
						<div class="upper-bar">
							<span>친구 초대</span>
							<button class="invite-closeBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
						</div>
						<div class="invite-first-area">
							<div class="search-list">
								<input type="text" id="name">
								<button class="searchBtn">검색</button>
							</div>
							<form action="/app/chat/invite" method="post">
								<div class="friend-list">
									<c:forEach begin="1" end="10">
										<div>
											<img src="/app/resources/profile/profile03sponge.jpg" alt="프로필사진">
											<span>이정민</span>
											<label for="addMember"><input type="checkbox" name="checkMember"></label>
										</div>
									</c:forEach>
								</div>
							</form>
								<div id="inviteBtn"><button>초대</button></div>
							</div>
					</div>
				</div>
				<div id="wrap">
                    <!-- 채팅방 목록 영역 -->
					<div id="left-area">
						<div class="upper-area">
							<span>채팅방 목록</span>
						</div>
						<div class="content-area">
							<div class="icon-area">
								<div class="icon-wrap">
									<button class="moveFollowerList"><i class="fa-solid fa-user-group fa-2x" style="color: #858181;"></i></button>
									<button class="moveChatList"><i class="fa-solid fa-comment fa-2x" ></i></button>
                                    
								</div>
							</div>
							<div class="room-list-area">
								<div class="room-name">
									<img src="/app/resources/profile/profile02ddonge.jpg" alt="프로필사진">
									<span>101동 골프모임 <div class="memberCnt">6</div></span>
								</div>
								<div class="room-member-list">
									<div>
										<button class="inviteMember">
											<div class="invite-area"><i class="fa-solid fa-plus fa-2x"></i></div>
											<span>대화상대 초대</span>
										</button>
									</div>
									<!-- 방장만 강퇴 우클릭 이벤트 보이게  -->
									<div>
										<img src="/app/resources/profile/profile04cheese.jpg" alt="프로필사진">
										<span>홍다빈</span>
									</div>
									<div class="kick-out">
										<img src="/app/resources/profile/profile03sponge.jpg" alt="프로필사진">
										<span>이정민</span>
										<ul class="kick-area">
											<li><a href="#">강퇴</a></li>
										</ul>
									</div>
									<div class="kick-out">
										<img src="/app/resources/profile/profile01daram.png" alt="프로필사진">
										<span>문성빈</span>
										<ul class="kick-area">
											<li><a href="#">강퇴</a></li>
										</ul>
									</div>
									<div class="kick-out">
										<img src="/app/resources/profile/profile02ddonge.jpg" alt="프로필사진">
										<span>김지연</span>
										<ul class="kick-area">
											<li><a href="#">강퇴</a></li>
										</ul>
									</div>
									<div class="kick-out">
										<img src="/app/resources/profile/profile04cheese.jpg" alt="프로필사진">
										<span>주영훈</span>
										<ul class="kick-area">
											<li><a href="#">강퇴</a></li>
										</ul>
									</div>
									<!-- 강퇴 모달 -->
									<div id="kick-modal" style="display: none;">
										<p>이 유저를 강퇴하시겠습니까?</p>
										<div>
											<button id="confirm-btn">확인</button>
											<button id="cancel-btn">취소</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
                    <!-- 채팅 영역 -->
					<div id="chat-area">
                        <div class="room-name-area">
                            <div><span>101동 골프 모임</span><button class="openBtn"><i class="fa-solid fa-pen fa-sm" style="color: #000000;"></i></button></div>
                            
                            <div><button class="quitBtn"><span>나가기</span><i class="fa-solid fa-arrow-right-from-bracket fa-lg" style="color: #000000;"></i></button></div>
                        </div>
                        <div class="chat-content-area">
							<div class="well" id="chatdata">
								<!-- 대화내용 출력 -->
								<!-- <c:forEach items="${conlist}" var="list">
								<div class="well">
								<c:if test="${list.usersdto.uname ne uname}">
									<div class="otehr-content">
										<div class="other-content-info">
												<strong> ${list.usersdto.uname}</strong><br>
										</div>
										<p class="other-content-wrap"> ${list.content}</p> 
										<span class="other-content-date">${list.fdate }</span>
									</div>
								</c:if>
								<c:if test="${list.usersdto.uname eq uname}">
									<div class="mycontent">
										<div class="mycontent-info">
										</div>
										<p class="mycontent-wrap"> ${list.content}</p> 
									</div>
								</c:if>
								</div>
								</c:forEach> -->
							</div>
						</div>
                        <div class="input-area">
                            <textarea name="" id="" placeholder="내용을 입력하세요."></textarea>
                            <button id="sendBtn">보내기</button>
                        </div>
                    </div>
					<!-- 채팅 수정 모달 영역 -->
					<div class="modal hidden">
						<div class="bg"></div>
						<div class="modalBox">
							<div class="upper-bar">
								<span>채팅방 정보 수정</span>
								<button class="closeBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
							</div>
							<form action="/app/chat/edit" method="post" enctype="multipart/form-data">
								<div class="first-area">
									<div class="nameBox">
										채팅방 이름
										<input type="text" id="name" value="${vo.name}">
									</div>
									<div class="picBox">
										채팅방 사진
										<input type="file" name="img" multiple accept=".jpg, .png, .jpeg">
									</div>
									<div id="submitBtn"><input type="submit" value="수정"></div>
								</div>
							</form>
						</div>
					</div>
					<!--ff-->

				</div>
			</main>

	</body>

	</html>

	<script>
		
		// 헤더 함수 실행
		basicSetting();
    	headerName('채팅');

		// 채팅 아이콘 클릭 시 이동
		const followIcon = document.querySelector(".moveFollowerList");
		followIcon.addEventListener("click", function(){
			location.href="/app/chat/followerList";
		})

		// 채팅방 수정 모달 열기
        const openModal = () => {
        document.querySelector(".modal").classList.remove("hidden");
        };

        // 채팅방 수정 모달 닫기
        const closeModal = () => {
        document.querySelector(".modal").classList.add("hidden");
        };

        const openBtn = document.querySelector(".openBtn");
        openBtn.addEventListener("click", openModal);

        // 모달 닫기 버튼에 이벤트 추가
        document.querySelector(".closeBtn").addEventListener("click", closeModal);

        // 모달 배경 클릭 시 모달 닫기
        document.querySelector(".bg").addEventListener("click", closeModal);


		// 채팅멤버 우클릭 시 강퇴 실행 함수
		// 우클릭 이벤트 핸들러
		function handleRightClick(event) {
			// 기본 우클릭 메뉴 방지
			event.preventDefault(); 

			// 해당 kick-out div의 위치 가져오기
			const div = this;
			const rect = div.getBoundingClientRect();
			const divTop = rect.top + window.pageYOffset;
			const divLeft = rect.left + window.pageXOffset;

			// 해당 kick-out div에 속한 kick-area 요소 가져오기
			const kickArea = div.querySelector(".kick-area");

			// span 요소의 위치 가져오기
			const span = div.querySelector("span");
			const spanRect = span.getBoundingClientRect();
			const spanTop = spanRect.top + window.pageYOffset;
			const spanRight = spanRect.right + window.pageXOffset;

			// kick-area 요소의 위치 설정
			kickArea.style.top = spanTop + span.offsetHeight + "px";
			kickArea.style.left = spanRight + "px";

			// kick-area 요소 표시
			kickArea.style.display = "block";

			// 배경 클릭 시 삭제 이벤트 
			document.addEventListener("click", handleBackgroundClick);
		}

		// 배경 클릭 이벤트 
		function handleBackgroundClick(event) {
			// kick-area 숨기기
			const kickAreas = document.querySelectorAll(".kick-area");
			kickAreas.forEach(function (kickArea) {
				kickArea.style.display = "none";
			});

			// 배경 클릭 이벤트 제거
			document.removeEventListener("click", handleBackgroundClick);
		}

		// 강퇴 버튼 클릭 이벤트 
		function handleKickOutClick() {
			// 모달 표시
			const kickModal = document.getElementById("kick-modal");
			kickModal.style.display = "block";
		}

		// 확인 버튼 클릭 이벤트
		function handleConfirmClick() {
			// 강퇴 함수 추가 예정
			alert("강퇴되었습니다.");

			const kickModal = document.getElementById("kick-modal");
			kickModal.style.display = "none";
		}

		// 취소 버튼 클릭 이벤트
		function handleCancelClick() {
			// 모달 닫기
			const kickModal = document.getElementById("kick-modal");
			kickModal.style.display = "none";
		}

		// 우클릭 이벤트를 모든 kick-out에 추가
		const kickOutDivs = document.querySelectorAll(".kick-out");
		kickOutDivs.forEach(function (div) {
			div.addEventListener("contextmenu", handleRightClick);

			// kick-area 요소의 클릭 이벤트 추가
			const kickArea = div.querySelector(".kick-area");
			const kickButton = kickArea.querySelector("a");
			kickButton.addEventListener("click", handleKickOutClick);
		});

		// 확인 버튼 클릭 이벤트 추가
		const confirmBtn = document.getElementById("confirm-btn");
		confirmBtn.addEventListener("click", handleConfirmClick);

		// 취소 버튼 클릭 이벤트 추가
		const cancelBtn = document.getElementById("cancel-btn");
		cancelBtn.addEventListener("click", handleCancelClick);



		// 채팅방 초대 모달 열기
        const openListModal = () => {
        document.querySelector(".invite-modal").classList.remove("hidden");
        };

        // 채팅방 초대 모달 닫기
        const closeListModal = () => {
        document.querySelector(".invite-modal").classList.add("hidden");
        };

		// 모달 닫기 버튼에 이벤트 추가
		document.querySelector(".invite-closeBtn").addEventListener("click", closeListModal);

		// 모달 배경 클릭 시 모달 닫기
		document.querySelector(".bg").addEventListener("click", closeListModal);


		// 친구 초대 클릭 이벤트 추가
		const inviteBtn = document.querySelector(".inviteMember");
		inviteBtn.addEventListener("click", openListModal);

	</script>