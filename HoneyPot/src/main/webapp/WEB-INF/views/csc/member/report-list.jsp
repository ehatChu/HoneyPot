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
                            <div class="report-list-detail" onclick="detailReport(this);">
                                <div hidden>${vo.no}</div>
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

        <!-- 신고 내역 상세보기 모달 -->
        <div class="report-background">
            <div class="report-window">
                <div class="report-popup">
                    <div class="report-model-header-area">
                        <div class="report-model-header">
                            <div class="report-model-header-text">상세보기</div>
                            <span class="material-symbols-outlined" id="report-close">
                                close
                            </span>
                        </div>
                    </div>
                    <div class="report-model-body-area">
                        <div class="report-model-body-first">
                            <div class="report-model-title-area">
                                <div class="report-model-title-text">신고 내역</div>
                                <div class="report-model-member-area">
                                    <div class="report-model-member-target">신고대상</div>
                                    <div class="report-model-member-name">김지수</div>
                                    <div class="report-model-member-profile">
                                        <img src="" alt="프로필 사진">
                                    </div>
                                </div>
                            </div>
                            <div class="report-model-question-title" id="report-model-question"></div>
                            <div class="report-model-question-area">
                                <div class="report-model-question-text"  id="report-model-question-content"></div>
                            </div>
                        </div>

                        <div class="report-model-btn-area">
                            <button id="report-check-btn" class="report-model-check-btn">확인</button>
                            <button id="report-delete-btn" class="report-model-delete-btn">삭제</button>

                        </div>

                    </div>

                </div>
            </div>
        </div>

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

    // report 상세보기 버튼
    let deleteBno = null;

    function detailReport(e) {
    const rno = e.firstElementChild.innerText;
    console.log(rno);
    $.ajax({
        url : "/app/csc/report/detail",
        method : "GET",
        data : {
            "rno" : rno
        },
        dataType : "json",
        success : function(data) {
            const question = document.querySelector("#report-model-question");
            const questionC = document.querySelector("#report-model-question-content");

            question.innerHTML = "";
            questionC.innerHTML = "";

            const questionStr = data.title;
            const questionCStr = data.content;

            question.innerHTML = questionStr;
            questionC.innerHTML = questionCStr;
            deleteBno = data.no;

            document.querySelector(".report-background").className = "report-background show";
        },
        error : function() {
            alert("실패");
        },
    })	

    }

    // report 상세보기 모달 사용
    function reportshow () {
        document.querySelector(".report-background").className = "report-background show";
    }

    function reportclose () { 
        document.querySelector(".report-background").className = "report-background";
    }

    // document.querySelector("#temp-btn").addEventListener('click', reportshow);
    document.querySelector("#report-close").addEventListener('click', reportclose);
    document.querySelector("#report-check-btn").addEventListener('click', reportclose);


</script>