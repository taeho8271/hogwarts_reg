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
		background-image: url('D:/HJ/PROJECT/castle.jpg');
		background-size: 100% 130%;
		width: 100%; 
		height: 1000px;
		position: fixed;
		left: 0;
		right: 0;
		overflow-y: hidden;
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
		list-style-type: none;
		background-color: #522808;
		width: 1600px;
		height: 120px;
		padding: 0;
		margin: 0;	
	}

	ul li {
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
	
	/*아이콘 크기*/
	.material-icons { font-size: 48px; }
	
</style>

<!--
<script>
// 각 메인 메뉴의 서브 메뉴 출력
window.onload = function(){

	
	// 모든 서브 메뉴를 sub_menus 변수로 할당(대입) 
	var sub_menus = document.querySelectorAll('div[id$=_sub]');


	// 반복문(for)를 활용하여 모든 서브 메뉴들의 보이기 속성(visibility)를 은닉(감추기) 상태로 초기화 설정합니다.
	
	for(var i=0; i < 4; i++){
		
		sub_menus[i].style.visibility = "hidden";
		
	}
	
	
	// 메인 메뉴들을 main_menus 변수로 할당합니다.
	var main_menus = document.querySelectorAll('li[id$=_btn]');
	
	
	// 메인 메뉴들의 각각의 이벤트 처리 코드를 축소하기 위해 for문 활용.
	for (const main_menu_one of main_menus) {
		
		// 각 개별 메인 메뉴에 마우스를 올렸을 때(rollover) 이벤트 처리 
		main_menu_one.onmouseover = function(e) {
			
			const rollover_menu = this.id.split("_")[0]; // 참고 코드-1
			
			// 홈(home) 메뉴는 롤오버 적용 제외
			if (rollover_menu != "home") {
			
				// 메인 메뉴 버튼의 아이디 추출을 통해서 서브 메뉴 아이디를 선택
				var sub_menu_id = this.id.split("_")[0] + "_sub";
				// 메인 메뉴 계열(자신)의 서브 메뉴
				var this_sub_menu = document.getElementById(sub_menu_id);
				
				// 참고 코드-2
				// 다른 서브 메뉴들을 은닉(감추기)
				// for ~ of 문을 활용합니다. 
				// 전체 서브 메뉴 변수 : sub_menus
				// 단, 반복문 내에서 조건식을 사용하여 서브 메뉴 아이디(id)가 자신의 서브 메뉴 아이디(this_sub_menu)
				// 가 아닌 것만 선택적으로 은닉(hidden)하도록 조치합니다.
				for (const sub_menu_one of sub_menus) {
					
					if (sub_menu_one.id != this_sub_menu.id) {
						sub_menu_one.style.visibility = "hidden";
					}
					else
					{
						sub_menu_one.style.visibility = "visible";
					}
					
				} // for
				
				// 자신의 서브 메뉴(this_sub_menu)를 보이도록 조치
				
				
				
			} // 홈(home) 버튼 롤오버 할 경우 모든 서브 메뉴(sub_menus) 은닉 
			else if (rollover_menu == "home") {

				// 위의 구문(참고 코드-2)과 유사하게 for ~ of 문을 활용합니다.
				// 단, 모든 서브 메뉴를 은닉 조치하기 때문에 조건식은 없습니다.
				for (const sub_menu_one of sub_menus) {
					
					
						sub_menu_one.style.visibility = "hidden";
					 
					
				} // for
				
				
				
			} //
			
		} // onmouseover
	
	} // for
	
	// 서브 메뉴 롤아웃 할 경우 이벤트 핸들러
	// for ~ of 문을 활용하여 서브 메뉴(sub_menus) 변수의 개별 서브메뉴(sub_menu_one)의 이벤트 처리
	for (const sub_menu_one of sub_menus) {
	
		// 개별 서브메뉴(sub_menu_one)에 마우스 롤아웃(mouseout) 하였을 때 이벤트 핸들(처리)
		sub_menu_one.onmouseout = function(e) {
			
			// 서브 메뉴 자신의 아이디에서 "_"를 제거한 첫번째 토큰을 rollover_nemu라는 변수로 할당 
			// 참고 코드-1의 방식을 참조합니다.
			const rollover_menu = this.id.split("_")[0]; 
			
			// 홈 메뉴(home)는 롤오버 적용 제외 : 조건식(if)
			if (rollover_menu != "home") {
			
				// 메인 메뉴 버튼의 아이디(this.id) 추출을 통해서 서브 메뉴 아이디를 선택
				var sub_menu_id = this.id.split("_")[0] + "_sub";
				// 참고 코드-1의 방식을 참조하며 추가적으로 "_sub" 첨가하여
				// 아이디(sub_menu_id) 변수에 할당(대입)합니다.
				var this_sub_menu = document.getElementById(sub_menu_id);
					
				this_sub_menu.style.visibility = "hidden";
				
				// this_sub_menu 보이기(visibility) 속성을 은닉(hidden)으로 설정합니다. 
					
				
			} // if	
			
		}  // 개별 서브메뉴(sub_menu_one)에 마우스 롤아웃(mouseout) 하였을 때 이벤트 핸들(처리) "끝"
		
	} // for ~ of 문을 활용하여 서브 메뉴(sub_menus) 변수의 개별 서브메뉴(sub_menu_one)의 이벤트 처리 "끝" 
	
}//
</script>
-->

<body> 
	<!--상단바 시작-->
	<div id="header">&nbsp;&nbsp;
		<img src="D:\HJ\PROJECT/logo.png" width="60px" height="55px" >
		<img src="D:\HJ\PROJECT/hogwarts.png" width="150px" height="50px" >
	</div>
	<!--상단바 끝-->
	
	<!--하단바 시작-->
	<div id="wrap">
	
		<div id="footer_menu">
	
			<ul>
				<li id="pre_submit_btn">
				<a href="#">
					<i class="material-icons">add_shopping_cart</i><br>
					장바구니</a>	
				</li>
				<li id="submit_btn"><a href="#">
					<i class="material-icons">access_time</i><br>수강신청</a>
				</li>
				<li id="table_btn"><a href="#">
					<i class="material-icons">view_list</i><br>내 수강목록</a>
				</li>
				<li id="homeAppliances_btn"><a href="#">
					<i class="material-icons">map</i><br>오시는 길</a>
				</li>
			</ul>
		
		</div>
	</div>
	<!--하단바 끝-->
</body> 
</html>
