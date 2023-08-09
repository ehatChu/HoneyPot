<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" href="/app/resources/css/csc/member/report.css">

<!-- 알람창 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.18/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.18/dist/sweetalert2.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp"%>
	</nav>

	<main>
		
        <div class="report-area">
            <div class="report-text-title">신고 등록</div>

            <div class="report-form-area">
                <form action="/app/csc/report" method="post" onsubmit="return checkInput();">
                    <div class="report-first-area">
                        <div>
                            <div class="report-text">신고유형</div>
                            <div class="report-category-area">
                                <select name="reportCno" class="report-category">
                                    <c:forEach items="${cList}" var="vo">
                                    	<option value="${vo.no}">${vo.name}</option>
                                    </c:forEach>

                                </select>
                            
                            </div>
                        </div>
                        
                        <div class="report-people-body">
                            <div class="report-text">신고대상</div>
                            <div class="report-people-area" id="report-people-area">
                                
                            </div>
                        </div>
                        
                    </div>
        
                    <div class="report-title-area">
                        <div class="report-text">제목</div>
                        <div><input type="text" class="report-title" name="title"></div>
                    </div>
        
                    <div>
                        <div class="report-text">내용</div>
                        <div class="report-content"><textarea id="summernote" name="content"></textarea></div>
                    </div>

                    <div class="report-submit-area"><input class="report-submit" type="submit" value="신고하기"></div>
    
                </form>
            </div>
            

        </div>

        <div class="member-background">
            <div class="member-window">
                <div class="member-popup">
                    <div class="model-header-area">
                        <div class="model-header">
                            <div class="model-header-text">회원찾기</div>
                            <span class="material-symbols-outlined" id="member-close">
                                close
                            </span>
                        </div>
                    </div>

                    <div class="model-main-area">
                        <div class="model-search-area">
                            <div class="model-search-box-area">
                                <select name="searchType" id="" class="model-search-category">
                                    <option value="NAME">이름</option>
                                    <option value="PHONE">연락처</option>
                                </select>
                                <input type="text" name="searchValue" class="model-serach-input">
                            </div>
                            
                            <button type="button" class="model-search-btn" onclick="searchMemberList();">검색</button>
                        </div>
                        <div class="model-content-area" id="member-list-area">
                            	<div class="model-content-plist">
                            		<div hidden></div>
	                                <div class="plist-profile">
                                        <img src="" alt="프로필사진">
                                    </div>
	                                <div class="plist-name"></div>
	                                <div class="plist-address"></div>
	                            </div>
                        </div>

                        <button type="button" class="check-btn" onclick="searchMember();">확인</button>
                    </div>
                </div>
            </div>
        </div>


	</main>

</body>
</html>

