<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    #first-line {
        height: 80px;
        display: grid;
        grid-template-columns: 1fr 0.85fr 0.5fr 0.5fr;
        align-items: center;
        border-bottom: 1px solid black;
    }
    #first-line > div {
        /* border: 1px solid black; */
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-right: 35px;

    }

    #first-line > div:first-child{
        margin-left: 20px;
    }
    .font-bold {
        font-weight: 600;
    }
    .size-middle {
        font-size: 23px;
    }
    input {
        padding: 5px;
    }
    select {
        width: 150px;
        padding: 5px;
    }
    .check {
        transform: scale(1.5);
        margin-right: 10px;
        /* font-family: 'Noto Sans KR';
        font-size: 30px; */
    }
    .big-btn {
        padding: 7px 50px;
        font-size: 23px;
        font-weight: 700;
        font-family: 'Noto Sans KR';
    }
    #second-line {
        height: 80px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-bottom: 1px solid black;
        box-sizing: border-box;
    }
    .margin-right {
        margin-right: 20px;
    }
    .margin-left {
        margin-left: 10px;
    }
    body * {
        font-family: 'Noto Sans KR';
    }
    .color-main {
        background-color: #FFCE31;
        border: none;
    }
    .color-gray {
        background-color: #D9D9D9;
        border: none;
    }
    table {
        border-collapse: collapse;
        width: 1560px;
        height: 500px;
        box-sizing: border-box;
    } 
    input[type="checkbox"] {
        transform: scale(1.5);
    }
    .main-header {
        height: 50px;
    }
    .table-line {
        text-align: center;
    }
    .color-red {
        background-color: red;
        border: none;
    }
    #result-line {
        text-align: center;
        margin-top: 10px;
    }
    #page-area{
        margin-top: 10px;
    }
    .table-line:hover td {
        background-color: #ffeeb7;
    }
    #page-area {
        margin-top: 20px;
        text-align: center;
        font-size: 30px;
    }
    .num:hover {
        background-color: #FFCE31;
        border-radius: 5px;
    }
    .page-box {
        padding: 3px 10px;
    }
</style>
<!-- 해당페이지는 facilities/admin/reserve-list -->
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <nav>
        <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
       
    </nav>

    <main>
        <form action="">
            <div id="first-line">
                <div id="dutation">
                    <span class="font-bold size-middle">기간</span><span><input type="checkbox" class="check">전체기간<input type="date" class="margin-left">&#x2001;~&#x2001;<input type="date"></span>
                </div>
                <div id="time">
                    <span class="font-bold size-middle">시간</span><span><input type="checkbox" class="check">하루<input type="time" class="margin-left">&#x2001;~&#x2001;<input type="time"></span>
                </div>
                <div id="facilities" class="font-bold size-middle">
                    시설 
                    <select name="facility">
    
                        <option value="0">전체</option>
                        <option value="10">도서관</option>
                        <option value="10">수영장</option>
                        <option value="10">헬스장</option>
                        <option value="10">골프장</option>
                    </select>
                </div>
                <div id="dong" class="font-bold size-middle">
                    동
                    <select name="dong">
    
                        <option value="0">전체</option>
                        <option value="11">101동</option>
                        <option value="12">102동</option>
                        <option value="13">103동</option>
                        <option value="14">104동</option>
                        <option value="21">201동</option>
                        <option value="22">202동</option>
                        <option value="23">203동</option>
                        <option value="24">204동</option>
                        <option value="31">301동</option>
    
                    </select> 
                </div>
            </div>
            <div id="second-line">
                <input type="button" value="검색" class="big-btn margin-right color-main"><input type="reset" value="초기화" class="big-btn color-gray">
            </div>
        </form>
        
        <div id="third-line">
            <table border="1">
                <thead>
                    <tr class="main-header">
                        <th><input type="checkbox"></th>
                        <th>예약번호</th>
                        <th>예약시설</th>
                        <th>예약자</th>
                        <th>예약일시</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="i" begin="1" end="8">
                        <tr class="table-line">
                            <td><input type="checkbox"></td>
                            <td>101006</td>
                            <td>도서관</td>
                            <td>홍길동</td>
                            <td>2022-07-02 17:00~18:00</td>
                            <td>예약</td>
                        </tr>
                   </c:forEach>
                </tbody>
            </table>
        </div>
        <div id="result-line">
            <button class="big-btn color-red">강제취소</button>
            <div id="page-area">
                <span class="page-box"><i class="fa-solid fa-chevron-down fa-rotate-90" style="color: #FFCE31;"></i></span>
                <span class="page-box num">1</span>
                <span class="page-box num">2</span>
                <span class="page-box num">3</span>
                <span class="page-box num">4</span>
                <span class="page-box num">5</span>
                <span class="page-box"><i class="fa-solid fa-chevron-down fa-rotate-270" style="color: #FFCE31;"></i></span>
            </div>
        </div>
    </main>

</body>
</html>
<script>
    basicSetting(); // 기본 셋팅
    headerName('고객센터'); // 현재 페이지 이름
    firstNav(['도서관', '수영장', '헬스장','골프장','예약자통합관리'], '예약자통합관리'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
</script>