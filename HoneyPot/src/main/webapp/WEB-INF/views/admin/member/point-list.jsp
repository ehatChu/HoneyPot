<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/app/resources/css/admin/member/point-list.css">
</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <nav>
            <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
            <!-- <%@ include file="/WEB-INF/views/common/second-nav.jsp" %> -->
        </nav>

        <main>
            <form action="/app/admin/member/point-list" method="GET">
                <div class="point-search-area">
                    <div class="point-search">
                        <div class="point-search-box-area">
                            <select name="searchType" id="" class="point-search-category">
                                <option value="NAME">이름</option>
                                <option value="TITLE">사유</option>
                            </select>
                            <input type="text" name="searchValue" class="point-serach-input">
                        </div>
                        <div class="point-search-btn-area">
                            <button type="submit">검색</button>
                        </div>
                    </div>
                </div>
            </form>

            <div class="point-list-area">
                <div class="point-list-table-area">
                    <div class="point-list-table">
                        <c:forEach items="${pList}" var="vo">
                        	<div class="point-list" onclick="detailPointModel(this)">
                                <div hidden>${vo.no}</div>
	                            <div class="point-list-profile">
	                                <div class="point-member-profile">
	                                    <img src="/app/resources/member/profile/${vo.memberProfile}" alt="프로필사진">
	                                </div>
	                                <div class="point-member-text">
	                                	<div hidden>${vo.memberNo}</div>
	                                    <div>${vo.memberName}</div>
	                                    <c:if test="${vo.score gt 0}">
	                                    	<div class="blue">상점${vo.score}점</div>
	                                    </c:if>
	                                    <c:if test="${vo.score lt 0}">
	                                    	<div class="red">벌점${vo.score}점</div>
	                                    </c:if>
	                                </div>
	                            </div>
	                            <div class="point-list-content">
	                                <div>${vo.content}</div>
	                            </div>
	                            <div class="point-list-admin">
	                            	<div hidden>${vo.adminNo}</div>
	                                <div>${vo.adminName}</div>
	                            </div>
	                            <div class="point-list-date">
	                                <div>${vo.pointDate}</div>
	                            </div>
                        	</div>
                        </c:forEach>

                    </div>
                    <div class="page-area">

                        <c:if test="${pvo.currentPage > 1}">
                            <a href="/app/admin/member/point-list?page=${pvo.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}"><</a>
                        </c:if>
                            <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" step="1" var="i">
                                <c:if test="${pvo.currentPage != i}">
                                    <a href="/app/admin/member/point-list?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">${i}</a>
                                </c:if>
                                <c:if test="${pvo.currentPage == i}">
                                    <a id="current-page">${i}</a>
                                </c:if>
                            </c:forEach>
                        <c:if test="${pvo.currentPage < pvo.maxPage}">
                            <a href="/app/admin/member/point-list?page=${pvo.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">></a>
                        </c:if>
                    </div>
                </div>

            </div>

            <!-- 상벌점 상세 조회 모달 -->
            <div class="point-background">
                <div class="point-window">
                    <div class="point-popup">
                        <div class="point-model-header-area">
                            <div class="point-model-header">
                                <div class="point-model-header-text">상벌점 상세내역</div>
                                <span class="material-symbols-outlined" id="point-close">
                                    close
                                </span>
                            </div>
                        </div>
                        <div class="point-model-body-area">
                            <div class="point-model-body-first">
                                <div class="point-model-point-date">
                                    <div class="point-model-title-text">상벌점 점수</div>
                                    <div class="point-model-point-num" id="point-model-point-num"></div>
                                </div>
                                <div class="point-model-point-member">
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
                                <div class="point-model-body-content" id="point-model-body-content"></div>
                            </div>

                            <div class="point-model-btn-area">
                                <button id="point-check-btn" class="point-model-edit-btn" onclick="pointEditModelShow()">수정</button>
                                <button id="point-check-btn" class="point-model-delete-btn" onclick="deletePoint()">삭제</button>

                            </div>

                        </div>
        
                    </div>
                <div>
                <!-- 상벌점 수정 모달 -->
                <div class="point-edit-background">
                    <div class="point-edit-window">
                        <div class="point-edit-popup" id="point-edit-popup">
                            <div class="point-edit-model-header-area">
                                <div class="point-edit-model-header">
                                    <div class="point-edit-model-header-text">상벌점 수정</div>
                                    <span class="material-symbols-outlined" id="point-edit-close">
                                        close
                                    </span>
                                </div>
                            </div>
                            <div class="point-edit-model-body-area">
                                <div class="point-edit-model-body-text">상벌점</div>
                                <input type="number" id="point-edit-model-score-box" class="point-edit-model-score-box">
                                <div class="point-edit-model-body-text">사유</div>
                                <textarea class="point-edit-model-content" id="point-edit-model-content"></textarea>

                                <div class="point-edit-model-btn-area">
                                    <button id="point-edit-compelet-btn" class="point-edit-model-check-btn" onclick="pointEdit();">수정완료</button>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>    
            <div>
            
        </main>

