<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view calendar</title>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<style>
    #main-wrapper {
        display: grid;
        grid-template-columns: 0.8fr 1fr;
        height: 700px;
    }

    #main-wrapper > div {
        padding :10px;
        border: 3px solid red;
       
    }
    #calendar {
        margin-top: 15px;
        padding: 10px;
        border-radius: 10px;
        background-color: white;
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
        <div id="main-wrapper">
            <div id="calendar-area"> 
                <h1>캘린더</h1>
                <div id='calendar'></div>
            </div>
            <div id="schedule-area">
                의 일정
            </div>
        </div>
    </main>
</body>
</html>
<script>

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth'
        ,selectable: true
        ,selecMirro : true
        });
        calendar.render();
    });

</script>
<script>
    basicSetting(); // 기본 셋팅
    headerName('마이페이지'); // 현재 페이지 이름
    firstNav(['내정보', '나의활동', '신청내역','관리비'], '내정보'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    secondNav(['캘린더', '가계부','사유물'], '캘린더'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>