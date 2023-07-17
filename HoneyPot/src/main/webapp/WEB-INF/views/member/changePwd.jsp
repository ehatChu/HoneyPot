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
				display: flex;
				justify-content: center;
				align-items: center;
			}

			#login-area {
				display: flex;
				justify-content: center;
				align-items: center;
				width: 1000px;
				height: 800px;
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

			#loginForm>div:not(.bbox) {
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
						<div class="logo">
							<img id="logo" src="/app/resources/main/honeyPot.png">
						</div>
						<div></div>
						<div id="tit">이전 비밀번호</div>
						<input type="text" class="box">
						<div></div>
						<div id="tit">새 비밀번호</div>
						<input type="text" class="box">
						<div></div>
						<div id="tit">비밀번호 확인</div>
						<input type="text" class="box">
						<div></div>
						<div></div>
						<div class="bbox">
							<%@ include file="/WEB-INF/views/data/captcha.jsp" %>
						</div>
						<div></div>
						<div></div>
						<input type="submit" class="box box2" value="비밀번호 수정">
						<div></div>
					</div>
				</div>
			</div>
	</body>

	</html>

	<script>

	</script>