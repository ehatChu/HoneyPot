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
        grid-template-columns: 1.2fr 1fr;
        height: 700px;
    }

    #main-wrapper > div {
        padding :10px;
      
       
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
        font-size: 1.5em;
        /* color: transparent; */
        
    }

    .color-gold {
        color: transparent; 
        text-shadow: 0 0 0 #FFD601;
        
    }
    
    .color-gray {
         color: transparent; 
         text-shadow: 0 0 0 lightgray;
         
    }
    .middle-text-size {
        font-size: 19px;
        font-weight: 600;
    }
    .cursor {
        cursor: pointer;
    }
    #schedule-area1 {
        margin: 10px;
        padding: 10px;
        background-color: white;
        border-radius: 10px;
        
    }
    #schedule-area2 {
        margin: 10px;
        padding: 10px;
        background-color: white;
        border-radius: 10px;
        
    }
    .calendar-text-bold {
        margin-top: 10px;
        font-size: 20px;
        font-weight: 600;
    }
    h1 {
        text-align: center; 
    }
    #scheduler-btn {
        padding: 5px 10px;
        background-color: #FFD601;
        border: none;
        border-radius: 5px;
    }
    .modal-background {
		position: fixed;
		top:0; left: 0; bottom: 0; right: 0;
		background: rgba(0, 0, 0, 0.4);
        z-index: 100;
	}
    #modal-top {
		width: 500px;
		height: 50px;
		background-color: #FFCE31;
		border-radius: 20px 20px 0px 0px;
		display: flex;
		align-items: center;
		justify-content: space-between;
	}

	#scheduler{
		width: 500px;
		height: 380px;
		background-color: white;
	
		border-radius: 30px 30px 0px 0px;
	}
    #modal-box {
        z-index: 10000;
        position: fixed;
		top: 200px;
		left: 800px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #modal-header {
        font-size: 20px;
        padding-left: 10px;
        font-weight: 600;
    }
    .quit-btn {
        padding-right: 10px;
    }
   
    #modal-content {
        display: grid;
        width: 410.4px;
        grid-template-columns: 1fr 1fr;
        grid-row: 1fr 1fr 0.8fr;
        grid-row-gap: 20px;
        
    }
    #modal-content >div {
        /* border: 1px solid black; */
    }
    #modal-content > div:nth-child(3){
        grid-column: span 2;
    }
    #modal-content > div:nth-child(4){
        grid-column: span 2;
    }

    #schedule-btn {
        width: 410.4px;
        padding: 20px 120px;
        font-size: 26px;
        font-weight: 800;
        background-color: #FFCE31;
        border: none;
        border-radius: 10px;
    }
    * {
        font-family: 'Noto Sans KR';
    }
    .font-size-bold {
        font-size: 18px;
        font-weight: 600;
        color: gray;
    }
    .input {
        padding: 5px 10px;
    }
    .input-text {
        width: 410.4px;
        padding: 10px 0px;
    }
    .input-date {
        width: 190px;
    }
    #modal-area {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 50px;
    }
    #modal-content > div:nth-child(2){
        margin-left: 13.53px;
    }
    .small-text-size {
        font-size: 15px;
    }
    .cal-margin-right {
        margin-right: 10px;
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
                <h1><span id="clickDate"></span>의 일정 <button id="scheduler-btn">일정짜기</button></h1>
                    <div class="calendar-text-bold">아파트일정</div>
                    <div id="schedule-area1">
                     
                    </div>
                <form action="/app/calendar/personal-delete">
                    <div class="calendar-text-bold">개인일정</div>
                    <div id="schedule-area2">
                        <!-- <c:forEach var="i" begin="1" end="10">
                            <div>
                                <span id="star" class="star-font-size color-gold cursor">⭐</span>   
                                <span class="middle-text-size">아파트 리모델링 예정</span>
                            </div>
                        </c:forEach> -->
                    </div>
                </form>
            </div>
            <div id="modal-box" style="display: none;">
                <div id="scheduler">
                    <div id="modal-top">
                        <span id="modal-header">일정만들기</span><span><i class="fa-solid fa-xmark fa-2xl margin-right quit-btn" style="color: #000000;"></i></span>
                    </div>
                    <form action="/app/calendar/regi-schedule" method="post">
                        <div id="modal-area">
                            <div id="modal-content">
                                <div>
                                    <div class="font-size-bold">시작날짜</div>
                                    <div><input class="input input-date" type="date" name="startDate"></div>
                                </div>
                                <div>
                                    <div class="font-size-bold">끝날짜</div>
                                    <div><input class="input input-date" type="date" name="endDate"></div>
                                </div>
                                <div>
                                    <div class="font-size-bold">일정이름</div>
                                    <div><input class="input input-text" type="text" placeholder="10글자 이내로 작성해주세요." name="scheduleName"></div>
                                </div>
                                <div><input type="submit" id="schedule-btn" value="일정짜기"></div>
                    
                            </div>
                        </div>
                        
                    </form>
                    
                    
                </div>
            </div>
        </div>
    </main>
</body>
</html>
<script>
    basicSetting(); // 기본 셋팅
    headerName('마이페이지'); // 현재 페이지 이름
    firstNav(['내정보', '나의활동', '신청내역','관리비'], '내정보'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    secondNav(['캘린더', '가계부','사유물'], '캘린더'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>
<script> 
    
    //누르면 onclick되게
    let starList = document.querySelectorAll("#star");
    for(let star of starList){
        star.addEventListener("click",function(){
            star.classList.toggle('color-gray');
        });
    }
    
    
  
 
    //기본값으로 오늘 날짜가 들어가게
    let today = new Date();
    var clickDate = document.querySelector("#clickDate");
    clickDate.innerHTML= dateFormat(today);

    
    //날짜포메팅 (2017-03-20(월))
    function dateFormat(date) {
        let dateFormat2 = date.getFullYear() +
            '-' + ( (date.getMonth()+1) < 9 ? "0" + (date.getMonth()+1) : (date.getMonth()+1) )+
            '-' + ( (date.getDate()) <= 9 ? "0" + (date.getDate()) : (date.getDate()) )
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
            Plugin : ['interaction','dayGrid']
            ,editable : false
            ,initialView: 'dayGridMonth'
            ,selectable: true
            ,selecMirro : true
            ,dateClick : function(info) {
                clickDate.innerHTML=dateFormat(new Date(info.dateStr));
                //클릭하면 ajax로 서버와 통신하여 json형식의 data받아오기
                //일단 ajax가 잘되는지 부터 보자
                $.ajax({
                    url : "/app/calendar/apart-schedule",
                    type : "post",
                    data : {
                        selectedDate : dateFormat(new Date(info.dateStr)),
                    },
                    dataType : 'json',
                    success : function(data){

                        
                        console.log(data);
                        const AdminArea = document.querySelector("#schedule-area1");
                        let str ="";
                       for(let i=0;i<data.length;i++){
                            str+="<div>";
                            str+="<span class='middle-text-size cal-margin-right'>"+data[i].name+"</span>";
                            str+="<span class='small-text-size cal-margin-right'>";
                            //시작날짜와 끝날짜가 같으면 
                            if(data[i].startDate==data[i].endDate){
                                str+=data[i].startDate;
                            }else {
                                str+=data[i].startDate+"~"+data[i].endDate;
                            }
                            str+="</span>"
                            str+="<span class='small-text-size cal-margin-right'>"+data[i].writerName+"</span>";
                            str+="</div>"
                       }
                       AdminArea.innerHTML=str;
                        //여기서버튼을 가져오면 될듯
                        //딜리트버튼 누르면 DB에서 삭제하기
                        const deleteBtn = document.querySelectorAll(".delete-btn");
                        console.log(deleteBtn);
 
                    },
                    error : function(e){
                        console.log("이잉에러");
                    },
                });
                $.ajax({
                    url : "/app/calendar/personal-schedule",
                    type : "post",
                    data : {
                        selectedDate : dateFormat(new Date(info.dateStr)),
                    },
                    dataType : 'json',
                    success : function(data){
                        // console.log("같은걸 클릭했는데 2개의 ajax가 발동한다구? 이게가능해?");
                        console.log(data);
                        const AdminArea2= document.querySelector("#schedule-area2");
                        let str ="";
                       for(let i=0;i<data.length;i++){
                            str+="<div>";
                            str+="<span class='middle-text-size cal-margin-right'>"+data[i].name+"</span>";
                            str+="<span class='small-text-size cal-margin-right'>";
                            //시작날짜와 끝날짜가 같으면 
                            if(data[i].startDate==data[i].endDate){
                                str+=data[i].startDate;
                            }else {
                                str+=data[i].startDate+"~"+data[i].endDate;
                            }
                            str+="</span>"
                            str+="<span class='cal-margin-right'><a href='/app/calendar/delete-personal?sNum="+data[i].no+"'>"
                            str+="<i class='fa-solid fa-xmark fa-xl margin-right delete-btn' style='color: #000000;''></i></a></span>";
                            str+="</div>"
                       }
                       AdminArea2.innerHTML=str;
                    },
                    error : function(e){
                        console.log("같은 클릭에 ajax가 2개이상 됨.");
                    },
                });
            }
            ,events : function(info, successCallback,failureCallback) {
                $.ajax({
                    type : 'post'
                    ,cache : false
                    ,url : '/app/calendar/represent-schedule'
                    ,dataType : 'json'
                    ,contentType : "application/x-www-form-urlencoded; charset=UTF-8"
                    ,success : function(param){
                        var events = [];
                        $.each(param,function (intdex, data) {
                            if(data.writerName == '관리소장'){
                                events.push({
                                    title : data.name,
                                    start : data.startDate,
                                    end : data.endDate,
                                    color : '#B70404'
                                });
                            }else if(data.writerName =="동대표"){
                                events.push({
                                    title : data.name,
                                    start : data.startDate,
                                    end : data.endDate,
                                    color : '#4A321F'
                                });
                            }else {
                                events.push({
                                    title : data.name,
                                    start : data.startDate,
                                    end : data.endDate,
                                    color : '#FFCE31'
                                });
                            }
                        })
                        successCallback(events);
                       
                    }
                    ,error : function(e){
                        console.log(e);
                    }


                });                
            }
            


        });
        calendar.render();

    
    });

    
   
    //버튼 누르면 모달창 띄우기
    //일정만들기 버튼
    let schedulerBtn = document.querySelector("#scheduler-btn");
    //모달창
    let modal = document.querySelector("#modal-box");
    //메인
    let main = document.querySelector("main");
    //X아이콘
    let quitBtn = document.querySelector(".quit-btn");

    //모달창 
    schedulerBtn.addEventListener("click",function(){
        modal.style.display = "block";
        main.classList.add("modal-background");
    });
    //모달 닫기
    quitBtn.addEventListener("click",function(){
        modal.style.display="none";
        main.classList.remove("modal-background");
    });

    
</script>

