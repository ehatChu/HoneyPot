<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/app/resources/css/admin/member/property-list.css">
<style>
    .inquiry-search-area{
        width: 1560px;
        height: 100px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-bottom: 1px solid rgb(156, 156, 156);
        
    }
    .model-search-area{
        display: flex;
        flex-direction: row;
    }
    .model-search-box-area{
        width: 1000px;
        height: 60px;
        background-color: white;
        display: flex;
        flex-direction: row;
        box-shadow: 3px 3px 5px rgb(145, 145, 145);
    }

    .model-search-category{
        padding-left: 10px;
        width: 150px;
        height: 60px;
        border: none;
        font-size: 18px;
        font-family: 'Noto Sans KR';
    }
    .model-serach-category:focus{
            outline: none;
    }
    .model-serach-input{
        padding-left: 15px;
        font-size: 18px;
        width: 850px;
        height: 60px;
        border: none;
        font-family: 'Noto Sans KR';
    }

    .model-serach-input:focus{
        outline: none;
    }
    #second-line {
        height: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-bottom: 1px solid black;
    }
    #second-line > div {
        margin-right: 20px;
        font-size: 20px;
    }
    .flex-blank {
        width: 200px;
    }

    .margin-left {
        margin-left: 30px;
    }
    .input-box {
        padding: 6px 10px;
    }
    #third-line {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 59px;
        align-items: center;
        border-bottom: 1px solid black;
        
    }
    .design-btn {
        padding: 8px 20px;
        border: none;
        font-size: 18px;
        font-weight: 600;
    }
    .color-main {
        background-color: #FFCE31;
    }
    .btn-reset {
        background-color: lightgray;
        margin-left: 30px;
    }
    #fourth-line {
        display: flex;
        justify-content: flex-start;
        height: 50px;
        align-items: center;
        font-size: 17px;
        border-bottom: 1px solid black;
        background-color: #E6E6E6;
    }
    .flex-line {
        display: flex;
        justify-content: space-between;
        width: 200px;
        height: 50px;
        border-right:1px solid black;
        align-items: center;
    }
    .flex-line > div:first-child {
        margin-left: 5px;
    }
    .flex-line > div:last-child {
        margin-right: 5px;
    }
  
   .now-focus-red {
    color: red;
    font-weight: 800;
   }
   .main-header {
        height: 40px;
   }
   .main-table {
    border-collapse: collapse;
    width: 1560px;
    box-sizing: border-box;
   }
   .table-line {
    text-align:  center;
    height: 40px;
   }
   .confirm-btn {
        width: 100px;
        height: 40px;
        border: none;
        font-size: 18px;
        font-weight: 600;
   }
   #btn-area {
        display: flex;
        justify-content: center;
        margin-top: 10px;
   }
  
    #page-area {
        margin-top: 20px;
        text-align: center;
        font-size: 20px;
    }
    .num:hover {
        background-color: #FFCE31;
        border-radius: 5px;
    }
    .page-box {
        padding: 3px 10px;
    }
    a {
        text-decoration: none;
        color: black;
    }
    .paging-btn {
       border: none;
       width: 20px;
       height: 20px;
       
    }
    .color-brown {
        background-color: #4A321F;
        color: white;
    }
    /* 모달관련 */
    #mine-modal-box {
        width: 800px;
        height: 400px;
        background-color: white;
        position: fixed;
        top: 200px;
        left: 600px;
        display: none;
        border-radius: 30px 30px 0px 0px;
    }

    #modal-top-area {
        width: 800px;
        height: 50px;
        background-color: #FFCE31;
        border-radius: 20px 20px 0px 0px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    #modal-img-area {
        width: 350px;
        height: 300px;
        border: 1px solid black;
    }

    #modal-mine-img {
        object-fit: fill;
        width: 350px;
        height: 300px;
    }
    #modal-info-area {
        width: 350px;
        height: 300px;
        border: 1px solid black;
    }   
    #modal-main-area {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 350px;
    }
    #blank01 {
        width: 32px;
    }
    #modal-info-text-area {
        padding-top: 30px;
        display: grid;
        grid-template-columns: 1.2fr 3fr;
        height: 100px;
    }
    #modal-btn-area {
        display: flex;
        justify-content: center;
        height: 180px;
        align-items: end;
    }
    /* 공용클래스 */
    .margin-left-20 {
        margin-left: 20px;
    }
    .margin-right-20 {
        margin-right: 20px;
    }
    .text-bold {
        font-weight: 700;
    }
    .text-size-18 {
        font-size: 18px;
    }
    .text-size-22 {
        font-size: 22px;
    }
    .now-focus-white {
        background-color: white;
        border: 1px solid black;
    }
    #blank999 {
        width: 30px;
    }
    #main-mine-line {
        height: 400px;
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
            <form action="/app/admin/innerFac/reservation?p=1" method="get" >
                <div class="inquiry-search-area">
                    <div class="model-search-area">
                        <div class="model-search-box-area">
                            <select class="model-search-category">
                                <option value="">예약자명</option>
                            </select>
                            <c:if test="${empty searchName}">
                                <input type="text" name="name" class="model-serach-input">
                            </c:if>
                            <c:if test="${not empty searchName}">
                                <input type="text" name="name" class="model-serach-input" value="${searchName}">
                            </c:if>
                        </div>
                        
                    </div>
                </div>
                <!-- <div id="second-line">
                    <div class="flex-blank"></div>
                    <c:if test="${empty searchMineOwner}">
                        <div id="thing-owner">사유물소지인 <input type="text" name="mineOwner" class="margin-left input-box"></div>
                    </c:if>
                    <c:if test="${not empty searchMineOwner}">
                        <div id="thing-owner">사유물소지인 <input type="text" name="mineOwner" class="margin-left input-box" value="${searchMineOwner}"></div>
                    </c:if>
                    <div id="blank999"></div>
                   
                    <div class="flex-blank"></div>
                </div> -->
                <div id="second-line">
                    <div id="dutation">
                        <span class="font-bold size-middle">기간</span><span><input type="date" name="startDate" class="margin-left" value="${searchStartDate}">&#x2001;~&#x2001;<input type="date" name="endDate" value="${searchEndDate}"></span>
                    </div>
                    <div id="time">
                        <span class="font-bold size-middle">시작시간</span><span><input type="time" name="startTime" value="${searchStartTime}" class="margin-left"></span>
                    </div>
                    <div id="facilities" class="font-bold size-middle">
                        시설 
                        <select name="no">
                            <option value="100">전체</option>
                            <option value="1">도서관</option>
                            <option value="2">수영장</option>
                            <option value="3">헬스장</option>
                            <option value="4">골프장</option>
                        </select>
                    </div>
                    
                </div>
                <div id="third-line">
                    <input type="submit" value="검색" class="design-btn color-main"> <input type="reset" value="초기화" class="design-btn btn-reset">
                </div>
            

            
        </form>
           
            <div id="main-mine-line">
                <div>
                    <table class="main-table" border="1">
                        <thead>
                            <tr class="main-header">
                                <th>예약자명</th>
                                <th>동</th>
                                <th>호수</th>
                                <th>시설명</th>
                                <th>예약일시</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="vo" items="${facVoList}">
                                <tr class="table-line">
                                    <td>${vo.memberName}</td>
                                    <td>${vo.dongNum}</td>
                                    <td>${vo.hoNum}</td>
                                    <td>${vo.amenityName}</td>
                                    <td>${vo.reserveTime}</td>
                                </tr>
                            </c:forEach>
                            
                        </tbody>
                    </table>
                </div>
               

            </div>
            

            <c:if test="${not empty pv}">
	            <div id="page-area">
	                <c:if test="${pv.currentPage > 1}">
	                    <span class="page-box"><a href="/app/admin/innerFac/reservation?p=${pv.currentPage-1}&name=${searchName}&startDate=${searchStartDate}&endDate=${searchEndDate}&startTime=${searchStartTime}"><i class="fa-solid fa-chevron-down fa-rotate-90" style="color: #FFCE31;"></i></a></span>
	                </c:if>
	                <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
	                    <c:if test="${pv.currentPage != i}">
                            <!-- "/app/admin/innerFac/reservation?p=${pv.currentPage-1}&name=${searchName}&startDate={searchStartDate}&endDate={searchEndDate}&startTime=${searchStartTime}" -->
	                        <span class="page-box num"><a href="/app/admin/innerFac/reservation?p=${i}&name=${searchName}&startDate=${searchStartDate}&endDate=${searchEndDate}&startTime=${searchStartTime}">${i}</a></span>
	                    </c:if>
	                    <c:if test="${pv.currentPage == i}">
	                        <span class="page-box num">${i}</span>
	                    </c:if>
	                </c:forEach>
	                <c:if test="${pv.currentPage < pv.maxPage}">
	                    <span class="page-box"><a href="/app/admin/innerFac/reservation?p=${pv.currentPage+1}&name=${searchName}&startDate=${searchStartDate}&endDate=${searchEndDate}&startTime=${searchStartTime}"><i class="fa-solid fa-chevron-down fa-rotate-270" style="color: #FFCE31;"></i></a></span>
	                    
	                </c:if>
	            </div>
            </c:if>
            

          
        </main>

</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('단지관리'); // 현재 페이지 이름
	firstNav(['관리비', '편의시설', '조식관리'], '편의시설'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['도서관','수영장','헬스장','골프장','예약자통합조회'], '예약자통합조회');
    firstNavLink(['/app/fee/admin','/app/admin/innerFac/editInfo?facNo=1','/app/meal/ameal']);
    secondNavLink(['/app/admin/innerFac/editInfo?facNo=1','/app/admin/innerFac/editInfo?facNo=2','/app/admin/innerFac/editInfo?facNo=3','/app/admin/innerFac/editInfo?facNo=4','/app/admin/innerFac/reservation?p=1'],);

    
</script>
