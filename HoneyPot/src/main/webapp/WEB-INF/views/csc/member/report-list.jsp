<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" href="/app/resources/css/csc/member/report-list.css">

</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <nav>
            <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
        </nav>

        <main>
            <div class="report-list-area">
                <div class="report-text-title">신고 목록</div>
    
                
                <div class="report-list-content-area">
                    <c:forEach items="${rList}" var="vo">
                        <div class="report-list">
                            <div class="report-list-detail">
                                <c:if test="${not empty vo.answerDate}">
                                    <div class="report-respond-true">답변</div>    
                                </c:if>
                                <c:if test="${empty vo.answerDate}">
                                    <div class="report-respond-false">미답변</div>    
                                </c:if>
                                <div><span class="text-yellow">[${vo.reportCname}]</span> ${vo.title}</div>
                                <div>${vo.enrollDate}</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
    
            </div>

        </main>

</body>

</html>

<script>
    // 헤더 카테고리 메뉴바
	const nav = document.querySelector("nav");
	const main = document.querySelector("main");
	const mainArea = document.querySelector("#main-area");
	const navArea = document.querySelector("#nav-area");

	mainArea.innerHTML = main.innerHTML;
	navArea.innerHTML = nav.innerHTML;
	main.innerHTML = "";
	nav.innerHTML = "";

    headerName('고객센터'); // 현재 페이지 이름
	firstNav(['자주묻는질문', '문의하기', '문의목록', '신고하기', '신고목록'], '신고목록');


</script>