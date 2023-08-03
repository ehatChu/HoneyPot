<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/app/resources/css/member/mypage/point.css">
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<nav>
			<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
			<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
		</nav>

		<main>
			<div class="point-area">
                <div class="point-title1 bold">상벌점 내역</div>
                <div class="point-showboard-area">
                    <div class="point-showboard">
                        <div class="point-textbox">
                            <div class="point-showboard-text bold">상점</div>
                            <div class="point-showboard-num bold">${listCnt.plusPoint}</div>
                        </div>
                    </div>
                    <div class="point-showboard">
                        <div class="point-textbox">
                            <div class="point-showboard-text bold">벌점</div>
                            <div class="point-showboard-num bold">${listCnt.minusPoint}</div>
                        </div>
                    </div>
                    <div class="point-showboard">
                        <div class="point-textbox">
                            <div class="point-showboard-text bold">총 점수</div>
                            <div class="point-showboard-num bold">${listCnt.sumPoint}</div>
                        </div>
                    </div>

                </div>
                <form action="/app/mypage/act/point-list" method="get">
                    <div class="point-form-area">
                        <input type="date" name="startDate">
                        <div class="point-deco bold">~</div>
                        <input type="date" name="endDate">
                        <input class="point-search-btn bold" type="submit" value="검색">
                    </div>
                </form>

                <div class="point-list-area">
                    <c:forEach items="${pList}" var="vo">
                    	<div class="point-list">
                    	<c:if test="${vo.score gt 0}">
                            <div class="point-list-score">상점 ${vo.score}</div>
                    	</c:if>
                    	<c:if test="${vo.score lt 0}">
                    		<div class="point-list-score red">벌점 ${vo.score}</div>
                    	</c:if>
                            <div class="point-list-content">${vo.content}</div>
                            <div class="point-list-pointDate">${vo.pointDate}</div>
                        </div>
                    </c:forEach>
                </div>

            </div>


		</main>

</body>

</html>

<script>
	basicSetting(); // 기본 셋팅
	headerName('마이페이지'); // 현재 페이지 이름
	firstNav(['내정보', '나의활동', '신청내역', '관리비'], '나의활동'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['내게시글', '내댓글', '내평가', '좋아요', '상벌점내역'], '상벌점내역'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>