<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" href="/app/resources/css/csc/member/inquiry-list.css">

    <!-- 알람창 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.18/dist/sweetalert2.all.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.18/dist/sweetalert2.min.css" rel="stylesheet">

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
				<c:forEach items="${qList}" var="vo">
					<div class="inquiry-list">
                        <div class="inquiry-list-detail" onclick="detailQna(this);">
                            <div hidden>${vo.no}</div>
                            <c:if test="${vo.answerYn eq 'Y'}">
	                    		<div class="inquiry-respond-true">답변</div>    
	                        </c:if>
	                        <c:if test="${vo.answerYn eq 'N'}">
	                    		<div class="inquiry-respond-false">미답변</div>    
	                        </c:if>
	                        <div><span class="text-yellow">[${vo.qnaCname}]</span> ${vo.title}</div>
	                        <div>${vo.enrollDate}</div>
	                    </div>
	                </div>
				</c:forEach>
            </div>

        </div>

    </main>

    <!-- QNA 상세보기 모달 -->
    <div class="qna-background">
        <div class="qna-window">
            <div class="qna-popup">
                <div class="qna-model-header-area">
                    <div class="qna-model-header">
                        <div class="qna-model-header-text">상세보기</div>
                        <span class="material-symbols-outlined" id="qna-close">
                            close
                        </span>
                    </div>
                </div>
                <div class="qna-model-body-area">
                    <div class="qna-model-body-first">
                        <div class="qna-model-title-text">QNA 질문</div>
                        <div class="qna-model-question-title" id="qna-model-question">제목01</div>
                        <div class="qna-model-question-area">
                            <div class="qna-model-question-icon">Q</div>
                            <div class="qna-model-question-text"  id="qna-model-question-content"></div>
                        </div>
                    </div>

                    <div class="qna-model-answer-text-area">
                        <div class="qna-model-question-area">
                            <div class="qna-model-answer-text" id="qna-model-answer"></div>
                            <div class="qna-model-answer-icon">A</div>
                        </div>
                    </div>

                    <div class="qna-model-btn-area">
                        <button id="qna-check-btn" class="qna-model-check-btn">확인</button>
                        <button id="qna-delete-btn" class="qna-model-delete-btn">삭제</button>

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

    // QNA 상세보기 버튼
    function detailQna(e) {
    const bno = e.firstElementChild.innerText;
    console.log(bno);
    $.ajax({
        url : "/app/csc/qna/detail",
        method : "GET",
        data : {
            "qno" : bno
        },
        dataType : "json",
        success : function(data) {
            const question = document.querySelector("#qna-model-question");
            const questionC = document.querySelector("#qna-model-question-content");
            const answer = document.querySelector("#qna-model-answer");

            question.innerHTML = "";
            questionC.innerHTML = "";
            answer.innerHTML = "";

            const answerStr = data.answer;
            const questionStr = data.title;
            const questionCStr = data.content;

            question.innerHTML = questionStr;
            questionC.innerHTML = questionCStr;
            answer.innerHTML = answerStr;


        },
        error : function() {
            alert("실패");
        },
    })	

    document.querySelector(".qna-background").className = "qna-background show";
    }

    // qna 상세보기 모달 사용
    function qnashow () {
        document.querySelector(".qna-background").className = "qna-background show";
    }

    function qnaclose () { 
        document.querySelector(".qna-background").className = "qna-background";
    }

    // document.querySelector("#temp-btn").addEventListener('click', qnashow);
    document.querySelector("#qna-close").addEventListener('click', qnaclose);
    document.querySelector("#qna-check-btn").addEventListener('click', qnaclose);

    // 삭제 버튼 활성화
    const deleteBtn = document.querySelector("#qna-delete-btn");
    deleteBtn.addEventListener("click", function(){
        Swal.fire({
            title: '정말로 삭제 하시겠습니까?',
            text: '다시 되돌릴 수 없습니다. 신중하세요.',
            icon: 'warning',
            
            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
            cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
            confirmButtonText: '승인', // confirm 버튼 텍스트 지정
            cancelButtonText: '취소', // cancel 버튼 텍스트 지정
            
            // reverseButtons: true, // 버튼 순서 거꾸로
            
            }).then(result => {
            // 만약 Promise리턴을 받으면,
            if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
            
                Swal.fire('삭제가 완료되었습니다.', '', 'success');
            }
        });
    });

</script>