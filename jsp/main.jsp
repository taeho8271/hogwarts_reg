<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 

<title>메인 페이지</title> 
</head> 
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	
	
	/*상단바*/
	div#header {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		height: 40px;
		background-color: #522808;
		padding: 10px 0 20px;
		z-index: 2;
	}
	
	
	/*상단바 제외 섹션*/
	div#wrap{
		/*
		background-image: url('D:/HJ/PROJECT/castle.jpg');
		background-size: 100% 130%;
		width: 100%; 
		height: 1000px;
		position: fixed;
		left: 0;
		right: 0;
		overflow-y: hidden;
		*/
	}
	
	/*하단바 메뉴*/
	div#footer_menu{
		overflow-x: auto;
		overflow-y: hidden;
		width: 100%;
		height: 120px;
		background-color: #522808;
		position: fixed;
		left: 0;
		right: 0;
		bottom: 0;
		opacity: 0.9;
	}
	
	/*하단바 섹션*/
	ul {	
		list-style: none;
		background-color: #522808;
		width: 1600px;
		height: 120px;
		padding: 0;
		margin: 0;	
	}

	ul li {
		list-style: none;
		margin-left: 25px;
		margin-right: 25px;
		float: left;
		width: 350px;
		background-color: #522808;	
	}

	/*메뉴 블록*/
	li a {
		display: block;
		color: white;
		text-align: center;
		padding: 30px 30px;
		text-decoration: none;
		margin-top: 0;	
	}
	
	li a:hover {
		background-color: #916343;
		color: white;
		font-weight: bold;
		height: 100px;
		top: 0;	
	}
	
	div.slide{
		width: 100%; 
		height: 800px;
		overflow:hidden;
		background-size: 1600px 800px;
		position: fixed;
		left: 0;
		right: 0;
		overflow-y: hidden;
	}
	
    div.slide ul{position:absolute;height:100%;}
    div.slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 16s infinite;}
    div.slide li:nth-child(1){background:url('D:/HJ/PROJECT/wallpapers.png'); animation-delay:0s}
    div.slide li:nth-child(2){background:url('D:/HJ/PROJECT/campus.jpg');animation-delay:4s}
    div.slide li:nth-child(3){background:url('D:/HJ/PROJECT/castle.jpg');animation-delay:8s}
    div.slide li:nth-child(4){background:url('D:/HJ/PROJECT/cafe.jpg');animation-delay:12s}
    
	@keyframes fade {
      0% {opacity:0;}
      5% {opacity:1;}
      25% {opacity:1;}
      30% {opacity:0;}
      100% {opacity:0;}
    }

	
	/*아이콘 크기*/
	.material-icons { font-size: 48px; }
	
</style>



<body> 
	<!--상단바 시작-->
	<div id="header">&nbsp;&nbsp;
		<img src="D:\HJ\PROJECT\header_logo.png" width="191px" height="55px" >
	</div>
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
	
			<ul>
				<li id="pre_submit_btn">
				<a onclick = "window.open('pre_submit.html')">
					<i class="material-icons">add_shopping_cart</i><br>
					<b>장바구니</a>	
				</li>
				<li id="submit_btn">
				<a onclick = "window.open('submit.html')">
					<i class="material-icons">access_time</i><br><b>수강신청</a>
				</li>
				<li id="table_btn">
				<a onclick = "window.open('table.html')">
					<i class="material-icons">view_list</i><br><b>내 수강목록</a>
				</li>
				<li id="homeAppliances_btn">
				<a href="#">
					<i class="material-icons">map</i><br><b>오시는 길</a>
				</li>
			</ul>
		
		</div>
	</div>
	<!--하단바 끝-->
</body> 
</html>
