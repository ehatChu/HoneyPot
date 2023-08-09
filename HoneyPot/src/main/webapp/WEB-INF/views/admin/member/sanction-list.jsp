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
            <form action="/app/admin/member/sanction-list" method="GET">
                <div class="sanction-search-area">
                    <div class="sanction-search">
                        <div class="sanction-search-box-area">
                            <select name="searchType" id="" class="sanction-search-category">
                                <option value="NAME">이름</option>
                                <option value="TITLE">사유</option>
                            </select>
                            <input type="text" name="searchValue" class="sanction-serach-input">
                        </div>
                        <div class="sanction-search-btn-area">
                            <button type="submit">검색</button>
                        </div>
                    </div>
                </div>
            </form>

            <div class="sanction-list-area">
                <div class="sanction-list-table-area">
                    <div class="sanction-list-table">
                        <c:forEach items="${sList}" var="vo">
                        	<div class="sanction-list" onclick="detailsanctionModel(this)">
                                <div hidden>${vo.no}</div>
	                            <div class="sanction-list-profile">
	                                <div class="sanction-member-profile">
	                                    <img src="/app/resources/member/profile/${vo.memberProfile}" alt="프로필사진">
	                                </div>
	                                <div class="sanction-member-text">
	                                    <div>${vo.memberName}</div>
	                                    <div class="red">정지 : ${vo.stopDate}점</div>
	                                </div>
	                            </div>
	                            <div class="sanction-list-content">
	                                <div>${vo.content}</div>
	                            </div>
	                            <div class="sanction-list-admin">
	                                <div>${vo.adminName}</div>
	                            </div>
	                            <div class="sanction-list-date">
	                                <div>${vo.enrollDate}</div>
	                            </div>
                        	</div>
                        </c:forEach>

                    </div>
                    <div class="page-area">

                        <c:if test="${pvo.currentPage > 1}">
                            <a href="/app/admin/member/sanction-list?page=${pvo.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}"><</a>
                        </c:if>
                            <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" step="1" var="i">
                                <c:if test="${pvo.currentPage != i}">
                                    <a href="/app/admin/member/sanction-list?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">${i}</a>
                                </c:if>
                                <c:if test="${pvo.currentPage == i}">
                                    <a id="current-page">${i}</a>
                                </c:if>
                            </c:forEach>
                        <c:if test="${pvo.currentPage < pvo.maxPage}">
                            <a href="/app/admin/member/sanction-list?page=${pvo.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">></a>
                        </c:if>
                    </div>
                </div>

            </div>

            <!-- 제재 상세 조회 모달 -->
            <div class="sanction-background">
                <div class="sanction-window">
                    <div class="sanction-popup">
                        <div class="sanction-model-header-area">
                            <div class="sanction-model-header">
                                <div class="sanction-model-header-text">제재 상세내역</div>
                                <span class="material-symbols-outlined" id="sanction-close">
                                    close
                                </span>
                            </div>
                        </div>
                        <div class="sanction-model-body-area">
                            <div class="sanction-model-body-first">
                                <div class="sanction-model-sanction-date">
                                    <div class="sanction-model-title-text">제재 일자</div>
                                    <div class="sanction-model-sanction-num" id="sanction-model-sanction-num"></div>
                                </div>
                                <div class="sanction-model-sanction-member">
                                    <div class="sanction-model-title-text1">대상자</div>
                                    <div class="sanction-model-member-info">
                                        <div id="sanction-model-member-name"></div>
                                        <div class="sanction-model-member-profile">
                                            <img id="sanction-model-member-profile" src="" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="sanction-model-title-text">내용</div>
                                <div class="sanction-model-body-content" id="sanction-model-body-content"></div>
                            </div>

                            <div class="sanction-model-btn-area">
                                <button id="sanction-check-btn" class="sanction-model-delete-btn" onclick="deletesanction()">삭제</button>
                            </div>

                        </div>
        
                    </div>
                <div>
                <!-- 상벌점 수정 모달 -->
                <!-- <div class="sanction-edit-background">
                    <div class="sanction-edit-window">
                        <div class="sanction-edit-popup" id="sanction-edit-popup">
                            <div class="sanction-edit-model-header-area">
                                <div class="sanction-edit-model-header">
                                    <div class="sanction-edit-model-header-text">상벌점 수정</div>
                                    <span class="material-symbols-outlined" id="sanction-edit-close">
                                        close
                                    </span>
                                </div>
                            </div>
                            <div class="sanction-edit-model-body-area">
                                <div class="sanction-edit-model-body-text">상벌점</div>
                                <input type="number" id="sanction-edit-model-score-box" class="sanction-edit-model-score-box">
                                <div class="sanction-edit-model-body-text">사유</div>
                                <textarea class="sanction-edit-model-content" id="sanction-edit-model-content"></textarea>

                                <div class="sanction-edit-model-btn-area">
                                    <button id="sanction-edit-compelet-btn" class="sanction-edit-model-check-btn" onclick="sanctionEdit();">수정완료</button>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>     -->
            <div>
            
        </main>

