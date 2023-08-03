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
            <form action="/app/admin/member/member-list" method="GET">
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
                <a href="/app/admin/member/member-list?searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}" class="member-category" id="memberAll">
                    <div>회원</div>
                    <div>${memberCntMap.sum}</div>
                </a>

                <a href="/app/admin/member/member-list?searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}&status=N" class="member-category border-r-solid" id="memberN">
                    <div>신규회원</div>
                    <div>${memberCntMap.statusNum}</div>
                </a>
            </div>

            <div class="member-area">

                <div class="member-list-area">
                	<c:forEach items="${mList}" var="vo">
	                    <div class="member-list" onclick="showMemberDetail(this);">
                            <div hidden>${vo.no}</div>
	                        <div class="member-list-img">
	                            <img src="${vo.profile}" alt="프로필사진">
	                        </div>
	                        <div class="member-list-text">
	                            <span>${vo.name}</span>
	                            <span>(${vo.dongNum}동 ${vo.hoNum}호)</span>
	                        </div>
	                    </div>
                	</c:forEach>
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
        <div class="point-background">
            <div class="point-window">
                <div class="point-popup">
                    <div class="point-model-header-area b-yellow">
                        <div class="point-model-header">
                            <div class="point-model-header-text">상벌점주기</div>
                            <span class="material-symbols-outlined" id="point-close">
                                close
                            </span>
                        </div>
                    </div>
                    <div class="point-model-body-area">
                        <div class="point-model-body-first">
                            <div class="point-model-sanction-date">
                                <div class="point-model-title-text">상벌점 점수</div>
                                <div><input class="point-model-sanction-input" type="number"></div>
                            </div>
                            <div class="point-model-sanction-member">
                                <div class="point-model-title-text1">대상자</div>
                                <div class="point-model-member-info">
                                    <div id="point-model-member-name"></div>
                                    <div class="point-model-member-profile">
                                        <img id="point-model-member-profile" src="" alt="프로필사진">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="point-model-title-text">내용</div>
                            <textarea name="" id="" class="point-model-body-content" cols="30" rows="10"></textarea>
                        </div>

                        <div class="point-model-btn-area">
                            <button id="point-check-btn" class="point-model-btn b-yellow">점수주기</button>

                        </div>

                    </div>
    
                </div>
            </div>
        </div>

        <!-- 정지 모달 -->
        <div class="stop-background">
            <div class="stop-window">
                <div class="stop-popup">
                    <div class="stop-model-header-area b-red">
                        <div class="stop-model-header">
                            <div class="stop-model-header-text">정지하기</div>
                            <span class="material-symbols-outlined" id="stop-close">
                                close
                            </span>
                        </div>
                    </div>
                    <div class="stop-model-body-area">
                        <div class="stop-model-body-first">
                            <div class="stop-model-sanction-date">
                                <div class="stop-model-title-text">정지 일수</div>
                                <div><input class="stop-model-sanction-input" type="number"></div>
                            </div>
                            <div class="stop-model-sanction-member">
                                <div class="stop-model-title-text1">정지자</div>
                                <div class="stop-model-member-info">
                                    <div id="stop-model-member-name"></div>
                                    <div class="stop-model-member-profile">
                                        <img id="stop-model-member-profile" src="" alt="프로필사진">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="stop-model-title-text">내용</div>
                            <textarea name="" id="" class="stop-model-body-content" cols="30" rows="10"></textarea>
                        </div>

                        <div class="stop-model-btn-area">
                            <button id="stop-check-btn" class="stop-model-btn b-red">정지하기</button>

                        </div>

                    </div>
    
                </div>
            </div>
        </div>

        <script>
            

        </script>

