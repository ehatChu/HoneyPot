<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- full calendar lib-->
		<!-- jquery CDN -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<!-- fullcalendar CDN -->
		<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
		<!-- fullcalendar 언어 CDN -->
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
		<!-- sweetAlert CDN -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

		<!-- 구글 아이콘 -->
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

		<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>

		<!-- ajax -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<!-- 썸머노트 -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');

			* {
				padding: 0px;
				margin: 0px;
				box-sizing: border-box;
				font-family: 'Noto Sans KR';
			}

			body {
				color: #2e2e2e;
				overflow-x: hidden;
				font-weight: 400;
				background-color: #f5f5f5;
			}

			body::-webkit-scrollbar {
				display: none;
			}
		</style>

		<c:if test="${ not empty alertMsg }">
			<script>
				alert('${alertMsg}');
			</script>
		</c:if>
		<c:remove var="alertMsg" scope="session" />