<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        .inquiry-search-area{
            width: 1560px;
            height: 100px;
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
            box-shadow: 3px 3px 5px rgb(145, 145, 145);
        }

        .model-search-category{
            padding-left: 10px;
            width: 150px;
            height: 60px;
            border: none;
            font-size: 18px;
            font-family: 'Noto Sans KR';
        }

        
        .model-serach-category:focus{
            outline: none;
        }



        .model-serach-input{
            padding-left: 15px;
            font-size: 18px;
            width: 850px;
            height: 60px;
            border: none;
            font-family: 'Noto Sans KR';
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
            margin-left: 100px;
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
            width: 130px;
            margin-right: 50px;
        }

        .answer-category-box{
            margin-left: 20px;
            width: 170px;
            height: 30px;
            margin-right: 50px;
        }

        .content-category-box{
            margin-left: 20px;
            width: 170px;
            height: 30px;
        }

        .inquiry-btn-area{
            background-color: #f5f5f5;
            width: 1560px;
            height: 70px;
            border-bottom: 1px solid rgb(156, 156, 156);
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
        }

        .inquiry-search-btn{
            margin-left: 30px;
            width: 100px;
            height: 45px;
            border: none;
            background-color: #FFCE31;
            border-radius: 4px;
            font-weight: 900;
            font-family: 'Noto Sans KR';
            font-size: 20px;
        }

        .inquiry-search-btn:hover{
            cursor: pointer;
        }

        .white{
            background-color: white;
        }

        .inquiry-list-category-area{
            background-color: #f5f5f5;
            width: 1560px;
            height: 90px;
            border-bottom: 1px solid rgb(156, 156, 156);
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .inquiry-list-category{
            height: 100%;
            width: 260px;
            /* box-sizing: border-box; */
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-left: 1px solid rgb(156, 156, 156);
        }
        
        .right-border{
            border-right: 1px solid rgb(156, 156, 156);
        }

        .focus-category{
            background-color: white;
            border-top: 3px solid black;
        }

        .list-category-text{
            font-size: 16px;
            margin-left: 20px;
            font-weight: 900;
        }

        .list-category-num{
            font-weight: 900;
            margin-right: 20px;
        }

        .yellow{
            color: #FFCE31;
        }

        .inquiry-list-area > table{
            width: 1560px;
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
                <select name="" id="" class="answer-category-box">
                    <option value="">전체</option>
                    <option value="">미답변</option>
                    <option value="">답변</option>
                </select>
                <div class="inquiry-category-text">분류</div>
                <select name="" id="" class="content-category-box">
                    <option value="">전체</option>
                    <option value="">카테고리1</option>
                    <option value="">카테고리2</option>
                    <option value="">카테고리3</option>
                    <option value="">카테고리4</option>
                </select>

            </div>
            <div class="inquiry-btn-area">
                <button type="button" class="inquiry-search-btn">검색</button>
                <button type="button" class="inquiry-search-btn white">초기화</button>

            </div>

            <div class="inquiry-list-category-area">
                <div class="inquiry-list-category focus-category">
                    <div class="list-category-text">전체</div>
                    <div class="list-category-num yellow">3</div>
                </div>
                <div class="inquiry-list-category">
                    <div class="list-category-text">답변완료</div>
                    <div class="list-category-num">3</div>
                </div>
                <div class="inquiry-list-category right-border">
                    <div class="list-category-text">미답변</div>
                    <div class="list-category-num">3</div>
                </div>
            </div>

            <div class="inquiry-list-area">
                <table>
                    <tr>
                        <td>분류</td>
                        <td>제목</td>
                        <td>작성자</td>
                        <td>작성일자</td>
                        <td>답변일자</td>
                        <td>답변자</td>
                    </tr>
                    
                </table>
            </div>
        </main>

</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('고객센터'); // 현재 페이지 이름
    firstNav(['문의 내역', '신고 내역', 'FAQ 관리'], '문의 내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>