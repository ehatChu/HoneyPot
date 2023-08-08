<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
    .write-area {
        width: 1440px;
        margin-top: 20px;
        margin-left: 100px;
    }

    #page-title {
        font-size: 40px;
        font-weight: 700;
    }

    #article {
        font-size: 20px;
        font-weight: 700;
        color: #5F5F5F;
        margin-top: 10px;
    }

    .title-area { margin-bottom: 20px; }

    #importantYn {
        font-size: 15px;
        font-weight: 700;
        color: #5F5F5F;
        margin-top: 10px;
        margin-left: 10px;
    }

    #category {
        margin-top: 10px;
        width: 140px;
		height: 50px;
        border-radius: 8px;
        border: 1px solid rgb(156, 156, 156);
        padding: 10px;
        outline: none;
        font-size: 18px;
		font-family: 'Noto Sans KR';
    }

    #title {
        margin-top: 10px;
        width: 500px;
        height: 50px;
        border-radius: 8px;
        border: 1px solid rgb(156, 156, 156);
        padding: 10px;
        outline: none;
        font-size: 18px;
		font-family: 'Noto Sans KR';
    }

    .vote-btn-area {
        margin-top: 10px;
    }

    #vote-btn {
        background-color: white;
        border-radius: 8px;
        border: 1px solid rgb(156, 156, 156);
        width: 125px;
        height: 30px;
        cursor: pointer;
        color: #868686;
        font-size: 15px;
        font-weight: 600;
        font-family: 'Noto Sans KR';
    }

    .write-content {
        margin-top: 10px;
        background-color: white;
        border-radius: 6px;
        width: 1200px;
    }

    .write-submit-area {
        margin-top: 30px;
        width: 1200px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .write-submit {
        width: 300px;
        height: 50px;
        background-color: #FAD355;
        border: none;
        border-radius: 8px;
        font-weight: 900;
        font-size: 20px;
        font-family: 'Noto Sans KR';
    }

    .write-submit:hover { cursor: pointer; }


    /* 투표 모달 */

    .modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 1000;
    }

    .hidden {
        display: none;
    }

    .bg {
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.6);
        position: absolute;
    }

    .modal-content {
        max-height: 473px;
        width: 325px;
        border-radius: 20px;
        overflow-y: auto;
        background-color: white;
        position: absolute;
    }

    .modal-content::-webkit-scrollbar {
        display: none;
    }

    #modal-head {
        display: flex;
        justify-content: space-between;
        background-color: #FAD355;
        height: 45px;
        font-size: 20px;
    }

    #modal-head > div {
        margin-top: 8px;
        margin-left: 20px;
        margin-right: 20px;
        font-weight: bold;
        text-align: center;
    }

    #modal-head > div:last-child:hover {
        cursor: pointer;
    }

    #modal-body {
        height: 100%;
        box-sizing: border-box;
    }

    #modal-body > *:not(:last-of-type) {
        margin-left: 15px;
    }

    #modal-article, #dup-checkbox {
        font-size: 18px;
        font-weight: 700;
        color: #5F5F5F;
        margin-top: 20px;
    }

    #modal-body input {
        margin-top: 8px;
        width: 250px;
        height: 30px;
        border-radius: 8px;
        border: 1px solid rgb(156, 156, 156);
        padding-left: 10px;
    }

    .plus-article {
        width: 105px;
    }

    .plus-article:hover {
        cursor: pointer;
    }

    #modal-body input[type=date] {
        width: 150px;
    }

    #modal-body input[type=checkbox] {
        height: 15px;
        width: 20px;
        border: 1px solid rgb(156, 156, 156);
        margin-top: 0px;
    }

    #insert-btn-area {
        margin-top: 30px;
        text-align: center;
    }

    #insert-btn {
        width: 100px;
        height: 30px;
        background-color: #FAD355;
        border: none;
        border-radius: 8px;
        font-weight: 700;
        font-size: 18px;
        font-family: 'Noto Sans KR';
    }

    #insert-btn:hover {
        cursor: pointer;
    }


    /* 투표 UI */
    .vote-wrap {
        border: 3px solid #4A321F;
        border-radius: 20px;
        margin: 10px 0px;
        padding: 10px;
        background: white;
        width: 350px;
        overflow-x: auto;
    }

    #vote-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    #vote-title {
        font-size: 18px;
        font-weight: bold;
    }

    #vote-end-date {
        margin-right: 40px;
        font-size: 15px;
        color: #5F5F5F;
        color: rgb(156, 156, 156);;
    }

    #vote-del-btn {
        cursor: pointer;
    }

    #vote-body {
        display: grid;
        grid-template-columns: 1fr;
        overflow:auto;
        white-space: nowrap;
        /* text-overflow: ellipsis; */
        margin-top: 10px;
    }

