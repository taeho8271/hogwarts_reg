<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>상단바</title>

<!-- CSS 외장화 -->
<link rel="stylesheet" href="${contextPath}/css/nanumgothic.css">

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
		width: 191px;
		height: 55px; 
		cursor: pointer;
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

</style>
</head>
<body>
	<!-- contextPath -->
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
	<div id="header">&nbsp;&nbsp;
		<img onclick = "location.href='${contextPath}/accessinfo/login.do'" src="${contextPath}/img/header_logo.png">
	</div>
</body>
</html>