<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        .inquiry-search-area{
            width: 1560px;
            height: 120px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-bottom: 1px solid rgb(156, 156, 156);
            
        }

        .model-search-area{
            display: flex;
            flex-direction: row;
        }

        .model-search-box-area{
            width: 1000px;
            height: 60px;
            background-color: white;
            display: flex;
            flex-direction: row;
        }

        .model-search-category{
            padding-left: 10px;
            width: 150px;
            height: 60px;
            border: none;
        }

        
        .model-serach-category:focus{
            outline: none;
        }

        .model-search-btn{
            margin-left: 30px;
            width: 100px;
            height: 60px;
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
            width: 850px;
            height: 60px;
            border: none;
        }

        .model-serach-input:focus{
            outline: none;
        }

        .inquiry-category-area{
            background-color: #f5f5f5;
            width: 1560px;
            height: 80px;
            border-bottom: 1px solid rgb(156, 156, 156);
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .inquiry-category-text{
            margin-left: 80px;
            font-size: 18px;
            font-weight: 700;
        }

        input[name=allDate]{
            margin-left: 20px;
        }

        .inquiry-category-text2{
            margin-left: 5px;
            font-size: 14px;
            color: gray;
        }

        input[name=startDate]{
            margin-left: 20px;
            margin-right: 10px;
            width: 130px;
            height: 25px;
        }

        input[name=endDate]{
            margin-left: 10px;
            height: 25px;
            margin-right: 50px;
        }



    </style>
</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <nav>
            <%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
            <!-- <%@ include file="/WEB-INF/views/common/second-nav.jsp" %> -->
        </nav>

        <main>
            <div class="inquiry-search-area">
                <div class="model-search-area">
                    <div class="model-search-box-area">
                        <select name="" id="" class="model-search-category">
                            <option value="">이름</option>
                            <option value="">호수</option>
                        </select>
                        <input type="text" class="model-serach-input">
                    </div>
                    
                </div>
            </div>
            <div class="inquiry-category-area">
                <div class="inquiry-category-text">기간</div>
                <input type="checkbox" name="allDate">
                <div class="inquiry-category-text2">전체기간</div>
                <input type="date" name="startDate">
                <div>~</div>
                <input type="date" name="endDate">
                <div class="inquiry-category-text">답변여부</div>
                <select name="" id="">
                    <option value="">전체</option>
                    <option value="">미답변</option>
                    <option value="">답변</option>
                </select>
                <div class="inquiry-category-text">분류</div>
                <select name="" id="">
                    <option value="">전체</option>
                    <option value="">카테고리1</option>
                    <option value="">카테고리2</option>
                    <option value="">카테고리3</option>
                    <option value="">카테고리4</option>
                </select>

            </div>
            <button type="button" class="model-search-btn">검색</button>
        </main>

</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('고객센터'); // 현재 페이지 이름
    firstNav(['문의 내역', '신고 내역', 'FAQ 관리'], '문의 내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>