<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

main{
	display: grid;
	grid-template-rows: 2fr 2fr;
}
				
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp"%>
		<%@ include file="/WEB-INF/views/common/second-nav.jsp"%>
	</nav>
	
	<main>
			<div id="showStatistics-area">
				<div id="A_graph-area">
					<div class="A_title">
						분류별 지출
					</div>
					<div class="A_content">
						<div class="graph">
							<div class="chart-bar" data-deg="50"></div>
							<div class="chart-bar" data-deg="95"></div>
							<div class="chart-bar" data-deg="200"></div>
							<div class="chart-bar" data-deg="15"></div>
						</div>
						<div>
	
						</div>
					</div>
				</div>
				<div id="A_calendar-area">
	
				</div> 			
			</div> 
			<div id="detail-area">

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