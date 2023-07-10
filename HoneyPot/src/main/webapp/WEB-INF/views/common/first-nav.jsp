<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* 헤더 아래에 초이스 구역 */
#main-choice {
	width: 1560px;
	display: grid;
	height: 80px;
	grid-template-columns: 0.5fr 0.5fr 0.5fr 2fr;
	border-bottom: 1px solid black;
	background-color: #f5f5f5;
	z-index: 1;
}

.title-elem {
	border: 4px solid #FAD355;
	height: 40px;
	border-radius: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.choice-elem {
	width: 220px;
	padding-left: 40px;
	padding-top: 15px;
}

#main-area {
	height: 812px;
}

/* 서브초이스 */
</style>
</head>
<body>
	<div id="main-choice">
	</div>
</body>
</html>