<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/app/resources/css/member/mypage/friend.css">
</head>

<body>
    <%@ include file="/WEB-INF/views/common/header-k-test.jsp" %>
        <nav>
            <!-- <%@ include file="/WEB-INF/views/common/first-nav.jsp" %> -->
            <%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
        </nav>

        <main>
            <div class="inquiry-search-area">
                <div class="model-search-area">
                    <div class="model-search-box-area">
                        <select name="" id="" class="model-search-category">
                            <option value="">전체</option>
                            <option value="">카테고리1</option>
                            <option value="">카테고리2</option>
                            <option value="">카테고리3</option>
                            <option value="">카테고리4</option>
                        </select>
                        <input type="text" class="model-serach-input">
                    </div>
                    <div class="search-btn-area">
                        <button type="button">검색</button>
                    </div>

                    
                </div>
            </div>
            <button id="alarm-btn">알림창 모달바 생성</button>
            <button id="temp-btn">배달 모달바 생성</button>


            <div class="member-area">

                <div class="member-list-area">
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                    <div class="member-list">
                        <div class="member-list-img">
                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>김지연</span>
                            <span>(102동 1111호)</span>
                        </div>
                    </div>
                </div>
                <div class="member-detail-area">
                    <div class="member-detail-header">
                        <div class="member-deatail-img-area">
                            <div class="member-deatail-img">
                                <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                            </div>
                        </div>
                        <div class="member-detail-text">
                            <div class="member-detail-name">김지연</div>
                            <div class="member-deatil-content">
                                <div>
                                    <div class="member-detail-address">102동 1111호</div>
                                    <div class="member-deatil-email">kh@koreakh.cok.kr</div>
                                </div>
                                <div class="member-deatil-btn-area">
                                    <button>팔로우 취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            


            
            
        </main>

        
            <div class="alarm-window">
                <div class="alarm-popup">
                    <div class="alarm-header">
                        <span class="material-symbols-outlined" id="alarm-close">
                            close
                        </span>
                    </div>
                    <div class="alarm-body-area">
                        <div class="model-alarm-img">
                            <img src="/app/resources/bee/delivery.png" alt="배달">
                        </div>
                        <div class="model-alarm-content">
                            <div class="model-alarm-text">홍길동님 배달이 왔습니다.</div>
                            <div class="model-alarm-text">경비실에서 찾아가세요</div>
                            <div class="model-alarm-date">2023-07-04 13시 50분</div>
                        </div>
                        <div class="model-alarm-btn">
                            <button id="check-btn">확인</button>
                        </div>
                    </div>
    
                </div>
            </div>

            

            <div class="delivery-background">
                <div class="delivery-window">
                    <div class="delivery-popup">
                        <div class="delivery-model-header-area">
                            <div class="delivery-model-header">
                                <div class="delivery-model-header-text">제재 상세내역</div>
                                <span class="material-symbols-outlined" id="delivery-close">
                                    close
                                </span>
                            </div>
                        </div>
                        <div class="delivery-model-body-area">
                            <div class="delivery-model-body-first">
                                <div class="delivery-model-sanction-date">
                                    <div class="delivery-model-title-text">알림 유형</div>
                                    <div>
                                        <select name="" id="" class="delivery-model-input-date">
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="delivery-content-header">
                                    <div class="delivery-model-title-text">회원목록</div>
                                    <div class="delivery-model-search-box">
                                        <input type="text">
                                        <button>검색</button>
                                    </div>
                                </div>
                            </div>
                            <div class="delivery-content-body">
                                <div class="delivery-member-list-area">
                                    <div class="delivery-member-list" draggable="true">
                                        <div class="delivery-member-list-img">
                                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                                        </div>
                                        <div class="delivery-member-list-text">
                                            <span>김일연</span>
                                            <span>(102동 1111호)</span>
                                        </div>
                                    </div>
                                    <div class="delivery-member-list" draggable="true">
                                        <div class="delivery-member-list-img">
                                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                                        </div>
                                        <div class="delivery-member-list-text">
                                            <span>김이연</span>
                                            <span>(102동 1111호)</span>
                                        </div>
                                    </div>
                                    <div class="delivery-member-list" draggable="true">
                                        <div class="delivery-member-list-img">
                                            <img src="/app/resources/profile/exam_profile.png" alt="프로필사진">
                                        </div>
                                        <div class="delivery-member-list-text">
                                            <span>김삼연</span>
                                            <span>(102동 1111호)</span>
                                        </div>
                                    </div>
                                    

                                </div>
                                <div class="delivery-member-btn-area">
                                    <button class="member-move-btn">></button>
                                    <button class="member-move-btn"><</button>
                                </div>
                                <div class="delivery-member-list-area">

                                </div>
                            </div>

                            <div class="delivery-model-btn-area">
                                <button id="delivery-check-btn" class="delivery-model-btn" type="button">보내기</button>
                            </div>

                        </div>
        
                    </div>
                </div>
            </div>


</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    // firstNav(['회원조회', '제재내역', '상벌점내역', '사유물내역'], '회원조회'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
    secondNav(['이웃 목록 19'], '이웃 목록 19'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴

    function mainHeigth(){
        document.querySelector("#main-area").style.height = 1250 + "px";
    }

    mainHeigth();

    // 알람 모달 사용
    function alarmShow () {
        document.querySelector(".alarm-window").className = "alarm-window show";
    }

    function alarmClose () { 
        document.querySelector(".alarm-window").className = "alarm-window";
    }


    document.querySelector("#alarm-btn").addEventListener('click', alarmShow);
    document.querySelector("#alarm-close").addEventListener('click', alarmClose);
    document.querySelector("#check-btn").addEventListener('click', alarmClose);

    // document,querySelector(".model-content-plist").addEventListener('click',);

    // 배달 모달 사용
    function deliveryShow () {
        document.querySelector(".delivery-background").className = "delivery-background show";
    }

    function deliveryClose () { 
        document.querySelector(".delivery-background").className = "delivery-background";
    }


    document.querySelector("#temp-btn").addEventListener('click', deliveryShow);
    document.querySelector("#delivery-close").addEventListener('click', deliveryClose);
    document.querySelector("#delivery-check-btn").addEventListener('click', deliveryClose);




    // 드래그앤 드랍
    const draggables = document.querySelectorAll(".delivery-member-list");
    const containers = document.querySelectorAll(".delivery-member-list-area");

    draggables.forEach(draggable => {
    draggable.addEventListener("dragstart", () => {
        draggable.classList.add("dragging");
    });

    draggable.addEventListener("dragend", () => {
        draggable.classList.remove("dragging");
    });
    });

    containers.forEach(container => {
    container.addEventListener("dragover", e => {
        e.preventDefault();
        const afterElement = getDragAfterElement(container, e.clientX);
        const draggable = document.querySelector(".dragging");
        if (afterElement === undefined) {
        container.appendChild(draggable);
        } else {
        container.insertBefore(draggable, afterElement);
        }
    });
    });

    function getDragAfterElement(container, x) {
    const draggableElements = [
        ...container.querySelectorAll(".draggable:not(.dragging)"),
    ];

    return draggableElements.reduce(
        (closest, child) => {
        const box = child.getBoundingClientRect();
        const offset = x - box.left - box.width / 2;
        // console.log(offset);
        if (offset < 0 && offset > closest.offset) {
            return { offset: offset, element: child };
        } else {
            return closest;
        }
        },
        { offset: Number.NEGATIVE_INFINITY },
    ).element;
    }
</script>
