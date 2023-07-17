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
    input[type="checkbox"] {
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
    }
    .margin-right {
        margin-right: 20px;
    }
    .margin-left {
        margin-left: 10px;
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
                    <span class="font-bold size-middle">기간</span><span><input type="checkbox">전체기간<input type="date" class="margin-left">&#x2001;~&#x2001;<input type="date"></span>
                </div>
                <div id="time">
                    <span class="font-bold size-middle">시간</span><span><input type="checkbox">하루<input type="time" class="margin-left">&#x2001;~&#x2001;<input type="time"></span>
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
                <input type="button" value="검색" class="big-btn margin-right"><input type="reset" value="초기화" class="big-btn">
            </div>
        </form>
        
        <div id="third-line"></div>
        <div id="result-line"></div>
    </main>

</body>
</html>
<script>
    basicSetting(); // 기본 셋팅
    headerName('고객센터'); // 현재 페이지 이름
    firstNav(['도서관', '수영장', '헬스장','골프장','예약자통합관리'], '예약자통합관리'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
</script>