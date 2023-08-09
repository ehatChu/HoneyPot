<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="/app/resources/css/csc/member/inquiry.css">

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
		
        <div class="inquiry-area">
            <div class="inquiry-text-title">문의 등록</div>

            <div class="inquiry-form-area">
                <form action="/app/csc/inquiry" method="post" onsubmit="return checkInput();">
                    <div>
                        <div class="inquiry-text">문의유형</div>
                        <div class="inquiry-category-area">
                            <select name="qnaCno" class="inquiry-category">
                                <c:forEach items="${cList}" var="cvo">
                                	<option value="${cvo.no}">${cvo.name}</option>
                                </c:forEach>

                            </select>
                            
                        </div>
                    </div>
        
                    <div class="inquiry-title-area">
                        <div class="inquiry-text">제목</div>
                        <div><input type="text" name="title" class="inquiry-title"></div>
                    </div>
        
                    <div>
                        <div class="inquiry-text">내용</div>
                        <div class="inquiry-content"><textarea id="summernote" name="content"></textarea></div>
                    </div>

                    <div class="inquiry-submit-area"><input class="inquiry-submit" type="submit" value="문의하기"></div>
    
                </form>
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
	firstNav(['자주묻는질문', '문의하기', '문의목록', '신고하기', '신고목록'], '문의하기'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
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