</body>

</html>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    firstNav(['회원조회', '관리자조회', '제재내역', '상벌점내역', '사유물내역'], '상벌점내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    firstNavLink(['/app/admin/member/member-list', '/app/admin/member/admin-list', '/app/admin/member/sanction-list', '/app/admin/member/point-list', '/app/csc/report-list',]);
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

    let clickNo = null;
    // 상벌점 내역 상세 모달 보이기 숨기기 메소드
    function showPoint () {
        document.querySelector(".point-background").className = "point-background pshow";
    }

    function closePoint () { 
        document.querySelector(".point-background").className = "point-background";
    }


    document.querySelector("#point-close").addEventListener('click', closePoint);

    // 상벌점 내역 상세 모달 사용
    function detailPointModel(e){
        const pno = e.firstElementChild.innerText;
        console.log(pno);
        $.ajax({
        url : "/app/admin/member/point-list/detail",
        method : "POST",
        data : {
            "pno" : pno
        },
        dataType : "json",
        success : function(data) {
            const pointBox = document.querySelector("#point-model-point-num");
            const contentBox = document.querySelector("#point-model-body-content");
            const nameBox = document.querySelector("#point-model-member-name");
            const profileBox = document.querySelector("#point-model-member-profile");

            pointBox.innerHTML = "";
            contentBox.innerHTML = "";
            nameBox.innerHTML = "";
            profileBox.src = "";
            
            pointBox.innerHTML = data.score;
            contentBox.innerHTML = data.content;
            nameBox.innerHTML = data.memberName;
            profileBox.src = "/app/resources/member/profile/" + data.memberProfile;
            clickNo = data.no;
            
            showPoint();
        },
        error : function() {
                alert("실패");
            },
        })
    }

    // 상벌점 내역 삭제
    function deletePoint(){
        Swal.fire({
            title: '정말로 삭제 하시겠습니까?',
            text: '다시 되돌릴 수 없습니다. 신중하세요.',
            icon: 'warning',
            
            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
            cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
            confirmButtonText: '승인', // confirm 버튼 텍스트 지정
            cancelButtonText: '취소', // cancel 버튼 텍스트 지정
            
            // reverseButtons: true, // 버튼 순서 거꾸로
            
            }).then(result => {
            // 만약 Promise리턴을 받으면,
            if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
            
                location.href="/app/admin/member/point-list/delete?pno=" + clickNo;
            }
        });
    }

    // 상벌점 수정 모달 드래그 사용
    $( function() {
	  //draggable() 함수 	jquery-ul.js 스크립트 파일 안에 선언된 함수
    $("#point-edit-popup").draggable({
        scroll : false,
        containment : 'parent',
        handle : '.point-edit-model-header-area'
    });
    } );

    // 상벌점 수정 모달 사용
    function pointEditShow() {
        document.querySelector(".point-edit-background").className = "point-edit-background eshow";
    }

    function pointEditClose() { 
        document.querySelector(".point-edit-background").className = "point-edit-background";
    }

    // 상벌점 수정 모달
    function pointEditModelShow(){
        const scoreBox = document.querySelector("#point-model-point-num");
        const contentBox = document.querySelector("#point-model-body-content");
        const editScoreBox = document.querySelector("#point-edit-model-score-box");
        const editContentBox = document.querySelector("#point-edit-model-content");

        const titleStr = scoreBox.innerHTML;
        const contentStr = contentBox.innerHTML;

        editScoreBox.value =  titleStr;
        editContentBox.value = contentStr;

        pointEditShow();
    }

    // point close시에 내용 비우기
    document.querySelector("#point-edit-close").addEventListener('click', function(){
        const scoreBox = document.querySelector("#point-edit-model-score-box");
        const contentBox = document.querySelector("#point-edit-model-content");

        pointEditClose();

        scoreBox.value = "";
        contentBox.value = "";
    });

    // 상벌점 수정
    function pointEdit(){
        const scoreValue = document.querySelector("#point-edit-model-score-box").value;
        const contentValue = document.querySelector("#point-edit-model-content").value;
        $.ajax({
            url : "/app/admin/member/point-list/edit",
            method : "POST",
            data : {
                "no" : clickNo,
                "score" : scoreValue,
                "content" : contentValue
            },
            dataType : "json",
            success : function(data) {
                pointEditClose();
                closePoint();
                const score = document.querySelector("#point-model-point-num");
                const content = document.querySelector("#point-model-body-content");

                score.innerHTML = "";
                content.innerHTML = "";

                const scoreStr = data.score;
                const contentStr = data.content;
                clickNo = data.no;

                score.innerHTML = scoreStr;
                content.innerHTML = contentStr;

                showPoint();

        },
        error : function() {
                alert("실패");
            },
        })
    }
</script>
