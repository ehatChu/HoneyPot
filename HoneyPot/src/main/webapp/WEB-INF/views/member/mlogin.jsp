<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
				padding-left: 30px;
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
				margin-left: 100px;
			}

			#d02 {
				width: 900px;
				height: 200px;
				display: flex;
				justify-content: space-evenly;
			}

			#d02 img {
				height: 140px;
			}

			#bee1 {
				margin-top: 0px;
			}

			#bee2 {
				margin-top: 60px;
			}

			#bee3 {
				margin-top: 10px;
			}

			#bee4 {
				margin-top: 50px;
			}

			#bee5 {
				margin-top: 20px;
			}

			#f01 {
				font-size: 70px;
				font-weight: bold;
			}

			#f02 {
				font-size: 32px;
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
				justify-content: space-around;
				align-items: center;
				font-size: 18px;
			}

			#loginForm {
				width: 70%;
				height: 70%;
			}
		</style>

	</head>

	<body>
		<%@ include file="/WEB-INF/views/common/setup.jsp" %>
			<div id="floor1">
				<div id="d01">
					<div id="f01">HONEY POT</div>
					<div id="f02">푸리미엄 꿀단지 그룹웨어 방문을 환영합니다</div>
				</div>
				<div id="d02">
					<img id="bee1" src="/app/resources/main/image_12.png">
					<img id="bee2" src="/app/resources/main/image_12.png"> <img id="bee3"
						src="/app/resources/main/image_12.png">
					<img id="bee4" src="/app/resources/main/image_12.png">
					<img id="bee5" src="/app/resources/main/image_12.png">
				</div>
			</div>
			<div id="floor2">
				<div id="login-area">
					<div id="loginForm">
						<input type="text" class="box" placeholder="아이디">
						<br>
						<input type="text" class="box" placeholder="비밀번호">
						<div id="sub">
							<div>아이디 비밀번호 찾기</div>
							<div>회원가입</div>
						</div>
						<br>
						<input type="submit" class="box box2" value="로그인">
					</div>
				</div>
			</div>
	</body>

	</html>

	<script>

	</script>