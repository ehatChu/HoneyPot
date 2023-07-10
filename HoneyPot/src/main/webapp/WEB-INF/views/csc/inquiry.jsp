<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .inquiry-area{
            width: 1560px;
            margin-top: 40px;
            margin-left: 70px;
        }

        .inquiry-text-title{
            font-size: 40px;
            font-weight: 700;
        }

        .inquiry-text{
            font-size: 20px;
            font-weight: 700;
            color: #5F5F5F;
        }

        .inquiry-form-area{
            margin-top: 15px;
            margin-left: 10px;
        }

        .inquiry-category{
            width: 300px;
            height: 50px;
            border-radius: 10px;
        }

        .inquiry-category-area{
            margin-top: 10px;
        }

        .inquiry-title-area{
            margin-top: 10px;
        }

        .inquiry-title{
            margin-top: 10px;
            width: 300px;
            height: 50px;
            border-radius: 10px;
            border: 1px solid black;
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
                <form action="">
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
                        <div><input type="text"></div>
                    </div>
    
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
</script>
