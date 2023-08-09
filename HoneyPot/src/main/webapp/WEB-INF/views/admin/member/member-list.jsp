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

                <a href="/app/admin/member/member-list?searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}&status=N" class="member-category" id="memberN">
                    <div>신규회원</div>
                    <div>${memberCntMap.statusN}</div>
                </a>
                <a href="/app/admin/member/member-list?searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}&status=S" class="member-category border-r-solid" id="memberS">
                    <div>정지회원</div>
                    <div>${memberCntMap.statusS}</div>
                </a>
            </div>

            <div class="member-area">

                <div class="member-list-area">
                	<c:forEach items="${mList}" var="vo">
                		<c:if test="${vo.status eq 'Y'}">
		                    <div class="member-list" onclick="showMemberDetail(this);">
	                            <div hidden>${vo.no}</div>
		                        <div class="member-list-img">
		                            <img src="/app/resources/member/profile/${vo.profile}" alt="프로필사진">
		                        </div>
		                        <div class="member-list-text">
		                            <span>${vo.name}</span>
		                            <span>(${vo.dongNum}동 ${vo.hoNum}호)</span>
		                        </div>
		                    </div>
                		</c:if>
                		<c:if test="${vo.status eq 'N'}">
		                    <div class="member-list new-member" onclick="showMemberDetail(this);">
	                            <div hidden>${vo.no}</div>
		                        <div class="member-list-img">
		                            <img src="/app/resources/member/profile/${vo.profile}" alt="프로필사진">
		                        </div>
		                        <div class="member-list-text">
		                            <span>${vo.name}</span>
		                            <span>(${vo.dongNum}동 ${vo.hoNum}호)</span>
		                        </div>
		                    </div>
                		</c:if>
                        <c:if test="${vo.status eq 'S'}">
		                    <div class="member-list stop-member" onclick="showMemberDetail(this);">
	                            <div hidden>${vo.no}</div>
		                        <div class="member-list-img">
		                            <img src="/app/resources/member/profile/${vo.profile}" alt="프로필사진">
		                        </div>
		                        <div class="member-list-text">
		                            <span>${vo.name}</span>
		                            <span>(${vo.dongNum}동 ${vo.hoNum}호)</span>
		                        </div>
		                    </div>
                		</c:if>
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
                                <div><input class="point-model-sanction-input" id="point-model-point-input" type="number"></div>
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
                            <textarea name="" id="point-model-body-content" class="point-model-body-content" cols="30" rows="10"></textarea>
                        </div>

                        <div class="point-model-btn-area">
                            <button id="point-check-btn" class="point-model-btn b-yellow" onclick="setMemberPoint()">점수주기</button>

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
                                <div><input class="stop-model-sanction-input" id="stop-model-sanction-input" type="number"></div>
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
                            <textarea name="" id="stop-model-body-content" class="stop-model-body-content" cols="30" rows="10"></textarea>
                        </div>

                        <div class="stop-model-btn-area">
                            <button id="stop-check-btn" class="stop-model-btn b-red" onclick="setMemberStop();">정지하기</button>

                        </div>

                    </div>
    
                </div>
            </div>
        </div>

        <script>
            

        </script>

</body>

</html>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    firstNav(['회원조회', '관리자조회', '제재내역', '상벌점내역', '사유물내역'], '회원조회'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    firstNavLink(['/app/admin/member/member-list', '/app/admin/member/admin-list', '/app/admin/member/sanction-list', '/app/admin/member/point-list', '/app/csc/report-list',]);
    let clickNo = null;

    // 회원 상태 카테고리 동적 css
    function memberStatusCheck(){
        const statusCheck = '${searchMap.status}'
        const statusAll = document.querySelector("#memberAll");
        const statusN = document.querySelector("#memberN");
        const statusS = document.querySelector("#memberS");

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
    function memberNCheck(){
        const noMemberNum = '${memberCntMap.statusN}'
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
                    str +=  `<div class="member-detail-header">
                            <div class="member-detail-img">
                                <img src="/app/resources/member/profile/\${data.profile}" alt="">
                            </div>
                            <div class="member-detail-btn-area">
                                `;
                                if("${loginAdmin.grade}" == 'M' || "${loginAdmin.grade}" == 'S'){
                                    str += `<button class="member-detail-point-btn" onclick="showPointModel();">상벌점</button>
                                    <button class="member-detail-stop-btn" onclick="showStopModel();">정지</button>
                                    <button class="member-detail-delete-btn" onclick="deleteMember();">삭제</button>`;

                                }else{
                                    str += `<button class="member-detail-point-btn" onclick="showPointModel();">상벌점</button>`;
                                }
                                
                           str += `</div>
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
                }else if(data.status == 'N'){
                    str +=  `<div class="member-detail-header">
                            <div class="member-detail-img">
                                <img src="/app/resources/member/profile/\${data.profile}" alt="">
                            </div>
                            <div class="member-detail-btn-area">
                                `;
                                if("${loginAdmin.grade}" == 'M' || "${loginAdmin.grade}" == 'S'){
                                    str += `<button class="member-detail-member-btn" onclick="regularMember();">회원등록</button>
                                    <button class="member-detail-delete-btn" onclick="deleteMember();">삭제</button>`;

                                }

                            str += `</div>
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
                }else if(data.status == 'S'){
                    str +=  `<div class="member-detail-header">
                            <div class="member-detail-img">
                                <img src="/app/resources/member/profile/\${data.profile}" alt="">
                            </div>
                            <div class="member-detail-btn-area">`;
                                if("${loginAdmin.grade}" == 'M' || "${loginAdmin.grade}" == 'S'){
                                    str += `<button class="member-detail-point-btn" onclick="showPointModel();">상벌점</button>
                                    <button class="member-detail-delete-btn" onclick="deleteMember();">삭제</button>`;
                                }else{
                                    str += `<button class="member-detail-point-btn" onclick="showPointModel();">상벌점</button>`;
                                }
                           str += `
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

    // 정지 하기
    function setMemberStop(){
        
        const mno = clickNo;
        const stopDateValue = document.querySelector("#stop-model-sanction-input").value;
        const contentValue = document.querySelector("#stop-model-body-content").value;
        $.ajax({
            url : "/app/admin/member/member-list/stop",
            method : "POST",
            data : {
                "memberNo" : mno,
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
                location.href="/app/admin/member/member-list";
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

    // 상벌점 주기
    function setMemberPoint(){
        
        const mno = clickNo;
        const scoreValue = document.querySelector("#point-model-point-input").value;
        const contentValue = document.querySelector("#point-model-body-content").value;
        $.ajax({
            url : "/app/admin/member/member-list/point",
            method : "POST",
            data : {
                "memberNo" : mno,
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
    function deleteMember(){
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
                url : "/app/admin/member/member-list/delete",
                method : "POST",
                data : {
                    "mno" : mno,
                },
                success : function() {
                    alert("회원 삭제 성공");
                    location.href="/app/admin/member/member-list";
                },
                error : function() {
                        alert("실패");
                    },
                })
            }
        });
    }

    // 정규 회원 등록
    function regularMember(){
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
                url : "/app/admin/member/member-list/regular",
                method : "POST",
                data : {
                    "mno" : mno,
                },
                success : function() {
                    alert("정규 회원 등록 성공");
                    location.href="/app/admin/member/member-list";
                },
                error : function() {
                        alert("실패");
                    },
                })
            }
        });
    }

   

    
</script>
