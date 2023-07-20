<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/app/resources/css/csc/member/inquiry-list.css">
</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <nav>
        <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
    </nav>

    <main>
        <div class="inquiry-list-area">
            <div class="inquiry-text-title">문의 목록</div>

            <div class="inquiry-list-content-area">
                <div class="inquiry-list">
                    <div class="inquiry-list-detail">
                        <div class="inquiry-respond-true">답변</div>
                        <div><span class="text-yellow">[카테고리1]</span> 문의 제목입니다.</div>
                        <div>2023-07-04</div>
                    </div>
                </div>
    
                <div class="inquiry-list">
                    <div class="inquiry-list-detail">
                        <div class="inquiry-respond-false">미답변</div>
                        <div><span class="text-yellow">[카테고리1]</span> 문의 제목입니다.</div>
                        <div>2023-07-04</div>
                    </div>
                </div>

                <div class="inquiry-list">
                    <div class="inquiry-list-detail">
                        <div class="inquiry-respond-false">미답변</div>
                        <div><span class="text-yellow">[카테고리1]</span> 문의 제목입니다.</div>
                        <div>2023-07-04</div>
                    </div>
                </div>

                <div class="inquiry-list">
                    <div class="inquiry-list-detail">
                        <div class="inquiry-respond-false">미답변</div>
                        <div><span class="text-yellow">[카테고리1]</span> 문의 제목입니다.</div>
                        <div>2023-07-04</div>
                    </div>
                </div>

                <div class="inquiry-list">
                    <div class="inquiry-list-detail">
                        <div class="inquiry-respond-false">미답변</div>
                        <div><span class="text-yellow">[카테고리1]</span> 문의 제목입니다.</div>
                        <div>2023-07-04</div>
                    </div>
                </div>

                <div class="inquiry-list">
                    <div class="inquiry-list-detail">
                        <div class="inquiry-respond-false">미답변</div>
                        <div><span class="text-yellow">[카테고리1]</span> 문의 제목입니다.</div>
                        <div>2023-07-04</div>
                    </div>
                </div>

                <div class="inquiry-list">
                    <div class="inquiry-list-detail">
                        <div class="inquiry-respond-false">미답변</div>
                        <div><span class="text-yellow">[카테고리1]</span> 문의 제목입니다.</div>
                        <div>2023-07-04</div>
                    </div>
                </div>
            </div>

        </div>



    </main>

    <!-- FAQ 상세보기 모달 -->
    <div class="faq-background">
        <div class="faq-window">
            <div class="faq-popup">
                <div class="faq-model-header-area">
                    <div class="faq-model-header">
                        <div class="faq-model-header-text">상세보기</div>
                        <span class="material-symbols-outlined" id="faq-close">
                            close
                        </span>
                    </div>
                </div>
                <div class="faq-model-body-area">
                    <div class="faq-model-body-first">
                        <div class="faq-model-sanction-date">
                            <div class="faq-model-title-text">FAQ 질문</div>
                            <div class="faq-model-question-text" id="faq-model-question"></div>
                        </div>
                    </div>
                    <div class="faq-model-answer-text-area">
                        <span class="material-symbols-outlined" id="faq-model-answer-icon">
                            subdirectory_arrow_right
                            </span>
                        <div class="faq-model-answer-text" id="faq-model-answer"></div>
                    </div>

                    <div class="faq-model-btn-area">
                        <button id="faq-check-btn" class="faq-model-btn">닫기</button>

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
	firstNav(['자주묻는질문', '문의하기', '문의목록', '신고하기', '신고목록'], '문의목록');

</script>