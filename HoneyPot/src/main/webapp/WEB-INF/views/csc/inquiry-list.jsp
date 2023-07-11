<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <style>
        .inquiry-list-area{
            width: 1440px;
            margin-top: 20px;
            margin-left: 100px;
        }

        .inquiry-text-title{
            font-size: 40px;
            font-weight: 700;
        }

        .inquiry-list-detail{
            display: flex;
            flex-direction: row;
            cursor: pointer;
        }

    </style>

</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <nav>
            <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
        </nav>

        <main>
            <div class="inquiry-list-area">
                <div class="inquiry-text-title">문의 목록</div>
    
                
                <div class="inquiry-list">
                    <div class="inquiry-list-detail" onclick="location.href=''">
                        <div>미처리</div>
                        <div>[카테고리1] 신고 제목입니다.</div>
                        <div>2023-07-04</div>
                    </div>

                </div>
    
            </div>


        </main>

</body>

</html>

<script>
    // 기본 셋팅 (수정x)
    function basicSetting() {
        const nav = document.querySelector("nav");
        const main = document.querySelector("main");
        const mainArea = document.querySelector("#main-area");
        const navArea = document.querySelector("#nav-area");
        mainArea.innerHTML = main.innerHTML;
        navArea.innerHTML = nav.innerHTML;
        main.innerHTML = "";
        nav.innerHTML = "";
    }

    function firstNav() {
        const mainChoice = document.querySelector("#main-choice");
        let navMenu1 = ['자주묻는질문', '문의하기', '문의목록', '신고하기', '신고목록'];

        let menus = "";
        for (let menu of navMenu1) {
            menus += "<div class='choice-elem'><div class='title-elem'>" + menu + "</div></div>"
        }
        mainChoice.innerHTML = menus;
    }
    
    // 헤더 네임 바꾸기
    function headerName() {
        const mainChoice = document.querySelector("#header-main-text");
        mainChoice.innerHTML = '';
        let menus = '고객센터';

        mainChoice.innerHTML = menus;
    }

    
    // 함수 실행
    basicSetting();
    firstNav();
    headerName();
</script>