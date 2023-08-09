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
                    <div>전체</div>
                    <div>${adminCntMap.sum}</div>
                </a>
                <a href="/app/admin/member/admin-list?searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}&grade=D" class="admin-category" id="adminGradeD">
                    <div>동대표</div>
                    <div>${adminCntMap.gradeD}</div>
                </a>
                <a href="/app/admin/member/admin-list?searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}&grade=S" class="admin-category" id="adminGradeS">
                    <div>경비원</div>
                    <div>${adminCntMap.gradeS}</div>
                </a>
                <a href="/app/admin/member/admin-list?searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}&status=N" class="admin-category" id="adminStatusN">
                    <div>신규관리자</div>
                    <div>${adminCntMap.statusN}</div>
                </a>
                <a href="/app/admin/member/admin-list?searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}&status=S" class="admin-category border-r-solid" id="adminStatusS">
                    <div>정지관리자</div>
                    <div>${adminCntMap.statusS}</div>
                </a>
            </div>

            <div class="admin-area">

                <div class="admin-list-area">
                	<c:forEach items="${aList}" var="vo">
                		<c:if test="${vo.status eq 'Y'}">
		                    <div class="admin-list" onclick="showadminDetail(this);">
	                            <div hidden>${vo.no}</div>
		                        <div class="admin-list-img">
		                            <img src="/app/resources/member/profile/${vo.profile}" alt="프로필사진">
		                        </div>
		                        <div class="admin-list-text">
		                            <span>${vo.name}</span>
		                        </div>
		                    </div>
                		</c:if>
                		<c:if test="${vo.status eq 'N'}">
		                    <div class="admin-list new-admin" onclick="showadminDetail(this);">
	                            <div hidden>${vo.no}</div>
		                        <div class="admin-list-img">
		                            <img src="/app/resources/member/profile/${vo.profile}" alt="프로필사진">
		                        </div>
		                        <div class="admin-list-text">
		                            <span>${vo.name}</span>
		                        </div>
		                    </div>
                		</c:if>
                        <c:if test="${vo.status eq 'S'}">
		                    <div class="admin-list stop-admin" onclick="showadminDetail(this);">
	                            <div hidden>${vo.no}</div>
		                        <div class="admin-list-img">
		                            <img src="/app/resources/member/profile/${vo.profile}" alt="프로필사진">
		                        </div>
		                        <div class="admin-list-text">
		                            <span>${vo.name}</span>
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
    firstNav(['회원조회', '관리자조회', '제재내역', '상벌점내역', '사유물내역'], '관리자조회'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    firstNavLink(['/app/admin/member/member-list', '/app/admin/member/admin-list', '/app/admin/member/sanction-list', '/app/admin/member/point-list', '/app/car-list',]);
    let clickNo = null;

    // 회원 상태 카테고리 동적 css
    function adminStatusCheck(){
        const statusCheck = '${searchMap.status}'
        const gradeCheck = '${searchMap.grade}'
        const statusAll = document.querySelector("#adminAll");
        const gradeD = document.querySelector("#adminGradeD");
        const gradeS = document.querySelector("#adminGradeS");
        const statusN = document.querySelector("#adminStatusN");
        const statusS = document.querySelector("#adminStatusS");

        
        if(statusCheck == 'N'){
            statusN.classList.add("c-focus");
            // answerN.lastElementChild.classList.add("yellow");
        }else if(statusCheck == 'S'){
            statusS.classList.add("c-focus");
        }else if(gradeCheck == 'D'){
            gradeD.classList.add("c-focus");
        }else if(gradeCheck == 'S'){
            gradeS.classList.add("c-focus");
        }else if(statusCheck == '' || statusCheck == null || statusCheck == undefined || gradeCheck == '' || gradeCheck == null || gradeCheck == undefined){
            statusAll.classList.add("c-focus");
            // answerAll.lastElementChild.classList.add("yellow")
        }

    }

    // 신규 관리자 여부 확인
    function adminNCheck(){
        const noadminNum = '${adminCntMap.statusN}'
        const adminN = document.querySelector("#adminStatusN");
        if(noadminNum > 0){
            adminN.lastElementChild.classList.add("blinking");
            adminN.lastElementChild.classList.add("blue");
        }
    }

    adminStatusCheck();
    adminNCheck();

    // 회원 상세 보기 ajax
    function showadminDetail(e){
        const ano = e.firstElementChild.innerText;
        $.ajax({
            url : "/app/admin/member/admin-list/detail",
            method : "POST",
            data : {
                "ano" : ano
            },
            dataType : "json",
            success : function(data) {
                const detailArea = document.querySelector("#admin-detail-area");
                detailArea.innerHTML = "";

                let str = "";

                if(data.status == 'Y'){
                    str +=  `<div class="admin-detail-header">
                            <div class="admin-detail-img">
                                <img src="/app/resources/member/profile/\${data.profile}" alt="">
                            </div>
                            <div class="admin-detail-btn-area">
                                <button class="admin-detail-stop-btn" onclick="stopAdmin();">정지</button>
                                <button class="admin-detail-delete-btn" onclick="deleteAdmin();">삭제</button>
                            </div>
                        </div>
                        <div class="admin-detail-body-area">
                            <div class="admin-detail-body">
                                <div class="admin-detail-body-title">상세보기</div>
                                <div class="admin-detail-name">
                                    \${data.name}
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>직급</span>
                                    `;
                                    if(data.grade == 'D'){
                                        str += `<span class="admin-detail-content">동대표</span>`
                                    }else if(data.grade == 'S'){
                                        str += `<span class="admin-detail-content">경비원</span>`
                                    }
                                    str += `
                                </div>
                            </div>
                        </div>`
                }else if(data.status == 'N'){
                    str =  `<div class="admin-detail-header">
                            <div class="admin-detail-img">
                                <img src="/app/resources/member/profile/\${data.profile}" alt="">
                            </div>
                            <div class="admin-detail-btn-area">
                                <button class="admin-detail-admin-btn" onclick="regularAdmin();">승인</button>
                                <button class="admin-detail-delete-btn" onclick="deleteAdmin();">삭제</button>
                            </div>
                        </div>
                        <div class="admin-detail-body-area">
                            <div class="admin-detail-body">
                                <div class="admin-detail-body-title">상세보기</div>
                                <div class="admin-detail-name">
                                    \${data.name}
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>직급</span>
                                    `;
                                    if(data.grade == 'D'){
                                        str += `<span class="admin-detail-content">동대표</span>`
                                    }else if(data.grade == 'S'){
                                        str += `<span class="admin-detail-content">경비원</span>`
                                    }
                                    str += `
                                </div>
                            </div>
                        </div>`
                }else if(data.status == 'S'){
                    str =  `<div class="admin-detail-header">
                            <div class="admin-detail-img">
                                <img src="/app/resources/member/profile/\${data.profile}" alt="">
                            </div>
                            <div class="admin-detail-btn-area">
                                <button class="admin-detail-point-btn" onclick="regularAdmin();">정지해제</button>
                                <button class="admin-detail-delete-btn" onclick="deleteAdmin();">삭제</button>
                            </div>
                        </div>
                        <div class="admin-detail-body-area">
                            <div class="admin-detail-body">
                                <div class="admin-detail-body-title">상세보기</div>
                                <div class="admin-detail-name">
                                    \${data.name}
                                </div>
                                <div class="admin-detail-content-box">
                                    <span>직급</span>
                                    `;
                                    if(data.grade == 'D'){
                                        str += `<span class="admin-detail-content">동대표</span>`
                                    }else if(data.grade == 'S'){
                                        str += `<span class="admin-detail-content">경비원</span>`
                                    }
                                    str += `
                                </div>
                            </div>
                        </div>`
                }

                clickNo = ano;
                
                detailArea.innerHTML = str;
            },
            error : function() {
                    alert("실패");
                },
        })

    }

    // 관리자 정지
    function stopAdmin(){
        Swal.fire({
            title: '정말로 정지하시겠습니까?',
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
                const ano = clickNo;
                $.ajax({
                url : "/app/admin/member/admin-list/stop",
                method : "POST",
                data : {
                    "ano" : ano,
                },
                success : function() {
                    alert("관리자 정지 성공");
                    location.href="/app/admin/member/admin-list";
                },
                error : function() {
                        alert("실패");
                    },
                })
            }
        });
    }

    // 관리자 삭제
    function deleteAdmin(){
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
                const ano = clickNo;
                $.ajax({
                url : "/app/admin/member/admin-list/delete",
                method : "POST",
                data : {
                    "ano" : ano,
                },
                success : function() {
                    alert("관리자 삭제 성공");
                    location.href="/app/admin/member/admin-list";
                },
                error : function() {
                        alert("실패");
                    },
                })
            }
        });
    }

    // 관리자 승인
    function regularAdmin(){
        Swal.fire({
            title: '관리자 승인하시겠습니까?',
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
                const ano = clickNo;
                $.ajax({
                url : "/app/admin/member/admin-list/regular",
                method : "POST",
                data : {
                    "ano" : ano,
                },
                success : function() {
                    alert("관리자 승인 성공");
                    location.href="/app/admin/member/admin-list";
                },
                error : function() {
                        alert("실패");
                    },
                })
            }
        });
    }

   

    
</script>
