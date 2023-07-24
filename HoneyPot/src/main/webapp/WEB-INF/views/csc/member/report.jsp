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

        .background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.3);
            z-index: 1000;
            
            /* 숨기기 */
            z-index: -1;
            opacity: 0;
        }

        .show {
            opacity: 1;
            z-index: 1000;
            transition: all .5s;
        }

        .window {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .popup {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #f5f5f5;
            box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            
            /* 임시 지정 */
            width: 700px;
            height: 700px;
            
            /* 초기에 약간 아래에 배치 */
            transform: translate(-50%, -40%);
         }

        .show .popup {
            transform: translate(-50%, -50%);
            transition: all .5s;
        }

        .model-header-area{
            width: 700px;
            height: 50px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            background-color: #FFCE31;
        }

        .model-header{
            margin-left: 20px;
            width: 660px;
            height: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #close{
            font-size: 30px;
            font-weight: 900;
            color: red;
            cursor: pointer;
        }

        .model-header-text{
            font-size: 20px;
            font-weight: 600;
        }

        .model-main-area{
            margin-top: 10px;
            width: 700px;
            height: 630px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .check-btn{
            width: 200px;
            height: 50px;
            background-color: #FFCE31;
            border: none;
            border-radius: 8px;
            font-size: 20px;
            font-family: 'Noto Sans KR';
            font-weight: 900;
            margin-top: 20px;
        }

        .check-btn:hover{
            cursor: pointer;
        }

        .model-search-area{
            margin-top: 20px;
            display: flex;
            flex-direction: row;
        }

        .model-search-btn{
            margin-left: 10px;
            width: 100px;
            height: 40px;
            border: none;
            background-color: #FFCE31;
            border-radius: 6px;
            font-weight: 900;
            font-family: 'Noto Sans KR';
            font-size: 16px;
        }

        .model-search-btn:hover{
            cursor: pointer;
        }

        .model-serach-input{
            padding-left: 10px;
            width: 300px;
            height: 40px;
            border: none;
        }

        .model-serach-input:focus{
            outline: none;
        }


        .model-search-category{
            padding-left: 10px;
            width: 100px;
            height: 40px;
            border: none;
        }

        
        .model-serach-category:focus{
            outline: none;
        }

        .model-search-box-area{
            width: 400px;
            height: 40px;
            background-color: white;
            display: flex;
            flex-direction: row;
        }

        .model-content-area{
            margin-top: 20px;
            border-radius: 10px;
            background-color: white;
            border: 1px solid #d4d4d4d7;
            width: 420px;
            height: 450px;
            overflow: scroll;
        }

        .model-content-area::-webkit-scrollbar {
            display: none;
        }

        .model-content-plist{
            border-bottom: 1px solid #d4d4d4d7;
            width: 420px;
            height: 60px;
            display: flex;
            align-items: center;
        }

        .model-content-plist:hover{
            background-color: #d4d4d4d7;
        }

        .plist-profile{
            margin-left: 20px;
        }

        .plist-name{
            margin-left: 10px;
        }

        .plist-address{
            margin-left: 10px;
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
                                <button id="report-people" class="report-people" type="button">신고대상자 찾기</button>
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

        <div class="background">
        <div class="window">
            <div class="popup">
                <div class="model-header-area">
                    <div class="model-header">
                        <div class="model-header-text">회원찾기</div>
                        <span class="material-symbols-outlined" id="close">
                            close
                        </span>
                    </div>
                </div>

                <div class="model-main-area">
                    <div class="model-search-area">
                        <div class="model-search-box-area">
                            <select name="" id="" class="model-search-category">
                                <option value="">이름</option>
                                <option value="">호수</option>
                            </select>
                            <input type="text" class="model-serach-input">
                        </div>
                        
                        <button type="button" class="model-search-btn">검색</button>
                    </div>
                    <div class="model-content-area">
                        <div class="model-content-plist">
                            <div class="plist-profile">사진</div>
                            <div class="plist-name">이름</div>
                            <div class="plist-address">(111동 1211호)</div>
                        </div>
                        <div class="model-content-plist"></div>
                        <div class="model-content-plist"></div>
                        <div class="model-content-plist"></div>
                        <div class="model-content-plist"></div>
                        <div class="model-content-plist"></div>
                        <div class="model-content-plist"></div>
                        <div class="model-content-plist"></div>
                        <div class="model-content-plist"></div>
                        <div class="model-content-plist"></div>
                        <div class="model-content-plist"></div>
                        <div class="model-content-plist"></div>
                        <div class="model-content-plist"></div>
                    </div>

                    <button type="button" class="check-btn" id="check-btn">확인</button>
                </div>
            </div>
        <div>
        <div>

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

    // 모달 사용
    function show () {
        document.querySelector(".background").className = "background show";
    }

    function close () { 
        document.querySelector(".background").className = "background";
    }


    document.querySelector("#report-people").addEventListener('click', show);
    document.querySelector("#close").addEventListener('click', close);
    document.querySelector("#check-btn").addEventListener('click', close);

    // document,querySelector(".model-content-plist").addEventListener('click',);

</script>

