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
                            <div class="point-showboard-num bold">0</div>
                        </div>
                    </div>
                    <div class="point-showboard">
                        <div class="point-textbox">
                            <div class="point-showboard-text bold">벌점</div>
                            <div class="point-showboard-num bold">0</div>
                        </div>
                    </div>
                    <div class="point-showboard">
                        <div class="point-textbox">
                            <div class="point-showboard-text bold">총 점수</div>
                            <div class="point-showboard-num bold">0</div>
                        </div>
                    </div>

                </div>
                <form action="${root}/customer/order-list" method="post">
                    <div class="point-form-area">
                        <select class="point-selectbox bold" name="orderStatus">
                            <option value="" disabled selected hidden>전체상태</option>
                            <option value="완료">상점</option>
                            <option value="중지">벌점</option>
                        </select>
                        <input type="date">
                        <div class="point-deco bold">~</div>
                        <input type="date">
                        <input class="point-searchbtn bold" type="submit" value="검색">
                    </div>
                </form>

                <div class="point-list-area">

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