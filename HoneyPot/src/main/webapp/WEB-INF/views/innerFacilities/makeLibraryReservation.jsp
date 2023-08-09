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
	.reserved-color {
		background-color: #4A321F;
		color: white;
	}

	.color-red {
		background-color: red;
		font-weight: 800;
	}
	.color-orange {
		background-color: #FAD355;
	}

	input[type="radio"]:checked + label{
      background-color: red; /* 여기에 바꾸고자 하는 색상을 입력합니다. */
    }
	input[type="radio"]{
		display: none;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp" %>
		<%@ include file="/WEB-INF/views/common/second-nav.jsp" %>
	</nav>

	<main>
		
		<form>
			<input type="hidden" value="1" name="amenityNo">
			<div id="temp-main-wrapper">
			
				<div id="reservation-area">
					
						<div>
							<h1>1.날짜선택</h1>
							<input type="date" id="date-choice" name="date">
							<script>
					
	
								
								//오늘 날짜를 -형식으로 바꿀 것 
								let today = new Date();
								
								let dateElem = document.querySelector("#date-choice");
								
								dateElem.setAttribute("value",new Date().toISOString().substring(0, 10));
								dateElem.setAttribute("min",new Date().toISOString().substring(0, 10));
								
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
							
							<!-- closeTime의 -1을 해줘야 마감시간이 24시면 23시까지만 예약을 받을수있음. -->
							<c:forEach var="i" begin="${openTime}" end="${closeTime-1}" step="1">
								
								<!-- small-box이용하면 label을 박스형태로 바꿀 수 있음. -->
							
	
								<input type="radio" name="startTime" value="${i}" id="${i}"><label for="${i}" class="small-box orange-color"></label>
										
							</c:forEach>
							<script>
								

							</script>
							
						</div>
						<div id="count-people">
							<div class="middle-size">선택한 시간대의 예약자는 현재</div>
							<div class="big-size orange-font-color" id="nowNo"></div><span class="middle-size">/${maxNum}명입니다.</span>
						</div>
						<script>
							var nowNo = document.querySelector("#nowNo");
							if(nowNo.innerText==''||nowNo.innerText==null){
								nowNo.innerText='0';
							}
						</script>
						<div>
							<h1>3.신청하시겠습니까?</h1>
							<input type="submit" value="예약하기" class="orange-color btn-box" formaction="/app/facilities/reserve"> 
							<input type="submit" value="예약취소" class="brown-color btn-box" formaction="/app/innerFac/delete">
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
	headerName('편의시설'); // 현재 페이지 이름
	firstNav(['도서관', '수영장', '헬스장','골프장'], '도서관'); // 1st param : 메인 메뉴 목록, 2st param : 현재 메인 메뉴
	secondNav(['시설소개', '예약하기'], '예약하기'); // 1st param : 서브 메뉴 목록, 2st param : 현재 서브 메뉴
	firstNavLink(['/app/innerFac/info?no=1','/app/innerFac/info?no=2','/app/innerFac/info?no=3','/app/innerFac/info?no=4']);
	secondNavLink(['/app/innerFac/info?no=1','/app/facilities/library/reserve'],);

	//날짜를 받는 input태그의 값이 change될 때 ajax를 실행 하도록 
	let date = document.querySelector("#date-choice");
	

	//openTime과 closeTime을 변수로 불러오기
	const openTime = "${openTime}";
	const closeTime = "${closeTime}";

	//라벨 다 가져와서 for문 돌려보자
	const label = document.querySelectorAll("label"); //다 가져와서 모든 요소에 값을 넣어주면 되는데...

	const dateList = '${reservedDate}';//배열같이 생긴 문자열임..
	let dateValue = JSON.parse(dateList);
	dateStringToInt(dateValue);

	//json타입받으면 문자열 받으면 int로 변환시켜주는 그인트를 가지고 lb의를 변경시켜주는
	function dateStringToInt(dateValue){
		var no = [];
		for(let i=0;i<dateValue.length;i++){
			//12번째부터 13번째까지
			no[i]= parseInt(dateValue[i].substring(11,13),10);
		}
		//라벨에 값넣어주기 innerText
		for(let lb of label){
		//7라벨의 for값을 가져와서 
		const forValue = lb.getAttribute("for");

		//forValue가 10보다 작다면 
		let resultValue = forValue < 10 ? '0'+forValue : forValue;
		lb.innerText =resultValue+':00';	

			for(let i=0;i<no.length;i++){
				if(no[i]==forValue){
					lb.classList.add('reserved-color');
				}
			}

		}
	}


	date.addEventListener("change",function(){
		//일단 바뀌면 모든 label값들 가져와서 class에서 removed-color뺏기
		for(let lb of label){
			lb.classList.remove('reserved-color');
		}

		const v1 = date.value;
		$.ajax({
			url : "/app/innerFac/reserve/reservationInfo",
			type : "get",
			data : {
				date : v1, 
			},


			dataType : "json",
			success : function(data){
				alert("통신성공");
				//date를 넘기면 숫자가 나오는 그런....... 함수를.........
				dateStringToInt(data);
			} ,
			error : function(){
				alert("통신실패");
			} ,
		});
	});

	
	//클릭할 때마다 에드이벤트리스너 달기
	for(let lb of label){
		lb.addEventListener("click",function(){
			//ajax부르기 (data값으로 lb.getAttribute("for")을 전달)
			//date와 time값 가지고오기
			let time = lb.getAttribute("for");
			let date = document.querySelector("#date-choice").value
			
			$.ajax({
				url : "/app/innerFac/reserve/reservedPeopleCnt" ,
				type : "get",
				data : {
					date : date,
					time : time,
					amenityNo : 1, 
				},
				dataType : "json",
				success : function(result){
					//nowNo
					
					nowNo.innerText=result.cnt;
				},
				error : function(){
					alert("통신실패");
				},
			});
		});
	}
	
	
</script>