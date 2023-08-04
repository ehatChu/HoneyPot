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

    #category {
        margin-top: 10px;
        width: 150px;
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

    /* div { border: 1px solid red; } */

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
                <form action="/app/board/write" method="post" enctype="multipart/form-data">
                    <input type="text" style="display: none;" name="imgList" value="">
                    <div class="title-area">
                        <span id="article">제목</span>
                        
                        <div>
                            <!-- 카테고리 -->
                            <select id="category" name="boardCno">
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
	firstNav(['공지 게시판', '자유 게시판', '장터 게시판', '익명 게시판', '칭찬 게시판'], ''); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
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
    let totalImgList = [];
    function f01(fileList){
        const fd = new FormData();
        for(let file of fileList){
            fd.append("f" , file);
        }

        $.ajax({
            url : '/app/board/upload' ,
            type : 'post' ,
            data : fd ,
            processData : false ,
            contentType : false ,
            dataType : 'json' ,
            success : function(changeNameList){
                console.log(totalImgList);
                console.log(changeNameList);

                for (let c of changeNameList) {
                    totalImgList.push(c);
                }

                const imgList = document.querySelector('input[name=imgList]');
                imgList.value = totalImgList;
                for(let changeName of changeNameList){
                $('#summernote').summernote('insertImage' , '/app/resources/board/' + changeName);
                }
            } ,
            error : function(error){
                console.log(error);
            } ,
        });
    }


</script>