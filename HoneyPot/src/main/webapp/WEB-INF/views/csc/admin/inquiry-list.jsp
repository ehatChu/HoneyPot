<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" href="/app/resources/css/csc/admin/inquiry-list.css">

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
						<tr onclick="detailQna(this);">
							<td hidden>${vo.no}</td>
	                        <td>${vo.qnaCname}</td>
	                        <td>${vo.title}</td>
	                        <td>${vo.memberName}</td>
	                        <td>${vo.enrollDate}</td>
	                        <c:if test="${vo.answerYn eq 'Y'}">
	                        	<td>${vo.answerDate}</td>
	                        </c:if>
	                        <c:if test="${vo.answerYn eq 'N'}">
	                        	<td>-</td>
	                        </c:if>
	
	                    </tr>
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


</script>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('고객센터'); // 현재 페이지 이름
    firstNav(['문의 내역', '신고 내역', 'FAQ 관리'], '문의 내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

    
    // QNA 상세보기 버튼
    let deleteBno = null;

    function detailQna(e) {
    const bno = e.firstElementChild.innerText;
    console.log(bno);
    // $.ajax({
    //     url : "/app/csc/qna/detail",
    //     method : "GET",
    //     data : {
    //         "qno" : bno
    //     },
    //     dataType : "json",
    //     success : function(data) {
    //         const question = document.querySelector("#qna-model-question");
    //         const questionC = document.querySelector("#qna-model-question-content");
    //         const answer = document.querySelector("#qna-model-answer");

    //         question.innerHTML = "";
    //         questionC.innerHTML = "";
    //         answer.innerHTML = "";

    //         const answerStr = data.answer;
    //         const questionStr = data.title;
    //         const questionCStr = data.content;

    //         question.innerHTML = questionStr;
    //         questionC.innerHTML = questionCStr;
    //         answer.innerHTML = answerStr;
    //         deleteBno = data.no;

    //     },
    //     error : function() {
        //         alert("실패");
        //     },
        // })
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

</script>