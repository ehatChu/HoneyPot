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

        .write-text-title{
            font-size: 40px;
            font-weight: 700;
        }

        .write-text{
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

        .write-title-area{
            margin-top: 10px;
        }

        .write-title{
            margin-top: 10px;
            width: 1200px;
            height: 50px;
            border-radius: 8px;
            border: 1px solid rgb(156, 156, 156);
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

    </style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp"%>
	</nav>

	<main>
		
        <div class="write-area">
            <div class="write-text-title">게시글 작성</div>

            <br>

            <div class="-form-area">
                <form action="" method="post">
        
                    <div class="write-title-area">
                        <div class="write-text">제목</div>
                        <div><input type="text" class="write-title" placeholder="제목을 입력해주세요."></div>
                    </div>
        
                    <div>
                        <div class="write-text">내용</div>
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
	// 기본 셋팅 (수정x)
	function basicSetting() {
			const nav = document.querySelector("nav");
			const main = document.querySelector("main");
			const mainArea = document.querySelector("#main-area");
			const navArea = document.querySelector("#nav-area");
			mainArea.innerHTML = main.innerHTML;
			navArea.innerHTML = nav.innerHTML;
			main.innerHTML = "";
			nav.innerHTML = "";
		}

		// 수정1,2 : navMenu1,2에 메뉴를 적어주세요
		function firstNav() {
			const mainChoice = document.querySelector("#main-choice");
			let navMenu1 = ['공지 게시판', '자유 게시판', '장터 게시판', '익명 게시판', '칭찬 게시판', '관리자 게시판'];

			let menus = "";
			for (let menu of navMenu1) {
				menus += "<div class='choice-elem'><div class='title-elem'>" + menu + "</div></div>"
			}
			mainChoice.innerHTML = menus;
		}

		// 함수 실행
		basicSetting();
		firstNav();

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
	</script>