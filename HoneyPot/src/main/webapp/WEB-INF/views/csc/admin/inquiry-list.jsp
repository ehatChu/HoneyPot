<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" href="/app/resources/css/csc/admin/inquiry-list.css">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">



</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <nav>
            <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
            <!-- <%@ include file="/WEB-INF/views/common/second-nav.jsp" %> -->
        </nav>

        <main>
            <form action="/app/admin/csc/inquiry-list">
	            <div class="inquiry-search-area">
	                <div class="model-search-area">
	                    <div class="model-search-box-area">
	                        <select name="searchType" class="model-search-category">
	                            <option value="TITLE">제목</option>
	                            <option value="NAME">작성자</option>
	                        </select>
	                        <input type="text" name="searchValue" class="model-serach-input">
	                    </div>
	                    
	                </div>
	            </div>
	            <div class="inquiry-category-area">
	                <div class="inquiry-category-text">기간</div>
	                <input type="checkbox" class="inquiry-allDate" id="allDate" value="all">
	                <label for="allDate" class="inquiry-category-text2">전체기간</label>
	                <input type="date" name="startDate">
	                <div>~</div>
	                <input type="date" name="endDate">
	                <!-- <div class="inquiry-category-text">답변여부</div>
	                <select name="answerYn" id="" class="answer-category-box">
	                    <option value="">전체</option>
	                    <option value="Y">답변</option>
	                    <option value="N">미답변</option>
	                </select> -->
	                <div class="inquiry-category-text">분류</div>
	                <select name="qnaCno" id="" class="content-category-box">
	                    <option value="">전체</option>
	                    <c:forEach items="${cList}" var="vo">
	                    	<option value="${vo.no}">${vo.name}</option>
	                    </c:forEach>
	                    
	                </select>
	
	            </div>
	            <div class="inquiry-btn-area">
	                <button type="submit" class="inquiry-search-btn">검색</button>
	                <button type="button" class="inquiry-search-btn white margin-r50" onclick="resetValue();">초기화</button>
	
	            </div>
            </form>

            <div class="inquiry-list-category-area">
                <a href="/app/admin/csc/inquiry-list?searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&startDate=${searchVo.startDate}&endDate=${searchVo.endDate}&qnaCno=${searchVo.qnaCno}" class="inquiry-list-category" id="answerAll">
                    <div class="list-category-text">전체</div>
                    <div class="list-category-num">${listCnt.sum}</div>
                </a>
                <a href="/app/admin/csc/inquiry-list?searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&startDate=${searchVo.startDate}&endDate=${searchVo.endDate}&answerYn=Y&qnaCno=${searchVo.qnaCno}" class="inquiry-list-category" id="answerY">
                    <div class="list-category-text">답변완료</div>
                    <div class="list-category-num">${listCnt.answerY}</div>
                </a>
                <a href="/app/admin/csc/inquiry-list?searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&startDate=${searchVo.startDate}&endDate=${searchVo.endDate}&answerYn=N&qnaCno=${searchVo.qnaCno}" class="inquiry-list-category-last" id="answerN">
                    <div class="list-category-text">미답변</div>
                    <div class="list-category-num">${listCnt.answerN}</div>
                </a>
            </div>

            <div class="inquiry-list-area">
                <table>
                    <tr>
                        <th>분류</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일자</th>
                        <th>답변일자</th>
                    </tr>

					<c:forEach items="${qList}" var="vo">
                        <c:if test="${vo.answerYn eq 'Y'}">
                            <tr class="inquiry-answerY" onclick="detailQna(this);">
                                <td hidden>${vo.no}</td>
                                <td>${vo.qnaCname}</td>
                                <td>${vo.title}</td>
                                <td>${vo.memberName}</td>
                                <td>${vo.enrollDate}</td>
                                <td>${vo.answerDate}</td>
                            </tr>
                        </c:if>
                        <c:if test="${vo.answerYn eq 'N'}">
                            <tr onclick="detailQna(this);">
                                <td hidden>${vo.no}</td>
                                <td>${vo.qnaCname}</td>
                                <td>${vo.title}</td>
                                <td>${vo.memberName}</td>
                                <td>${vo.enrollDate}</td>
                                <td>-</td>
                            </tr>
                        </c:if>
					</c:forEach>
                    
                </table>
            </div>

            <div class="page-area">

                <c:if test="${pvo.currentPage > 1}">
                    <a href="/app/admin/csc/inquiry-list?page=${pvo.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&startDate=${searchVo.startDate}&endDate=${searchVo.endDate}&answerYn=${searchVo.answerYn}&qnaCno=${searchVo.qnaCno}"><</a>
                </c:if>
                    <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" step="1" var="i">
                        <c:if test="${pvo.currentPage != i}">
                            <a href="/app/admin/csc/inquiry-list?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&startDate=${searchVo.startDate}&endDate=${searchVo.endDate}&answerYn=${searchVo.answerYn}&qnaCno=${searchVo.qnaCno}">${i}</a>
                        </c:if>
                        <c:if test="${pvo.currentPage == i}">
                            <a id="current-page">${i}</a>
                        </c:if>
                    </c:forEach>
                <c:if test="${pvo.currentPage < pvo.maxPage}">
                    <a href="/app/admin/csc/inquiry-list?page=${pvo.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&startDate=${searchVo.startDate}&endDate=${searchVo.endDate}&answerYn=${searchVo.answerYn}&qnaCno=${searchVo.qnaCno}">></a>
                </c:if>
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
                            <div class="qna-model-title-area">
                                <div class="qna-model-title-text">문의 내역</div>
                                <div class="qna-model-member-area">
                                    <div class="qna-model-member-target">문의자</div>
                                    <div class="qna-model-member-name" id="qna-model-member-name"></div>
                                    <div class="qna-model-member-profile">
                                        <img id="qna-model-member-profile" src="" alt="프로필 사진">
                                    </div>
                                </div>
                            </div>
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

                        </div>

                    </div>

                </div>
            </div>

                <!-- QNA 답변 달기 모달 -->
                <div class="qna-answer-background">
                    <div class="qna-answer-window">
                        <div class="qna-answer-popup" id="qna-answer-popup">
                            <div class="qna-answer-model-header-area">
                                <div class="qna-answer-model-header">
                                    <div class="qna-answer-model-header-text">답변하기</div>
                                    <span class="material-symbols-outlined" id="qna-answer-close">
                                        close
                                    </span>
                                </div>
                            </div>
                            <div class="qna-answer-model-body-area">
                                
                                <textarea id="qna-answer-content" class="qna-answer-model-content"></textarea>

                                <div class="qna-answer-model-btn-area">
                                    <button id="qna-answer-compelet-btn" class="qna-answer-model-check-btn">답변완료</button>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>

                <!-- QNA 답변 수정 모달 -->
                <div class="qna-answer-edit-background">
                    <div class="qna-answer-edit-window">
                        <div class="qna-answer-edit-popup" id="qna-answer-edit-popup">
                            <div class="qna-answer-edit-model-header-area">
                                <div class="qna-answer-edit-model-header">
                                    <div class="qna-answer-edit-model-header-text">답변수정</div>
                                    <span class="material-symbols-outlined" id="qna-answer-edit-close">
                                        close
                                    </span>
                                </div>
                            </div>
                            <div class="qna-answer-edit-model-body-area">
                                
                                <textarea id="qna-answer-edit-content" class="qna-answer-edit-model-content"></textarea>

                                <div class="qna-answer-edit-model-btn-area">
                                    <button id="qna-answer-edit-compelet-btn" class="qna-answer-edit-model-check-btn">수정완료</button>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
        </div>

        

