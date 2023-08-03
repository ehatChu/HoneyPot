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
            <form action="/app/member/friends" method="GET">
                <div class="inquiry-search-area">
                    <div class="model-search-area">
                        <div class="model-search-box-area">
                                <select name="searchType" id="" class="model-search-category">
                                    <option value="NAME">이름</option>
                                    <option value="DONG">동</option>
                                    <option value="HO">호수</option>
                                    <option value="PHONE">연락처</option>
                                </select>
                                <input type="text" class="model-serach-input" name="searchValue">
                            </div>
                            <div class="search-btn-area">
                                <button type="submit">검색</button>
                            </div>
                    </div>
                </div>
            </form>



            <div class="member-area">
	                <div class="member-list-area" >
				<c:forEach items="${mvoList }" var="mList">
				<c:if test="${loginMember.name ne mList.name}">
                    <div class="member-list" oncontextmenu="showFollowArea(event, '${mList.no}')" onclick="showMemberDetail(this)">
                        <div hidden>${mList.no}</div>
                        <div class="member-list-img">
                            <img src="/app/resources/profile/${mList.profile}" alt="프로필사진">
                        </div>
                        <div class="member-list-text">
                            <span>${mList.name }</span>
                            <span>(${mList.dongNum}동 ${mList.hoNum}호)</span>
                            <span id="memberNo" hidden>${mList.no}</span>
                            <ul class="follow-area">
                                <li><a href="#" id="follow-link-${mList.no}">팔로우</a></li>
                            </ul>
                        </div>
                    </div>
				</c:if>
				</c:forEach>
	                </div>
                <div class="member-detail-area" id="member-detail-area">
                    <div class="member-detail-guide-area">
                        <div><span class="material-symbols-outlined" id="member-detail-guide-img">
                            badge
                            </span></div>
                        <div class="member-detail-guide-text">상세보기를 원하시면 클릭을 하세요</div>
                    </div>
                </div>

            </div>
            


            <button id="s-alarm-btn">알림창 모달바 생성</button>
            <button id="temp-btn">배달 모달바 생성</button>
            
        </main>

        
            <div class="s-alarm-window">
                <div class="s-alarm-popup">
                    <div class="alarm-header">
                        <span class="material-symbols-outlined" id="s-alarm-close">
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

        <script>
                function showMemberDetail(e){
                    const mno = e.firstElementChild.innerText;
                    $.ajax({
                        url : "/app/member/friends/detail",
                        method : "POST",
                        data : {
                            "mno" : mno
                        },
                        dataType : "json",
                        success : function(data) {
                            const detailArea = document.querySelector("#member-detail-area");
                            detailArea.innerHTML = "";

                            let str =  `<div class="member-detail-header">
                                    <div class="member-detail-img">
                                        <img src="\${data.profile}" alt="">
                                    </div>
                                </div>
                                <div class="member-detail-body-area">
                                    <div class="member-detail-body">
                                        <div class="member-detail-body-title">상세보기</div>
                                        <div class="member-detail-name">
                                            \${data.name}
                                        </div>
                                        <div class="member-detail-content-box">
                                            <span>동호수</span>
                                            <span class="member-detail-content">\${data.dongNum}동 \${data.hoNum}호</span>
                                        </div>
                                        <div class="member-detail-content-box">
                                            <span>생년월일</span>
                                            <span class="member-detail-content">\${data.birth}</span>
                                        </div>
                                        <div class="member-detail-content-box">
                                            <span>이메일</span>
                                            <span class="member-detail-content">\${data.email}</span>
                                        </div>
                                        <div class="member-detail-content-box">
                                            <span>연락처</span>
                                            <span class="member-detail-content">\${data.phone}</span>
                                        </div>
                                    </div>
                                </div>`
                            detailArea.innerHTML = str;
                        },
                        error : function() {
                                alert("실패");
                            },
                    })
        
                }

                secondNav(['이웃 목록 ${memberCnt}'], '이웃 목록 ${memberCnt}'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
        </script>


</body>

</html>

<script>
    basicSetting(); // 기본 셋팅
    headerName('회원관리'); // 현재 페이지 이름
    // firstNav(['회원조회', '제재내역', '상벌점내역', '사유물내역'], '회원조회'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴

    function mainHeigth(){
        document.querySelector("#main-area").style.height = 1250 + "px";
    }

    mainHeigth();

    // 알람 모달 사용
    function alarmShow () {
        document.querySelector(".s-alarm-window").className = "s-alarm-window show";
    }

    function alarmClose () { 
        document.querySelector(".s-alarm-window").className = "s-alarm-window";
    }


    document.querySelector("#s-alarm-btn").addEventListener('click', alarmShow);
    document.querySelector("#s-alarm-close").addEventListener('click', alarmClose);
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





    

    //// 팔로우 우클릭 이벤트
    function showFollowArea(event,memberNo) {
        event.preventDefault();

        const target = event.currentTarget;
        const followArea = target.querySelector('.follow-area');

        followArea.classList.add('show');

        const offsetX = event.clientX;
        const offsetY = event.clientY;
        followArea.style.position = 'fixed';
        followArea.style.left = offsetX + 'px';
        followArea.style.top = offsetY + 'px';

        $.ajax({
            url: '/app/member/getFriendList', 
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                const followLink = document.getElementById('follow-link-' + memberNo);
                const isFriend = data.find(item => item.friendNo === memberNo);
                if (isFriend) {
                    followLink.textContent = '팔로우 취소';
                } else {
                    followLink.textContent = '팔로우';
                }
            },
            error: function(xhr, status, error) {
                console.error('Error occurred while fetching friend list:', error);
            }
        });

        document.addEventListener('click', hideFollowAreaOnClick);
    }

    function hideFollowArea() {
        const followAreas = document.querySelectorAll('.follow-area');
        followAreas.forEach(followArea => {
            followArea.classList.remove('show');
        });
    }

    function hideFollowAreaOnClick(event) {
        const followAreas = document.querySelectorAll('.follow-area');
        if (!followAreas[0].contains(event.target)) {
            hideFollowArea();
            document.removeEventListener('click', hideFollowAreaOnClick);
        }
    }

    // 팔로우 버튼 클릭 이벤트
    $(document).on('click', '.follow-area li a', function(event) {
        event.preventDefault();

        const followArea = this.closest('.follow-area');
        const memberNo = followArea.parentElement.querySelector('#memberNo').textContent.trim();

        $.ajax({
            url: '/app/member/friend/follow', 
            type: 'POST',
            dataType: 'json',
            data: { friendNo: memberNo }, 
            success: function(data) {
                if (data.success) {
                    const followLink = document.getElementById('follow-link-' + memberNo);
                    if (data.isFollowing) {
                        followLink.textContent = '팔로우 취소';
                    } else {
                        followLink.textContent = '팔로우';
                    }
                }
            },
            error: function(xhr, status, error) {
                console.error('Error occurred while following/unfollowing:', error);
            }
        });
        hideFollowArea();
        document.removeEventListener('click', hideFollowAreaOnClick);
    });





</script>
