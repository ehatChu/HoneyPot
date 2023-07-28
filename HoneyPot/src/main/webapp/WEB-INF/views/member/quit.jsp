<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<%@ include file="/WEB-INF/views/common/setup.jsp" %>
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
				width: 800px;
				height: 600px;
				margin: 50px;
				background-color: #FAD355;
				border-radius: 60px;
			}

			#loginForm {
				width: 100%;
				height: 80%;
				display: grid;
				grid-template-columns: 1.5fr 3fr 1.5fr;
				align-items: center;
			}

			#loginForm>div:not(.bbox) {
				display: flex;
				justify-content: center;
				align-items: center;
			}

			.logo {
				font-size: 44px;
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

			.f1 {
				display: flex;
				justify-content: space-between;
				align-items: center;
				height: 90px;
				width: 100%;
				margin-bottom: 10px;
			}
		</style>

	</head>

	<body>
		<div id="floor">
			<div id="login-area">
				<form id="loginForm" action="/app/member/quit" method="post" onsubmit="return validateForm()">
					<div></div>
					<div class="logo">정말 탈퇴하시겠습니까?</div>
					<div></div>
					<div></div>
					<div class="bbox">
						<%@ include file="/WEB-INF/views/data/captcha.jsp" %>
					</div>
					<div></div>
					<div></div>
					<input type="submit" class="box box2" value="회원 탈퇴">
					<div></div>
				</form>
			</div>
		</div>
	</body>

	</html>

	<script>
		function validateForm() {
			const ans = document.querySelector('#answer');
			if (ans.style.backgroundColor != 'rgb(74, 50, 31)') {
				alert("자동입력 방지코드를 다시 확인해주세요")
				return false;
			}
			return true;
		}
	</script>