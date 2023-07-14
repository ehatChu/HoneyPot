<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/app/resources/css/admin/member/member-list.css">
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

            <div class="member-category-area">
                <div class="member-category c-focus">
                    <div>전체</div>
                    <div>3</div>
                </div>
                <div class="member-category">
                    <div>회원</div>
                    <div>3</div>
                </div>
                <div class="member-category">
                    <div>관리자</div>
                    <div>3</div>
                </div>
                <div class="member-category border-r-solid">
                    <div>신규회원</div>
                    <div>3</div>
                </div>

            </div>

            <div class="member-area">

                <div class="member-list-area">
                    안녕
                </div>
                <div class="member-detail-area">
                    안녕
                </div>

            </div>
            


            <button id="temp-btn">정지 모달바 생성</button>
            <button id="temp-btn1">상벌점 모달바 생성</button>

        </main>

        <div class="background1">
            <div class="window1">
                <div class="popup1">
                    <div class="model-header-area b-yellow">
                        <div class="model-header">
                            <div class="model-header-text">상벌점주기</div>
                            <span class="material-symbols-outlined" id="close1">
                                close
                            </span>
                        </div>
                    </div>
                    <div class="model-body-area">
                        <div class="model-body-first">
                            <div class="model-sanction-date">
                                <div class="model-title-text">상벌점 점수</div>
                                <div><input class="model-sanction-input" type="number"></div>
                            </div>
                            <div class="model-sanction-member">
                                <div class="model-title-text1">대상자</div>
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
                            <button id="check-btn" class="model-btn b-yellow">점수주기</button>

                        </div>

                    </div>
    
                </div>
            </div>
        </div>

        <!-- 정지 모달 -->
        <div class="background">
            <div class="window">
                <div class="popup">
                    <div class="model-header-area b-red">
                        <div class="model-header">
                            <div class="model-header-text">정지하기</div>
                            <span class="material-symbols-outlined" id="close">
                                close
                            </span>
                        </div>
                    </div>
                    <div class="model-body-area">
                        <div class="model-body-first">
                            <div class="model-sanction-date">
                                <div class="model-title-text">정지 일수</div>
                                <div><input class="model-sanction-input" type="number"></div>
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
                            <button id="check-btn" class="model-btn b-red">정지하기</button>

                        </div>

                    </div>
    
                </div>
            </div>
        </div>

</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    firstNav(['회원조회', '제재내역', '상벌점내역', '사유물내역'], '회원조회'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
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

    // 모달 사용
    function show1 () {
        document.querySelector(".background1").className = "background1 show";
    }

    function close1 () { 
        document.querySelector(".background1").className = "background1";
    }


    document.querySelector("#temp-btn1").addEventListener('click', show1);
    document.querySelector("#close1").addEventListener('click', close1);
    document.querySelector("#check-btn").addEventListener('click', close1);

    // document,querySelector(".model-content-plist").addEventListener('click',);
</script>
