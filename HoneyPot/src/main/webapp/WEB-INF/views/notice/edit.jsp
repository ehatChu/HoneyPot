<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
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
            <div id="page-title">게시글 수정</div>

            <br>

            <div class="form-area">
                <form action="/app/notice/edit?no=${vo.no}" method="post">

                    <div class="title-area">
                        <span id="article">제목</span>

                        <!-- 중요여부 체크박스 -->
                        <span id="importantYn">
                            <c:choose>
                                <c:when test="${vo.importantYn eq 'Y'}">
                                    <input type="checkbox" name="importantYn" value="Y" checked> 상단고정
                                    <!-- <input type="hidden" name="importantYn" value="N" id="hiddenImportantYn"> -->
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox" name="importantYn" value="Y"> 상단고정
                                </c:otherwise>
                            </c:choose>
                        </span>
                        
                        <div>
                            <!-- 카테고리 -->
                            <select id="category" name="noticeCno">
                                <option value="" selected>--카테고리--</option>
                                <c:forEach items="${cvo}" var="cvo">
                                    <c:if test="${vo.noticeCno eq cvo.no}">
                                        <option value="${cvo.no}" selected>${cvo.name}</option>
                                    </c:if>
                                    <c:if test="${vo.noticeCno ne cvo.no}">
                                        <option value="${cvo.no}">${cvo.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
    
                            <input type="text" id="title" name="title" value="${vo.title}">
                        </div>
                    </div>

                    <div>
                        <span id="article">내용</span>

                        <!-- 본문 서머노트 -->
                        <div class="write-content"><textarea id="summernote" name="content"></textarea></div>
                    </div>

                    <div class="write-submit-area"><input class="write-submit" type="submit" value="수정하기"></div>

                </form>
            </div>

        </div>
    </main>

</body>
</html>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>
	basicSetting(); // 기본 셋팅
	headerName('게시판'); // 현재 페이지 이름
	firstNav(['공지 게시판', '자유 게시판', '장터 게시판', '익명 게시판', '칭찬 게시판'], '공지 게시판'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	firstNavLink(['/app/notice/list', '/app/board/free', '/app/board/market', '/app/board/noname', '/app/board/praise',]);


    //서머노트
    $('#summernote').summernote({
        // placeholder: '${vo.content}',
        tabsize: 2,
        height: 300,
        maxHeight: 300,
        minHeight: 300,
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

    // 서머노트에 글 내용 추가
    $("#summernote").summernote('code', '${vo.content}');


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

</script>