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

			.bbox {
				display: flex;
				flex-direction: column;
				justify-content: space-between;
				align-items: start;
				border-radius: 20px;
				border: none;
				height: 150px;
			}

			.bbbox {
				background-color: rgb(255, 255, 255);
				border-radius: 20px;
				border: none;
				height: 50px;
				width: 100%;
			}

			.box2 {
				background-color: #4A321F;
				color: white;
				font-size: 24px;
			}

			#tit {
				font-size: 28px;
			}

			#tit2 {
				font-size: 22px;
				margin-bottom: 10px;
			}

			.f1 {
				display: flex;
				justify-content: space-between;
				align-items: center;
				height: 60px;
				width: 100%;
				margin-bottom: 10px;
			}

			.ff1 {
				display: flex;
				justify-content: center;
				align-items: center;
				width: 65%;
				height: 100%;
			}

			.ff2 {
				background-color: #4A321F;
				border-radius: 20px;
				color: white;
				display: flex;
				justify-content: center;
				align-items: center;
				width: 15%;
				height: 100%;
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
							<div id="tit2">자동입력방지코드</div>
							<div class="f1">
								<img class="ff1" src="/app/resources/member/1111_1.png">
								<div class="ff2"><i class="fa-solid fa-rotate-right fa-user fa-2x" style="color: #ffffff;"></i></div>
							</div>
							<input type="text" class="bbbox">
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