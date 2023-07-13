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
            height: 100%;
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .model-search-box-area{
            width: 900px;
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
            width: 750px;
            height: 60px;
            border: none;
            font-family: 'Noto Sans KR';
        }

        .model-serach-input:focus{
            outline: none;
        }

        .search-btn-area{
            margin-left: 40px;
        }

        .search-btn-area > button{
            width: 130px;
            height: 50px;
            border: none;
            background-color: #3183ff;
            font-weight: bold;
            font-family: 'Noto Sans KR';
            font-size: 20px;
        }

        .white{
            background-color: white;
        }

        .faq-main-area{
            width: 1560px;   
            display: flex;
            flex-direction: row;
        }

        .faq-content-area{
            width: 1060px;
            height: 80px;
        }

        .inquiry-list-category-area{
            background-color: #E7E7E7;
            width: 1060px;
            height: 80px;
            /* border-bottom: 1px solid rgb(156, 156, 156); */
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .inquiry-list-category{
            height: 100%;
            width: 212px;
            /* box-sizing: border-box; */
            display: flex;
            justify-content: center;
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
            font-weight: 900;
        }  

        .yellow{
            color: #FFCE31;
        }

        .red{
            color: #FF3131;
        }

        .blue{
            color: #3172ff;
        }

        .inquiry-list-area > table{
            width: 1060px;
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
            background-color: #d0ecff;
        }

        .inquiry-list-area > table tr > th:nth-of-type(2){
            width: 500px;
        }

        .page-area {
            width: 1060px;
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
            background-color: #3a5ae7;
            color: white;
        }

        .category-color{
            color: #3a5ae7;
        }

        .faq-category-area{
            width: 500px;
            height: 700px;
            background-color: #f5f5f5;
        }

        .faq-category-list{
            width: 100%;
            height: 25%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid rgb(156, 156, 156);
            border-left: 1px solid rgb(156, 156, 156);
        }

        .faq-category-list-text{
            margin-left: 35px;
            font-weight: 900;
            font-size: 30px;
        }

        .faq-category-list-num{
            margin-right: 55px;
            font-weight: 900;
            font-size: 30px;
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
                            <option value="">전체</option>
                            <option value="">카테고리1</option>
                            <option value="">카테고리2</option>
                            <option value="">카테고리3</option>
                            <option value="">카테고리4</option>
                        </select>
                        <input type="text" class="model-serach-input">
                    </div>
                    <div class="search-btn-area">
                        <button type="button">검색</button>
                    </div>

                    
                </div>
            </div>
            
            <div class="faq-main-area">
                <div class="faq-content-area">
                    <div class="inquiry-list-category-area">
                        <div class="inquiry-list-category focus-category">
                            <div class="list-category-text">전체</div>
                        </div>
                        <div class="inquiry-list-category">
                            <div class="list-category-text">카테고리1</div>
                        </div>
                        <div class="inquiry-list-category">
                            <div class="list-category-text">카테고리2</div>
                        </div>
                        <div class="inquiry-list-category">
                            <div class="list-category-text">카테고리3</div>
                        </div>
                        <div class="inquiry-list-category right-border">
                            <div class="list-category-text">카테고리4</div>
                        </div>
                    </div>
        
                    <div class="inquiry-list-area">
                        <table>
                            <tr>
                                <th>분류</th>
                                <th>제목</th>
                                <th>조회수</th>
                                <th>작성일자</th>
                            </tr>
                            <tr>
                                <td>카테고리1</td>
                                <td>제목01</td>
                                <td>1234</td>
                                <td>2023-05-05 17:54</td>
                            </tr>
                            <tr>
                                <td>카테고리1</td>
                                <td>제목01</td>
                                <td>1234</td>
                                <td>2023-05-05 17:54</td>
                            </tr>
                            <tr>
                                <td>카테고리1</td>
                                <td>제목01</td>
                                <td>1234</td>
                                <td>2023-05-05 17:54</td>
                            </tr>
                            <tr>
                                <td>카테고리1</td>
                                <td>제목01</td>
                                <td>1234</td>
                                <td>2023-05-05 17:54</td>
                            </tr>
                            <tr>
                                <td>카테고리1</td>
                                <td>제목01</td>
                                <td>1234</td>
                                <td>2023-05-05 17:54</td>
                            </tr>
                            <tr>
                                <td>카테고리1</td>
                                <td>제목01</td>
                                <td>1234</td>
                                <td>2023-05-05 17:54</td>
                            </tr>
                            <tr>
                                <td>카테고리1</td>
                                <td>제목01</td>
                                <td>1234</td>
                                <td>2023-05-05 17:54</td>
                            </tr>
                            <tr>
                                <td>카테고리1</td>
                                <td>제목01</td>
                                <td>1234</td>
                                <td>2023-05-05 17:54</td>
                            </tr>
        
                        </table>
                    </div>
        
                    <div class="page-area">
                        <button class="blue"><</button>
                        <button>1</button>
                        <button>2</button>
                        <button>3</button>
                        <button>4</button>
                        <button>5</button>
                        <button class="blue">></button>
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
    
                </div>
                <div class="faq-category-area">
                    <div class="faq-category-list">
                        <div class="faq-category-list-text">카테고리1</div>
                        <div class="faq-category-list-num">3</div>
                    </div>
                    <div class="faq-category-list">
                        <div class="faq-category-list-text">카테고리1</div>
                        <div class="faq-category-list-num">3</div>
                    </div>
                    <div class="faq-category-list">
                        <div class="faq-category-list-text">카테고리1</div>
                        <div class="faq-category-list-num">3</div>
                    </div>
                    <div class="faq-category-list">
                        <div class="faq-category-list-text">카테고리1</div>
                        <div class="faq-category-list-num">3</div>
                    </div>
                </div>
            </div>

            
        </main>

</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('고객센터'); // 현재 페이지 이름
    firstNav(['문의 내역', '신고 내역', 'FAQ 관리'], 'FAQ 관리'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>
