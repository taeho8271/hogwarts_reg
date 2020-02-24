<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>비밀번호 찾기</title>

<!-- contextPath -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/js/prefixfree.min.js"></script>

<!-- CSS 외장화 -->
<link rel="stylesheet" href="${contextPath}/css/search_pw.css">
<link rel="stylesheet" href="${contextPath}/css/nanumgothic.css">

</head>
<body>
	<!-- 비밀번호 찾기 결과 메시지 -->
	<c:if test="${not empty msg}">
		<script>
		alert("${msg}");
		</script>
	</c:if>
	
	
	<!-- 상단바 시작 -->
 	<%@ include file="header_n.jsp" %>
	<!-- 상단바 끝 -->
	<figcaption><b>비밀번호 찾기</figcaption>

	<!-- 상단바 제외한 입력 모든 부분 시작 -->
	<div id="spw_wrap">
	
	<!-- 좌측 부분 로고 시작 -->
	<div id="spw_box">
		<div id="logo">
			<img id="logo" src="${contextPath}/img/hogwartslogo.png">
		</div>
	<!-- 좌측 부분 로고 끝 -->
	
	<!-- 우측 부분 시작 -->
	<div id="field_box">
	<form id="search_pw_form" name="search_pw_form" method="post" action="${contextPath}/accessinfo/SearchPwProc.do">
	<!-- 학번/비밀번호 필드 -->
	<div id="top_id_box"></div>
	
    <!-- 학번 필드 섹션 시작 -->
    <div id="id_box">
		<div id="label_id">
			<label for="id">학번 </label>
		</div>
		<div id="field_id">
			<input type="text"
				id="spwId"
				name="spwId"
				size="30"
				maxlength="20"
				pattern="\d{8}"
				required
				title="학번은 반드시 8자리 숫자로만 입력해야 합니다."
				class="form-control">
		</div>
	</div>
    <!-- 학번 필드 섹션 끝 -->
 
    <!-- 이름 필드 섹션 시작 -->
    <div id="name_box">
		<div id="label_name">
			<label for="name">이름 </label>
		</div>
		<div id="field_name">
			<input type="text"
				id="spwName"
				name="spwName"
				size="30"
				maxlength="20"
				pattern="[가-힣]{2,20}"
				required 
				title = "이름은 반드시 한글로만 입력해야 합니다">
		</div>	   
	</div>
    <!-- 비밀번호 필드 섹션 끝 -->
	
    <!-- 이메일 필드 섹션 시작 -->
    <div id="email_box"> 
		<div id="label_email">
			<label for="email">이메일 </label>
		</div>
		<div id="field_email">
			<input type="text"
				id="spwMail"  
				name="spwMail"
				maxlength="20">
			
		<b>@</b>

		<!-- 이메일 제공자 시작-->
		<select id="sbMsv" name="sbMsv">
			<option>선택</option>
			<option>hogwarts.edu</option>
			<option>hanmail.net</option>
			<option>naver.com</option>
			<option>hotmail.com</option>
			<option>gmail.com</option>
			<option>nate.com</option>
			
		</select>
		<!-- 이메일 제공자 끝 -->
					

		</div>
	</div>
    <!-- 이메일 필드 섹션 끝 -->
 
    <!-- 버튼 영역 시작 -->
    <div id="submit_box"> 
        <input type="submit"
            class="submit_btn"
            value="찾기">
    </div>
	<!-- 버튼 영역 끝 -->
</form>

    </div>
	<!-- 우측 부분 끝 -->
	</div>
	<!-- 입력 영역 끝 -->
	</div>
	<!-- 상단바 제외한 로그인 모든 부분 끝 -->

</body>
</html>