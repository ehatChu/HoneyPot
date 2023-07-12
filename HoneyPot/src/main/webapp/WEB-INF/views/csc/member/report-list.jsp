<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <style>
        .report-list-area{
            width: 1440px;
            margin-top: 20px;
            margin-left: 100px;
        }

        .report-text-title{
            font-size: 40px;
            font-weight: 700;
        }

        .report-list{
            margin-top: 30px;
            width: 1300px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .report-list-detail{
            margin-top: 20px;
            height: 50px;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            cursor: pointer;
            width: 1000px;
            font-size: 22px;
            font-weight: 500;
        }


        .report-respond-true{
            width: 100px;
            height: 50px;
            background-color: #FFCE31;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            
        }

        .report-respond-false{
            width: 100px;
            height: 50px;
            background-color: #4A321F;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 14px;
            color: white;
            
        }

        .text-yellow{
            color: #FFCE31;
        }

    </style>

</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <nav>
            <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
        </nav>

        <main>
            <div class="report-list-area">
                <div class="report-text-title">신고 목록</div>
    
                
                <div class="report-list">
                    <div class="report-list-detail">
                        <div class="report-respond-true">처리</div>
                        <div><span class="text-yellow">[카테고리1]</span> 신고 제목입니다.</div>
                        <div>2023-07-04</div>
                    </div>
                </div>

                <div class="report-list">
                    <div class="report-list-detail">
                        <div class="report-respond-false">미처리</div>
                        <div><span class="text-yellow">[카테고리1]</span> 신고 제목입니다.</div>
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