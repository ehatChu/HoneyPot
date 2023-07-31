<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" href="/app/resources/css/csc/admin/faq.css">

</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <nav>
            <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
            <!-- <%@ include file="/WEB-INF/views/common/second-nav.jsp" %> -->
        </nav>

        <main>
            <div class="faq-search-area">
                <div class="faq-search">
                    <div class="faq-search-box-area">
                        <select name="" id="" class="faq-search-category">
                            <option value="TITLE">제목</option>
                        </select>
                        <input type="text" class="faq-serach-input">
                    </div>
                    <div class="faq-search-btn-area">
                        <button type="button">검색</button>
                    </div>

                    
                </div>
            </div>
            
            <div class="faq-main-area">
                <div class="faq-content-area">
                    <div class="faq-list-category-area">
                        <a href="" class="faq-list-category focus-category">
                            <div class="faq-list-category-text">전체</div>
                        </a>
                        <c:forEach items="${cList}" var="vo">
	                        <a href="" class="faq-list-category right-border">
	                            <div class="faq-list-category-text">${vo.name}</div>
	                        </a>
                        </c:forEach>
                    </div>
        
                    <div class="faq-list-area">
                        <table>
                            <tr>
                                <th>분류</th>
                                <th>제목</th>
                                <th>조회수</th>
                                <th>작성일자</th>
                            </tr>
							<c:forEach items="${fList}" var="vo">
								<tr>
									<td>${vo.faqCname}</td>
									<td>${vo.question}</td>
									<td>${vo.hit}</td>
									<td>${vo.enrollDate}</td>
								</tr>
							</c:forEach>
        
                        </table>
                    </div>
        
                    <div class="page-area">
                        <c:if test="${pvo.currentPage > 1}">
                            <a href="/app/admin/csc/faq?page=${pvo.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}"><</a>
                        </c:if>
                            <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" step="1" var="i">
                                <c:if test="${pvo.currentPage != i}">
                                    <a href="/app/admin/csc/faq?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">${i}</a>
                                </c:if>
                                <c:if test="${pvo.currentPage == i}">
                                    <a id="current-page">${i}</a>
                                </c:if>
                            </c:forEach>
                        <c:if test="${pvo.currentPage < pvo.maxPage}">
                            <a href="/app/admin/csc/faq?page=${pvo.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">></a>
                        </c:if>
                    </div>
    
                </div>

                <div class="faq-category-area">
                	<c:forEach items="${cList}" var="vo">
                		<div class="faq-category-list">
	                        <div class="faq-category-list-text">${vo.name}</div>
	                        <div class="faq-category-list-num">3</div>
                    	</div>
                	</c:forEach>
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
