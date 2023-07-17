<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>

		<style>
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
				width: 120px;
				height: 40px;
			}

			#abc {
				margin-top: -10px;
				width: 220px;
				height: 100px;
				display: flex;
				flex-direction: column;
				justify-content: space-between;
				align-items: end;
			}

			.bbbox {
				background-color: rgb(255, 255, 255);
				border-radius: 20px;
				border: none;
				height: 40px;
				width: 100%;
			}

			#subsub {
				width: 100%;
				display: flex;
				justify-content: space-between;
				align-items: center;
			}

			.bbox {
				display: flex;
				flex-direction: column;
				justify-content: space-between;
				align-items: start;
				border-radius: 20px;
				border: none;
				height: 220px;
			}
		</style>
	</head>

	<body>
		<label id="tit2" for="captcha" style="display: block">자동 입력 방지 코드</label>
		<div class="f1">
			<div style="overflow: hidden">
				<div style="float: left">
					<img id="captchaImg" title="캡차이미지" src="/captchaImg.do" alt="image" width="300px" />
					<div id="ccaudio" style="display: none"></div>
				</div>
			</div>
			<div id="abc" style="padding: 3px">
				<div class="ff2" onclick="javaScript:getImage()">새로고침</div>
				<div class="ff2" onclick="javaScript:audio()">음성듣기</div>
			</div>
		</div>
		<div id="subsub" style="padding: 3px">
			<input id="answer" class="bbbox" type="text" value=""> 
		</div>
	</body>

	</html>

	<script>
		window.onload = function () {
			getImage();	// 이미지 가져오기

			document.querySelector('#check').addEventListener('click', function () {
				var params = { answer: document.querySelector('#answer').getAttribute('value') };
				AF.ajax('/app/kmsData/chkAnswer.do', params, function (returnData) {
					if (returnData == 200) {
						alert('입력값이 일치합니다.');
						// 성공 코드
					} else {
						alert('입력값이 일치하지 않습니다.');
						getImage();
						document.querySelector('#answer').setAttribute('value', '');
					}
				}, 'json');
			});
		}
		/*매번 랜덤값을 파라미터로 전달하는 이유 : IE의 경우 매번 다른 임의 값을 전달하지 않으면 '새로고침' 클릭해도 정상 호출되지 않아 이미지가 변경되지 않는 문제가 발생된다*/
		function audio() {
			var rand = Math.random();
			var uAgent = navigator.userAgent;
			var soundUrl = '/app/kmsData/captchaAudio.do?rand=' + rand;
			if (uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MISE') > -1) {	/*IE 경우 */
				audioPlayer(soundUrl);
			} else if (!!document.createElement('audio').canPlayType) { /*Chrome 경우 */
				try {
					new Audio(soundUrl).play();
				} catch (e) {
					audioPlayer(soundUrl);
				}
			} else {
				window.open(soundUrl, '', 'width=1,height=1');
			}
		}
		function getImage() {
			var rand = Math.random();
			var url = '/app/kmsData/captchaImg.do?rand=' + rand;
			document.querySelector('#captchaImg').setAttribute('src', url);
		}
		function audioPlayer(objUrl) {
			document.querySelector('#ccaudio').innerHTML = '<bgsoun src="' + objUrl + '">';
		}

	</script>