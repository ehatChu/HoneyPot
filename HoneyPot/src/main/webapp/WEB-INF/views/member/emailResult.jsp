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
					width: 1000px;
					height: 600px;
					margin: 50px;
					background-color: #FAD355;
					border-radius: 60px;
				}

				#loginForm {
					width: 100%;
					height: 90%;
					display: grid;
					grid-template-columns: 1.5fr 3fr 1.5fr;
					;
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

				#tit {
					font-size: 28px;
				}
			</style>

	</head>

	<body>
		<div id="floor">
			<div id="login-area">
				<div id="loginForm">
					<div></div>
					<div class="logo" onclick="location.href = '/app/member/mlogin';">
						<img id="logo" src="/app/resources/main/honeyPot.png">
					</div>
					<div></div>
					<c:if test="${not empty id}">
						<div id="tit">아이디</div>
						<input style="padding-left: 30px; background-color: #4A321F; color: white;" type="text"
							class="box" name="result" value="${id.substring(0, 4)}" readonly>
					</c:if>
					<c:if test="${not empty pwd}">
						<div id="tit">비밀번호</div>
						<input style="padding-left: 30px; background-color: #4A321F; color: white;" type="text"
							class="box" name="result" value="${pwd.substring(0, 3)}" readonly>
					</c:if>
					<div></div>
					<div></div>
					<input type="submit" class="box box2" value="확인" onclick="location.href='/app/member/mlogin'">
					<div></div>
				</div>
			</div>
		</div>
	</body>

	</html>

	<script>
		if ('${id}' != null) {
			const result = document.querySelector('input[name=result]');
			result.value += '*'.repeat('${id}'.length - 4);
		}

		if ('${pwd}' != null) {
			const result = document.querySelector('input[name=result]');
			result.value += '*'.repeat('${pwd}'.length - 3);
		}
	</script>