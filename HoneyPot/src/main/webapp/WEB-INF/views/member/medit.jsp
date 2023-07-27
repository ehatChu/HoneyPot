<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
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
				height: 2000px;
				width: 1920px;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			#login-area {
				display: flex;
				justify-content: center;
				width: 1200px;
				height: 1800px;
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

			#loginForm>div:not(.box4):not(.dongHo) {
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
				width: 65%;
				font-size: 24px;
			}

			.box3 {
				background-color: #4A321F;
				margin-left: 50px;
				margin-right: 50px;
				color: white;
				font-size: 24px;
			}

			.box4 {
				display: flex;
				justify-content: space-between;
				align-items: center;
				border: none;
				height: 70px;
			}

			.box5 {
				background-color: red;
				color: white;
				display: flex;
				justify-content: center;
				align-items: center;
				font-size: 24px;
				width: 25%;
			}

			#tit {
				font-size: 28px;
			}

			#tit3 {
				font-size: 44px;
				font-weight: bold;
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
				display: flex;
				justify-content: center;
				align-items: center;
				border-radius: 70%;
				top: 10px;
				left: 150px;
			}

			.dongHo {
				width: 100%;
				display: flex;
				justify-content: space-between;
				align-items: center;
			}

			input[name=pwd],
			input[name=name],
			input[name=birth],
			input[name=dongNum],
			input[name=hoNum] {
				background-color: #4A321F;
				color: white;
			}
		</style>

	</head>

	<body>
		<div id="floor">
			<div id="login-area">
				<form id="loginForm" action="/app/member/medit" method="post" onsubmit="return validateForm()">
					<div></div>
					<div class="logo" onclick="location.href = '/app/main/mmain';">
						<img id="logo" src="/app/resources/main/honeyPot.png">
					</div>
					<div></div>
					<div></div>
					<div>
						<div class="grayCircle">
							<div id=cir><i class="fa-solid fa-gear fa-2xl" style="color: #d9d9d9;"></i></div>
							<i class="fa-sharp fa-solid fa-user fa-7x" style="color: #ffffff;"></i>
						</div>
					</div>
					<div></div>
					<div></div>
					<div id="tit3">회원</div>
					<div></div>
					<div id="tit">아이디</div>
					<input style="padding-left: 30px;" type="text" maxlength="15" class="box formValue" name="id"
						value="${loginMember.id}">
					<div></div>
					<div id="tit">비밀번호</div>
					<input style="padding-left: 30px;" type="password" class="box formValue" name="pwd"
						value="${loginMember.pwd}" readonly>
					<div onclick="goChangePwd();" class="box3 box">수정</div>
					<div id="tit">이름</div>
					<input style="padding-left: 30px;" type="text" class="box formValue" name="name"
						value="${loginMember.name}" readonly>
					<div></div>
					<div id="tit">생년월일</div>
					<input style="padding-left: 30px;" type="text" class="box formValue" name="birth"
						value="${loginMember.birth}" readonly>
					<div></div>
					<div id="tit">연락처</div>
					<input style="padding-left: 30px;" type="text" maxlength="11" class="box formValue" name="phone"
						value="${loginMember.phone}">
					<div></div>
					<div id="tit">동 / 호수</div>
					<div class="dongHo">
						<input style="padding-left: 30px; padding-right: 30px;" type="text" class="box formValue"
							name="dongNum" value="${loginMember.dongNum}" readonly>
						<input style="padding-left: 30px; padding-right: 30px;" type="text" class="box formValue"
							name="hoNum" value="${loginMember.hoNum}" readonly>
					</div>
					<div></div>
					<div id="tit">이메일</div>
					<input style="padding-left: 30px;" type="email" class="box" name="email"
						value="${loginMember.email}">
					<div></div>
					<div></div>
					<div class="box4">
						<input type="submit" class="box box2" value="수정">
						<div onclick="quit();" class="box box5">탈퇴</div>
					</div>
					<div></div>
				</form>
			</div>
		</div>
	</body>

	</html>

	<script>
		let idValue = sessionStorage.getItem("idValue")
		let phoneValue = sessionStorage.getItem("phoneValue")
		let emailValue = sessionStorage.getItem("emailValue")
		let newPwdValue = sessionStorage.getItem("newPwdValue");
		sessionStorage.removeItem('idValue');
		sessionStorage.removeItem('phoneValue');
		sessionStorage.removeItem('emailValue');
		sessionStorage.removeItem('newPwdValue');

		if (newPwdValue != null) {
			const id = document.querySelector('input[name=id]');
			const pwd = document.querySelector('input[name=pwd]');
			const phone = document.querySelector('input[name=phone]');
			const email = document.querySelector('input[name=email]');
			id.value = idValue;
			pwd.value = newPwdValue;
			phone.value = phoneValue;
			email.value = emailValue;
		}


		function validateForm() {
			let isValidate = true;
			const id = document.querySelector('input[name=id]');
			const phone = document.querySelector('input[name=phone]');
			const email = document.querySelector('input[name=email]');
			const formValues = document.querySelectorAll('.formValue');

			for (let tag of formValues) {
				if (tag.value == "") {
					isValidate = false;
				}
			}

			if (phone.value && (!/^\d{11}$/.test(phone.value))) {
				alert("유효한 휴대폰 번호를 입력해주세요.");
				return false;
			}
			if (!isValidate) {
				alert("입력값이 충분하지 않습니다");
				return false;
			}

			return true;
		}


		function quit() {
			location.href = "/app/member/quit";
		}


		function goChangePwd() {
			const id = document.querySelector('input[name=id]');
			const phone = document.querySelector('input[name=phone]');
			const email = document.querySelector('input[name=email]');
			sessionStorage.setItem("idValue", id.value);
			sessionStorage.setItem("phoneValue", phone.value);
			sessionStorage.setItem("emailValue", email.value);

			location.href = '/app/member/changePwd';
		}
	</script>