<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .write-area{
        width: 1440px;
        margin-top: 20px;
        margin-left: 100px;
    }

    #page-title{
        font-size: 40px;
        font-weight: 700;
    }

    #article{
        font-size: 20px;
        font-weight: 700;
        color: #5F5F5F;
        margin-top: 10px;
    }

    .write-form-area{
        margin-top: 15px;
        margin-left: 10px;
    }

    .write-category{
        width: 400px;
        height: 50px;
        border-radius: 8px;
        border: 1px solid rgb(156, 156, 156);
    }

    .write-category-area{
        margin-top: 10px;
    }

    #title-area{
        margin-top: 10px;
    }

    #title{
        margin-top: 10px;
        width: 500px;
        height: 50px;
        border-radius: 8px;
        border: 1px solid rgb(156, 156, 156);
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

    .write-content{
        margin-top: 10px;
        background-color: white;
        border-radius: 6px;
        width: 1200px;
    }

    .write-submit-area{
        margin-top: 30px;
        width: 1200px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .write-submit{
        width: 300px;
        height: 50px;
        background-color: #FAD355;
        border: none;
        border-radius: 8px;
        font-weight: 900;
        font-size: 20px;
        font-family: 'Noto Sans KR';
    }

    .write-submit:hover{
        cursor: pointer;
    }


    /* 투표 모달 */
    .modal {
        height: 700px;
        width: 500px;
        border-radius: 20px;
        overflow: hidden;
        background-color: white;
    }



    #modal-head{
        display: flex;
        justify-content: space-between;
        background-color: #FAD355;
        height: 45px;
        font-size: 20px;
    }

    #modal-head > div{
        margin-top: 8px;
        margin-left: 20px;
        margin-right: 20px;
        font-weight: bold;
        text-align: center;
        justify-content: center;
    }

    #modal-head > div:last-child:hover {
        cursor: pointer;        
    }

    #modal-body {
        height: 100%;
        box-sizing: border-box;
    }

    #modal-body > * {
        margin-left: 15px;
    }

    #modal-article, #dup-radio{
        font-size: 18px;
        font-weight: 700;
        color: #5F5F5F;
        margin-top: 15px;
    }

    #modal-body > input {
        margin-top: 10px;
        width: 250px;
        height: 30px;
        border-radius: 8px;
        border: 1px solid rgb(156, 156, 156);
    }

    .plus-article { width: 105px; }
    .plus-article:hover { cursor: pointer; }

    input[type=date]{
        width: 150px;
    }

    #modal-body > div {
        border: 1px solid red;
    }



</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp"%>
	</nav>

	<main>
		
        <div class="write-area">
            <div id="page-title">게시글 작성</div>

            <br>

            <div class="form-area">
                <form action="" method="post">
        
                    <div class="title-area">
                        <div id="article">제목</div>

                        <div>
                            <input type="text" id="title" placeholder="제목을 입력해주세요.">
                        </div>
                    </div>
        
                    <div>
                        <div id="article">내용</div>

                        <div class="vote-btn-area">
                            <button id="vote-btn">
                                <i class="fa-sharp fa-solid fa-check-to-slot"></i> &nbsp; 투표 생성
                                <!-- <a href="javascript:toggleModal();"><i class="fa-sharp fa-solid fa-check-to-slot"></i> &nbsp; 투표 생성</a> -->
                            </button>
                        </div>

                        <div class="modal">
                            <div id="modal-head">
                                <div>투표 생성</div>
                                <div>&times;</div>
                            </div>

                            <div id="modal-body">
                                <div id="modal-article">제목</div>
                                <input type="text" id="modal-input" placeholder="투표 제목을 입력해주세요.">

                                <div id="modal-article">기간</div>
                                <input type="date" id="start-date"> ~ <input type="date" id="end-date">

                                <div id="modal-article">투표항목</div>
                                <input type="text" id="modal-input" placeholder="항목 입력">

                                <div id="modal-article" class="plus-article">
                                    <i class="fa-solid fa-plus"></i> &nbsp; 항목 추가
                                </div>

                                <div id="dup-radio">
                                    <input type="radio" id="dup" value="y">
                                    <label for="dup">중복 투표 허용</label>
                                </div>
                                

                            </div>
                            

                        </div>


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
        firstNav(['공지 게시판', '자유 게시판', '장터 게시판', '익명 게시판', '칭찬 게시판', '관리자 게시판'], '공지 게시판'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴


        //서머노트
        $('#summernote').summernote({
            placeholder: '내용을 입력해주세요.',
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


        // click on 라벨 추가 모달 열기

        const voteBtn = document.querySelector("#vote-btn");
        const modal = document.querySelector(".modal");

        voteBtn.addEventListener('click', function(e) {
            modal.classList.remove('hidden');
        });

        $(document).on('click', '#add-btn', function (e) {
            console.log("click event");
            $('#modal').addClass('show');
        
        });
        
        // 모달 닫기
        $(document).on('click', '#close_btn', function (e) {
            console.log("click event");
            $('#modal').removeClass('show');
        
        });


        
	</script>