<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<script src="prefixfree.min.js"></script>  
<style>
    @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
   
	body {
		margin: 0
	}

   	/*상단바*/
	div#prs_header {
		/*
		position: fixed;
		top: 0;
		left: 0;
		*/
		height: 40px;
		background-color: #522808;
		padding: 10px 0 20px;
	}
      
    /* 전체 패널 박스(login_box) */
	div#login_wrap {
		width: 100%;
		height: calc(100vh - 70px);
		/* 중앙정렬	*/
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	/* 좌측 박스 */
    div#login_box {  
        width: 850px;
        height: 500px;        		
      /*padding-top: 100px;
		position: absolute;
		top: 170px;
		left: 300px; */
        background: #E7E3DE;
		font-family: Nanum Gothic;
		border-top: 15px solid #522808;
    }  
 
	/* 로고 위치 조정 width: 370px */
	div#logo {
		padding: 100px 0 0 70px;
		/*background-color: orange;*/
		width: 300px;
		float: left;
	}
	
	/* 우측 영역 */
	div#field_box {
		width: 430px;
		height: 400px;
		/*background-color: pink;*/
		float: left;
	}

    /* 전송/로그인 버튼 */
    input.submit_btn {
        width: 420px;
        height: 40px;
        background-color: #522808;
        border: 0px solid #522808;
        font-size: 13pt;
        letter-spacing: 0.2em;          
        color: #fff; 
        padding-bottom: 7px;
		border-radius: 7px;
    }
	
	/* 로그인 버튼: 롤오버 효과 */
	input.submit_btn:hover {
		background-color: rgba(181,146,99,0.5);
		color: #fff;
	}
 
    /* 학번/비밀번호 필드 */
    div#top_id_box {
		width: 530px;
		height: 120px;
	}
	
	/* 학번 입력 박스 */
	div#id_box {
		width: 530px;
		height: 70px;
		display: flex;
		align-items: center;
		justify-content: center;
		color: #522808;
	}
	
	/* 비밀번호 입력 박스 */
	div#pw_box {
		width: 530px;
		height: 70px;
		color: #522808;
	}
	 
    /* 로그인 버튼 */
    div#submit_box {
      /*margin: 10px 0;
        height: 58px;*/
		width: 480px;
		height: 80px;
    }
	
    /* 학번/비밀번호 필드 */
    input#id {
        width: 310px;
        height: 30px;
        font-size: 12pt;
        border: 1px solid #ccc;   
        text-indent: 1em;
        color: brown;
		margin: 5px 0;
	}
	
	/* id pw 필드 영역 */
	div#login_box div[id$=_label] {
		width: 100px;
		float: left;
		height: 48px;
		text-align: right;
		padding-top: 12px;
		font-weight: bold;
	}
	
	div#login_box div[id$=_field] {
		width: 430px;
		float: left;
		height: 60px;
		text-indent: 10px;
		text-align: left;
	}
		
	input#pw {
        width: 310px;
        height: 30px;
        font-size: 12pt;
        border: 1px solid #ccc;   
        text-indent: 1em;
        color: brown;
		margin: 5px 0;
    }
	
	/* 학번 찾기, 비밀번호 찾기, 비밀번호 변경 링크 */
	div#links {
		width: 480px;
	}
	
	/* unvisited link */
	a:link {
		color: #522808;
		text-decoration: none;
	}
	
	/* visited link */
	a:visited {
		color: #522808;
	}
	
	/* mouse over link */
	a:hover {
		color: #522808;
		text-decoration: underline;
	}
	
	/* selected link */
	a:active {
		color: orange;
	} 

	
	div#search_id {
		width: 140px;
		float: left;
		padding-left: 25px;
		/*background-color: red;*/
	}
	
	div#search_pw {
		width: 160px;
		float: left;
		/*background-color: orange;*/
	}
	
	div#change_pw {
		width: 150px;
		float: right;
		/*background-color: yellow;*/
	}

	

</style>
</head>
<body>
	<!-- 상단바 시작 -->
 	<div id="prs_header">&nbsp;&nbsp;
		<img src="https://github.com/Heejunng/final-Project/blob/master/img/header_logo.png?raw=true" width="191px" height="55px">
	</div>
	<!-- 상단바 끝 -->
	
	<!-- 상단바 제외한 로그인 모든 부분 시작 -->
	<div id="login_wrap">
 
	<!-- 좌측 부분 로고 시작 -->
	<div id="login_box">
		<div id="logo">
			<img src="https://github.com/Heejunng/final-Project/blob/master/img/hogwartslogo.png?raw=true" width="230px" height="200px" align="left">
		</div>
	<!-- 좌측 부분 로고 끝 -->
	
	<!-- 우측 부분 시작 -->
	<div id="field_box">
	
	<!-- 학번/비밀번호 필드 -->
	<div id="top_id_box"></div>
	
    <!-- 학번 필드 섹션 시작 -->
    <div id="id_box">
		<div id="id_label">
			<label for="id">학번 </label>
		</div>
		<div id="id_field">
			<input type="text"
				id="id"
				name="id"
				size="30"
				maxlength="20"
				class="form-control">
		</div>
	</div>
    <!-- 학번 필드 섹션 끝 -->
 
    <!-- 비밀번호 필드 섹션 시작 -->
    <div id="pw_box"> 
		<div id="pw_label">
			<label for="pw">비밀번호 </label>
		</div>
		<div id="pw_field">
			<input type="password"
				id="pw"
				name="pw"
				size="30"
				maxlength="20">
		</div>	   
	</div>
    <!-- 비밀번호 필드 섹션 끝 -->
 
    <!-- 로그인 버튼 섹션 시작 -->
    <div id="submit_box"> 
        <input type="submit"
            class="submit_btn"
            value="로그인">
    </div>
	<!-- 로그인 버튼 섹션 끝 -->
	
	<!-- 학번 찾기, 비밀번호 찾기, 비밀번호 변경 필드 시작 -->	
	<div id="links">
		<div id="search_id"> 	 
			<a href="search_id.html">학번 찾기</a>
		</div>
		<div id="search_pw">	 
			<a href="search_pw.html">비밀번호 찾기</a>
		</div>
		<div id="change_pw">	 
			<a href="change_pw.html">비밀번호 변경</a>
		</div>
	</div>		
	<!-- 학번 찾기, 비밀번호 찾기, 비밀번호 변경 필드 끝 -->
    </div>
	<!-- 우측 부분 끝 -->
	</div>
	<!-- 로그인 박스 끝 -->
	</div>
	<!-- 상단바 제외한 로그인 모든 부분 끝 -->

</body>
</html>
