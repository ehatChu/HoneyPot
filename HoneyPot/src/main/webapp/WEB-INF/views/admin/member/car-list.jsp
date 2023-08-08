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
</style>
</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <nav>
            <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
            <!-- <%@ include file="/WEB-INF/views/common/second-nav.jsp" %> -->
        </nav>

        <main>
            <form action="/app/admin/property-list/car" method="get" >
                <div class="inquiry-search-area">
                    <div class="model-search-area">
                        <div class="model-search-box-area">
                            <select class="model-search-category">
                                <option value="">사유물번호</option>
                            </select>
                            <c:if test="${empty searchUniqueNum}">
                                <input type="text" name="uniqueNum" class="model-serach-input">
                            </c:if>
                            <c:if test="${not empty searchUniqueNum}">
                                <input type="text" name="uniqueNum" class="model-serach-input" value="${searchUniqueNum}">
                            </c:if>
                        </div>
                        
                    </div>
                </div>
                <div id="second-line">
                    <div class="flex-blank"></div>
                    <c:if test="${empty searchMineOwner}">
                        <div id="thing-owner">사유물소지인 <input type="text" name="mineOwner" class="margin-left input-box"></div>
                    </c:if>
                    <c:if test="${not empty searchMineOwner}">
                        <div id="thing-owner">사유물소지인 <input type="text" name="mineOwner" class="margin-left input-box" value="${searchMineOwner}"></div>
                    </c:if>
                    <div id="blank999"></div>
                   
                    <div class="flex-blank"></div>
                </div>
                <div id="third-line">
                    <input type="submit" value="검색" class="design-btn color-main"> <input type="reset" value="초기화" class="design-btn btn-reset">
                </div>
            

            <div id="fourth-line">
                <a href="/app/admin/property-list/car?p=1&kinda=CAR&uiqueNum=${searchUniqueNum}&mineOwner=${searchMineOwner}">
                    <div id="all-list" class="flex-line now-focus-white">
                        <div>전체</div>
                        <div id="all-value" class="now-focus-red">${cntAll}</div>
                    </div>
                </a>
                <a href="/app/admin/property-list/car?p=1&kinda=CAR&uiqueNum=${searchUniqueNum}&mineOwner=${searchMineOwner}&status=O">
                    <div id="ok-confirm" class="flex-line">
                        <div>승인완료</div>
                        <div id="ok-value">${cntOk}</div>
                    </div>
                </a>
                <a href="/app/admin/property-list/car?p=1&kinda=CAR&uiqueNum=${searchUniqueNum}&mineOwner=${searchMineOwner}&status=R">
                    <div id="no-confirm" class="flex-line">
                        <div>미처리</div>
                        <div id="no-value">${cntNone}</div>
                    </div>
                </a>
            </div>
        </form>
           
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
                    <span class="page-box"><a href="/app/admin/property-list/car?p=${pv.currentPage-1}&kinda=CAR&uiqueNum=${searchUniqueNum}&mineOwner=${searchMineOwner}&status=${originStatus}"><i class="fa-solid fa-chevron-down fa-rotate-90" style="color: #FFCE31;"></i></a></span>
                </c:if>
                <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
                    <c:if test="${pv.currentPage != i}">
                        <span class="page-box num"><a href="/app/admin/property-list/car?p=${i}&kinda=CAR&uiqueNum=${searchUniqueNum}&mineOwner=${searchMineOwner}&status=${originStatus}">${i}</a></span>
                    </c:if>
                    <c:if test="${pv.currentPage == i}">
                        <span class="page-box num">${i}</span>
                    </c:if>
                </c:forEach>
                <c:if test="${pv.currentPage < pv.maxPage}">
                    <span class="page-box"><a href="/app/admin/property-list/car?p=${pv.currentPage+1}&kinda=CAR&uiqueNum=${searchUniqueNum}&mineOwner=${searchMineOwner}&status=${originStatus}"><i class="fa-solid fa-chevron-down fa-rotate-270" style="color: #FFCE31;"></i></a></span>
                    
                </c:if>
            </div>

            <div id="mine-modal-box">
                <div id="modal-top-area">
					<span class="margin-left-20 text-bold text-size-18">사유물상세정보</span><span><i class="fa-solid fa-xmark fa-2xl margin-right-20 quit-btn" style="color: #000000;"></i></span>
				</div>
                <form action="/app/admin/property-delete" method="get">
                    <div id="modal-main-area">
                        
                            <div id="modal-img-area">
                                <!-- ajax로 json형식의 vo를 받아오면 img src 채워넣기... -->
                                <img id="modal-mine-img">
                            </div>
                            <div id="blank01"></div>
                            <div id="modal-info-area">
                                <div id="modal-info-text-area">
                                    <!-- 사유물 이름 -->
                                    <input type="hidden" name="detailNo">
                                    <input type="hidden" name="detailKinda">
                                    <div class="text-size-18">사유물이름</div>
                                    <div id="modal-mine-name"></div>
                                    <div class="text-size-18">번호판</div>
                                    <div id="modal-mine-number"></div>
                                </div>
                                <div id="modal-btn-area">
                                
                                    <!-- c:if 승인취소 추가해야함 -->
                                    <input type="submit" class="design-btn color-brown" value="승인반려 및 쉬소">
                                </div>
                            </div>
                    </div>
                </form>
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
    const modalBox = document.querySelector("#mine-modal-box");
    tbody.addEventListener("click",(event)=>{
        const bno = event.target.parentNode.children[0].querySelector("input[type=hidden]").value;
       
        const name = document.querySelector("#modal-mine-name");
        const uniqueNum = document.querySelector("#modal-mine-number");
        const img = document.querySelector("#modal-mine-img");
        const detailNo = document.querySelector("input[name=detailNo]");
        const detailKinda = document.querySelector("input[name=detailKinda]");
        modalBox.style.display = "block";
        console.log(bno);
        $.ajax({
                url : "/app/property-detail",
                type : "get",
                data : {
                    no : bno,
                    kinda : "CAR",
                },
                dataType : "json",
                success : function(dataJson){
                    console.log(dataJson.name);
                    console.log(dataJson.uniqueNum);

                    name.innerHTML = dataJson.name;
                    uniqueNum.innerHTML =dataJson.uniqueNum;
                    img.src = "/app/resources/member/mine/"+dataJson.img;
                    detailNo.value = bno;
                    //종류도 받아와서 ajax로 받아서 input의 value로 넣기
                    detailKinda.value = "CAR";
                } ,
                error : function(e){
                    console.log(e);
                } ,
        });

     });   

    //quit-btn누르면 모달창 다운시키기
    const quitBtn = document.querySelector(".quit-btn");
    quitBtn.addEventListener("click",function(){
        modalBox.style.display = "none";
    });

    //승인완누르면 완료된 것만 뜨게 ajax...
   
    const okValue = document.querySelector("#ok-value");
    const allList = document.querySelector("#all-list");
    const allValue = document.querySelector("#all-value");
    const noConfirm = document.querySelector("#no-confirm");
    const uniqueNum = document.querySelector("input[name=uniqueNum]").value;
    const mineOwner = document.querySelector("input[name=mineOwner]").value

    //승인완료
    const okConfirm = document.querySelector("#ok-confirm");
    okConfirm.addEventListener("click",function(){
        //모든요소에 클래스떼주기
        allList.classList.remove("now-focus-white");
        allValue.classList.remove("now-focus-red");
        noConfirm.classList.remove("now-focus-white");
        noConfirm.classList.remove("now-focus-red");

        //클래스 붙여주기 now-focus
        okConfirm.classList.add("now-focus-white");
        okValue.classList.add("now-focus-red");
    })
</script>