<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>메인</title>

<!-- contextPath -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/js/prefixfree.min.js"></script>

<!-- CSS 외장화 -->
<link rel="stylesheet" href="${contextPath}/css/main.css">
<link rel="stylesheet" href="${contextPath}/css/nanumgothic.css">

<!-- Google Material Icons -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>
<body>
	
	<!--상단바 시작-->
	<%@ include file="header.jsp" %>
	<!--상단바 끝-->
	
	<!--하단바 시작-->
	<div id="wrap">
		<div class="slide">
			
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			
		</div>
		
		<div id="footer_menu">
	
			<ul id="main_footer">
				<li id="pre_submit_btn">
				<a onclick = "location.href='${contextPath}/course/presubmit.do'">
					<i class="material-icons">add_shopping_cart</i><br>
					<b>장바구니</a>	
				</li>
				<li id="submit_btn">
				<a onclick = "location.href='${contextPath}/course/submit.do'">
					<i class="material-icons">access_time</i><br><b>수강신청</a>
				</li>
				<li id="table_btn">
				<a onclick = "location.href='${contextPath}/course/table.do'">
					<i class="material-icons">view_list</i><br><b>내 수강목록</a>
				</li>
				<li id="location_btn">
				<a onclick = "location.href='${contextPath}/main/location.do'">
					<i class="material-icons">map</i><br><b>오시는 길</a>
				</li>
			</ul>
		
		</div>
	</div>
	<!--하단바 끝-->
	
</body> 
</html>