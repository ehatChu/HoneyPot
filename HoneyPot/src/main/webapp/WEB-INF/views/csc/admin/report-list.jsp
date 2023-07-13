<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

        .inquiry-category-area{
            background-color: #f5f5f5;
            width: 1560px;
            height: 65px;
            border-bottom: 1px solid rgb(156, 156, 156);
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .inquiry-category-text{
            margin-left: 100px;
            font-size: 18px;
            font-weight: 700;
        }

        input[name=allDate]{
            margin-left: 20px;
        }

        .inquiry-category-text2{
            margin-left: 5px;
            font-size: 14px;
            color: gray;
        }

        input[name=startDate]{
            margin-left: 20px;
            margin-right: 10px;
            width: 130px;
            height: 25px;
        }

        input[name=endDate]{
            margin-left: 10px;
            height: 25px;
            width: 130px;
            margin-right: 50px;
        }

        .answer-category-box{
            margin-left: 20px;
            width: 170px;
            height: 30px;
            margin-right: 50px;
        }

        .content-category-box{
            margin-left: 20px;
            width: 170px;
            height: 30px;
        }

        .inquiry-btn-area{
            background-color: #E7E7E7;
            width: 1560px;
            height: 70px;
            border-bottom: 1px solid rgb(156, 156, 156);
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
        }

        .inquiry-search-btn{
            margin-left: 30px;
            width: 100px;
            height: 45px;
            border: none;
            background-color: #FF3131;
            border-radius: 4px;
            font-weight: 900;
            font-family: 'Noto Sans KR';
            font-size: 20px;
        }

        .inquiry-search-btn:hover{
            cursor: pointer;
        }

        .white{
            background-color: white;
        }

        .inquiry-list-category-area{
            background-color: #E7E7E7;
            width: 1560px;
            height: 80px;
            /* border-bottom: 1px solid rgb(156, 156, 156); */
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .inquiry-list-category{
            height: 100%;
            width: 260px;
            /* box-sizing: border-box; */
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-left: 1px solid rgb(156, 156, 156);
        }
        
        .right-border{
            border-right: 1px solid rgb(156, 156, 156);
        }

        .focus-category{
            background-color: white;
            border-top: 3px solid black;
        }

        .list-category-text{
            font-size: 16px;
            margin-left: 20px;
            font-weight: 900;
        }

        .list-category-num{
            font-weight: 900;
            margin-right: 20px;
        }

        .yellow{
            color: #FFCE31;
        }

        .red{
            color: #FF3131;
        }

        .inquiry-list-area > table{
            width: 1560px;
            text-align: center;
            border-collapse : collapse;
            border-spacing : 0;
        }
        
        .inquiry-list-area > table tr{
            background-color: #f5f5f5;
            height: 60px;
            
        }

        .inquiry-list-area > table tr > th{
            border: 2px solid rgb(156, 156, 156);
        }

        .inquiry-list-area > table tr > td{
            border: 1px solid rgb(156, 156, 156);
        }

        .inquiry-list-area > table tr:not(:first-of-type):hover{
            background-color: #FFD0D0;
        }

        .inquiry-list-area > table tr > th:nth-of-type(2){
            width: 500px;
        }

        .page-area {
            width: 1560px;
            margin-top: 15px;
            display: flex;
            justify-content: center;
        }

        .page-area button {
            display: inline-block;
            font-weight: bold;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            background-color: transparent;
        }

        .page-area button:hover{
            background-color: #fa5555;
            color: white;
        }

        .category-color{
            color: #e73a3a;
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
                            <option value="">이름</option>
                            <option value="">호수</option>
                        </select>
                        <input type="text" class="model-serach-input">
                    </div>
                    
                </div>
            </div>
            <div class="inquiry-category-area">
                <div class="inquiry-category-text">기간</div>
                <input type="checkbox" name="allDate">
                <div class="inquiry-category-text2">전체기간</div>
                <input type="date" name="startDate">
                <div>~</div>
                <input type="date" name="endDate">
                <div class="inquiry-category-text">처리여부</div>
                <select name="" id="" class="answer-category-box">
                    <option value="">전체</option>
                    <option value="">미처리</option>
                    <option value="">처리</option>
                </select>
                <div class="inquiry-category-text">분류</div>
                <select name="" id="" class="content-category-box">
                    <option value="">전체</option>
                    <option value="">카테고리1</option>
                    <option value="">카테고리2</option>
                    <option value="">카테고리3</option>
                    <option value="">카테고리4</option>
                </select>

            </div>
            <div class="inquiry-btn-area">
                <button type="button" class="inquiry-search-btn">검색</button>
                <button type="button" class="inquiry-search-btn white">초기화</button>

            </div>

            <div class="inquiry-list-category-area">
                <div class="inquiry-list-category focus-category">
                    <div class="list-category-text">전체</div>
                    <div class="list-category-num red">3</div>
                </div>
                <div class="inquiry-list-category">
                    <div class="list-category-text">처리완료</div>
                    <div class="list-category-num">3</div>
                </div>
                <div class="inquiry-list-category right-border">
                    <div class="list-category-text">미처리</div>
                    <div class="list-category-num">3</div>
                </div>
            </div>

            <div class="inquiry-list-area">
                <table>
                    <tr>
                        <th>분류</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일자</th>
                        <th>답변일자</th>
                        <th>처리자</th>
                    </tr>

                    <tr>
                        <td>카테고리1</td>
                        <td>제목01</td>
                        <td>작성자01</td>
                        <td>2023-05-05 17:54</td>
                        <td>-</td>
                        <td>답변자01</td>

                    </tr>

                    <tr>
                        <td>카테고리1</td>
                        <td>제목01</td>
                        <td>작성자01</td>
                        <td>2023-05-05 17:54</td>
                        <td>-</td>
                        <td>답변자01</td>

                    </tr>

                    <tr>
                        <td>카테고리1</td>
                        <td>제목01</td>
                        <td>작성자01</td>
                        <td>2023-05-05 17:54</td>
                        <td>-</td>
                        <td>답변자01</td>

                    </tr>

                    <tr>
                        <td>카테고리1</td>
                        <td>제목01</td>
                        <td>작성자01</td>
                        <td>2023-05-05 17:54</td>
                        <td>-</td>
                        <td>답변자01</td>

                    </tr>

                    <tr>
                        <td>카테고리1</td>
                        <td>제목01</td>
                        <td>작성자01</td>
                        <td>2023-05-05 17:54</td>
                        <td>-</td>
                        <td>답변자01</td>

                    </tr>
                    <tr>
                        <td>카테고리1</td>
                        <td>제목01</td>
                        <td>작성자01</td>
                        <td>2023-05-05 17:54</td>
                        <td>-</td>
                        <td>답변자01</td>

                    </tr>
                    
                </table>
            </div>

            <div class="page-area">
                <button class="red"><</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button class="red">></button>
                <!-- <c:if test="${pv.currentPage > 1}">
                    <a class="btn btn-primary btn-sm" href="${root}/board/list?page=${pv.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">이전</a>
                </c:if>
                    <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
                        <c:if test="${pv.currentPage != i}">
                            <a class="btn btn-primary btn-sm" href="${root}/board/list?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">${i}</a>
                        </c:if>
                        <c:if test="${pv.currentPage == i}">
                            <a class="btn btn-primary btn-sm">${i}</a>
                        </c:if>
                    </c:forEach>
                <c:if test="${pv.currentPage < pv.maxPage}">
                    <a class="btn btn-primary btn-sm" href="${root}/board/list?page=${pv.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">다음</a>
                </c:if> -->
            </div>
        </main>

</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('고객센터'); // 현재 페이지 이름
    firstNav(['문의 내역', '신고 내역', 'FAQ 관리'], '신고 내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>