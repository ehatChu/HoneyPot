<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        .faq-search-area{
            width: 1560px;
            height: 120px;
            background-color: #EAEAEA;
            display: flex;
            justify-content: end;
            align-items: center;
            border-bottom: 1px solid rgb(156, 156, 156);
        }

        .faq-search{
            width: 400px;
            height: 50px;
            background-color: white;
            border: 1px solid black;
            border-radius: 10px;
            display: flex;
            justify-self: center;
            align-items: center;
            margin-right: 100px;
        }




        input[name=faqSearch]{
            margin-left: 12px;
            border: none;
            width: 330px;
            height: 30px;
        }

        input[name=faqSearch]:focus {outline:none;}

        #faq-search-icon{
            margin-left: 10px;
            font-size: 35px;
        }

        #faq-search-icon:hover{
            cursor: pointer;
        }

        table {
		margin: 30px;
		border-collapse: collapse;
        font-size: 20px;
        width: 1350px;
	}

	.board-list-area, .page-area {
		width: 1500px;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#board-list td {
		padding: 14px 50px;
		margin-bottom: 20px;
		border-bottom: 3px solid  rgba(179, 179, 179, 0.925);
	}

	#board-list tr:hover {
		background-color: #fdeaab;
		transition: 0.3s;
		cursor: pointer;
	}

	.fa-heart { color: red; }

	.btn-area {
		margin-bottom: 15px;
		width: 1560px;
		display: flex;
		justify-content: right;
		align-items: center;
	}

	#btn-box {
		margin-right: 200px;
	}

	#btn-box > button {
		width: 80px;
		height: 40px;
		background-color: #FAD355;
		color: black;
		font-weight: bold;
		border-radius: 10px;
		border: none;
		text-align: center;
		margin-right: 7px;
	}

	#btn-box > button:hover {
		color: white;
		cursor: pointer;
	}

	.page-area {
		margin: 15px;
	}

	.page-area button {
		display: inline-block;
		font-weight: bold;
		font-size: 18px;
		border: none;
		border-radius: 5px;
		padding: 10px 20px;
		cursor: pointer;
		background-color: transparent;
	}

	.page-area button:hover{
		background-color: #FAD355;
		color: white;
	}

    .category-color{
        color: #e7bf3a;
    }

    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp"%>
		<%@ include file="/WEB-INF/views/common/second-nav.jsp"%>
	</nav>

	<main>
		<div class="faq-area">
            <div class="faq-search-area">
                <div class="faq-search">
                    <input type="text" name="faqSearch">
                    <span id="faq-search-icon" class="material-symbols-outlined">
                        search
                        </span>
                </div>

            </div>
            <div class="board-list-area">
                <table id="board-list">
                <c:forEach items="${fList}" var="vo">
                    <tr>
                        <td><span class="category-color">[${vo.faqCname}] </span>${vo.question}</td>
                        <td>${vo.writerName}</td>
                        <td>${vo.enrollDate}</td>
                        <td><i class="fa-solid fa-eye"></i>${vo.hit}</td>
                    </tr>
                </c:forEach>
                </table>
    
            </div>
    
            <div class="page-area">
                <button><</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>></button>
                <!-- <c:if test="${pv.currentPage > 1}">
                    <a class="btn btn-primary btn-sm" href="${root}/board/list?page=${pv.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">이전</a>
                </c:if>
                    <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
                        <c:if test="${pv.currentPage != i}">
                            <a class="btn btn-primary btn-sm" href="${root}/board/list?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">${i}</a>
                        </c:if>
                        <c:if test="${pv.currentPage == i}">
                            <a class="btn btn-primary btn-sm">${i}</a>
                        </c:if>
                    </c:forEach>
                <c:if test="${pv.currentPage < pv.maxPage}">
                    <a class="btn btn-primary btn-sm" href="${root}/board/list?page=${pv.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">다음</a>
                </c:if> -->
            </div>

        </div>
	
	</main>

</body>
</html>

<script>
	const nav = document.querySelector("nav");
	const main = document.querySelector("main");
	const mainArea = document.querySelector("#main-area");
	const navArea = document.querySelector("#nav-area");

	mainArea.innerHTML = main.innerHTML;
	navArea.innerHTML = nav.innerHTML;
	main.innerHTML = "";
	nav.innerHTML = "";

    headerName('고객센터'); // 현재 페이지 이름
	firstNav(['자주묻는질문', '문의하기', '문의목록', '신고하기', '신고목록'], '자주묻는질문'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['전체', '카테고리1', '카테고리2', '카테고리3'], '전체'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

</script>