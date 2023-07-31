<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" href="/app/resources/css/csc/admin/report-list.css">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">



</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <nav>
            <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
            <!-- <%@ include file="/WEB-INF/views/common/second-nav.jsp" %> -->
        </nav>

        <main>
            <form action="/app/admin/csc/report-list">
	            <div class="report-search-area">
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
	            <div class="report-category-area">
	                <div class="report-category-text">기간</div>
	                <input type="checkbox" class="report-allDate" id="allDate" value="all">
	                <label for="allDate" class="report-category-text2">전체기간</label>
	                <input type="date" name="startDate">
	                <div>~</div>
	                <input type="date" name="endDate">
	                <!-- <div class="report-category-text">답변여부</div>
	                <select name="answerYn" id="" class="answer-category-box">
	                    <option value="">전체</option>
	                    <option value="Y">답변</option>
	                    <option value="N">미답변</option>
	                </select> -->
	                <div class="report-category-text">분류</div>
	                <select name="reportCno" id="" class="content-category-box">
	                    <option value="">전체</option>
	                    <c:forEach items="${cList}" var="vo">
	                    	<option value="${vo.no}">${vo.name}</option>
	                    </c:forEach>
	                    
	                </select>
	
	            </div>
	            <div class="report-btn-area">
	                <button type="submit" class="report-search-btn">검색</button>
	                <button type="button" class="report-search-btn white margin-r50" onclick="resetValue();">초기화</button>
	
	            </div>
            </form>

            <div class="report-list-category-area">
                <a href="/app/admin/csc/report-list?searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&startDate=${searchVo.startDate}&endDate=${searchVo.endDate}&reportCno=${searchVo.reportCnoCno}" class="report-list-category" id="answerAll">
                    <div class="list-category-text">전체</div>
                    <div class="list-category-num">${listCnt.sum}</div>
                </a>
                <a href="/app/admin/csc/report-list?searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&startDate=${searchVo.startDate}&endDate=${searchVo.endDate}&answerYn=Y&reportCno=${searchVo.reportCnoCno}" class="report-list-category" id="answerY">
                    <div class="list-category-text">처리완료</div>
                    <div class="list-category-num">${listCnt.answerY}</div>
                </a>
                <a href="/app/admin/csc/report-list?searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&startDate=${searchVo.startDate}&endDate=${searchVo.endDate}&answerYn=N&reportCno=${searchVo.reportCnoCno}" class="report-list-category-last" id="answerN">
                    <div class="list-category-text">미처리</div>
                    <div class="list-category-num">${listCnt.answerN}</div>
                </a>
            </div>

            <div class="report-list-area">
                <table>
                    <tr>
                        <th>분류</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일자</th>
                        <th>답변일자</th>
                    </tr>

					<c:forEach items="${rList}" var="vo">
						<tr onclick="detailReport(this);">
							<td hidden>${vo.no}</td>
	                        <td>${vo.reportCname}</td>
	                        <td>${vo.title}</td>
	                        <td>${vo.reporter}</td>
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
                    <a href="/app/admin/csc/report-list?page=${pvo.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&startDate=${searchVo.startDate}&endDate=${searchVo.endDate}&answerYn=${searchVo.answerYn}&reportCno=${searchVo.reportCno}"><</a>
                </c:if>
                    <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" step="1" var="i">
                        <c:if test="${pvo.currentPage != i}">
                            <a href="/app/admin/csc/report-list?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&startDate=${searchVo.startDate}&endDate=${searchVo.endDate}&answerYn=${searchVo.answerYn}&reportCno=${searchVo.reportCno}">${i}</a>
                        </c:if>
                        <c:if test="${pvo.currentPage == i}">
                            <a id="current-page">${i}</a>
                        </c:if>
                    </c:forEach>
                <c:if test="${pvo.currentPage < pvo.maxPage}">
                    <a href="/app/admin/csc/report-list?page=${pvo.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&startDate=${searchVo.startDate}&endDate=${searchVo.endDate}&answerYn=${searchVo.answerYn}&reportCno=${searchVo.reportCno}">></a>
                </c:if>
            </div>

        </main>

        <!-- report 상세보기 모달 -->
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
                            <div class="report-model-question-title" id="report-model-question">제목01</div>
                            <div class="report-model-question-area">
                                <div class="report-model-question-text"  id="report-model-question-content"></div>
                            </div>
                        </div>

                        <div class="report-model-btn-area">

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
            answerN.lastElementChild.classList.add("red");
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

        const reportCno = document.querySelector("select[name='reportCno']");
        reportCno.firstElementChild.selected = true;
    } 

    </script>

</html>



<script>
    basicSetting(); // 기본 셋팅
    headerName('고객센터'); // 현재 페이지 이름
    firstNav(['문의 내역', '신고 내역', 'FAQ 관리'], '신고 내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

    
    // report 상세보기 버튼
    let clickRno = null;

    function detailReport(e) {
    const rno = e.firstElementChild.innerText;
    console.log(rno);
    $.ajax({
        url : "/app/admin/csc/report/detail",
        method : "POST",
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
            const nameStr = data.respondentName;
            const profileStr = data.respondentProfile;

            question.innerHTML = questionStr;
            questionC.innerHTML = questionCStr;
            name.innerHTML = nameStr;
            profile.src = profileStr;
            clickRno = data.no;

            const btnArea = document.querySelector(".report-model-btn-area");
            btnArea.innerHTML = "";

            if(data.answerYn == 'N'){
                btnArea.innerHTML = '<button id="report-answer-btn" class="report-model-check-btn" onclick="reportComplete()">처리완료</button><button id="report-delete-btn" class="report-model-delete-btn" onclick="deletereport()">삭제</button>';

            }else if(data.answerYn == 'Y'){
                btnArea.innerHTML = '<button id="report-delete-btn" class="report-model-delete-btn" onclick="deletereport()">삭제</button>';
            }

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
    // document.querySelector("#report-check-btn").addEventListener('click', reportclose);

    // 삭제 버튼 활성화
    function deletereport(){
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
            
                location.href="/app/admin/csc/report/delete?rno=" + clickRno;
            }
        });
    };

    // 신고 처리 버튼 활성화
    function reportComplete(){
        
    }




</script>