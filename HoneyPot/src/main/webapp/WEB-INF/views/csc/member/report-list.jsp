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
                                    <div class="report-respond-true">처리</div>    
                                </c:if>
                                <c:if test="${empty vo.answerDate}">
                                    <div class="report-respond-false">미처리</div>    
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
                                    <div class="report-model-member-name" id="report-model-member-name"></div>
                                    <div class="report-model-member-profile">
                                        <img id="report-model-member-profile" src="" alt="프로필 사진">
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
    
    basicSetting(); // 기본 셋팅
    headerName('고객센터'); // 현재 페이지 이름
	firstNav(['자주묻는질문', '문의하기', '문의목록', '신고하기', '신고목록'], '신고목록');
    firstNavLink(['/app/csc/faq', '/app/csc/inquiry', '/app/csc/inquiry-list', '/app/csc/report', '/app/csc/report-list',]);

    // 신고 내역 상세보기 버튼
    let deleteRno = null;

    function detailReport(e) {
    const rno = e.firstElementChild.innerText;
    // console.log(rno);
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
            const name = document.querySelector("#report-model-member-name")
            const profile = document.querySelector("#report-model-member-profile");

            question.innerHTML = "";
            questionC.innerHTML = "";
            name.innerHTML = "";
            profile.src = "";

            const questionStr = data.title;
            const questionCStr = data.content;
            const nameStr = data.memberName;
            const profileStr = data.memberProfile;

            question.innerHTML = questionStr;
            questionC.innerHTML = questionCStr;
            name.innerHTML = nameStr;
            profile.src = "/app/resources/member/profile/" + profileStr;
            deleteRno = data.no;
            console.log(deleteRno);

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

    // 삭제 버튼 활성화
    const deleteBtn = document.querySelector("#report-delete-btn");
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
            
                location.href="/app/csc/report/delete?rno=" + deleteRno;
            }
        });
    });


</script>