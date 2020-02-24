<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>비밀번호 변경</title>

<!-- contextPath -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/js/prefixfree.min.js"></script>

<!-- CSS 외장화 -->
<link rel="stylesheet" href="${contextPath}/css/change_pw.css">
<link rel="stylesheet" href="${contextPath}/css/nanumgothic.css">

</head>
<body>
	<!-- 비번 변경 결과 메시지 -->
	<c:if test="${not empty msg}">
		<script>
		alert("${msg}");
		</script>
	</c:if>

	<!-- 상단바 시작 -->
	<%@ include file="header_n.jsp" %>
	<!-- 상단바 끝 -->
	
	<!-- 제목 시작 -->
	<figcaption><b>비밀번호 변경</figcaption>
	<!-- 제목 끝 -->
	
	<!-- 비번 바꾸기 양식 시작 -->
	<div id="cpw_wrap">
	
	<!-- 상단 로고  영역 시작 -->
	<div id="logo_box">
		<!-- 로고 영역 시작 -->
		<div id="logo">
			<img id="logo" src="${contextPath}/img/hogwartslogo.png">
		</div>
		<!-- 로고 영역 끝 -->			
							
	<!-- 입력 영역 시작 -->
	<div id="cpw_field_box">
	<form id="change_pw_form" name="change_pw_form" method="post" action="${contextPath}/accessinfo/updateProc.do">
	
	<!-- 학번/비밀번호 필드 -->
	<div id="top_id_box"></div>	
	
	<!-- 학번 필드 섹션 시작 -->
    <div id="id_box">		
	<!-- 학번 시작 -->
	<div id="label_id">
		<label for="cpw_id"> 학번</label>
	</div>
	<div id="field_id">
		<input type="text"
			   id="cpwId"
			   name="cpwId"  
			   maxlength="20"
			   pattern="\d{8}"
			   required
			   title="학번은 반드시 8자리 숫자로만 입력해야 합니다."></input>
		</div>
	</div>
    <!-- 학번 필드 섹션 끝 -->
	
	<!-- 이름 시작 -->
	<div id="name_box"> 
		<div id="label_name">
			<label for="cpw_name"> 이름</label>
		</div>
		<div id="field_name">
			<input type="text"
			   id="cpwName"
			   name="cpwName"  
			   maxlength="20" 
			   size="30"
			   pattern="[가-힣]{2,20}"
			   required 
			   title = "이름은 반드시 한글로만 입력해야 합니다"
			   class="form-control"></input>
		</div>
	</div>
	<!-- 이름 끝 -->
					
	<!-- 현재 비번 시작 -->
	<div id="cpw_box">
		<div id="label_pw">
			<label for="cpw_pw"> 현재 비밀번호</label>
		</div>
		<div id="field_pw">
			<input type="password"
			   id="cpwPw"  
			   name="cpwPw"
			   maxlength="20"></input>
		</div>
	</div>
	<!-- 현재 비번 끝 -->
					 
	<!-- 새 비번 시작 -->
	<div id="cnpw_box">
		<div id="label_npw">
			<label for="cpw_npw"> 새 비밀번호</label>
		</div>
		<div id="field_npw">
			<input type="password"
			   id="cpwNpw"  
			   name="cpwNpw"
			   maxlength="20" ></input>
		</div>
	</div>
	<!-- 새 비번 끝 -->
					
	<!-- 새 비번 확인 시작 -->
	<div id="cnpwf_box">
		<div id="label_npw">
			<label for="cpw_cf"> 비밀번호 확인</label>
		</div>
		<div id="field_cf">
			<input type="password"
			   id="cpwCf"  
			   name="cpwCf"
			   maxlength="20"></input>
		</div>
	</div>
	<!-- 새 비번 확인 끝 -->
	
	<!-- 완료 버튼 시작 -->
	<div id="cpw_btn">
	<input type="submit"
		   class="cpw_btn"
		   value="변 경"></input>
	</div>
	<!-- 완료 버튼 끝 -->
</form>	
	
   	</div>
	<!-- 입력 영역 끝 -->
	</div>
	<!-- 상단(로고+입력) 영역 끝 -->
	</div>
	<!-- 양식 상자 끝 -->

</body>
</html>