</body>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

    // 답변여부 카테고리 동적 css
    function answerCheck(){
        const answerCheck = '${searchVo.answerYn}'
        const answerAll = document.querySelector("#answerAll");
        const answerY = document.querySelector("#answerY");
        const answerN = document.querySelector("#answerN");

        if(answerCheck == '' || answerCheck == null || answerCheck == undefined){
            answerAll.classList.add("focus-category");
            // answerAll.lastElementChild.classList.add("yellow");
        }else if(answerCheck == 'Y'){
            answerY.classList.add("focus-category");
            // answerY.lastElementChild.classList.add("yellow");
        }else if(answerCheck == 'N'){
            answerN.classList.add("focus-category");
            // answerN.lastElementChild.classList.add("yellow");
        }

    }
    
    // 미답변 여부 확인
    function answerNCheck(){
        let noAnswerNum = '${listCnt.answerN}'
        const answerN = document.querySelector("#answerN");
        if(noAnswerNum > 0){
            answerN.lastElementChild.classList.add("blinking");
            answerN.lastElementChild.classList.add("yellow");
        }
    }
    answerCheck();
    answerNCheck();

    // 초기화 버튼
    function resetValue(){
        const inputBtnArr = document.querySelectorAll("input");
        for(let inputBtn of inputBtnArr){
            inputBtn.value = "";
        }
        const checkBtn = document.querySelector("input[type='checkbox']");
        checkBtn.checked = false;

        const searchType = document.querySelector("select[name='searchType']");
        searchType.firstElementChild.selected = true;

        const qnaCno = document.querySelector("select[name='qnaCno']");
        qnaCno.firstElementChild.selected = true;
    }   
    $( function() {
	  //draggable() 함수 	jquery-ul.js 스크립트 파일 안에 선언된 함수
    $("#qna-answer-popup").draggable({
        scroll : false,
        containment : 'parent',
        handle : '.qna-answer-model-header-area'
    });
    } );

    $( function() {
	  //draggable() 함수 	jquery-ul.js 스크립트 파일 안에 선언된 함수
    $("#qna-answer-edit-popup").draggable({
        scroll : false,
        containment : 'parent',
        handle : '.qna-answer-edit-model-header-area'
    });
    } );


    </script>

