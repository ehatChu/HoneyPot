<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/app/resources/css/admin/member/property-list.css">
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
            <div id="second-line">
                <div id="thing-owner">사유물소지인 <input type="text"></div>
                <div id="proceeding-status">
                    처리유무
                    <select name="proceeding-status">
                        <option value="0">전체</option>
                        <option value="10">처리완료</option>
                        <option value="20">처리중</option>
                    </select>
                </div>
                <div id="car-or-bicycle">
                    분류
                    <select name="car-or-bicycle">
                        <option value="0">전체</option>
                        <option value="10">자동차</option>
                        <option value="20">자전거</option>
                    </select>
                </div>
            </div>
            <div id="third-line">
                <input type="button" value="검색"> <input type="reset" value="초기화">
            </div>
            <div id="fourth-line">
                <div>
                    <div>전체</div><div>1920</div>
                </div>
                <div>
                    <div>승인완료</div>
                    <div>132</div>
                </div>
                <div>
                    <div>미처리</div>
                    <div>12</div>
                </div>
            </div>
            <div id="main-mine-line">
                 <table>
                    <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>사유물명</th>
                            <th>소지인</th>
                            <th>연락처</th>
                            <th>작성일자</th>
                            <th>처리일자</th>
                            <th>처리자</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="mineVo" items="${mineVoList}">
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>${mineVo.name}</td>
                                <td>${mineVo.memberName}</td>
                                <td>${mineVo.phone}</td>
                                <td>${mineVo.enrollDate}</td>
                                <td>${mineVo.confirmDate}</td>
                                <td>${mineVo.adminName}</td>
                            </tr>
                        </c:forEach>
                        
                    </tbody>
                </table>

            </div>
            <div id="page-area"></div>
        </main>

</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    firstNav(['회원조회', '제재내역', '상벌점내역', '사유물내역'], '사유물내역'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    // secondNav(['시설소개', '예약하기'], '시설소개'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

</script>
