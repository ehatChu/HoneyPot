<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			#floor {
				height: 937px;
				width: 1920px;
				background-color: white;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			#login-area {
				display: flex;
				justify-content: center;
				align-items: center;
				width: 1000px;
				height: 700px;
				margin: 50px;
				background-color: #FAD355;
				border-radius: 60px;
			}

			#loginForm {
				width: 100%;
				height: 90%;
				display: grid;
				grid-template-columns: 1.5fr 3fr 1.5fr;
				align-items: center;
			}

			#loginForm div {
				display: flex;
				justify-content: center;
				align-items: center;
			}

			.logo {
				font-size: 52px;
				font-weight: bold;
				text-align: center;
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

			#tit {
				font-size: 28px;
			}
		</style>

	</head>

	<body>
		<%@ include file="/WEB-INF/views/common/setup.jsp" %>
			<div id="floor">
				<div id="login-area">
					<div id="loginForm">
						<div></div>
						<div class="logo">HONEY POT</div>
						<div></div>
						<div id="tit">아이디</div>
						<input type="text" class="box">
						<div></div>
						<div id="tit">이메일</div>
						<input type="text" class="box">
						<div></div>
						<div></div>
						<input type="submit" class="box box2" value="비밀번호 찾기">
						<div></div>
					</div>
				</div>
			</div>
	</body>

	</html>

	<script>

	</script>