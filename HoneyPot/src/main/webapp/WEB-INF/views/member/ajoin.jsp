<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<%@ include file="/WEB-INF/views/common/setup.jsp" %>
			<style>
				* {
					padding: 0px;
					margin: 0px;
					box-sizing: border-box;
				}

				body {
					font-family: 'Noto Sans KR';
					color: #2e2e2e;
					overflow-x: hidden;
					font-weight: 400;
					background-color: #f5f5f5;
				}

				body::-webkit-scrollbar {
					width: 12px;
				}

				body::-webkit-scrollbar-thumb {
					background: #4A321F;
					/* 스크롤바 색상 */
					/* border-radius: 10px; 스크롤바 둥근 테두리 */
				}

				body::-webkit-scrollbar-track {
					background: #4a321f23;
					/*스크롤바 뒷 배경 색상*/
				}

				#floor {
					height: 1500px;
					width: 1920px;
					display: flex;
					justify-content: center;
					align-items: center;
				}

				#login-area {
					display: flex;
					justify-content: center;
					width: 1200px;
					height: 1300px;
					margin: 50px;
					padding: 100px;
					background-color: #FAD355;
					border-radius: 60px;
					overflow-y: scroll;
				}

				#login-area::-webkit-scrollbar {
					display: none;
				}

				#loginForm {
					width: 100%;
					display: grid;
					grid-template-columns: 1.5fr 3fr 1.5fr;
					align-items: center;
				}

				#loginForm div {
					display: flex;
					justify-content: center;
					align-items: center;
				}

				#logo {
					height: 80px;
					margin-left: 15px;
					margin-top: 5px;
				}

				.box {
					background-color: rgb(255, 255, 255);
					border-radius: 20px;
					border: none;
					height: 70px;
				}

				.box2 {
					background-color: #4A321F;
					color: white;
					font-size: 24px;
				}

				.box3 {
					background-color: #4A321F;
					margin-left: 50px;
					margin-right: 50px;
					color: white;
					font-size: 24px;
				}

				#tit {
					font-size: 28px;
				}

				.grayCircle {
					position: relative;
					width: 200px;
					height: 200px;
					border-radius: 90%;
					background-color: #929292;
					display: flex;
					justify-content: center;
					align-items: center;
				}

				#cir {
					height: 45px;
					width: 45px;
					background-color: white;
					position: absolute;
					border-radius: 70%;
					top: 10px;
					left: 150px;
				}

				#ll {
					display: flex;
					justify-content: space-evenly;
					align-items: center;
				}

				#la {
					display: flex;
					justify-content: space-evenly;
					align-items: center;
					width: 30%;
					height: 70px;
					font-size: 32px;
				}

				#la input {
					width: 24px;
					height: 24px;
					border-radius: 90%;
				}
			</style>

	</head>

	<body>
		<div id="floor">
			<div id="login-area">
				<form id="loginForm" action="/app/member/ajoin" enctype="multipart/form-data" method="post"
					onsubmit="return validateForm()">
					<div></div>
					<div class="logo" onclick="location.href = '/app/member/alogin';">
						<img id="logo" src="/app/resources/main/honeyPot.png">
					</div>
					<div></div>
					<div></div>
					<div>
						<input type="file" id="fileInput" name="file" style="display: none;">
						<div class="grayCircle">
							<div id="cir" onclick="fileUpload();"><i class="fa-solid fa-gear fa-2xl"
									style="color: #d9d9d9;"></i></div>
							<img id="profileThumbnail">
							<i class="fa-sharp fa-solid fa-user fa-7x person" style="color: #ffffff;"></i>
						</div>
					</div>
					<div></div>
					<div></div>
					<div id="ll">
						<label id="la">
							<input type="radio" id="radio1" name="grade" value="D"> 동대표
						</label>
						<label id="la">
							<input type="radio" id="radio2" name="grade" value="S"> 경비원
						</label>
					</div>
					<div></div>
					<div id="tit">아이디</div>
					<input style="padding-left: 30px;" type="text" class="box" name="id">
					<div onclick="idDupCheck();" class="box3 box">중복검사</div>
					<div id="tit">비밀번호</div>
					<input style="padding-left: 30px;" type="password" class="box" name="pwd">
					<div></div>
					<div id="tit">비밀번호 확인</div>
					<input style="padding-left: 30px;" type="password" class="box" name="pwdCheck">
					<div></div>
					<div id="tit">담당 동</div>
					<input style="padding-left: 30px;" type="text" class="box" name="name">
					<div></div>
					<div></div>
					<input type="submit" class="box box2" value="회원가입">
					<div></div>
				</form>
			</div>
		</div>
	</body>

	</html>

	<script>
		let idChecked = false;

		const labels = document.querySelectorAll('label');
		labels.forEach(label => {
			label.addEventListener('click', () => {
				const inputTag = label.querySelector('input[type=radio]');
				inputTag.checked = true;
			});
		});

		function idDupCheck() {
			const id = document.querySelector("input[name=id]");
			var idValue = id.value;

			// 아이디 제약조건 - 영어/숫자 조합 4~12자리
			if (!(/^[A-z\d]{4,12}$/.test(idValue))) {
				alert('아이디는 영어/숫자 조합 4~12자리여야 합니다');
				id.style.backgroundColor = 'white';
				id.style.color = 'black';
				id.focus();
				idChecked = false;
			} else {
				$.ajax({
					url: '/app/member/aidDubCheck?id=' + idValue,
					type: 'get',
					success: function (event) {
						if (event == 'success') {
							alert("사용가능한 아이디입니다");
							id.style.backgroundColor = '#4A321F';
							id.style.color = 'white';
							idChecked = true;
						} else {
							alert("중복된 아이디입니다");
							id.style.backgroundColor = 'white';
							id.style.color = 'black';
							idChecked = false;
						}
					},
					error: function () {
						alert("idDupCheck error");
					}
				});
			}
		}

		function fileUpload() {
			document.getElementById('fileInput').click();
		}

		const fileTag = document.querySelector("#fileInput");
		const personThumbnail = document.querySelector(".person");
		const profileThumbnail = document.querySelector("#profileThumbnail");

		fileTag.addEventListener("change", function () {
			if (fileTag.files.length > 0) {
				personThumbnail.style.display = "none";
				profileThumbnail.style.display = "block";
				const fr = new FileReader();
				fr.readAsDataURL(fileTag.files[0]);
				fr.addEventListener("load", function (event) {
					profileThumbnail.src = event.target.result;
					profileThumbnail.style.borderRadius = "50%";
					profileThumbnail.width = "200";
					profileThumbnail.height = "200";
				});
			} else {
				profileThumbnail.style.display = "none";
				personThumbnail.style.display = "block";
			}
		});


		function validateForm() {
			const radio1 = document.querySelector('#radio1');
			const radio2 = document.querySelector('#radio2');
			const name = document.querySelector('input[name=name]');
			const id = document.querySelector("input[name='id']");
			const pwd = document.querySelector('input[name=pwd]');
			const pwdCheck = document.querySelector('input[name=pwdCheck]');

			//아이디 중복확인 여부
			if (!idChecked) {
				alert("아이디 중복검사를 해주세요");
				id.style.backgroundColor = 'white';
				id.style.color = 'black';
				id.focus();
				return false;
			} else {
				id.style.backgroundColor = '#4A321F';
				id.style.color = 'white';
			}

			// 비번 제약조건 - 영어/숫자/특수문자 조합 8~15자리
			if (!(/^[\w!@#$%^&*-]{8,15}$/.test(pwd.value))) {
				alert('영어/숫자/특수문자 조합 8~15자리로 비밀번호를 구성해주세요');
				pwd.style.backgroundColor = 'white';
				pwd.style.color = 'black';
				pwd.focus();
				return false;
			} else {
				pwd.style.backgroundColor = '#4A321F';
				pwd.style.color = 'white';
			}

			// 비밀번호 확인
			if (pwd.value != pwdCheck.value || pwdCheck.value.trim().length == 0) {
				alert("비밀번호 일치여부를 확인해주세요.");
				pwdCheck.style.backgroundColor = 'white';
				pwdCheck.style.color = 'black';
				pwdCheck.focus();
				return false;
			} else {
				pwdCheck.style.backgroundColor = '#4A321F';
				pwdCheck.style.color = 'white';
			}

			// 동 번호 숫자 3자리
			if (!/^\d{3}$/.test(name.value)) {
				alert("동번호 3자리를 입력해주세요");
				name.style.backgroundColor = 'white';
				name.style.color = 'black';
				name.focus();
				return false;
			} else {
				name.style.backgroundColor = '#4A321F';
				name.style.color = 'white';
			}

			if (!radio1.checked && !radio2.checked) {
				alert("직위를 선택해주세요");
				radio1.focus();
				return false;
			} else if (radio1.checked) {
				name.value += "동대표";
			} else {
				name.value += "동 경비원";
			}

			return true;
		}
	</script>