</style>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <nav>
        <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
    </nav>

    <main>

        <!-- 게시글 작성란 -->
        <div class="write-area">
            <div id="page-title">게시글 작성</div>

            <br>

            <div class="form-area">
                <form action="/app/notice/write" method="post" enctype="multipart/form-data">
                    <input type="text" style="display: none;" name="imgList">
                    <div class="title-area">
                        <span id="article">제목</span>

                        <!-- 중요여부 체크박스 -->
                        <span id="importantYn">
                            <input type="checkbox" name="importantYn" value="Y"> 상단고정
                        </span>
                        
                        <div>
                            <!-- 카테고리 -->
                            <select id="category" name="noticeCno">
                                <option value="" selected>--카테고리--</option>
                                <c:forEach items="${cvo}" var="cvo">
                                    <option value="${cvo.no}">${cvo.name}</option>
                                </c:forEach>
                            </select>
    
                            <input type="text" id="title" name="title" placeholder="제목을 입력해주세요.">
                        </div>
                    </div>

                    <div>
                        <span id="article">내용</span>

                        <div class="vote-btn-area">
                            <button type="button" id="vote-btn">
                                <i class="fa-sharp fa-solid fa-check-to-slot"></i> &nbsp; 투표 생성
                            </button>
                        </div>


                        <!-- 모달 -->
                        <div class="modal hidden">
                            <div class="bg"></div>

                            <div class="modal-content">
                                <div id="modal-head">
                                    <div>투표 생성</div>
                                    <div id="close-btn">&times;</div>
                                </div>

                                <div id="modal-body">
                                    <div id="modal-article">제목</div>
                                    <div><input type="text" id="modal-title-input" placeholder="투표 제목"></div>

                                    <div id="modal-article">종료일</div>
                                    <div><input type="date" id="end-date"></div>
                                    <!-- <input type="date" id="start-date"> ~ <input type="date" id="end-date"> -->

                                    <div id="vote-article-area">
                                        <div id="modal-article">투표항목</div>
                                        <div class="vote-article">
                                            <input type="text" id="vote-article" placeholder="항목 입력"><span onclick="del();">&times;</span>
                                        </div>
                                    </div>

                                    <div id="modal-article" class="plus-article">
                                        <i class="fa-solid fa-plus"></i> &nbsp; 항목 추가
                                    </div>

                                    <!-- <div id="dup-checkbox">
                                        <label for="dup">
                                            <input type="checkbox" id="dup" value="Y">
                                            중복 투표 허용
                                        </label>
                                    </div> -->

                                    <div id="insert-btn-area">
                                        <button type="button" id="insert-btn" onclick="makeVote();">확인</button>
                                    </div>
                                </div>
                                
                                <br>
                            </div>
                        </div>

                        
                        <!-- 투표 ui -->
                        <div class="vote-wrap hidden">
                            <div id="vote-header">
                                <input type="hidden" id="vote-title-hidden" name="voteTitle" value="">
                                <div id="vote-title">투표제목</div>
                                <input type="hidden" id="vote-end-date-hidden" name="endDate" value="">
                                <div id="vote-end-date">종료일 : 0000-00-00</div>
                                <div id="vote-del-btn">&times;</div>
                            </div>
    
                            <div id="vote-body">
                                <div>
                                    <!-- <label>
                                        <input type="hidden" name="voteCandidateNo" value="">
                                        <input type="hidden" name="voteCandidateName" value="">
                                        <input class="vote-target" id="vote-target" type="radio" name="voteCandidateNo">&nbsp;<span name="voteCandidateName">1번</span>
                                    </label> -->
                                </div>
                            </div>
                        </div>


                        <!-- 본문 서머노트 -->
                        <div class="write-content"><textarea id="summernote" name="content"></textarea></div>
                    </div>

                    <div class="write-submit-area"><input class="write-submit" type="submit" value="글쓰기"></div>

                </form>
            </div>

        </div>




    </main>

</body>
</html>


