<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        .report-area{
            width: 1440px;
            margin-top: 20px;
            margin-left: 100px;
        }

        .report-text-title{
            font-size: 40px;
            font-weight: 700;
        }

        .report-text{
            font-size: 20px;
            font-weight: 700;
            color: #5F5F5F;
            margin-top: 10px;
        }

        .report-form-area{
            margin-top: 15px;
            margin-left: 10px;
        }

        .report-category{
            width: 400px;
            height: 50px;
            border-radius: 8px;
            border: 1px solid rgb(156, 156, 156);
        }

        .report-category-area{
            margin-top: 10px;
        }

        .report-title-area{
            margin-top: 10px;
        }

        .report-title{
            margin-top: 10px;
            width: 1200px;
            height: 50px;
            border-radius: 8px;
            border: 1px solid rgb(156, 156, 156);
        }

        .report-content{
            margin-top: 10px;
            background-color: white;
            border-radius: 6px;
            width: 1200px;
        }

        .report-submit-area{
            margin-top: 30px;
            width: 1200px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .report-submit{
            width: 300px;
            height: 50px;
            background-color: rgb(255, 61, 61);
            border: none;
            border-radius: 8px;
            font-weight: 900;
            font-size: 20px;
            font-family: 'Noto Sans KR';
        }

        .report-submit:hover{
            cursor: pointer;
        }

        .report-first-area{
            width: 1200px;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
        }

        .report-people-area{
            margin-top: 10px;
        }

        .report-people{
            background-color: white;
            border-radius: 8px;
            border: 1px solid rgb(156, 156, 156);
            width: 420px;
            height: 50px;
            cursor: pointer;
            color: #868686;
            font-size: 15px;
            font-weight: 600;
            font-family: 'Noto Sans KR';
        }


    </style>

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
                <form action="" method="post">
                    <div class="report-first-area">
                        <div>
                            <div class="report-text">신고유형</div>
                            <div class="report-category-area">
                                <select name="" class="report-category">
                                    <option value=""></option>

                                </select>
                            
                            </div>
                        </div>
                        
                        <div>
                            <div class="report-text">신고대상</div>
                            <div class="report-people-area">
                                <button class="report-people" type="button">신고대상자 찾기</button>
                            </div>
                        </div>
                        
                    </div>
        
                    <div class="report-title-area">
                        <div class="report-text">제목</div>
                        <div><input type="text" class="report-title"></div>
                    </div>
        
                    <div>
                        <div class="report-text">내용</div>
                        <div class="report-content"><textarea id="summernote" name="content"></textarea></div>
                    </div>

                    <div class="report-submit-area"><input class="report-submit" type="submit" value="신고하기"></div>
    
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

