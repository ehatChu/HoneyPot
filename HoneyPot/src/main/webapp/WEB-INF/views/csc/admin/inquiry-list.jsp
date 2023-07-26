<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" href="/app/resources/css/csc/admin/inquiry-list.css">

</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <nav>
            <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
            <!-- <%@ include file="/WEB-INF/views/common/second-nav.jsp" %> -->
        </nav>

        <main>
            <form action="/app/admin/csc/inquiry-list">
	            <div class="inquiry-search-area">
	                <div class="model-search-area">
	                    <div class="model-search-box-area">
	                        <select name="searchType" id="" class="model-search-category">
                                <option value="">전체</option>
	                            <option value="TITLE">제목</option>
	                            <option value="NAME">작성자</option>
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
	                <div class="inquiry-category-text">답변여부</div>
	                <select name="" id="" class="answer-category-box">
	                    <option value="">전체</option>
	                    <option value="">미답변</option>
	                    <option value="">답변</option>
	                </select>
	                <div class="inquiry-category-text">분류</div>
	                <select name="searchCategory" id="" class="content-category-box">
	                    <option value="">전체</option>
	                    <c:forEach items="${cList}" var="vo">
	                    	<option value="${vo.no}">${vo.name}</option>
	                    </c:forEach>
	                    
	                </select>
	
	            </div>
	            <div class="inquiry-btn-area">
	                <button type="submit" class="inquiry-search-btn">검색</button>
	                <button type="button" class="inquiry-search-btn white margin-r50">초기화</button>
	
	            </div>
            </form>

            <div class="inquiry-list-category-area">
                <div class="inquiry-list-category focus-category">
                    <div class="list-category-text">전체</div>
                    <div class="list-category-num yellow">${listCnt.sum}</div>
                </div>
                <div class="inquiry-list-category">
                    <div class="list-category-text">답변완료</div>
                    <div class="list-category-num">${listCnt.answerY}</div>
                </div>
                <div class="inquiry-list-category right-border">
                    <div class="list-category-text">미답변</div>
                    <div class="list-category-num">${listCnt.answerN}</div>
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
                    </tr>

					<c:forEach items="${qList}" var="vo">
						<tr>
							<td hidden>${vo.no}</td>
	                        <td>${vo.qnaCname}</td>
	                        <td>${vo.title}</td>
	                        <td>${vo.memberName}</td>
	                        <td>${vo.enrollDate}</td>
	                        <c:if test="${vo.answerYn eq 'Y'}">
	                        	<td>${vo.answerDate}</td>
	                        </c:if>
	                        <c:if test="${vo.answerYn eq 'N'}">
	                        	<td>-</td>
	                        </c:if>
	
	                    </tr>
					</c:forEach>
                    
                </table>
            </div>

            <div class="page-area">
                <button class="yellow"><</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button class="yellow">></button>
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
    firstNav(['문의 내역', '신고 내역', 'FAQ 관리'], '문의 내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

</script>