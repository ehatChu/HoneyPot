<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/app/resources/css/admin/member/admin-list.css">
</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <nav>
            <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
            <!-- <%@ include file="/WEB-INF/views/common/second-nav.jsp" %> -->
        </nav>

        <main>
            <form action="/app/admin/member/admin-list" method="GET">
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

            <div class="admin-category-area">
                <a href="/app/admin/member/admin-list?searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}" class="admin-category" id="adminAll">
                    <div>회원</div>
                    <div>${adminCntMap.sum}</div>
                </a>

                <a href="/app/admin/member/admin-list?searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}&status=N" class="admin-category" id="adminN">
                    <div>신규회원</div>
                    <div>${adminCntMap.statusN}</div>
                </a>
                <a href="/app/admin/member/admin-list?searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}&status=S" class="admin-category border-r-solid" id="adminS">
                    <div>정지회원</div>
                    <div>${adminCntMap.statusS}</div>
                </a>
            </div>

            <div class="admin-area">

                <div class="admin-list-area">
                	<c:forEach items="${mList}" var="vo">
                		<c:if test="${vo.status eq 'Y'}">
		                    <div class="admin-list" onclick="showadminDetail(this);">
	                            <div hidden>${vo.no}</div>
		                        <div class="admin-list-img">
		                            <img src="${vo.profile}" alt="프로필사진">
		                        </div>
		                        <div class="admin-list-text">
		                            <span>${vo.name}</span>
		                            <span>(${vo.dongNum}동 ${vo.hoNum}호)</span>
		                        </div>
		                    </div>
                		</c:if>
                		<c:if test="${vo.status eq 'N'}">
		                    <div class="admin-list new-admin" onclick="showadminDetail(this);">
	                            <div hidden>${vo.no}</div>
		                        <div class="admin-list-img">
		                            <img src="${vo.profile}" alt="프로필사진">
		                        </div>
		                        <div class="admin-list-text">
		                            <span>${vo.name}</span>
		                            <span>(${vo.dongNum}동 ${vo.hoNum}호)</span>
		                        </div>
		                    </div>
                		</c:if>
                        <c:if test="${vo.status eq 'S'}">
		                    <div class="admin-list stop-admin" onclick="showadminDetail(this);">
	                            <div hidden>${vo.no}</div>
		                        <div class="admin-list-img">
		                            <img src="${vo.profile}" alt="프로필사진">
		                        </div>
		                        <div class="admin-list-text">
		                            <span>${vo.name}</span>
		                            <span>(${vo.dongNum}동 ${vo.hoNum}호)</span>
		                        </div>
		                    </div>
                		</c:if>
                	</c:forEach>
                </div>
                <div class="admin-detail-area" id="admin-detail-area">
                    <div class="admin-detail-guide-area">
                        <div><span class="material-symbols-outlined" id="admin-detail-guide-img">
                            badge
                            </span></div>
                        <div class="admin-detail-guide-text">상세보기를 원하시면 클릭을 하세요</div>
                    </div>
                </div>

            </div>
            
        </main>
        
</body>

