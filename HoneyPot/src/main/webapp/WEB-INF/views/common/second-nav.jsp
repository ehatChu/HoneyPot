<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* 서브초이스 */
#sub-choice {
	padding: 10px 10px 10px 50px;
	border-bottom: 1px solid black;
	background-color: #f5f5f5;
	z-index: 1;
}

#grid-sub-choice {
	display: grid;
	width: 400px;
	grid-template-columns: 1fr 1fr;
}
</style>
</head>
<body>
	<div id="sub-choice">
		<div id="grid-sub-choice">
			<div style="font-weight: 800;">도서관시설구조보기</div>
			<div>예약하기</div>
		</div>
	</div>
</body>
</html>