</html>



<script>
    basicSetting(); // 기본 셋팅
    headerName('상담센터'); // 현재 페이지 이름
    firstNav(['문의 내역', '신고 내역', 'FAQ 관리'], '문의 내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    firstNavLink(['/app/admin/csc/inquiry-list', '/app/admin/csc/report-list', '/app/admin/csc/faq',]);
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

    
    // QNA 상세보기 버튼
    let clickQno = null;

    function detailQna(e) {
    const qno = e.firstElementChild.innerText;
    console.log(qno);
    $.ajax({
        url : "/app/admin/csc/inquiry/detail",
        method : "POST",
        data : {
            "qno" : qno
        },
        dataType : "json",
        success : function(data) {
            const question = document.querySelector("#qna-model-question");
            const questionC = document.querySelector("#qna-model-question-content");
            const answer = document.querySelector("#qna-model-answer");
            const name = document.querySelector("#qna-model-member-name")
            const profile = document.querySelector("#qna-model-member-profile");

            question.innerHTML = "";
            questionC.innerHTML = "";
            answer.innerHTML = "";
            name.innerHTML = "";
            profile.src = "";

            const answerStr = data.answer;
            const questionStr = data.title;
            const questionCStr = data.content;
            const nameStr = data.memberName;
            const profileStr = data.memberProfile;

            question.innerHTML = questionStr;
            questionC.innerHTML = questionCStr;
            answer.innerHTML = answerStr;
            name.innerHTML = nameStr;
            profile.src = "/app/resources/member/profile/" + profileStr;
            clickQno = data.no;

            const btnArea = document.querySelector(".qna-model-btn-area");
            btnArea.innerHTML = "";

            if(data.answerYn == 'N'){
                btnArea.innerHTML = '<button id="qna-answer-btn" class="qna-model-check-btn" onclick="qnaAnswerShow();">답변하기</button><button id="qna-delete-btn" class="qna-model-delete-btn" onclick="deleteQNA()">삭제</button>';

            }else if(data.answerYn == 'Y'){
                btnArea.innerHTML = '<button id="qna-answer-btn" class="qna-model-check-btn" onclick="qnaAnwserEditModel();">답변수정</button><button id="qna-delete-btn" class="qna-model-delete-btn" onclick="deleteQNA()">삭제</button>';
            }

            document.querySelector(".qna-background").className = "qna-background show";

        },
        error : function() {
                alert("실패");
            },
        })
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
    // document.querySelector("#qna-check-btn").addEventListener('click', qnaclose);

    // 삭제 버튼 활성화
    const deleteBtn = document.querySelector("#qna-delete-btn");
    function deleteQNA(){
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
            
                location.href="/app/admin/csc/inquiry/delete?qno=" + clickQno;
            }
        });
    };

    // 답변 하기 활성화
    const answerBtn = document.querySelector("#qna-answer-compelet-btn");
    answerBtn.addEventListener("click", function(){
        const answerValue = document.querySelector("#qna-answer-content").value;
        $.ajax({
        url : "/app/admin/csc/inquiry/answer",
        method : "POST",
        data : {
            "qno" : clickQno,
            "answer" : answerValue
        },
        dataType : "json",
        success : function(data) {
            qnaAnswerClose();
            qnaclose();
            const answer = document.querySelector("#qna-model-answer");

            answer.innerHTML = "";

            const answerStr = data.answer;

            answer.innerHTML = answerStr;

            const btnArea = document.querySelector(".qna-model-btn-area");
            btnArea.innerHTML = "";

            if(data.answerYn == 'N'){
                btnArea.innerHTML = '<button id="qna-answer-btn" class="qna-model-check-btn" onclick="qnaAnswerShow();">답변하기</button><button id="qna-delete-btn" class="qna-model-delete-btn" onclick="deleteQNA()">삭제</button>';

            }else if(data.answerYn == 'Y'){
                btnArea.innerHTML = '<button id="qna-answer-btn" class="qna-model-check-btn" onclick="qnaAnwserEditModel();">답변수정</button><button id="qna-delete-btn" class="qna-model-delete-btn" onclick="deleteQNA()">삭제</button>';
            }

            qnashow();

        },
        error : function() {
                alert("실패");
            },
        })
    })

    // 문의 답변 모달 사용
    function qnaAnswerShow () {
        document.querySelector(".qna-answer-background").className = "qna-answer-background ashow";
    }

    function qnaAnswerClose () { 
        document.querySelector(".qna-answer-background").className = "qna-answer-background";
    }

    document.querySelector("#qna-answer-close").addEventListener('click', qnaAnswerClose);

    // 문의 답변 수정 모달 사용
    function qnaAnswerEditShow() {
        document.querySelector(".qna-answer-edit-background").className = "qna-answer-edit-background asshow";
    }

    function qnaAnswerEditClose() { 
        document.querySelector(".qna-answer-edit-background").className = "qna-answer-edit-background";
    }

    document.querySelector("#qna-answer-edit-close").addEventListener('click', qnaAnswerEditClose);

    function qnaAnwserEditModel(){
        $.ajax({
            url : "/app/admin/csc/inquiry/detail",
            method : "POST",
            data : {
                "qno" : clickQno
            },
            dataType : "json",
            success : function(data) {
            const answerEditBox = document.querySelector("#qna-answer-edit-content");

            answerEditBox.innerHTML = data.answer;

            qnaAnswerEditShow();

        },
        error : function() {
                alert("실패");
            },
        })
    }

    // 문의 답변 수정 하기
    const answerEditBtn = document.querySelector("#qna-answer-edit-compelet-btn");
    answerEditBtn.addEventListener("click", function(){
        const answerValue = document.querySelector("#qna-answer-edit-content").value;
        $.ajax({
        url : "/app/admin/csc/inquiry/answer",
        method : "POST",
        data : {
            "qno" : clickQno,
            "answer" : answerValue
        },
        dataType : "json",
        success : function(data) {
            qnaAnswerEditClose();
            qnaclose();
            const answer = document.querySelector("#qna-model-answer");

            answer.innerHTML = "";

            const answerStr = data.answer;

            answer.innerHTML = answerStr;

            const btnArea = document.querySelector(".qna-model-btn-area");
            btnArea.innerHTML = "";

            if(data.answerYn == 'N'){
                btnArea.innerHTML = '<button id="qna-answer-btn" class="qna-model-check-btn" onclick="qnaAnswerShow();">답변하기</button><button id="qna-delete-btn" class="qna-model-delete-btn" onclick="deleteQNA()">삭제</button>';

            }else if(data.answerYn == 'Y'){
                btnArea.innerHTML = '<button id="qna-answer-btn" class="qna-model-check-btn" onclick="qnaAnwserEditModel();">답변수정</button><button id="qna-delete-btn" class="qna-model-delete-btn" onclick="deleteQNA()">삭제</button>';
            }

            qnashow();

        },
        error : function() {
                alert("실패");
            },
        })
    })

</script>