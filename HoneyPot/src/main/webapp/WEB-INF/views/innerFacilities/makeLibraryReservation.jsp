<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#temp-main-wrapper{
		display: grid;
		grid-template-columns: 10fr 3fr; /*임시*/
	}
	#reservation-area{
		background-clip: content-box;
		padding: 20px 0px 20px 20px;	

		display: grid;
		grid-template-columns: 1fr 2fr;
		grid-template-rows: 0.2fr 0.4fr 0.5fr;
		height: 750px;
	}

	#today-area {
		background-clip: content-box;
		padding: 20px 20px 20px 20px;
	}

	#span-area {
		grid-column: span 2;
	}

	input[type="date"] {
		padding: 5px 10px 5px 10px;
		margin-left: 20px;
		margin-top: 10px;;
	}
	.small-box {
		width: 80px;
		height: 50px;
		display: inline-flex;
		margin-top: 20px;
		margin-left: 20px;
		align-items: center;
		justify-content: center;
	}
	.middle-size {
		font-size: 25px;
	}
	h1 {
		font-size: 40px;
		font-weight: 500;
	}
	.big-size {
		font-size: 60px;
		font-weight: 800;
		display: inline-block;
	}
	#count-people {
		padding-left: 20px;
	}
	
	.btn-box {
		width: 150px;
		height: 60px;
		font-size: 20px;
		font-weight: 600;
		margin: 20px;
		border: none;
	}
	.orange-color {
		background-color: #FAD355 ;
	}
	.brown-color {
		background-color: #4A321F ;
		color: white;
	}
	.orange-font-color {
		color: #FAD355;
	}
	.text-center {
		text-align: center;
	}
	.margin-blank {
		margin-top: 10px;
	}
	/* input[name="startTime"] {
		visibility: hidden;	
	} */
	
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
		<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
	</nav>

	<main>
		
		<form action="${root}/library/reserve" method="post">
			<div id="temp-main-wrapper">
			
				<div id="reservation-area">
					<div>
						<h1>1.날짜선택</h1>
						<input type="date" id="date-choice" >
						<script>
				

							
							//오늘 날짜를 -형식으로 바꿀 것 
							let today = new Date();
							
							let dateElem = document.querySelector("#date-choice");
							
							dateElem.setAttribute("value",dateFormat(new Date()));
							dateElem.setAttribute("min",dateFormat(new Date()));
							
							//7일 후 날짜구하기
							let afterWeek = new Date(Date.parse(today)+7*1000*60*60*24);
							dateElem.setAttribute("max",dateFormat(afterWeek));
						
				

							//포메팅 자주쓰일것 같아 함수로 분리함.
							function dateFormat(date) {
								let dateFormat2 = date.getFullYear() +
									'-' + ( (date.getMonth()+1) < 9 ? "0" + (date.getMonth()+1) : (date.getMonth()+1) )+
									'-' + ( (date.getDate()) < 9 ? "0" + (date.getDate()) : (date.getDate()) );
								return dateFormat2;
							}	
						</script>
					</div>
					<div></div>
					<div id="span-area">
						<!--  -->
						<h1>2.시간선택</h1>
						
						<c:forEach var="i" begin="${openTime}" end="${closeTime}" step="1">
							
							<!-- small-box이용하면 label을 박스형태로 바꿀 수 있음. -->
						

							<label for="${i}" class="small-box orange-color time${i}"></label><input type="checkbox" name="startTime" id="${i}" value="${i}">
									
						</c:forEach>
						<script>
							//openTime과 closeTime을 변수로 불러오기
							const openTime = "${openTime}";
							const closeTime = "${closeTime}";
							//라벨 다 가져와서 for문 돌려보자
							const label = document.querySelectorAll("label"); //다 가져와서 모든 요소에 값을 넣어주면 되는데...

							for(let lb of label){
								//7라벨의 for값을 가져와서 
								const forValue = lb.getAttribute("for");

								//forValue가 10보다 작다면 
								let resultValue = forValue < 10 ? '0'+forValue : forValue;
								lb.innerText =resultValue+':00';
							}
						

						</script>
						
					</div>
					<div id="count-people">
						<div class="middle-size">선택한 시간대의 예약자는 현재</div>
						<div class="big-size orange-font-color">23</div><span class="middle-size">/50명입니다.</span>
					</div>
					<div>
						<h1>3.신청하시겠습니까?</h1>
						<input type="submit" value="예약하기" class="orange-color btn-box"> <button class="brown-color btn-box">예약취소</button>
					</div>
				</div>
				<div id="today-area">
					<h1 class="text-center">오늘의 예약</h1>
		
						<c:forEach begin="1" end="4">
							<div class="text-center margin-blank">헬스장 11:00 </div>
						</c:forEach>
				
				</div>
			</div>
		</form>
		
	</main>
</body>
</html>
<script>
	basicSetting(); // 기본 셋팅
	headerName('예약하기'); // 현재 페이지 이름
	firstNav(['도서관', '수영장', '헬스장'], '도서관'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['시설소개', '예약하기'], '예약하기'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
</script>