</body>

</html>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    firstNav(['회원조회', '관리자조회', '제재내역', '상벌점내역', '사유물내역'], '제재내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    firstNavLink(['/app/admin/member/member-list', '/app/admin/member/admin-list', '/app/admin/member/sanction-list', '/app/admin/member/point-list', '/app/car-list',]);

    let clickNo = null;
    // 상벌점 내역 상세 모달 보이기 숨기기 메소드
    function showsanction () {
        document.querySelector(".sanction-background").className = "sanction-background sshow";
    }

    function closesanction () { 
        document.querySelector(".sanction-background").className = "sanction-background";
    }


    document.querySelector("#sanction-close").addEventListener('click', closesanction);

    // 제재 내역 상세 모달 사용
    function detailsanctionModel(e){
        const sno = e.firstElementChild.innerText;
        console.log(sno);
        $.ajax({
        url : "/app/admin/member/sanction-list/detail",
        method : "POST",
        data : {
            "sno" : sno
        },
        dataType : "json",
        success : function(data) {
            const sanctionBox = document.querySelector("#sanction-model-sanction-num");
            const contentBox = document.querySelector("#sanction-model-body-content");
            const nameBox = document.querySelector("#sanction-model-member-name");
            const profileBox = document.querySelector("#sanction-model-member-profile");

            sanctionBox.innerHTML = "";
            contentBox.innerHTML = "";
            nameBox.innerHTML = "";
            profileBox.src = "";
            
            sanctionBox.innerHTML = data.stopDate;
            contentBox.innerHTML = data.content;
            nameBox.innerHTML = data.memberName;
            console.log(data.memberProfile);
            profileBox.src = "/app/resources/member/profile/" + data.memberProfile;
            clickNo = data.no;
            
            showsanction();
        },
        error : function() {
                alert("실패");
            },
        })
    }

    // 상벌점 내역 삭제
    function deletesanction(){
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
            
                location.href="/app/admin/member/sanction-list/delete?sno=" + clickNo;
            }
        });
    }

    // 상벌점 수정 모달 드래그 사용
    // $( function() {
	//   //draggable() 함수 	jquery-ul.js 스크립트 파일 안에 선언된 함수
    // $("#sanction-edit-popup").draggable({
    //     scroll : false,
    //     containment : 'parent',
    //     handle : '.sanction-edit-model-header-area'
    // });
    // } );

    // 상벌점 수정 모달 사용
    // function sanctionEditShow() {
    //     document.querySelector(".sanction-edit-background").className = "sanction-edit-background eshow";
    // }

    // function sanctionEditClose() { 
    //     document.querySelector(".sanction-edit-background").className = "sanction-edit-background";
    // }

    // 상벌점 수정 모달
    // function sanctionEditModelShow(){
    //     const scoreBox = document.querySelector("#sanction-model-sanction-num");
    //     const contentBox = document.querySelector("#sanction-model-body-content");
    //     const editScoreBox = document.querySelector("#sanction-edit-model-score-box");
    //     const editContentBox = document.querySelector("#sanction-edit-model-content");

    //     const titleStr = scoreBox.innerHTML;
    //     const contentStr = contentBox.innerHTML;

    //     editScoreBox.value =  titleStr;
    //     editContentBox.value = contentStr;

    //     sanctionEditShow();
    // }

    // sanction close시에 내용 비우기
    // document.querySelector("#sanction-edit-close").addEventListener('click', function(){
    //     const scoreBox = document.querySelector("#sanction-edit-model-score-box");
    //     const contentBox = document.querySelector("#sanction-edit-model-content");

    //     sanctionEditClose();

    //     scoreBox.value = "";
    //     contentBox.value = "";
    // });

    // 상벌점 수정
    // function sanctionEdit(){
    //     const scoreValue = document.querySelector("#sanction-edit-model-score-box").value;
    //     const contentValue = document.querySelector("#sanction-edit-model-content").value;
    //     $.ajax({
    //         url : "/app/admin/member/sanction-list/edit",
    //         method : "POST",
    //         data : {
    //             "no" : clickNo,
    //             "score" : scoreValue,
    //             "content" : contentValue
    //         },
    //         dataType : "json",
    //         success : function(data) {
    //             sanctionEditClose();
    //             closesanction();
    //             const score = document.querySelector("#sanction-model-sanction-num");
    //             const content = document.querySelector("#sanction-model-body-content");

    //             score.innerHTML = "";
    //             content.innerHTML = "";

    //             const scoreStr = data.score;
    //             const contentStr = data.content;
    //             clickNo = data.no;

    //             score.innerHTML = scoreStr;
    //             content.innerHTML = contentStr;

    //             showsanction();

    //     },
    //     error : function() {
    //             alert("실패");
    //         },
    //     })
    // }
</script>