</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    firstNav(['회원조회','관리자조회', '제재내역', '상벌점내역', '사유물내역'], '회원조회'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
    let clickNo = null;

    // 회원 상태 카테고리 동적 css
    function memberStatusCheck(){
        const statusCheck = '${searchMap.status}'
        const statusAll = document.querySelector("#memberAll");
        const statusN = document.querySelector("#memberN");

        if(statusCheck == '' || statusCheck == null || statusCheck == undefined){
            statusAll.classList.add("c-focus");
            // answerAll.lastElementChild.classList.add("yellow");
        }else if(statusCheck == 'N'){
            statusN.classList.add("c-focus");
            // answerN.lastElementChild.classList.add("yellow");
        }

    }

    // 미답변 여부 확인
    function memberNCheck(){
        const noMemberNum = '${memberCntMap.statusNum}'
        const memberN = document.querySelector("#memberN");
        if(noMemberNum > 0){
            memberN.lastElementChild.classList.add("blinking");
            memberN.lastElementChild.classList.add("yellow");
        }
    }

    memberStatusCheck();
    memberNCheck();

    // 회원 상세 보기 ajax
    function showMemberDetail(e){
        const mno = e.firstElementChild.innerText;
        $.ajax({
            url : "/app/admin/member/member-list/detail",
            method : "POST",
            data : {
                "mno" : mno
            },
            dataType : "json",
            success : function(data) {
                const detailArea = document.querySelector("#member-detail-area");
                detailArea.innerHTML = "";

                let str = "";

                if(data.status == 'Y'){
                    str =  `<div class="member-detail-header">
                            <div class="member-detail-img">
                                <img src="\${data.profile}" alt="">
                            </div>
                            <div class="member-detail-btn-area">
                                <button class="member-detail-point-btn" onclick="showPointModel();">상벌점</button>
                                <button class="member-detail-stop-btn" onclick="showStopModel();">정지</button>
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
                }else{
                    str =  `<div class="member-detail-header">
                            <div class="member-detail-img">
                                <img src="\${data.profile}" alt="">
                            </div>
                            <div class="member-detail-btn-area">
                                <button class="member-detail-member-btn">회원등록</button>
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
                }

                clickNo = mno;
                
                detailArea.innerHTML = str;
            },
            error : function() {
                    alert("실패");
                },
        })

    }



    // 정지 모달 사용
    function showStop () {
        document.querySelector(".stop-background").className = "stop-background sshow";
    }

    function closeStop () { 
        document.querySelector(".stop-background").className = "stop-background";
    }


    document.querySelector("#stop-close").addEventListener('click', closeStop);
    document.querySelector("#stop-check-btn").addEventListener('click', closeStop);

    // 정지 모달 상세보기
    function showStopModel(){
        const mno = clickNo;
        $.ajax({
            url : "/app/admin/member/member-list/detail",
            method : "POST",
            data : {
                "mno" : mno
            },
            dataType : "json",
            success : function(data) {
                const nameArea = document.querySelector("#stop-model-member-name");
                const profileArea = document.querySelector("#stop-model-member-profile");

                nameArea.innerHTML = "";
                profileArea.innerHTML = "";

                nameArea.innerHTML = data.name;
                profileArea.src = data.profile;

                clickNo = mno;

                showStop();
            },
            error : function() {
                    alert("실패");
                },
        })
    }

    // 상벌점 모달 사용
    function showPoint () {
        document.querySelector(".point-background").className = "point-background pshow";
    }

    function closePoint () { 
        document.querySelector(".point-background").className = "point-background";
    }


    document.querySelector("#point-close").addEventListener('click', closePoint);
    document.querySelector("#point-check-btn").addEventListener('click', closePoint);

    // 상벌점 모달 상세보기
    function showPointModel(){
        const mno = clickNo;
        $.ajax({
            url : "/app/admin/member/member-list/detail",
            method : "POST",
            data : {
                "mno" : mno
            },
            dataType : "json",
            success : function(data) {
                const nameArea = document.querySelector("#point-model-member-name");
                const profileArea = document.querySelector("#point-model-member-profile");

                nameArea.innerHTML = "";
                profileArea.innerHTML = "";

                nameArea.innerHTML = data.name;
                profileArea.src = data.profile;

                clickNo = mno;

                showPoint();
            },
            error : function() {
                    alert("실패");
                },
        })
    }

    
</script>
