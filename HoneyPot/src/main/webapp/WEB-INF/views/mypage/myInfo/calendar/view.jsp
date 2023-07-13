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
    input[type=radio]{
        display: none;
    }
    .star-font-size{
        font-size: 2em;
        /* color: transparent; */
    }

   .color-gray {
        color: transparent; 
        text-shadow: 0 0 0 lightgray;
        
   }


    .middle-text-size {
        font-size: 17px;
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
        <div class="star-font-size star-shape zz" style="background-color: red; width: 100px; height: 100px;">⭐안녕22</div>
        <div id="main-wrapper">
            <div id="calendar-area"> 
                <h1>캘린더</h1>
                <div id='calendar'></div>
            </div>
            <div id="schedule-area">
                <h1><span id="clickDate"></span>의 일정</h1>
                <div class="text-bold">아파트일정</div>
                <div>
                    <div class="star-font-size star-shape zz" style="background-color: red; width: 100px; height: 100px;">⭐안녕</div>
                    <c:forEach var="i" begin="1" end="4">
                        <div>
                            <span class="middle-text-size">아파트 리모델링 예정</span>
                        </div>

                    </c:forEach>
                    
                   
                </div>
                <div class="text-bold">개인일정</div>
                <div>

                </div>
            </div>
        </div>
    </main>
</body>
</html>

<script>
    //star-shape누르면 class추가하고 또누르면 class뺏기
    const starShape = document.querySelectorAll(".zz");
    

    x = document.querySelector('.zz');
console.log(x);
x.addEventListener('click' , function(){
    alert(123);
});

    
    //기본값으로 오늘 날짜가 들어가게
    let today = new Date();
    var clickDate = document.querySelector("#clickDate");
    clickDate.innerHTML= dateFormat(today);

    
    //날짜포메팅 (2017-03-20(월))
    function dateFormat(date) {
        let dateFormat2 = date.getFullYear() +
            '-' + ( (date.getMonth()+1) < 9 ? "0" + (date.getMonth()+1) : (date.getMonth()+1) )+
            '-' + ( (date.getDate()) < 9 ? "0" + (date.getDate()) : (date.getDate()) )
            +'('+getDayOfWeek(date)+')';
        return dateFormat2;
    }	

    //요일구하기
    function getDayOfWeek(date) {
        const week = ["일","월","화","수","목","금","토",];
        const dayOFWeek = week[new Date(date).getDay()];
        return dayOFWeek;
    }

    //FULL CALENDAR
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var clickDate = document.querySelector("#clickDate");
        var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth'
        ,selectable: true
        ,selecMirro : true
        ,dateClick : function(info) {
            alert(info.dateStr);
            clickDate.innerHTML=dateFormat(new Date(info.dateStr));
        }
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