<script>
	basicSetting(); // 기본 셋팅
	headerName('게시판'); // 현재 페이지 이름
	firstNav(['공지 게시판', '자유 게시판', '장터 게시판', '익명 게시판', '칭찬 게시판'], '공지 게시판'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	firstNavLink(['/app/notice/list', '/app/board/free', '/app/board/market', '/app/board/noname', '/app/board/praise',]);


    //서머노트
    $('#summernote').summernote({
        placeholder: '내용을 입력해주세요.',
        tabsize: 2,
        height: 300,
        maxHeight: 300,
        minHeight: 300,
        width: 1200,
        callbacks : {
          onImageUpload : f01
        },
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

    //파일업로드 발생 시 동작하는 콜백함수
    function f01(fileList){
        const fd = new FormData();
        for(let file of fileList){
            fd.append("f" , file);
        }

        $.ajax({
            url : '/app/notice/upload' ,
            type : 'post' ,
            data : fd ,
            processData : false ,
            contentType : false ,
            dataType : 'json' ,
            success : function(changeNameList){
                console.log(changeNameList);
                const imgList = document.querySelector('input[name=imgList]');
                imgList.value = changeNameList;
                for(let changeName of changeNameList){
                $('#summernote').summernote('insertImage' , '/app/resources/notice/' + changeName);
                }
            } ,
            error : function(error){
                console.log(error);
            } ,
        });
    }


    //모달
    const voteBtn = document.querySelector("#vote-btn");
    const closeBtn = document.querySelector("#close-btn");
    const modal = document.querySelector(".modal");
    const plusArticle = document.querySelector(".plus-article");
    const voteArticleArea = document.querySelector('#vote-article-area');

    //투표 모달 항목 추가
    plusArticle.addEventListener('click', function () {
        voteArticleArea.innerHTML += '<div class="vote-article"><input type="text" id="vote-article" placeholder="항목 입력"><span onclick="del();">&times;</span></div>';
    })

    //투표 모달 항목 삭제
    function del() {
        let xButton = event.target;
        xButton.previousSibling.remove();
        xButton.remove();
        modal.style.height = initHeight + "px";
    };

    //투표 모달 열기
    voteBtn.addEventListener('click', function() {
        modal.classList.remove('hidden');
    });

    //투표 모달 닫기
    closeBtn.addEventListener('click', function() {
        modal.classList.add('hidden');
    });


    //상단고정 여부 값 전달
    // function updateCheckbox () {
    //     const importantYn = document.querySelector("input[name=importantYn]");
    //     if (importantYn.checked) {
    //         importantYn.value = 'Y';
    //         console.log(importantYn.value);
    //     }else {
    //         importantYn.value = 'N';
    //         console.log(importantYn.value);
    //     }
    // }


        //상단고정 여부 값 전달
        const form = document.querySelector("form");
    form.addEventListener("submit",function(){
        const importantYn = document.querySelector("input[name=importantYn]");
        if (importantYn.checked) {
            importantYn.value = 'Y';
            console.log(importantYn.value);
        }else {
            importantYn.value = 'N';
            console.log(importantYn.value);
        }
    })


    //투표 생성
    function makeVote() {

        //제목 입력창
        const modalTitleInput = document.querySelector("#modal-title-input");
        //종료일 입력창
        const endDate = document.querySelector("#end-date");
        //투표항목 입력창
        const voteArticleArr = document.querySelectorAll("#vote-article");

        
        //입력된 제목
        const voteTitle = document.querySelector("#vote-title");
        //숨긴 제목
        const voteTitleHidden = document.querySelector("#vote-title-hidden");
        
        //입력된 종료일
        const voteEndDate = document.querySelector("#vote-end-date");
        //숨긴 종료일
        const voteEndDateHidden = document.querySelector("#vote-end-date-hidden");
       
        //투표항목 구역
        const voteBody = document.querySelector("#vote-body");
        //투표항목
        // const voteTarget = document.querySelector("#vote-target");
        

        voteTitle.innerHTML = modalTitleInput.value;
        voteTitleHidden.value = modalTitleInput.value;
        voteEndDate.innerHTML = "종료일 : " + endDate.value;
        voteEndDateHidden.value = endDate.value;

        
        voteBody.innerHTML = '';
        for (let i=1 ; i <= voteArticleArr.length ; i++){
            voteBody.innerHTML 
                += '<div><label><input type="hidden" name="voteCandidateNo" value="' + i + '"><input type="hidden" name="voteCandidateName" value="' + voteArticleArr[i-1].value + '">'
                + '<input class="vote-target" id="vote-target' + i + '" type="radio" name="voteCandidateNo" disabled>&nbsp;<span name="voteCandidateName">' + voteArticleArr[i-1].value + '</span></label></div>';
        }
        
        // const voteCandidateName = document.querySelector('input[name=voteCandidateName]');
        // console.log(voteCandidateName.value);

        // const voteTargetArr = document.querySelectorAll("#vote-target");
        // console.log(voteTargetArr[1].value);


        //제출시, 모달 숨기고 투표 미리보기
        modal.classList.add('hidden');
        const voteWrap = document.querySelector(".vote-wrap");
        const voteDelBtn = document.querySelector("#vote-del-btn");
        voteWrap.classList.remove('hidden');

        console.log("메이크보트 실행됨~~");

    }


    //투표 삭제
    const voteWrap = document.querySelector(".vote-wrap");
    const voteDelBtn = document.querySelector("#vote-del-btn");
    voteDelBtn.addEventListener('click', function() {
        voteWrap.classList.add('hidden');
    });
    


</script>