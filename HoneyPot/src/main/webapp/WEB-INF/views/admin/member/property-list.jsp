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
        justify-content: space-around;
        align-items: center;
        border-bottom: 1px solid black;
    }
    #second-line > div {
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
        height: 50px;
        align-items: center;
        border-bottom: 1px solid black;
        
    }
    .design-btn {
        width: 100px;
        height: 40px;
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
    .flex-line:first-child {
        background-color: white;
        border: 1px solid black;
    }
   .now-focus {
    color: red;
    font-weight: 800;
   }
   .main-header {
        height: 50px;
   }
   .main-table {
    border-collapse: collapse;
    width: 1560px;
    height: 450px;
    box-sizing: border-box;
   }
   .table-line {
    text-align:  center;
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
    #mine-modal-box {
        width: 800px;
        height: 400px;
        background-color: white;
        position: fixed;
        top: 200px;
        left: 600px;
        display: none;
    }
</style>
</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <nav>
            <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
            <!-- <%@ include file="/WEB-INF/views/common/second-nav.jsp" %> -->
        </nav>

        <main>
            <div class="inquiry-search-area">
                <div class="model-search-area">
                    <div class="model-search-box-area">
                        <select name="" id="" class="model-search-category">
                            <option value="">사유물번호</option>
                        </select>
                        <input type="text" class="model-serach-input">
                    </div>
                    
                </div>
            </div>
            <div id="second-line">
                <div class="flex-blank"></div>
                <div id="thing-owner">사유물소지인 <input type="text" class="margin-left input-box"></div>
                <div id="proceeding-status">
                    처리유무
                    <select name="proceeding-status" class="margin-left input-box">
                        <option value="0">전체</option>
                        <option value="10">처리완료</option>
                        <option value="20">처리중</option>
                    </select>
                </div>
                <div id="car-or-bicycle">
                    분류
                    <select name="car-or-bicycle" class="margin-left input-box">
                        <option value="0">전체</option>
                        <option value="10">자동차</option>
                        <option value="20">자전거</option>
                    </select>
                </div>
                <div class="flex-blank"></div>
            </div>
            <div id="third-line">
                <input type="button" value="검색" class="design-btn color-main"> <input type="reset" value="초기화" class="design-btn btn-reset">
            </div>
            <div id="fourth-line">
                <div class="flex-line">
                    <div>전체</div><div class="now-focus">1920</div>
                </div>
                <div class="flex-line">
                    <div>승인완료</div>
                    <div>132</div>
                </div>
                <div class="flex-line">
                    <div>미처리</div>
                    <div>12</div>
                </div>
            </div>
            <form action="${root}/admin/confirm/property">
                <div id="main-mine-line">
                    <table class="main-table" border="1">
                       <thead>
                           <tr class="main-header">
                               <th><input type="checkbox"></th>
                               <th>사유물명</th>
                               <th>소지인</th>
                               <th>연락처</th>
                               <th>작성일자</th>
                               <th>처리일자</th>
                               <th>처리자</th>
                           </tr>
                       </thead>
                       <tbody>
                           <c:forEach var="mineVo" items="${mineVoList}">
                               <tr class="table-line">
                                   <td><input type="checkbox"><input type="hidden" value="${mineVo.no}"></td>
                                   <td>${mineVo.name}</td>
                                   <td>${mineVo.memberName}</td>
                                   <td>${mineVo.phone}</td>
                                   <td>${mineVo.enrollDate}</td>
                                   <td>
                                   <c:if test="${empty mineVo.confirmDate}">
                                   -
                                   </c:if>
                                      <c:if test="${not empty mineVo.confirmDate}">
                                   ${mineVo.confirmDate}                                                                
                                   </c:if>
                                   </td>
                                   <td>${mineVo.adminName}</td>
                               </tr>
                           </c:forEach>
                           
                       </tbody>
                   </table>
   
               </div>
               <div id="btn-area">
                    <input type="submit" class="confirm-btn color-main" value="승인완료">
               </div>
            </form>
           
            <div id="page-area">
                <c:if test="${pv.currentPage > 1}">
                    <span class="page-box"><a href="/app/property-list?p=${pv.currentPage-1}"><i class="fa-solid fa-chevron-down fa-rotate-90" style="color: #FFCE31;"></i></a></span>
                </c:if>
                <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
                    <c:if test="${pv.currentPage != i}">
                        <span class="page-box num"><a href="/app/property-list?p=${i}">${i}</a></span>
                    </c:if>
                    <c:if test="${pv.currentPage == i}">
                        <span class="page-box num">${i}</span>
                    </c:if>
                </c:forEach>
                <c:if test="${pv.currentPage < pv.maxPage}">
                    <span class="page-box"><a href="/app/property-list?p=${pv.currentPage+1}"><i class="fa-solid fa-chevron-down fa-rotate-270" style="color: #FFCE31;"></i></a></span>
                    
                </c:if>
            </div>

            <div id="mine-modal-box">
                <input type="hidden" id="modal-ddd" >

                ${mineVoList.get(3).name}
                
            </div>
        </main>

</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    firstNav(['회원조회', '제재내역', '상벌점내역', '사유물내역'], '사유물내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

    // 해당 줄을 누르면 상세정보가 담긴 modal띄우기
    const tbody = document.querySelector('tbody');
    tbody.addEventListener("click",(event)=>{
        const bno = event.target.parentNode.children[0].querySelector("input[type=hidden]").value;
        const modalBox = document.querySelector("#mine-modal-box");
        modalBox.style.display = "block";
        console.log(bno);
        const ddd = document.querySelector("#modal-ddd");
        ddd.value = bno;
    });   
</script>
