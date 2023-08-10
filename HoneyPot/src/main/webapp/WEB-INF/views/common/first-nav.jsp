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
	display: flex;
	height: 80px;
	flex-direction: row;
	justify-content: flex-start;
	align-items:center;
	padding-left:30px;
	border-bottom: 1px solid rgb(156, 156, 156);
	background-color: #f5f5f5;
	z-index: 1;
}

.choice-elem {
	height: 40px;
	border-radius: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
	margin-right: 20px;
	min-width: 180px;
	cursor: pointer;
}

.title-elem {
	border: 4px solid #FAD355;
}

.choice-elem:hover {
	border: 4px solid #FAD355;
	font-weight: bold;
	background-color: white;
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