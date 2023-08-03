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
            <form action="/app/member/friends" method="GET">
                <div class="inquiry-search-area">
                    <div class="model-search-area">
                        <div class="model-search-box-area">
                                <select name="searchType" id="" class="model-search-category">
                                    <option value="NAME">이름</option>
                                    <option value="DONG">동</option>
                                    <option value="HO">호수</option>
                                    <option value="PHONE">연락처</option>
                                </select>
                                <input type="text" class="model-serach-input" name="searchValue">
                            </div>
                            <div class="search-btn-area">
                                <button type="submit">검색</button>
                            </div>
                    </div>
                </div>
            </form>

            <div class="member-category-area">
                <div class="member-category c-focus">
                    <div>회원</div>
                    <div>3</div>
                </div>

                <div class="member-category border-r-solid">
                    <div>신규회원</div>
                    <div>3</div>
                </div>
            </div>

            <div class="member-area">

                <div class="member-list-area">
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                </div>
                <div class="member-detail-area" id="member-detail-area">
                    <div class="member-detail-guide-area">
                        <div><span class="material-symbols-outlined" id="member-detail-guide-img">
                            badge
                            </span></div>
                        <div class="member-detail-guide-text">상세보기를 원하시면 클릭을 하세요</div>
                    </div>
                </div>

            </div>
            
        </main>
        
        <!-- 상벌점 모달 -->
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

        <script>
            function showMemberDetail(e){
                    const mno = e.firstElementChild.innerText;
                    $.ajax({
                        url : "/app/member/friends/detail",
                        method : "POST",
                        data : {
                            "mno" : mno
                        },
                        dataType : "json",
                        success : function(data) {
                            const detailArea = document.querySelector("#member-detail-area");
                            detailArea.innerHTML = "";

                            let str =  `<div class="member-detail-header">
                                    <div class="member-detail-img">
                                        <img src="\${data.profile}" alt="">
                                    </div>
                                </div>
                                <div class="member-detail-body-area">
                                    <div class="member-detail-body">
                                        <div class="member-detail-body-title">상세보기</div>
                                        <div class="member-detail-name">
                                            \${data.name}
                                        </div>
                                        <div class="member-detail-content-box">
                                            <span>동호수</span>
                                            <span class="member-detail-content">\${data.dongNum}동 \${data.hoNum}호</span>
                                        </div>
                                        <div class="member-detail-content-box">
                                            <span>생년월일</span>
                                            <span class="member-detail-content">\${data.birth}</span>
                                        </div>
                                        <div class="member-detail-content-box">
                                            <span>이메일</span>
                                            <span class="member-detail-content">\${data.email}</span>
                                        </div>
                                        <div class="member-detail-content-box">
                                            <span>연락처</span>
                                            <span class="member-detail-content">\${data.phone}</span>
                                        </div>
                                    </div>
                                </div>`
                            detailArea.innerHTML = str;
                        },
                        error : function() {
                                alert("실패");
                            },
                    })
        
                }

        </script>

</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    firstNav(['회원조회','관리자조회', '제재내역', '상벌점내역', '사유물내역'], '회원조회'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
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
