<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/app/resources/css/admin/member/sanction-list.css">
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

            <div class="sanction-list-area">
                <div class="sanction-list-table-area">
                    <div class="sanction-list-table">
                        <div class="sanction-list">
                            <div class="sanction-list-profile">
                                <div class="sanction-member-profile">
                                    <img src="" alt="프로필사진">
                                </div>
                                <div class="sanction-member-text">
                                    <div>이름</div>
                                    <div>정지일수</div>
                                </div>
                            </div>
                            <div class="sanction-list-content">
                                <div>제재 내용입니다.</div>
                            </div>
                            <div class="sanction-list-admin">
                                <div>처리자</div>
                            </div>
                            <div class="sanction-list-date">
                                <div>처리날짜</div>
                            </div>
                        </div>
                        <div class="sanction-list">
                            <div class="sanction-list-profile">
                                <div class="sanction-member-profile">
                                    <img src="" alt="프로필사진">
                                </div>
                                <div class="sanction-member-text">
                                    <div>이름</div>
                                    <div>정지일수</div>
                                </div>
                            </div>
                            <div class="sanction-list-content">
                                <div>제재 내용입니다.</div>
                            </div>
                            <div class="sanction-list-admin">
                                <div>처리자</div>
                            </div>
                            <div class="sanction-list-date">
                                <div>처리날짜</div>
                            </div>
                        </div>
                        <div class="sanction-list">
                            <div class="sanction-list-profile">
                                <div class="sanction-member-profile">
                                    <img src="" alt="프로필사진">
                                </div>
                                <div class="sanction-member-text">
                                    <div>이름</div>
                                    <div>정지일수</div>
                                </div>
                            </div>
                            <div class="sanction-list-content">
                                <div>제재 내용입니다.</div>
                            </div>
                            <div class="sanction-list-admin">
                                <div>처리자</div>
                            </div>
                            <div class="sanction-list-date">
                                <div>처리날짜</div>
                            </div>
                        </div>
                        <div class="sanction-list">
                            <div class="sanction-list-profile">
                                <div class="sanction-member-profile">
                                    <img src="" alt="프로필사진">
                                </div>
                                <div class="sanction-member-text">
                                    <div>이름</div>
                                    <div>정지일수</div>
                                </div>
                            </div>
                            <div class="sanction-list-content">
                                <div>제재 내용입니다.</div>
                            </div>
                            <div class="sanction-list-admin">
                                <div>처리자</div>
                            </div>
                            <div class="sanction-list-date">
                                <div>처리날짜</div>
                            </div>
                        </div>
                        <div class="sanction-list">
                            <div class="sanction-list-profile">
                                <div class="sanction-member-profile">
                                    <img src="" alt="프로필사진">
                                </div>
                                <div class="sanction-member-text">
                                    <div>이름</div>
                                    <div>정지일수</div>
                                </div>
                            </div>
                            <div class="sanction-list-content">
                                <div>제재 내용입니다.</div>
                            </div>
                            <div class="sanction-list-admin">
                                <div>처리자</div>
                            </div>
                            <div class="sanction-list-date">
                                <div>처리날짜</div>
                            </div>
                        </div>
                        <div class="sanction-list">
                            <div class="sanction-list-profile">
                                <div class="sanction-member-profile">
                                    <img src="" alt="프로필사진">
                                </div>
                                <div class="sanction-member-text">
                                    <div>이름</div>
                                    <div>정지일수</div>
                                </div>
                            </div>
                            <div class="sanction-list-content">
                                <div>제재 내용입니다.</div>
                            </div>
                            <div class="sanction-list-admin">
                                <div>처리자</div>
                            </div>
                            <div class="sanction-list-date">
                                <div>처리날짜</div>
                            </div>
                        </div>

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
                </div>

            </div>

            <button id="temp-btn">모달바 생성</button>

            <div class="background">
                <div class="window">
                    <div class="popup">
                        <div class="model-header-area">
                            <div class="model-header">
                                <div class="model-header-text">제재 상세내역</div>
                                <span class="material-symbols-outlined" id="close">
                                    close
                                </span>
                            </div>
                        </div>
                        <div class="model-body-area">
                            <div class="model-body-first">
                                <div class="model-sanction-date">
                                    <div class="model-title-text">제재일수</div>
                                    <div><input class="model-sanction-input" type="text"></div>
                                </div>
                                <div class="model-sanction-member">
                                    <div class="model-title-text1">정지자</div>
                                    <div class="model-member-info">
                                        <div>이정민</div>
                                        <div class="model-member-profile">
                                            <img src="" alt="프로필사진">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="model-title-text">내용</div>
                                <textarea name="" id="" class="model-body-content" cols="30" rows="10"></textarea>
                            </div>

                            <div class="model-btn-area">
                                <button id="check-btn" class="model-btn margin-r50" type="button">확인</button>
                                <button id="check-btn" class="model-btn" type="button">수정</button>

                            </div>

                        </div>
        
                    </div>
                <div>
                <div>
            
        </main>

</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    firstNav(['회원조회', '제재내역', '상벌점내역', '사유물내역'], '제재내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

    // 모달 사용
    function show () {
        document.querySelector(".background").className = "background show";
    }

    function close () { 
        document.querySelector(".background").className = "background";
    }


    document.querySelector("#temp-btn").addEventListener('click', show);
    document.querySelector("#close").addEventListener('click', close);
    document.querySelector("#check-btn").addEventListener('click', close);

    // document,querySelector(".model-content-plist").addEventListener('click',);
</script>
