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

			#loginForm div:not(.dongHo) {
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

			.dongHo {
				display: flex;
				justify-content: space-between;
				align-items: center;
				width: 100%;
			}
		</style>

	</head>

	<body>
		<div id="floor">
			<div id="login-area">
				<form id="loginForm" action="/app/member/mjoin" method="post" onsubmit="return validateForm()">
					<div></div>
					<div class="logo" onclick="location.href = '/app/member/mlogin';">
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
					<div id="tit">아이디</div>
					<input style="padding-left: 30px;" type="text" class="box" name="id">
					<div class="box3 box" onclick="dupCheck();">중복검사</div>
					<div id="tit">비밀번호</div>
					<input style="padding-left: 30px;" type="password" class="box" name="pwd">
					<div></div>
					<div id="tit">비밀번호 확인</div>
					<input style="padding-left: 30px;" type="password" class="box">
					<div></div>
					<div id="tit">이름</div>
					<input style="padding-left: 30px;" type="text" class="box" name="name">
					<div></div>
					<div id="tit">생년월일</div>
					<input style="padding-left: 30px;" type="text" class="box" name="birth">
					<div></div>
					<div id="tit">연락처</div>
					<input style="padding-left: 30px;" type="text" class="box" name="phone">
					<div></div>
					<div id="tit">동 / 호수</div>
					<div class="dongHo">
						<input style="padding-left: 30px; padding-right: 30px;" type="text" class="box" name="dongNum">
						<input style="padding-left: 30px; padding-right: 30px;" type="text" class="box" name="hoNum">
					</div>
					<div></div>
					<div id="tit">이메일</div>
					<input style="padding-left: 30px;" type="text" class="box" name="email">
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
		function dupCheck() {
			alert("사용 불가능한 아이디입니다");
		}

		function validateForm() {
			const idValue = document.getElementsByName("id")[0].value;
			const pwdValue = document.getElementsByName("pwd")[0].value;
			const nameValue = document.getElementsByName("name")[0].value;
			const birthValue = document.getElementsByName("birth")[0].value;
			const phoneValue = document.getElementsByName("phone")[0].value;
			const dongNumValue = document.getElementsByName("dongNum")[0].value;
			const hoNumValue = document.getElementsByName("hoNum")[0].value;
			const emailValue = document.getElementsByName("email")[0].value;

			if (idValue.trim() === "" || pwdValue.trim() === "" || nameValue.trim() === "" || birthValue.trim() === "" || phoneValue.trim() === "" || dongNumValue.trim() === "" || hoNumValue.trim() === "" || emailValue.trim() === "") {
				alert("입력값이 충분하지 않습니다");
				return false;
			}

			return true;
		}
	</script>