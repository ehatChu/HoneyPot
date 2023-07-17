<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
        <!-- sweetAlert CDN -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	</head>

	<style>
		#wrap {
			height: 1400px;
			display: grid;
			grid-template-rows: 600px 800px;
		}

        /* 관리비 내역, 등록, 수정 영역 */
        #list-area {
			display: grid;
			grid-template-rows: 50px 500px 50px;
			margin-top: 30px;
           
		}

		#search-area {
			display: flex;
			justify-content: space-between;
			align-items: center;

		}

		#search-area > div:first-child {
            width: 250px;
            height: 50px;
			font-weight: 500;
			font-size: 23px;
			color: #4A321F;
            display: flex;
            align-items: center;
            background: #ffce31;
            border-radius: 20px 20px 0px 0px;
		}

        #search-area > div > #date-box {
            border-radius: 20px 0px 0 0;
            background: #ffce31;
            border: none;
            font-size: 20px;
            font-weight: 600;
            margin-left: 10px;
            margin-right: 20px;
        }

		#search-area > div:nth-child(2) > input{
			width: 300px;
			height: 40px;
			border-radius: 20px;
			margin-right: 20px;
			font-size: 15px;
			padding: 20px;
		}

        #search-area > div:nth-child(2) > i {
            margin-right: 10px;
        }


		.A_detail {
			width: 1548px;
			height: 500px;
			text-align: center;
			vertical-align: middle;
			border-collapse: collapse;
			background: #FFFFFF;
            
		}

		.line{border-bottom:1px solid black;}
		
		.A_detail > thead > tr {
			font-size: 18px;
			height: 40px;
            background-color: #4A321F;
            color: #FFFFFF;
		}

        .A_detail > tbody > tr:hover {
            cursor: pointer;
			background-color: #fdeaab;
        }

		.A_detail > thead > tr >th:first-child > i {
			margin-left: 10px;
		}

		#page-area {
			display: grid;
			grid-template-columns: 950px 564px;
			justify-items: end;
			align-items: center;
			border-radius: 0 0 10px 0;
		}
		
		.paging {
			display: flex;
			align-items: baseline;
		}

        #page-area > .paging >.pageBtn {
            font-weight: bold;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            background-color: transparent;
        }

        #page-area > .paging > .pageBtn:hover{
            background-color: #FAD355;
            color: white;
        }

		#editBtn, #delBtn {
			border: none;
			background-color: transparent;
            cursor: pointer;
		}

		#openBtn {
			background-color: #ffce31;
			color: black;
			width: 150px;
			height: 40px;
			font-size: 18px;
			font-weight: 550;
			text-align: center;
			border-radius: 12px;
			border: none;
            cursor: pointer;
		}

		/* 등록 모달 영역 */
		.modal {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
        }

        .modal .bg {
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.6);
        }

        .modalBox {
          position: absolute;
          background-color: #fff;
          width: 700px;
          height: 600px;
		  border-radius: 30px;
		  display: grid;
		  grid-template-rows: 50px 550px;
        }

        .modalBox button {
          display: block;
          margin: 0 auto;
		  border: none;
		  background-color: #ffce31;
        }

        .hidden {
          display: none;
        }

		/* 모달 디자인 영역 */
		.upper-bar {
			display: grid;
			grid-template-columns: 650px 50px;
			align-items: center;
			background: #ffce31;
			color: black;
			border-radius: 30px 30px 0px 0px;
		}

		.upper-bar > span {
			margin-left: 20px;
			font-size: 20px;
			font-weight: 530;
		}
	
		.content-modal {
			display: grid;
			grid-template-rows: 100px 100px 260px 90px;
			color: #464646;
		}

		.first-area {
			display: grid;
			grid-template-columns: 1fr 1fr;
			padding: 40px;
			font-size: 18px;
		}

		.first-area > div > input {
			width: 170px;
			height: 30px;
		}

        .first-area > div:nth-child(2) > .categorySearch > input {
            width: 180px;
            height: 30px;
        }

        .first-area > div:nth-child(2) > .categorySearch > i {
            margin-left: 10px;
        }

		#acnt_category{
			width: 170px;
			height: 30px;
		}

		.second-area{
			padding: 40px;
			font-size: 18px;
		}

		.second-area > input {
			width: 170px;
			height: 30px;
		}

		.third-area{
			padding: 40px;
			font-size: 18px;
		}

		#detailContent{
			width: 610px;
			height: 170px;
			border-radius: 15px;
			resize: none;
			padding: 15px;
		}

		#submitBtn {
			display: flex;
			justify-content: center;
			align-items: center;
		}

		#submitBtn > input{
			background-color: #ffce31;
			width: 120px;
			height: 40px;
			font-size: 18px;
			font-weight: 600;
			color: black;
			border: none;
			border-radius: 10px;
		}

	
        /* 관리비 월 총괄표 */
        #month-total-area {
            margin-top: 150px;
            display: grid;
			grid-template-rows: 50px 500px 50px;
        }
        
        .excel {
            background-color: none;
            margin-right: 20px;
            cursor: pointer;
        }

        .A_detail > tbody > #subTotal {
            background-color: rgba(253, 255, 160, 0.326);
            font-weight: 550;
        }

        .A_detail > tbody > #test {
            background-color: #ffffff;
        }
        
        #title-area {
            display: flex;
			justify-content: space-between;
			align-items: center;
            background-color: #ffffff;
            border-radius: 20px 20px 0 0;
        }

        #title-area > div:first-child {
            width: 250px;
            height: 50px;
			font-weight: 500;
			font-size: 23px;
			color: #4A321F;
            display: flex;
            align-items: center;
            background: #ffce31;
            border-radius: 20px 20px 0px 0px;
		}

        #title-area > div > #date-box {
            border-radius: 20px 0px 0 0;
            background: #ffce31;
            border: none;
            font-size: 20px;
            font-weight: 600;
            margin-left: 10px;
            margin-right: 20px;
        }

		#title-area > div:nth-child(2) > input{
			width: 300px;
			height: 40px;
			border-radius: 20px;
			margin-right: 20px;
			font-size: 15px;
			padding: 20px;
		}

        #search-area > div:nth-child(2) > i {
            margin-right: 10px;
        }

       

	</style>

	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav>
				<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
				<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
			</nav>

			<main>
				<div id="wrap">
                    <!-- 관리비 등록,수정 -->
                    <div id="list-area">
                        <div id="search-area">
                            <div>
                                <select name="" id="date-box">
									<option value="2023-02">02월</option>
									<option value="2023-03">03월</option>
									<option value="2023-04">04월</option>
									<option value="2023-05">05월</option>
									<option value="2023-06" selected>06월</option>
								</select>
                               <div>관리비 내역</div>                            
                            </div>
                            <div><input type="text" placeholder="검색 할 내용을 입력하세요."><i class="fa-solid fa-magnifying-glass fa-lg" ><a href=""></a></i></div>
                        </div>
                        <div>
                            <table class="A_detail">
                                <thead>
                                    <tr class="line">
                                        <th>항목</th>
                                        <th>발생금액</th>
                                        <th>발생일자</th>
                                        <th>비고</th>
                                        <th>수정</th>
                                        <th>삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach begin="1" end="10">
                                        <tr class="line">
                                            <td>소독비</td>
                                            <td>38,000</td>
                                            <td>16일</td>
                                            <td>3주차 소독 진행</td>
                                            <td><button id="editBtn" class="openBtn"><i class="fa-solid fa-pen"></i></button></td>
                                            <td><button id="delBtn"><i class="fa-solid fa-xmark fa-lg"></i></button></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div id="page-area">
                            <div class="paging">
                                <button class="pageBtn"><</button>
                                <button class="pageBtn">1</button>
                                <button class="pageBtn">2</button>
                                <button class="pageBtn">3</button>
                                <button class="pageBtn">4</button>
                                <button class="pageBtn">5</button>
                                <button class="pageBtn">></button>
                                <!-- <c:if test="${pv.currentPage > 1}">
                                    <a class="btn btn-primary btn-sm" href="${root}/board/list?page=${pv.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">이전</a>
                                </c:if>
                                    <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
                                        <c:if test="${pv.currentPage != i}">
                                            <a class="btn btn-primary btn-sm" href="${root}/board/list?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">${i}</a>
                                        </c:if>
                                        <c:if test="${pv.currentPage == i}">
                                            <a class="btn btn-primary btn-sm">${i}</a>
                                        </c:if>
                                    </c:forEach>
                                <c:if test="${pv.currentPage < pv.maxPage}">
                                    <a class="btn btn-primary btn-sm" href="${root}/board/list?page=${pv.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">다음</a>
                                </c:if> -->
                            </div>
                            <button id="openBtn" class="openBtn">등록</button>
                            <!-- 모달 영역 -->
                            <div class="modal hidden">
                                <div class="bg"></div>
                                    <div class="modalBox">
                                        <div class="upper-bar">
                                            <span>관리비 등록</span>
                                            <button class="closeBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
                                        </div>
                                        <form action="/app/account/add" method="post">
                                        <div class="content-modal">
                                                <div class="first-area">
                                                    <div>
                                                        <span>발생일자</span>
                                                        <br>
                                                        <input type="date">
                                                    </div>
                                                    <div>
                                                        <span>카테고리</span>
                                                        <br>
                                                        <!-- 검색 영역으로 만들기 -->
                                                        <div class="categorySearch"><input type="text" placeholder="검색 할 내용을 입력하세요."><i class="fa-solid fa-magnifying-glass fa-lg" ><a href=""></a></i></div>
                                                    </div>
                                                </div>
                                                <div class="second-area">
                                                    <span>금액</span>
                                                    <br>
                                                    <input type="text" dir="rtl" maxlength="10" onkeyup="inputNumberFormat(this);"> 원
                                                </div>
                                                <div class="third-area">
                                                    <span>내용</span>
                                                    <br>
                                                    <textarea name="" id="detailContent" placeholder="상세 내용을 입력하세요. 예시:저녁 장보기"></textarea>
                                                </div>
                                                <div id="submitBtn"><input type="submit" value="등록"></div>
                                            </div>
                                        </form>
                                    </div>
                            </div>
                        </div>
                    </div>

                    <!-- 관리비 월별 총괄표-->
                    <div id="month-total-area">
                        <div id="title-area">
                            <div>
                                <select name="" id="date-box">
									<option value="2023-02">02월</option>
									<option value="2023-03">03월</option>
									<option value="2023-04">04월</option>
									<option value="2023-05">05월</option>
									<option value="2023-06" selected>06월</option>
								</select>
                               <div>관리비 총괄표</div>                            
                            </div>
                            <div>
                                <div><img src="/app/resources/temp/excel.png" alt="" width="40px" height="40px" class="excel"></div>
                            </div>
                        </div>
                        <div>
                            <table class="A_detail">
                                <thead>
                                    <tr class="line">
                                        <th>항목</th>
                                        <th>당월 발생금액</th>
                                        <th>전월 발생금액</th>
                                        <th>비고</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- <c:forEach begin="1" end="5"> -->
                                        <tr class="line" id="test">
                                            <td>일반관리비</td>
                                            <td>21,750,840</td>
                                            <td>21,640,330</td>
                                            <td></td>
                                        </tr>
                                        <tr class="line" id="test">
                                            <td>감가상각비</td>
                                            <td>490,000</td>
                                            <td>490,000</td>
                                            <td>일반관리비에서 분리</td>
                                        </tr>
                                        <tr class="line" id="subTotal">
                                            <td>소계</td>
                                            <td>55,740,840</td>
                                            <td>55,740,840</td>
                                            <td></td>
                                        </tr>
                                    <!--</c:forEach>-->
                                </tbody>
                            </table>
                        </div>
                        <div id="page-area">
                            <div class="paging">
                                <button class="pageBtn"><</button>
                                <button class="pageBtn">1</button>
                                <button class="pageBtn">2</button>
                                <button class="pageBtn">3</button>
                                <button class="pageBtn">4</button>
                                <button class="pageBtn">5</button>
                                <button class="pageBtn">></button>
                                <!-- <c:if test="${pv.currentPage > 1}">
                                    <a class="btn btn-primary btn-sm" href="${root}/board/list?page=${pv.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">이전</a>
                                </c:if>
                                    <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
                                        <c:if test="${pv.currentPage != i}">
                                            <a class="btn btn-primary btn-sm" href="${root}/board/list?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">${i}</a>
                                        </c:if>
                                        <c:if test="${pv.currentPage == i}">
                                            <a class="btn btn-primary btn-sm">${i}</a>
                                        </c:if>
                                    </c:forEach>
                                <c:if test="${pv.currentPage < pv.maxPage}">
                                    <a class="btn btn-primary btn-sm" href="${root}/board/list?page=${pv.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">다음</a>
                                </c:if> -->
                            </div>
                            </div>
                        </div>
                    </div>
				</div>
			</main>

	</body>

	</html>

	<script>
		
		// 헤더 함수 실행
		basicSetting();
		firstNav(['회원관리', '상담센터', '게시판', '단지관리', '캘린더'],'단지관리');
		secondNav(['관리비', '비품관리', '편의시설관리', '리뷰관리'],'관리비');
    	headerName('관리자');

        // 등록 모달

        // 모달 열기
        const openModal = () => {
        document.querySelector(".modal").classList.remove("hidden");
        };

        // 모달 닫기
        const closeModal = () => {
        document.querySelector(".modal").classList.add("hidden");
        };

        const openBtns = document.querySelectorAll(".openBtn");
        openBtns.forEach((btn) => {
        btn.addEventListener("click", openModal);
        });

        // 모달 닫기 버튼에 이벤트 추가
        document.querySelector(".closeBtn").addEventListener("click", closeModal);

        // 모달 배경 클릭 시 모달 닫기
        document.querySelector(".bg").addEventListener("click", closeModal);


        // 금액칸 콤마 정규식
        function comma(str) {
                str = String(str);
                return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
            }

        function uncomma(str) {
            str = String(str);
            return str.replace(/[^\d]+/g, '');
        } 

        function inputNumberFormat(obj) {
            obj.value = comma(uncomma(obj.value));
        }

        // 삭제 알림창
        // 백엔드 작업 시 삭제 버튼에 del 함수 걸어주기
        $().ready(function () {
            const delBtns = document.querySelectorAll("#delBtn")
            delBtns.forEach((btn) => {
            btn.addEventListener("click", function () {
            Swal.fire({
                title: '삭제하시겠습니까?',
                text: "다시 되돌릴 수 없습니다.",
                icon: 'warning',
                showCancelButton: true,
                color: '#333',
                confirmButtonColor: '#ffce31',
                cancelButtonColor: '#ffce31',
                confirmButtonText: '확인',
                confirmButtonTextColor: '#333',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        '삭제가 완료되었습니다.',
                    )
                }
            });
        }
            )}
            )});
		
	</script>