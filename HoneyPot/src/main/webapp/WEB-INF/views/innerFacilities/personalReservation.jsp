<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	#innerFacWrap {
		padding: 30px;
		display: flex;
	}
	#innerFac-img-area {
		width: 998px;
	}

	#info-content {
		width: 500px;
		background-color: #F5F5F5;
		border: none;
		font-size: 18px;
		outline: none;
		resize: none;
	}
	#big-title {
		font-size: 50px;
		font-weight: 600;
	}
	#innerFac-info-detail {
		font-size: 18px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
		<!-- <%@ include file="/WEB-INF/views/common/second-nav.jsp" %> -->
	</nav>

	<main>
		<!-- <div>${rsVoList}</div> -->
		<table class="A_detail">
			<thead>
				<tr class="line">
					<th>예약날짜</th>
					<th>예약시간</th>
					<th>시설이름</th>
					<th>예약취소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${rsVoList}" var="vo">
					<tr class="line">
						<td>${vo.reserveTime}</td>
						<td>${vo.startTime}~${vo.endTime}</td>
						<td>${vo.name}</td>
						<td><button onclick="location.href='/app/innerFac/cancel-personal?no=${vo.no}'">예약취소</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>

</body>
</html>
<script>
	basicSetting(); // 기본 셋팅
   	headerName('고객센터'); // 현재 페이지 이름
	firstNav(['도서관', '수영장', '헬스장','예약조회'], '예약조회'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	//secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
	
	

</script>