<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set value="${pageContext.request.contextPath}" var="root" />
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
				<div id="wrap">
					<div id="left-area">
						<div class="upper-area">
							<span>채팅방 목록</span>
							<input type="hidden" value="${loginMember.no}" id="loginMember">
							<input type="hidden" id="loginMemberName" value="${loginMember.name}" />
						</div>
						<div class="content-area">
							<div class="icon-area">
								<div class="icon-wrap">
									<button><i class="fa-solid fa-user-group fa-2x"></i></button>
									<button class="moveChatList"><i class="fa-solid fa-comment fa-2x" style="color: #858181;"></i></button>
								</div>
							</div>
							<div class="room-list-area">
								<div id="roomArea">
									<c:forEach items="${rList}" var="rList">
										<div class="room-name" id="detailBtn">
											<div id="roomNo" hidden>${rList.no}</div>
											<img src="${root}/resources/member/profile/${rList.img}" alt="채팅방사진">
											<span id="roomName">${rList.name}</span>
										</div>
									</c:forEach>
								</div>
								<!-- 채팅 만들기 버튼 함수 추가~~ -->
								<button class="openChat"> + 새로운 채팅</button>
							</div>
						</div>
					</div>
					<!-- 채팅 영역 -->
					<div id="chat-area">
                        <div class="room-name-area">
                            
                        </div>
						<div id="chatArea">
							<div id="chatMessageArea">
								
							</div>
						</div>
                        <div class="input-area">
                            <textarea name="" id="message" placeholder="내용을 입력하세요."></textarea>
							<button id="sendBtn">보내기</button>
                        </div>
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
									<input type="text" id="name" value="${cvoList[0].name}">
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
				<!-- 채팅방 친구 초대 모달 영역 -->
				<div class="invite-modal hidden">
					<div class="bg"></div>
					<div class="invite-modalBox">
						<div class="upper-bar">
							<span>채팅방 생성</span>
							<button class="invite-closeBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
						</div>
						<div class="invite-first-area">
							<div class="search-list">
									<input type="text" class="searchValue" name="searchValue">
									<button type="button" class="searchBtn">검색</button>
								</div>
								<div class="friend-list">
									<c:forEach items="${fvoList}" var="list">
										<div class="friend">
										<img src="/app/resources/member/profile/${list.friendProfile}" alt="프로필사진" class="memberPic">
										<span class="memberName">${list.friendName }</span>
										<input type="radio" name="friendNo" value="${list.friendNo}" id="addMember${list.friendNo}" class="styled-radio">
										<label for="addMember${list.friendNo}" class="checkArea">
										</label>
									  </div>
									</c:forEach>
									<div id="none">
									  <span>검색 결과가 없습니다.</span>
									</div>
								  </div>
							<div id="inviteBtn"><button type="button" class="startBtn">채팅 시작하기</button></div>
						</div>
					</div>
				</div>
			</main>
	</body>
	</html>
	

	<script>
		
		// 헤더 함수 실행
		basicSetting();
    	headerName('채팅');

		// 체크 박스 체크
        const changeBox = () => {
        document.querySelector(".checkedBox").classList.remove("hidden");
        };

        // 체크 박스 해제
        const backBox = () => {
        document.querySelector(".checkedBox").classList.add("hidden");
        };

        const checkBox = document.querySelectorAll(".checkBox");
        checkBox.forEach((btn) => {
        btn.addEventListener("click", changeBox);
        });
		
	
			// 채팅방 초대 모달 닫기
			const closeListModal = () => {
			document.querySelector(".invite-modal").classList.add("hidden");
			};

			// 모달 닫기 버튼에 이벤트 추가
			document.querySelector(".invite-closeBtn").addEventListener("click", closeListModal);

			// 모달 배경 클릭 시 모달 닫기
			document.querySelector(".bg").addEventListener("click", closeListModal);
			
			// 친구 목록 조회, 검색 결과 조회
			var openBtn = document.querySelector(".openChat");
			var searchBtn = document.querySelector(".searchBtn");
			
			var memberNo = $("#loginMember").val();
			openBtn.addEventListener("click", function(){
				console.log(memberNo);
				// 채팅방 초대 모달 열기
				document.querySelector(".invite-modal").classList.remove("hidden");
				searchBtn.addEventListener("click", function(){
					const searchValueText = document.querySelector('.searchValue').value;
					console.log(searchValueText);
					$.ajax({
					type: "GET",
					url: "/app/chat/search",
					data: {searchValue: searchValueText },
					success: function(response) {
						var friendsArray = Array.isArray(response) ? response : [response]; // 배열로 변환
						updateFriendList(friendsArray);

						// 검색 결과가 있는 경우
						if (friendsArray.length > 0) {
						$('.styled-radio').each(function() {
							$(this).css({
							'width': '30px',
							'height': '30px',
							'border-radius': '50%',
							'border': '3px solid #ffce31',
							'-webkit-appearance': 'none',
							'-moz-appearance': 'none',
							'appearance': 'none',
							'cursor': 'pointer',
							'transition': 'background 0.2s'
							});
							
							$(this).on('change', function() {
							if ($(this).is(':checked')) {
								$(this).css({
								'background': '#ffce31',
								'border': 'none'
								});
							} else {
								$(this).css({
								'background': 'none',
								'border': '3px solid #ffce31'
								});
							}
							});
						});
						}
					},
					error: function(error) {
						console.log(error);
					}
					});
							})
						});

			function updateFriendList(friendsArray) {
				var friendList = document.querySelector(".friend-list");
				var noResult = document.getElementById("none");

				friendList.innerHTML = "";
				friendList.appendChild(noResult);

				if (friendsArray.length === 0) {
					noResult.style.display = "block";
				} else {
					noResult.style.display = "none";
				}
					friendsArray.forEach(function (friend) {
					var friendElement = document.createElement("div");
					friendElement.classList.add("friend");

					var imgElement = document.createElement("img");
					imgElement.src = "/app/resources/member/profile/" + friend.friendProfile;
					imgElement.alt = "프로필사진";
					imgElement.classList.add("memberPic");

					var spanElement = document.createElement("span");
					spanElement.classList.add("memberName");
					spanElement.textContent = friend.friendName;

					var inputElement = document.createElement("input");
					inputElement.type = "radio";
					inputElement.name = "friendNo";
					inputElement.value = friend.friendNo;
					inputElement.id = "addMember" + friend.friendNo;
					
					var labelElement = document.createElement("label");
					labelElement.setAttribute("for", inputElement.id); 

					labelElement.appendChild(inputElement);
					friendElement.appendChild(imgElement);
					friendElement.appendChild(spanElement);
					friendElement.appendChild(labelElement);

					friendList.appendChild(friendElement);
					});
				}

				$(document).ready(function () {
				$(".startBtn").click(function () {
					var checkedFriendNo = $("input[type='radio'][name='friendNo']:checked").val();
					
					if (!checkedFriendNo) {
					alert("친구를 선택해 주세요.");
					} else {
					
					$.ajax({
						url: "/app/chat/add",
						type: "POST",
						data: {friendNo : checkedFriendNo},
						success: function (response) {
						if (response === "success") {
							// 성공 시 실행할 코드 작성
							location.reload(); 
						} else {
							// 실패 시 오류 메시지 출력
							alert("채팅방 생성 중 문제 발생: " + response.message);
						}
						},
						error: function (xhr, status, error) {
						console.error("Error:", error);
						alert("채팅방 생성 중 오류 발생");
						},
					});
					}
				});
				});
				
				
				// 웹소켓 만들기
				let wsocket = new WebSocket("ws://127.0.0.1:8888/app/chat");
				wsocket.onopen = funcOpen; 
				wsocket.onclose = funcClose;
				wsocket.onerror = funcError;
				wsocket.onmessage = funcMessage;
				var roomNo; // 전역 변수로 선언
				
				$(document).ready(function() {
					const detailBtns = document.querySelectorAll("#detailBtn");
					detailBtns.forEach((btn) => {
						btn.addEventListener("click", function() {
							roomNo = $(this).closest("div").find("#roomNo").text().trim();
							console.log(roomNo);

							$.ajax({
								type: "GET",
								url: "/app/chat/detail/content",
								data: { no: roomNo },
								success: function(response) {
									console.log(response);
									var cvo = response[0];
									var roomNameArea = $(".room-name-area");
									var html = "<div><span>" + cvo.name + "</span><span  id='rno' hidden>" + cvo.no +"</span><button class='openBtn'><i class='fa-solid fa-pen fa-sm' style='color: #000000;'></i></button></div> \
												<div><button class='quitBtn'><span>나가기</span><i class='fa-solid fa-arrow-right-from-bracket fa-lg' style='color: #000000;'></i></button></div>";
									roomNameArea.html(html);

									// 변수에 저장하여 함수 외부에서도 사용할 수 있도록
									var rno = cvo.no;
									
									funcOpen(rno);
									
									const quitBtn = document.querySelector(".quitBtn");
									quitBtn.addEventListener("click", function () {
									Swal.fire({
										title: '삭제하시겠습니까?',
										text: "이전 대화 내용이 삭제됩니다.",
										icon: 'warning',
										showCancelButton: true,
										confirmButtonColor: '#ffce31',
										cancelButtonColor: '#ffce31',
										confirmButtonText: '확인',
										cancelButtonText: '취소'
									}).then((result) => {
										if (result.isConfirmed) {
											var loginMember = document.querySelector("#loginMemberName").value;
											$.ajax({
												type: "POST",
												url: "/app/chat/delete",
												data: {roomNo : rno},
												success: function (response) {
													console.log(response);
													if (response === 'success') {
														location.href = "/app/chat/list";

													} else {
														Swal.fire({
															title: '삭제 실패',
															text: '다시 시도해주십시오.',
															icon: 'error',
															confirmButtonColor: '#ffce31',
														});
													}
												},
												error: function () {
													Swal.fire({
														title: '에러',
														text: '서버와의 통신에 문제가 발생하였습니다.',
														icon: 'error',
														confirmButtonColor: '#ffce31',
													});
												}
											});
											var quitEvent = {
												action: 'user_quit',
												userName: loginMember, 
												roomNo :rno
											};
											console.log("Sending quitEvent", JSON.stringify(quitEvent));
											wsocket.send(JSON.stringify(quitEvent));
											// 소켓 연결 끊기
											wsocket.close();
										}
									});
								});

								
								
								},
								error: function(error) {
									console.log(error);
								}
							});
						});
					});
				});

				function funcOpen(roomNo) {
					console.log("WebSocket 연결 성공");
					$("#chatMessageArea").empty();
					var memberNo = $("#loginMember").val();
					var loadMessagesRequest = JSON.stringify({
						action: "loadMessages",
						roomNo: roomNo
					});
					wsocket.send(loadMessagesRequest);

					// 소켓 들어올 때, read-time을 업데이트
					var updateReadTime = JSON.stringify({
						action: "updateReadTime",
						roomNo: roomNo,
						memberId: memberNo
					});
					wsocket.send(updateReadTime);

					setInterval(function() {
						wsocket.send(updateReadTime);
					}, 10000);
				}
				
				
				function funcClose() {
					console.log("소켓 닫힘");
				}

				function funcError() {
					console.log("소켓 에러");
				}

				function funcMessage(event) {
					var data = JSON.parse(event.data);
					console.log("메세지 받음");
					
					// 메시지 유형에 따라 처리
					if (data.action === "user_quit") {
						var quitMsg = data.userName + "님이 채팅방을 나갔습니다.";
						// 채팅 화면에 메시지 출력
						appendMessage(quitMsg);
					} else if(data.action === "loadMessages" && data.messages){
						data.messages.forEach(function (message) {
						appendMessage(message);
					});
					} else {
						appendMessage(data);
					}
					console.log(data);
				}

				function send() {
					var rno = document.querySelector("#rno").innerText;
					var msg = $("#message").val();
					var senderMemberNo = document.querySelector("#loginMember").value;
					console.log(rno);
					// 메시지 및 방 번호를 JSON 형식으로 변환
					var messageJson = JSON.stringify({
						action: "sendMessage",
						roomNo: rno,
						message: msg,
						memberNo: senderMemberNo
					});

					console.log(messageJson);
					// 웹소켓으로 메시지 보내기
					wsocket.send(messageJson);
					$("#message").val("");
				}

				function adjustChatAreaHeight() {
					var chatArea = $("#chatArea");
					var chatMessageArea = $("#wrapC");

					// 총 메시지 영역의 높이를 계산하여 chatMessageArea의 높이 설정
					var totalMessageHeight = 0;
					chatArea.find('#wrapC').each(function() {
						totalMessageHeight += $(this).outerHeight(true);
					});

					// chatArea의 높이와 총 메시지 영역의 높이 비교 후 설정
					var chatAreaHeight = chatArea.height();
					if (totalMessageHeight > chatAreaHeight) {
						chatArea.height(totalMessageHeight);
					} else {
						chatArea.height(chatAreaHeight);
					}
				}

				// 받은 데이터 넣어주는 함수
				function appendMessage(data) {
					const loginMemberName = document.querySelector("#loginMemberName").value;
					console.log(loginMemberName);
					console.log(data);
					var name = data.name;
					var msg = data.msg;
					var time = data.time;
					var profile = data.profile;
					var date = new Date(time);

					var hours = date.getHours();
					var minutes = date.getMinutes();

					var amOrPm = hours < 12 ? "오전" : "오후";

					hours = (hours % 12) || 12; 
					hours = hours < 10 ? "0" + hours : hours;
					minutes = minutes < 10 ? "0" + minutes : minutes;

					// 상대가 보낸 메세지 일 때
					if (name != loginMemberName) {
						var wrapElement = $('<div id="wrapC"></div>');
						wrapElement.addClass("other-message");
						var messageElement = $('<div class="message"></div>');
						var profileElement = $('<div class="memberProfile"></div>');
						var nameElement = $('<div class="memberName"></div>');
						var timeElement = $('<p class="time"></p>');
						var profileImg = $('<img>');
						profileImg.attr('src', "/app/resources/member/profile/" + profile);

						profileElement.append(profileImg);

						nameElement.text(name);
						messageElement.text(msg);
						timeElement.text(amOrPm + ' ' + hours + ':' + minutes);

						var nameAndMessageDiv = $('<div class="nameAndMessage"></div>');
						nameAndMessageDiv.append(nameElement);
						nameAndMessageDiv.append(messageElement);

						wrapElement.append(profileElement);
						wrapElement.append(nameAndMessageDiv);
						wrapElement.append(timeElement);

						$("#chatMessageArea").append(wrapElement);
					}

					// 내가 보낸 메세지 일 때
					if (name == loginMemberName) {
						var wrapElement = $('<div id="wrapC"></div>');
						wrapElement.addClass("my-message");

						var messageElement = $('<div class="message"></div>');
						var timeElement = $('<p class="time"></p>');

						messageElement.text(msg);
						timeElement.text(amOrPm + ' ' + hours + ':' + minutes);

						var nameAndMessageDiv = $('<div class="nameAndMessage"></div>');
						nameAndMessageDiv.append(messageElement);

						wrapElement.append(nameAndMessageDiv);
						wrapElement.append(timeElement);

						$("#chatMessageArea").append(wrapElement);
					}
				

					var chatArea = $("#chatArea");
					chatArea.scrollTop(chatArea.prop("scrollHeight"));
					
					// chatArea의 높이 조정
					adjustChatAreaHeight();
				}

				// chatArea의 높이 다시 조정
				$(window).resize(function() {
					adjustChatAreaHeight();
				});

				$(document).ready(function() {
				
				// 메세지 입력창에 keypress 함수
				$('#message').keypress(function(event) {
					var keycode = (event.keyCode ? event.keyCode : event.which);
			
					if (keycode == 13) {
						event.preventDefault();

						// 공백이면 send 발동 안함
						if ($.trim($('#message').val()) != "") {
							send();
						}
					}
					
					event.stopPropagation();
				});
			
				$('#sendBtn').click(function() {
					if ($.trim($('#message').val()) != "") {
						send();
					}
				});
			
			});

			
			
							
	</script>

