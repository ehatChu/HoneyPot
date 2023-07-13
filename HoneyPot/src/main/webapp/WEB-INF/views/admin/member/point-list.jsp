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
            background-color: #FFCE31;
            font-weight: bold;
            font-family: 'Noto Sans KR';
            font-size: 20px;
        }

        .sanction-list-area{
            width: 1560px;
            height: 700px;
            display: flex;
            justify-content: center;
        }

        .sanction-list-table-area{
            border-radius: 20px;
            width: 1500px;
            height: 670px;
            background-color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .sanction-list-table{
            width: 1400px;
            height: 560px;
            display: flex;
            flex-direction: column;
        }


        .sanction-list{
            width: 1350px;
            border-bottom: 2px solid rgb(187, 187, 187);
            display: flex;
            flex-direction: row;
            align-items: center;
            height: 90px;
        }

        .sanction-list-profile{
            margin-left: 20px;
            height: 80px;
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .sanction-member-profile{
            width: 55px;
            height: 55px;
            border-radius: 70%;
            background-color: black;
        }

        .sanction-member-text{
            width: 100px;
            margin-left: 10px;
            font-size: 12px;
            height: 45px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .sanction-list-content{
            width: 850px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .sanction-list-admin{
            width: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .sanction-list-date{
            width: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .page-area {
            width: 1560px;
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
            background-color: #FAD355;
            color: white;
        }

        .category-color{
            color: #e7bf3a;
        }

        .yellow{
            color: #FFCE31;
        }

        .red{
            color: #ff3131;
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
                                    <div class="yellow">상점100점</div>
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
                                    <div class="red">벌점200점</div>
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
            
        </main>

</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    firstNav(['회원조회', '제재내역', '상벌점내역', '사유물내역'], '상벌점내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>