<!--  jQuery, bootstrap -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script>

    basicSetting(); // 기본 셋팅
    headerName('고객센터'); // 현재 페이지 이름
	firstNav(['자주묻는질문', '문의하기', '문의목록', '신고하기', '신고목록'], '신고하기');
    firstNavLink(['/app/csc/faq', '/app/csc/inquiry', '/app/csc/inquiry-list', '/app/csc/report', '/app/csc/report-list',]);


    $('#summernote').summernote({
        tabsize: 2,
        height: 300,
        maxHeight:300,
        minHeight:300,
        width: 1200,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });

    // 신고 대상 검색 모달 사용
    function memberShow () {
        document.querySelector(".member-background").className = "member-background show";
    }

    function memberClose () { 
        const searchType = document.querySelector("select[name='searchType']");
        const searchValue = document.querySelector("input[name='searchValue']");
        searchType.value = "NAME";
        searchValue.value = "";

        mno = null;

        document.querySelector(".member-background").className = "member-background";

        searchBtn();
    }

    function memberClose1() {
        const searchType = document.querySelector("select[name='searchType']");
        const searchValue = document.querySelector("input[name='searchValue']");
        searchType.value = "NAME";
        searchValue.value = "";

        document.querySelector(".member-background").className = "member-background";
    }


    // document.querySelector("#report-people").addEventListener('click', memberShow);
    document.querySelector("#member-close").addEventListener('click', memberClose);
    // document.querySelector("#member-check-btn").addEventListener('click', memberClose);
    // document,querySelector(".model-content-plist").addEventListener('click',);


    // 모든 회원 찾기
    function getMemberList() {
        $.ajax({
        url : "/app/csc/report/memberList",
        method : "POST",
        // data : {

        // },
        dataType : "json",
        success : function(data) {
            const area = document.querySelector("#member-list-area");
            area.innerHTML = "";
            let str = "";
            for (let member of data) {
                if(member.no == "${loginMember.no}"){
                    continue;
                }
                str += `<div class="model-content-plist" onclick="checkMember(this);">`
                            		+ `<div hidden>\${member.no}</div>`
	                                +`<div class="plist-profile">`
                                    +    `<img src="/app/resources/member/profile/\${member.profile}" alt="프로필사진">`
                                    +`</div>`
	                                +`<div class="plist-name">\${member.name}</div>`
	                                +`<div class="plist-address">\${member.dongNum}동 \${member.hoNum}</div>`
	                            +`</div>`;
			}

            area.innerHTML = str;
            memberShow();
        },
        error : function() {
            alert("실패");
        },
    })	


    }

    // 검색한 회원 찾기
    function searchMemberList() {
        const searchType = document.querySelector("select[name='searchType']").value;
        const searchValue = document.querySelector("input[name='searchValue']").value;
        console.log(searchType);
        console.log(searchValue);
        $.ajax({
            url : "/app/csc/report/memberList",
            method : "POST",
            data : {
                "searchType" : searchType,
                "searchValue" : searchValue
            },
            dataType : "json",
            success : function(data) {
                const area = document.querySelector("#member-list-area");
                area.innerHTML = "";
                let str = "";
                for (let member of data) {
                    if(member.no == "${loginMember.no}"){
                        continue;
                    }
                    str += `<div class="model-content-plist" onclick="checkMember(this);">`
                                        + `<div hidden>\${member.no}</div>`
                                        +`<div class="plist-profile">`
                                        +    `<img src="/app/resources/member/profile/\${member.profile}" alt="\${member.profile}">`
                                        +`</div>`
                                        +`<div class="plist-name">\${member.name}</div>`
                                        +`<div class="plist-address">\${member.dongNum}동 \${member.hoNum}</div>`
                                    +`</div>`;
                }

                area.innerHTML = str;
                memberShow();
            },
            error : function() {
                alert("실패");
            },
        })
    }

    // 검색한 사람 프로필 보여주기
    let mno = null;

    function searchBtn(data){
        const peopleArea = document.querySelector("#report-people-area");
        peopleArea.innerHTML = "";
        let str = "";
        if(mno == null){
            str += '<button onclick="getMemberList();" class="report-people-btn" type="button">신고대상자 찾기</button>';
        }else{
            str += `<div class="report-peole" onclick="getMemberList();">`
                                  +  `<input name="respondent" hidden value="\${data.no}">`
                                  +  `<div class="report-people-name">\${data.name}</div>`
                                  +  `<div class="report-people-profile">`
                                  +      `<img src="/app/resources/member/profile/\${data.profile}" alt="\${data.profile}">`
                                  +  `</div>`
                                + `</div>`;
        }

        peopleArea.innerHTML = str;
    }
    searchBtn();

    function checkMember(e){
        checkMemberColor(e);
        mno = e.firstElementChild.innerText;
    }

    // 클릭한 사람 색상 바꾸기
    function checkMemberColor(e){
        const pList = document.querySelectorAll(".model-content-plist");

        for(let people of pList){
            people.className = "model-content-plist";
        }
        e.className = "model-content-plist check";
    }

    // 검색한 사람 가져오기
    function searchMember(){

        $.ajax({
            url : "/app/csc/report/member",
            method : "POST",
            data : {
                "mno" : mno
            },
            dataType : "json",
            success : function(data) {
                const area = document.querySelector("#member-list-area");
                console.log(data);
                memberClose1();
                searchBtn(data);
                
            },
            error : function() {
                alert("실패");
            },

        })


    }

    // 값 확인 onsubmit
    function checkInput(){
        const title = document.querySelector("input[name='title']");
        const content = document.querySelector("textarea[name='content']");
        
        if(title.value == "" || title.value == null || content.value == null || content.value == ""){
            $().ready(function () {
                    Swal.fire({
                        icon: 'error',                         // Alert 타입
                        title: '제출형식이 맞지않습니다.',         // Alert 제목
                        text: '제목과 내용을 입력해주세요',  // Alert 내용
                    });
            });
            return false;
        }

        return true;
    }
    



</script>

