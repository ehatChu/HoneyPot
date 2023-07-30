<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<%@ include file="/WEB-INF/views/common/setup.jsp" %>
			<style>
				.box {
					background-color: rgb(255, 255, 255);
					border-radius: 20px;
					border: none;
					margin-top: 10px;
					margin-bottom: 10px;
					width: 100%;
					height: 50px;
				}

				.box::placeholder {
					color: black;
					font-size: 18px;
				}

				.box2 {
					background-color: #4A321F;
					color: white;
					font-size: 18px;
				}

				#floor1 {
					height: 237px;
					width: 1920px;
					display: flex;
					justify-content: space-between;
					align-items: center;
				}

				#floor2 {
					height: 700px;
					width: 1920px;
					background-image: url("/app/resources/main/back.png");
					background-size: cover;
					display: flex;
					align-items: end;
					justify-content: end;
				}

				#d01 {
					margin-left: 50px;
				}

				#d02 {
					width: 600px;
					height: 200px;
					display: flex;
					justify-content: space-evenly;
				}

				#d02 img {
					height: 140px;
				}

				.bee {
					margin-left: -50px;
				}

				#bee1 {
					margin-top: 0px;
				}

				#bee2 {
					margin-top: 30px;
				}

				#bee3 {
					margin-top: 60px;
				}

				#f01 {
					font-size: 70px;
					font-weight: bold;
				}

				#f02 {
					font-size: 32px;
					margin-left: 15px;
				}

				#login-area {
					display: flex;
					justify-content: center;
					align-items: center;
					width: 510px;
					height: 380px;
					margin: 50px;
					background-color: rgba(255, 243, 203, 0.7);
					border-radius: 20px;
				}

				#sub {
					display: flex;
					justify-content: end;
					align-items: center;
					font-size: 18px;
					margin-right: 20px;
				}

				#loginForm {
					width: 70%;
					height: 70%;
				}

				#logo {
					height: 65px;
					margin-left: 15px;
					margin-top: 5px;
				}

				#logo-area>span {
					font-size: 30px;
					display: flex;
					align-items: center;
					margin-bottom: 30px;
				}

				#logo-area>span>span {
					padding-left: 10px;
				}
			</style>

	</head>

	<body>
		<div id="floor1">
			<div id="d01">
				<div id="logo-area">
					<span onclick="location.href = '/app/member/alogin';"> <img id="logo"
							src="/app/resources/main/logo.png">
						<img id="logo" src="/app/resources/main/honeyPot.png">
					</span>
				</div>
				<div id="f02">푸리미엄 꿀단지 그룹웨어 관리자 페이지입니다</div>
			</div>
			<div id="d02">
				<img class="bee" id="bee1" src="/app/resources/main/image_14.png">
				<img class="bee" id="bee2" src="/app/resources/main/image_14.png">
				<img class="bee" id="bee3" src="/app/resources/main/image_14.png"
					onclick="location.href='/app/member/mlogin'">
			</div>
		</div>
		<div id="floor2">
			<div id="login-area">
				<form id="loginForm" action="/app/member/alogin" method="post" onsubmit="return validateForm()">
					<input style="padding-left: 30px;" type="text" class="box" placeholder="아이디" name="id">
					<br>
					<input style="padding-left: 30px;" type="password" class="box" placeholder="비밀번호" name="pwd">
					<div id="sub">
						<div onclick="join()">회원가입</div>
					</div>
					<br>
					<input type="submit" class="box box2" value="로그인">
				</form>
			</div>
		</div>
	</body>

	</html>

	<%@ include file="/WEB-INF/views/data/loginWeather.jsp" %>
		<script>
			getWeatherInfo();
			getNanoDustInfo();

			function join() {
				location.href = "/app/member/ajoin";
			}

			function validateForm() {
				const idValue = document.getElementsByName("id")[0].value;
				const pwdValue = document.getElementsByName("pwd")[0].value;

				if (idValue.trim() === "" || pwdValue.trim() === "") {
					alert("아이디와 비밀번호를 모두 입력해주세요");
					return false;
				}

				return true;
			}
		</script>