<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table {
        margin-top: 30px;
        border-collapse: collapse;
    }
    #table-area {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    table {
        font-size: 20px;
    }
    thead > tr {
        height: 40px;
    }
    tbody > tr {
        height: 50px;
    }
    .margin-right {
        padding-right: 20px;
    }
    #page-area {
        margin-top: 20px;
        text-align: center;
        font-size: 30px;
    }
    .margin-right {
        margin-right: 10px;
    }
    .margin-left {
        margin-left: 20px;
    }
    .page-box {
        padding: 3px 10px;
    }
    .num:hover {
        background-color: #FFCE31;
        border-radius: 5px;
    }
    tr >td:last-child{
        display: flex;
        justify-content: center;
        align-items: center;
        height: 50px;
    }
    #ok-btn {
        padding: 5px 20px;
        font-family: 'Noto Sans KR';
        background-color: #4A321F;
        color: white;
        border-radius: 5px;
    }
    table > thead > tr {
        background-color: #FFCE31;
    }
    table > tbody > tr {
        border-bottom: 1px solid black;
    }
    table > thead > tr > th{
        padding: 10px;
    }
</style>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <nav>
        <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
        <%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
    </nav>

    <main>
        <div id="table-area">
            <table>
                <thead>
                    <tr>
                        <th>시설이름</th>
                        <th>시설 평가 내용</th>
                        <th>이동하기</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" begin="1" end ="12">
                        <tr>
                            <td class="margin-right">룰루 아쿠아리움센트럴파크점</td>
                            <td class="margin-right">먹을것도 많고 시설도 좋고 아주 좋았음. 피자가 양이 적음 그런데 말입니다.. 그녀는 더 길어지면 오똫게? 더더 넌 할 수 있어</td>
                            <td><button id="ok-btn">확인</button></td>
                        </tr>
                    </c:forEach>
                   
                </tbody>
            </table>
        </div>
        <div id="page-area">
            <span class="page-box"><i class="fa-solid fa-chevron-down fa-rotate-90" style="color: #FFCE31;"></i></span>
            <span class="page-box num">1</span>
            <span class="page-box num">2</span>
            <span class="page-box num">3</span>
            <span class="page-box num">4</span>
            <span class="page-box num">5</span>
            <span class="page-box"><i class="fa-solid fa-chevron-down fa-rotate-270" style="color: #FFCE31;"></i></span>
        </div>
    </main>
</body>
</html>
<script>
    basicSetting(); // 기본 셋팅
    headerName('내가남긴 평가보기'); // 현재 페이지 이름
    firstNav(['내정보', '나의활동', '신청내역','관리비'], '나의활동'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    secondNav(['내게시글', '내댓글','내평가','좋아요','상벌점내역'], '내평가'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>