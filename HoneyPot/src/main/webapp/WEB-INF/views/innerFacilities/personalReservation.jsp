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
	.main-table {
		border-collapse: collapse;
		width: 1400px;
		box-sizing: border-box;
	}
	.main-header {
		height: 50px;
		text-align: center;
	}
	.table-line {
		text-align: center;
		height: 50px;
	}
	#wrap {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		height: 700px;
	}
	thead {
		background-color: #FFCE31;
	}
	.page-box {
        padding: 3px 10px;
    }
	#current-page {
		background-color: #FFCE31;

	}
    a {
        text-decoration: none;
        color: black;
    }
    .paging-btn {
       border: none;
       width: 20px;
       height: 20px;
       
    }
	#page-area {
        margin-top: 20px;
        text-align: center;
        font-size: 20px;
    }
	.num:hover {
        background-color: #FFCE31;
        border-radius: 5px;
    }
	.cancel-btn {
		background-color: #4A321F;
		color: white;
		padding: 5px;
		border-radius: 6px;
	}
	/* #table-wrapper > div:nth-child(2) {
		height: 100%;
	} */
	#table-wrapper {
		height: 500px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
		<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
	</nav>

	<main>
		<!-- <div>${rsVoList}</div> -->
		<div id="wrap">
			<h1>편의시설 본인예약조회</h1>
			<div id="table-wrapper">
				<div>
					<table class="main-table">
						<thead>
							<tr class="main-header">
								<th>예약날짜</th>
								<th>예약시간</th>
								<th>시설이름</th>
								<th>예약취소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${rsVoList}" var="vo">
								<tr class="table-line">
									<td>${vo.reserveTime}</td>
									<td>${vo.startTime}~${vo.endTime}</td>
									<td>${vo.name}</td>
									<td><button class="cancel-btn" onclick="location.href='/app/innerFac/cancel-personal?no=${vo.no}'">예약취소</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
					
				
			</div>
			
			<c:if test="${not empty pv}">
				<div id="page-area">
					<c:if test="${pv.currentPage > 1}">
						<span class="page-box"><a href="/app/innerFac/personalReservation?p=${pv.currentPage-1}"><i class="fa-solid fa-chevron-down fa-rotate-90" style="color: #FFCE31;"></i></a></span>
					</c:if>
					<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
						<c:if test="${pv.currentPage != i}">
								<!-- "/app/admin/innerFac/reservation?p=${pv.currentPage-1}&name=${searchName}&startDate={searchStartDate}&endDate={searchEndDate}&startTime=${searchStartTime}" -->
							<span class="page-box num"><a href="/app/innerFac/personalReservation?p=${i}">${i}</a></span>
						</c:if>
						<c:if test="${pv.currentPage == i}">
							<span class="page-box num" id="current-page">${i}</span>
						</c:if>
					</c:forEach>
					<c:if test="${pv.currentPage < pv.maxPage}">
						<span class="page-box"><a href="/app/innerFac/personalReservation?p=${pv.currentPage+1}"><i class="fa-solid fa-chevron-down fa-rotate-270" style="color: #FFCE31;"></i></a></span>
						
					</c:if>
				 </div>
			</c:if>
		</div>
		
	</main>
	
</body>
</html>
<script>
	basicSetting(); // 기본 셋팅
   	headerName('마이페이지'); // 현재 페이지 이름
	firstNav(['내정보', '나의활동', '신청내역','관리비'], '신청내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['조식', '편의시설'], '편의시설'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
	firstNavLink(['/app/calendar/schedule-list','/app/mypage/act/board',' /app/meal/mypage','/app/fee/member']);
	secondNavLink(['/app/meal/mypage','/app/innerFac/personalReservation?p=1'],); 
	

</script>