<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/app/resources/css/member/mypage/friend.css">
</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
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
                    <div class="member-list" onclick="showMemberDetail(this)">
                        <div hidden>${mList.no}</div>
                        <div class="member-list-img">
                            <img src="/app/resources/member/profile/${mList.profile}" alt="프로필사진">
                        </div>
                        <div class="member-list-text" oncontextmenu="showFollowArea(event, '${mList.no}')">
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
            

        </main>

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
                                        <img src="/app/resources/member/profile/\${data.profile}" alt="">
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
