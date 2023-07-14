<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/app/resources/css/admin/member/property-list.css">
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
    headerName('회원관리'); // 현재 페이지 이름
    firstNav(['회원조회', '제재내역', '상벌점내역', '사유물내역'], '제재내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

</script>
