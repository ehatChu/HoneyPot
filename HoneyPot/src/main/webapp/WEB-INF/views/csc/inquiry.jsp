<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        .inquiry-area{
            width: 1440px;
            margin-top: 20px;
            margin-left: 100px;
        }

        .inquiry-text-title{
            font-size: 40px;
            font-weight: 700;
        }

        .inquiry-text{
            font-size: 20px;
            font-weight: 700;
            color: #5F5F5F;
            margin-top: 10px;
        }

        .inquiry-form-area{
            margin-top: 15px;
            margin-left: 10px;
        }

        .inquiry-category{
            width: 400px;
            height: 50px;
            border-radius: 8px;
            border: 1px solid rgb(156, 156, 156);
        }

        .inquiry-category-area{
            margin-top: 10px;
        }

        .inquiry-title-area{
            margin-top: 10px;
        }

        .inquiry-title{
            margin-top: 10px;
            width: 1200px;
            height: 50px;
            border-radius: 8px;
            border: 1px solid rgb(156, 156, 156);
        }

        .inquiry-content{
            margin-top: 10px;
            background-color: white;
            border-radius: 6px;
            width: 1200px;
        }

        .inquiry-submit-area{
            margin-top: 30px;
            width: 1200px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .inquiry-submit{
            width: 300px;
            height: 50px;
            background-color: #FAD355;
            border: none;
            border-radius: 8px;
            font-weight: 900;
            font-size: 20px;
            font-family: 'Noto Sans KR';
        }

        .inquiry-submit:hover{
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
		
        <div class="inquiry-area">
            <div class="inquiry-text-title">문의 등록</div>

            <div class="inquiry-form-area">
                <form action="" method="post">
                    <div>
                        <div class="inquiry-text">문의유형</div>
                        <div class="inquiry-category-area">
                            <select name="" class="inquiry-category">
                                <option value=""></option>

                            </select>
                            
                        </div>
                    </div>
        
                    <div class="inquiry-title-area">
                        <div class="inquiry-text">제목</div>
                        <div><input type="text" class="inquiry-title"></div>
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

<script>
	const nav = document.querySelector("nav");
	const main = document.querySelector("main");
	const mainArea = document.querySelector("#main-area");
	const navArea = document.querySelector("#nav-area");

	mainArea.innerHTML = main.innerHTML;
	navArea.innerHTML = nav.innerHTML;
	main.innerHTML = "";
	nav.innerHTML = "";

    function firstNav() {
			const mainChoice = document.querySelector("#main-choice");
			let navMenu1 = ['자주묻는질문', '문의하기', '문의목록', '신고하기', '신고목록'];

			let menus = "";
			for (let menu of navMenu1) {
				menus += "<div class='choice-elem'><div class='title-elem'>" + menu + "</div></div>"
			}
			mainChoice.innerHTML = menus;
    }

    function headerName() {
			const mainChoice = document.querySelector("#header-main-text");
            mainChoice.innerHTML = '';
			let menus = '고객센터';

			mainChoice.innerHTML = menus;
    }

    headerName();
    firstNav();


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

</script>