</html>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    firstNav(['회원조회','관리자조회', '제재내역', '상벌점내역', '사유물내역'], '회원조회'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
    let clickNo = null;

    // 회원 상태 카테고리 동적 css
    function adminStatusCheck(){
        const statusCheck = '${searchMap.status}'
        const statusAll = document.querySelector("#adminAll");
        const statusN = document.querySelector("#adminN");
        const statusS = document.querySelector("#adminS");

        if(statusCheck == '' || statusCheck == null || statusCheck == undefined){
            statusAll.classList.add("c-focus");
            // answerAll.lastElementChild.classList.add("yellow");
        }else if(statusCheck == 'N'){
            statusN.classList.add("c-focus");
            // answerN.lastElementChild.classList.add("yellow");
        }else if(statusCheck == 'S'){
            statusS.classList.add("c-focus");
        }

    }

    // 미답변 여부 확인
    function adminNCheck(){
        const noadminNum = '${adminCntMap.statusN}'
        const adminN = document.querySelector("#adminN");
        if(noadminNum > 0){
            adminN.lastElementChild.classList.add("blinking");
            adminN.lastElementChild.classList.add("yellow");
        }
    }

    adminStatusCheck();
    adminNCheck();

    // 회원 상세 보기 ajax
    function showadminDetail(e){
        const mno = e.firstElementChild.innerText;
        $.ajax({
            url : "/app/admin/admin/admin-list/detail",
            method : "POST",
            data : {
                "mno" : mno
            },
            dataType : "json",
            success : function(data) {
                const detailArea = document.querySelector("#admin-detail-area");
                detailArea.innerHTML = "";

                let str = "";

                if(data.status == 'Y'){
                    str =  `<div class="admin-detail-header">
                            <div class="admin-detail-img">
                                <img src="\${data.profile}" alt="">
                            </div>
                            <div class="admin-detail-btn-area">
                                <button class="admin-detail-point-btn" onclick="showPointModel();">상벌점</button>
                                <button class="admin-detail-stop-btn" onclick="showStopModel();">정지</button>
                                <button class="admin-detail-delete-btn" onclick="deleteadmin();">삭제</button>
                            </div>
                        </div>
                        <div class="admin-detail-body-area">
                            <div class="admin-detail-body">
                                <div class="admin-detail-body-title">상세보기</div>
                                <div class="admin-detail-name">
                                    \${data.name}
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>동호수</span>
                                    <span class="admin-detail-content">\${data.dongNum}동 \${data.hoNum}호</span>
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>생년월일</span>
                                    <span class="admin-detail-content">\${data.birth}</span>
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>이메일</span>
                                    <span class="admin-detail-content">\${data.email}</span>
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>연락처</span>
                                    <span class="admin-detail-content">\${data.phone}</span>
                                </div>
                            </div>
                        </div>`
                }else if(data.status == 'N'){
                    str =  `<div class="admin-detail-header">
                            <div class="admin-detail-img">
                                <img src="\${data.profile}" alt="">
                            </div>
                            <div class="admin-detail-btn-area">
                                <button class="admin-detail-admin-btn" onclick="regularadmin();">회원등록</button>
                                <button class="admin-detail-delete-btn" onclick="deleteadmin();">삭제</button>
                            </div>
                        </div>
                        <div class="admin-detail-body-area">
                            <div class="admin-detail-body">
                                <div class="admin-detail-body-title">상세보기</div>
                                <div class="admin-detail-name">
                                    \${data.name}
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>동호수</span>
                                    <span class="admin-detail-content">\${data.dongNum}동 \${data.hoNum}호</span>
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>생년월일</span>
                                    <span class="admin-detail-content">\${data.birth}</span>
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>이메일</span>
                                    <span class="admin-detail-content">\${data.email}</span>
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>연락처</span>
                                    <span class="admin-detail-content">\${data.phone}</span>
                                </div>
                            </div>
                        </div>`
                }else if(data.status == 'S'){
                    str =  `<div class="admin-detail-header">
                            <div class="admin-detail-img">
                                <img src="\${data.profile}" alt="">
                            </div>
                            <div class="admin-detail-btn-area">
                                <button class="admin-detail-point-btn" onclick="showPointModel();">상벌점</button>
                                <button class="admin-detail-delete-btn" onclick="deleteadmin();">삭제</button>
                            </div>
                        </div>
                        <div class="admin-detail-body-area">
                            <div class="admin-detail-body">
                                <div class="admin-detail-body-title">상세보기</div>
                                <div class="admin-detail-name">
                                    \${data.name}
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>동호수</span>
                                    <span class="admin-detail-content">\${data.dongNum}동 \${data.hoNum}호</span>
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>생년월일</span>
                                    <span class="admin-detail-content">\${data.birth}</span>
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>이메일</span>
                                    <span class="admin-detail-content">\${data.email}</span>
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>연락처</span>
                                    <span class="admin-detail-content">\${data.phone}</span>
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
            url : "/app/admin/admin/admin-list/detail",
            method : "POST",
            data : {
                "mno" : mno
            },
            dataType : "json",
            success : function(data) {
                const nameArea = document.querySelector("#stop-model-admin-name");
                const profileArea = document.querySelector("#stop-model-admin-profile");

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

    // 정지 하기
    function setadminStop(){
        
        const mno = clickNo;
        const stopDateValue = document.querySelector("#stop-model-sanction-input").value;
        const contentValue = document.querySelector("#stop-model-body-content").value;
        $.ajax({
            url : "/app/admin/admin/admin-list/stop",
            method : "POST",
            data : {
                "adminNo" : mno,
                "stopDate" : stopDateValue,
                "content" : contentValue
            },
            success : function() {

                const stopNum = document.querySelector("#stop-model-sanction-input");
                const content = document.querySelector("#stop-model-body-content");

                stopNum.value = "";
                content.value = "";

                closeStop();
                alert("회원 정지 성공");
                location.href="/app/admin/admin/admin-list";
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
            url : "/app/admin/admin/admin-list/detail",
            method : "POST",
            data : {
                "mno" : mno
            },
            dataType : "json",
            success : function(data) {
                const nameArea = document.querySelector("#point-model-admin-name");
                const profileArea = document.querySelector("#point-model-admin-profile");

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

    // 상벌점 주기
    function setadminPoint(){
        
        const mno = clickNo;
        const scoreValue = document.querySelector("#point-model-point-input").value;
        const contentValue = document.querySelector("#point-model-body-content").value;
        $.ajax({
            url : "/app/admin/admin/admin-list/point",
            method : "POST",
            data : {
                "adminNo" : mno,
                "score" : scoreValue,
                "content" : contentValue
            },
            success : function() {

                const score = document.querySelector("#point-model-point-input");
                const content = document.querySelector("#point-model-body-content");

                score.value = "";
                content.value = "";

                closePoint();

                alert("완료");
            },
            error : function() {
                    alert("실패");
                },
        })
    }

    // 회원 삭제
    function deleteadmin(){
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
                const mno = clickNo;
                $.ajax({
                url : "/app/admin/admin/admin-list/delete",
                method : "POST",
                data : {
                    "mno" : mno,
                },
                success : function() {
                    alert("회원 삭제 성공");
                    location.href="/app/admin/admin/admin-list";
                },
                error : function() {
                        alert("실패");
                    },
                })
            }
        });
    }

    // 정규 회원 등록
    function regularadmin(){
        Swal.fire({
            title: '정규 회원으로 바꾸시겠습니까?',
            icon: 'question',
            
            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
            cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
            confirmButtonText: '승인', // confirm 버튼 텍스트 지정
            cancelButtonText: '취소', // cancel 버튼 텍스트 지정
            
            // reverseButtons: true, // 버튼 순서 거꾸로
            
            }).then(result => {
            // 만약 Promise리턴을 받으면,
            if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
                const mno = clickNo;
                $.ajax({
                url : "/app/admin/admin/admin-list/regular",
                method : "POST",
                data : {
                    "mno" : mno,
                },
                success : function() {
                    alert("정규 회원 등록 성공");
                    location.href="/app/admin/admin/admin-list";
                },
                error : function() {
                        alert("실패");
                    },
                })
            }
        });
    }

   

    
</script>
