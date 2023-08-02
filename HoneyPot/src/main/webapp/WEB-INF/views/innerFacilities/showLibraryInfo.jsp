<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
		<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
	</nav>

	<main>
		<div style="height: 2000px;"></div>

	</main>

</body>
</html>
<script>
	basicSetting(); // 기본 셋팅
   	headerName('고객센터'); // 현재 페이지 이름
	firstNav(['도서관', '수영장', '헬스장'], '도서관'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>