<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>상단바</title>

<!-- CSS 외장화 -->
<link rel="stylesheet" href="${contextPath}/css/nanumgothic.css">

<!-- Google Material Icons -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style>

	div#header {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		height: 40px;
		background-color: #522808;
		color: white;
		padding: 10px 0 20px;
		z-index: 2;
	}
	
	img {
		float: left;
		cursor: pointer;
	}
	
	/* 퀵 메뉴 */
	ul#quick {	
		list-style: none;
		/* background-color: #522808; */
		background-color: yellow;
		float: left;
		width: 300px;
		height: 0;
		padding: 0;
		/* margin: 0px 0 0 0; */
	}

	ul#quick li {
		list-style: none;
		/* margin-left: 25px;
		margin-right: 25px; */
		float: left;
		width: 20px; /* 주의: 블럭 현상*/
		background-color: #522808;
	}

	/* 메뉴 블록 */
	ul#quick li[id$=_btn] a {
		display: block;
		color: white;
		text-align: center;
		text-decoration: none;
		margin-top: 25px;
		cursor: pointer;
	}
	
	ul#quick li[id$=_q] a:hover {
		background-color: #522808;
		color: #916343;
		font-weight: bold;
		height: 20px;
		top: 0;
		cursor: pointer;
	}
	
	/* 아이콘 크기 */
	i[id^=quick] {
		font-size: 30px;
		margin-bottom: 0;
	}
	
	div#user {
		position: absolute;
		top: 25px;
		right: 130px;
	}

	div#logout {
		position: absolute;
		top: 25px;
		right: 30px;
	}

	/* unvisited link */
	a#logout:link {
		color: #B19265;
		text-decoration: none;
	}
	
	/* visited link */
	a#logout:visited {
		color: #B19265;
	}
	
	/* mouse over link */
	a#logout:hover {
		color: #CEA466;
		text-decoration: underline;
	}
	
	/* selected link */
	a#logout:active {
		color: #CEA466;
	}
	
li#pre_submit_q {
		position: absolute;
		top: 20px;
		left: 200px;
	}

li#submit_q {
		position: absolute;
		top: 20px;
		left: 250px;
	}
li#table_q {
		position: absolute;
		top: 20px;
		left: 300px;
	}	
li#location_q {
		position: absolute;
		top: 20px;
		left: 350px;
	}




</style>
</head>
<body>
	<!-- contextPath -->
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
	<div id="header">&nbsp;&nbsp;
		<img onclick = "location.href='${contextPath}/main/main.do'" src="${contextPath}/img/header_logo.png" width="191px" height="55px" >
		
		<!-- 퀵 메뉴 시작 -->
		<ul id="quick">
			<li id="pre_submit_q">
			<a onclick = "location.href='${contextPath}/course/presubmit.do'">
				<i id="quick1" class="material-icons">add_shopping_cart</i><br>
				</a>
			</li>
			<li id="submit_q">
			<a onclick = "location.href='${contextPath}/course/submit.do'">
				<i id="quick2" class="material-icons">access_time</i><br></a>
			</li>
			<li id="table_q">
			<a onclick = "location.href='${contextPath}/course/table.do'">
				<i id="quick3" class="material-icons">view_list</i><br></a>
			</li>
			<li id="location_q">
			<a onclick = "location.href='${contextPath}/main/location.do'">
				<i id="quick4" class="material-icons">map</i><br></a>
			</li>
		</ul>
		<!-- 퀵 메뉴 끝 -->
		
		<div id= "user">
			<c:if test="${not empty LOGIN_SESS}">
				${sessionScope.LOGIN_SESS}님 환영합니다!
			</c:if>
		</div>
		
		<div id= "logout">	
			<a id="logout" href="${contextPath}/accessinfo/logout.do">로그아웃</a>
		</div>					

	</div>
</body>
</html>