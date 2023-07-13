<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			.logo {
				font-size: 52px;
				font-weight: bold;
				text-align: center;
			}

			.box {
				background-color: rgb(255, 255, 255);
				border-radius: 20px;
				border: none;
				margin-top: 10px;
				margin-bottom: 10px;
				width: 70%;
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

			.box3 {
				width: 70%;
			}

			#tit {
				font-size: 24px;
			}

			#em {
				width: 70%;
				display: flex;
				align-items: center;
				justify-content: space-between;
			}

			#floor {
				height: 937px;
				width: 1920px;
				background-color: white;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			#d01 {
				margin-left: 100px;
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
			}

			#login-area {
				display: flex;
				justify-content: center;
				align-items: center;
				width: 1020px;
				height: 660px;
				margin: 50px;
				background-color: #FAD355;
				border-radius: 60px;
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
				display: flex;
				flex-direction: column;
				align-items: center;
				justify-content: space-evenly;
			}
		</style>

	</head>

	<body>
		<%@ include file="/WEB-INF/views/common/setup.jsp" %>
			<div id="floor">
				<div id="login-area">
					<div id="loginForm">
						<div class="logo">HONEY POT</div>
						<div id="em">
							<div id="tit">이메일</div>
							<input type="text" class="box box3">
						</div>
						<input type="submit" class="box box2" value="아이디 찾기">
					</div>
				</div>
			</div>
	</body>

	</html>

	<script>

	</script>