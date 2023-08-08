<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/app/resources/css/csc/member/faq.css">

<style>
    /* 서브초이스 */
    #category-choice {
        padding: 10px 10px 10px 10px;
        border-bottom: 1px solid rgb(156, 156, 156);
        background-color: #f5f5f5;
        z-index: 1;
    }
    
    #category-sub-choice {
        display: flex;
        width: 100%;
    }
    
    .menu-box {
        width: 150px;
        text-align: center;
    }

    .menu-box > a{
        text-decoration: none;
        color: black;
    }
    
    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp"%>
        <div id="category-choice">
            <div id="category-sub-choice">
            	<div class="menu-box"><a href="/app/csc/faq?page=1&searchType=">전체</a></div>
               <c:forEach items="${cList}" var="vo">
               	 <div class="menu-box"><a href="/app/csc/faq?page=1&searchType=${vo.no}">${vo.name}</a></div>
               </c:forEach>

            </div>

        </div>
	</nav>

	<main>
		<div class="faq-area">
            <div class="faq-search-area">
                <form action="/app/csc/faq" method="get">
                    <div class="faq-search">
                        <input type="text" name="searchValue">
                        <button type="submit" id="faq-search-btn">
                            <span id="faq-search-icon" class="material-symbols-outlined">
                                search
                                </span>
                        </button>
                    </div>
                </form>

            </div>
            <div class="board-list-area">
                <table id="board-list">
                <c:forEach items="${fList}" var="vo">
                    <tr onclick="detailFAQ(this);">
                        <td hidden>${vo.no}</td>
                        <td><span class="faq-category-color">[${vo.faqCname}] </span>${vo.question}</td>
                        <td>${vo.writerName}</td>
                        <td>${vo.enrollDate}</td>
                        <td><i class="fa-solid fa-eye"></i> ${vo.hit}</td>
                    </tr>
                </c:forEach>
                </table>
    
            </div>
    
            <div class="page-area">

                <c:if test="${pvo.currentPage > 1}">
                    <a href="/app/csc/faq?page=${pvo.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}"><</a>
                </c:if>
                    <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" step="1" var="i">
                        <c:if test="${pvo.currentPage != i}">
                            <a href="/app/csc/faq?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">${i}</a>
                        </c:if>
                        <c:if test="${pvo.currentPage == i}">
                            <a id="current-page">${i}</a>
                        </c:if>
                    </c:forEach>
                <c:if test="${pvo.currentPage < pvo.maxPage}">
                    <a href="/app/csc/faq?page=${pvo.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">></a>
                </c:if>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
    basicSetting(); // 기본 셋팅
    headerName('고객센터'); // 현재 페이지 이름
	firstNav(['자주묻는질문', '문의하기', '문의목록', '신고하기', '신고목록'], '자주묻는질문'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    firstNavLink(['/app/csc/faq', '/app/csc/inquiry', '/app/csc/inquiry-list', '/app/csc/report', '/app/csc/report-list',]);
	// secondNav(['전체', '카테고리1', '카테고리2', '카테고리3'], '전체'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

    // FAQ 상세보기 버튼
    function detailFAQ(e) {
        const bno = e.firstElementChild.innerText;
        $.ajax({
			url : "/app/csc/faq/detail",
			method : "GET",
            data : {
                "fno" : bno
            },
            dataType : "json",
			success : function(data) {
                const question = document.querySelector("#faq-model-question");
                const answer = document.querySelector("#faq-model-answer");

                question.innerHTML = "";
                answer.innerHTML = "";

                const answerStr = data.answer;
                const questionStr = data.question;

                question.innerHTML = questionStr;
                answer.innerHTML = answerStr;


			},
			error : function() {
			},
		})	

        document.querySelector(".faq-background").className = "faq-background show";
    }

    // FAQ 상세보기 모달 사용
    function FAQshow () {
        
    }

    function FAQclose () { 
        document.querySelector(".faq-background").className = "faq-background";
    }

    
    document.querySelector("#faq-close").addEventListener('click', FAQclose);
    document.querySelector("#faq-check-btn").addEventListener('click', FAQclose);

    // FAQ 카테고리 bold 만들기
    function categoryBold(){
        const categoryMenu = document.querySelectorAll(".menu-box");
        let keyUrl = window.location.search;
        let categorypos = keyUrl.indexOf("searchType");
        if(categorypos != -1){
            let result = keyUrl.substr(categorypos + 11,1);
            console.log(result);
            if(result == "" || result == "&"){
                categoryMenu[0].className = "menu-box text-bold"
            }else if(result == 1){
                categoryMenu[1].className = "menu-box text-bold"
            }else if(result == 2){
                categoryMenu[2].className = "menu-box text-bold"
            }else if(result == 3){
                categoryMenu[3].className = "menu-box text-bold"
            }
        }else{
            categoryMenu[0].className = "menu-box text-bold"
        }

    }

    categoryBold();

</script>