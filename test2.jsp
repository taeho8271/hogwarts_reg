<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 

<title>시간표</title> 
</head> 

<style>

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	
	/* 전체 레이아웃 */
	/* 반응형 크기는 px로 맞춘 다음 비율로 해야 할 듯? */
	/*
	{
		(전체 레이아웃)
	}
	*/
	
	/*
		너비 : 1000px;
		글꼴크기 : 1em;
		글꼴 : 나눔 고딕;
	*/
	
	/*상단바*/
	#prs_header {
		width : 1650px;
		height : 40px;
		background-color :#007AAE;
		padding : 20px 0 20px;
	}
	
	/* 목록 전체 */
	#list_wrap {
		margin: 0 30px 0 0;
		padding: 0 0 30px 20px;
		/* background-color:red; */
	}
	
	/* 긴 속성명(과목코드, 과목명, 강사명, 요일/시간) */
	.list_column_l {
		float:left;
		width : 100px;
		margin-left : 10px;
	}
	
	
	/* 짧은 속성명(학점, 제한인원, 버튼) */
	.list_column_s {
		float:left;
		width : 50px;
		margin-left : 10px;
	}

	/* 개설강의 구역 전체 */
	#subject_wrap {
		width: 1000px;
		font-size : 1em;
		font-family : 나눔 고딕;
		margin: 0 30px 50px 0;
		/* background-color:yellow; */
	}
	
	/* 수강 구역 전체 */
	#lecture_wrap {
		width: 1000px;
		font-size : 1em;
		font-family : 나눔 고딕;
		margin: 50px 30px 0 0px;
		/* background-color:magenta; */
	}
	
	/* 시간표 구역 전체 */
	#tbl_wrap {
		width: 650px;
		position: absolute;
		left: 1020px;
		top: 135px;
		font-size : 1em;
		font-family : 나눔 고딕;
		margin: 0 0px 30px 0;
		/* background-color:cyan; */
	}
	
	/* 검색 영역 시작 */
	/* 게시판 검색(섹션) */
	#list_search_menu {
		width:100%;
		padding:20px;
		height:50px;
		/* background-color:yellow; */
		text-align:center;
	}
 
    /* IE 10, 11의 네이티브(native) 화살표 숨기기 */  
    /* select::-ms-expand { display: none; } */
	
	/*과목 검색 박스*/
	.search_box {
		height: 30px;
		margin: 20px 0 20px 20px;
		width : 1000px;
	
	}
	
	/* 검색어 선택 */
	#select_box
	{ 
	   width : 80px;
	   height : 30px;
	   text-indent : 0.5em;
	   font-size : 1em;
	   font-family : nanumgothic;
	   -webkit-appearance : none;
	   -moz-appearance : none;
	   appearance :none;
	   background-color : white;
	   border-radius : 0px;
	   opacity : 0.5;
	   filter:alpha(opacity=0.5);
   
	}
	
	/* 과목 검색 입력필드 */
	#list_search_word {
		width:200px;
		height:30px;
		border:1px solid #ccc;
		text-indent:0.5em;
        font-size:1em;
		font-family:Nanum Gothic;
	}
	

	/*검색 버튼*/
	.list_btn {	
	
		font-size : 1em;
		border-radius : 5px;
		border-width : 1px;
		border-style : solid;
		border-color : #ccc;
		/* padding : 10px 15px 10px 15px; */
		padding : 6px 12px;
		font-style : bold;
		width : auto;
		background-color:#007AAE;
		color:#fff;
		
	}
	
	/* 검색 영역 끝 */
	
	/* 목록(개설 강의, 수강예정) 시작*/
	/* 목록 헤더*/
	/*
		너비 : 100%;
		길이 : 30px;
		배경색 : 007AAE;
		내부간격 : 20px 0px 10px;
		글꼴색 : 흰색;
		글꼴 형태 : 굵게;
	*/
	
	#list_header {
		width : 100%;
		height : 30px;
		background-color : #007AAE;
		padding : 10px 0px 10px;
		color : #FFFFFFF;
		font-weight : bold;
	}
	
	/* 레이어 정렬 : 중앙정렬 */
	.div_align_center {
		display:flex;
		align-items:center;
		justify-content:center;
	}
	
	/* 목록 본체 */
	#list_body {
		width:1000px;
		height: 230px;
		overflow-x:hidden;
		overflow-y:scroll;
	}
	
	/* 강의(한줄) */
	.list_row {
		height:30px;
		padding:15px 0 15px ;
		border-bottom:1px solid #ccc;
	}
	
	/* 강의(한줄) : 롤오버 효과(rollover)*/
	.list_row:hover {
	background-color: rgba(96,197,241,0.2);
	}
	
	/* 학점, 제한인원, 담기 */
	.list_grade, .list_limit_num, .list_add {
		float:left;
		text-align: center;
		width:100px;
		/* background-color:orange; */
	}
	
	
	
	/* 담기 버튼 */
	/*
		글꼴 크기 : 1em;
		둥근 외곽선 효과 : 5px;
		외곽선 : 1px 실선 #ccc;
		너비 : 자동 확대/축소;
		내부간격 : 상하 5px, 좌우 7px;
		글꼴 굵기 : 굵게;
	*/
	.list_add_btn {
		font-size: 1em;
		border-radius : 5px;
		width : auto;
		border:1px solid #ccc;
		margin: 0 0 15px 0;
		padding : 6px 12px;
		font-weight : bold;
		align-items: center;
		justify-content: center;
	}	
	.btn_blue {
		background-color:#10141B;
		color:#fff;
	}
	
	.btn_blue:hover {
		background-color:#005174;
		color:#fff;
	}
	
	
	/* 목록 본체 */
	#list_body {
		width:1000px;
		height:230px;
		overflow-y:scroll;
		overflow-x:hidden;
		
	}
	
	/* 강의(한줄) */
	.list_row {
		height:30px;
		padding:15px 0 15px;
		border-bottom:1px solid #ccc;
	}
	
	
	/* 강의(한줄) : 롤오버 효과(rollover) */
	.list_row:hover {
	background-color:rgba(96, 197, 241, 0.2);
	}
	
	/* 빼기 */
	/*
		글꼴 크기 : 1em;
		둥근 외곽선 효과 : 5px;
		외곽선 : 1px 실선 #ccc;
		너비 : 자동 확대/축소;
		내부간격 : 상하 1px, 좌우 15px;
		글꼴 굵기 : 굵게;
		
	*/
	.list_cancel_btn {		
		font-size:1em;
		border-radius:5px;
		border:1px solid #ccc;
		width:auto;				
		font-weight:bold;
		padding:6px 12px;
		
	}
	
	.btn_blue {
		background-color:#007AAE;
		color:#fff;
	}
	
	.btn_blue:hover {
		background-color:#005174;
		color:#fff;
	}
	
	/* 목록 검색(섹션) */
	#list_search_menu {
		width:100%;
		padding:20px;
		height:50px;
		/* background-color:yellow; */
		text-align:center;
	}
	/* 목록(개설 강의, 수강예정) 끝*/
	
	/*시간표*/ ㅇ
	.prs_tbl {
		margin:20px 10px;
		
	}
	
	/* 시간표 내부 */
	.time {
		width: 40px;
	}
	
	.date {
		width: 110px;
	}
	
</style>


<body>
	<!-- 상단바 시작 -->
	<div id="prs_header">
			
	</div>
	<!-- 상단바 끝 -->
	
	<!-- 검색 구역 시작 -->
	<div class="search_box">
		<select id = "select_box" name = "select_box">
			<option>선택</option>
			<option>과목명</option>
			<option>강사명</option>
		</select>&nbsp;&nbsp;
			
		<input type="text" id="list_search_word" name="list_search_word"> &nbsp;&nbsp;
			<input type="checkbox" id = "mon" name="mon" value="3">월
			<input type="checkbox" id = "tue" name="tue" value="3">화
			<input type="checkbox" id = "wed" name="wed" value="3">수
			<input type="checkbox" id = "thu" name="thu" value="3">목
			<input type="checkbox" id = "fri" name="fri" value="3">금&nbsp;&nbsp;
			<input type="submit" id = "search_btn" class="list_btn" value="검색">
					
	</div>
	
	<!-- 목록 전체 구역 시작 -->
	<div id="list_wrap">
	
		<!-- 개설 강의 구역 시작 -->
		<div id="subject_wrap">
		
			<!-- 게시판 헤더 시작 -->
			<div id="list_header">
				
				<div class="list_column_l div_align_center">과목코드</div>
				<div class="list_column_l div_align_center">과목명</div>
				<div class="list_column_l div_align_center">강사명</div>
				<div class="list_column_l div_align_center">&nbsp;요일/시간</div>
				<div class="list_column_s div_align_center">학점</div>
				<div class="list_column_s div_align_center">제한인원</div>
				<div class="list_column_s div_align_center">&emsp;&nbsp;담기</div>
				
			</div>
			<!-- 게시판 헤더 끝 -->
			
			<!-- 게시판 바디 시작 -->
			<div id="list_body">
			
				<!-- 게시판 게시글(한줄) 시작 -->
				<!--  -->
				<div class="list_row">
					<div class="list_column_l div_align_center">1</div>
					<div class="list_column_l div_align_center">비행술</div>
					<div class="list_column_l div_align_center">후치 부인</div>
					<div class="list_column_l div_align_center">수 / 19,20,21</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">10/40</div>
					<div class="list_column_s div_align_center">
						<input class="list_add_btn btn_blue" type="submit" value="담기"></input>
					</div>
				</div>
				<div class="list_row">
					<div class="list_column_l div_align_center">2</div>
					<div class="list_column_l div_align_center">마법</div>
					<div class="list_column_l div_align_center">필리우스 플리트윅</div>
					<div class="list_column_l div_align_center">화 / 1,2,3,4,5,6</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">20/40</div>
					<div class="list_column_s div_align_center">
						<input class="list_add_btn btn_blue" type="submit" value="담기"></input>
					</div>
				</div>
				<div class="list_row">
					<div class="list_column_l div_align_center">3</div>
					<div class="list_column_l div_align_center">변신술</div>
					<div class="list_column_l div_align_center">미네르바 맥고나걸</div>
					<div class="list_column_l div_align_center">수 / 1,2,3,4,5,6</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">5/45</div>
					<div class="list_column_s div_align_center">
						<input class="list_add_btn btn_blue" type="submit" value="담기"></input>
					</div>
				</div>
				<div class="list_row">
					<div class="list_column_l div_align_center">4</div>
					<div class="list_column_l div_align_center">약초학</div>
					<div class="list_column_l div_align_center">포모나 스프라우트</div>
					<div class="list_column_l div_align_center">화 / 4,5,6,7,8,9</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">2/30</div>
					<div class="list_column_s div_align_center">
						<input class="list_add_btn btn_blue" type="submit" value="담기"></input>
					</div>
				</div>
				<!-- 게시판 게시글(한줄) 끝 -->

			</div>
			
			<!-- 게시판 바디 끝 -->
			
		</div>
		<!-- 개설 강의 구역 끝 -->
	   
		<!-- 수강 구역 시작 -->
		<div id="lecture_wrap">
		
			<!-- 목록 헤더 시작 -->
			<div id="list_header">
				
				<div class="list_column_l div_align_center">과목코드</div>
				<div class="list_column_l div_align_center">과목명</div>
				<div class="list_column_l div_align_center">강사명</div>
				<div class="list_column_l div_align_center">요일/시간</div>
				<div class="list_column_s div_align_center">학점</div>
				<div class="list_column_s div_align_center">제한인원</div>
				<div class="list_cancel div_align_center">빼기</div>
				
			</div>
			<!-- 목록 헤더 끝 -->
			
			<!-- 목록 바디 시작 -->
			<div id="list_body">
			
				<!-- 목록 게시글(한줄) 시작 -->
				
				<div class="list_row">
					<div class="list_column_l div_align_center">코드</div>
					<div class="list_column_l div_align_center">과목명</div>
					<div class="list_column_l div_align_center">강사명</div>
					<div class="list_column_l div_align_center">요일/시간</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">제한인원</div>
					<div class="list_cancel div_align_center">
					<input type="submit" class="list_cancel_btn btn_blue" value="빼기" />
					</div>
				</div>	
				<!-- 목록 게시글(한줄) 끝 -->
				
				<!-- 목록 게시글(한줄) 시작 -->
				<div class="list_row">
					<div class="list_column_l div_align_center">코드</div>
					<div class="list_column_l div_align_center">과목명</div>
					<div class="list_column_l div_align_center">강사명</div>
					<div class="list_column_l div_align_center">요일/시간</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">제한인원</div>
					<div class="list_cancel div_align_center">
					<input type="submit" class="list_cancel_btn btn_blue" value="빼기" />
					</div>
				</div>	
				<!-- 목록 게시글(한줄) 끝 -->
				
				<!-- 목록 게시글(한줄) 시작 -->
				<div class="list_row">
					<div class="list_column_l div_align_center">코드</div>
					<div class="list_column_l div_align_center">과목명</div>
					<div class="list_column_l div_align_center">강사명</div>
					<div class="list_column_l div_align_center">요일/시간</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">제한인원</div>
					<div class="list_cancel div_align_center">
					<input type="submit" class="list_cancel_btn btn_blue" value="빼기" />
					</div>
				</div>	
				<!-- 목록 게시글(한줄) 끝 -->
				
				
				
				<!-- 목록 게시글(한줄) 시작 -->
				<div class="list_row">
					<div class="list_column_l div_align_center">코드</div>
					<div class="list_column_l div_align_center">과목명</div>
					<div class="list_column_l div_align_center">강사명</div>
					<div class="list_column_l div_align_center">요일/시간</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">제한인원</div>
					<div class="list_cancel div_align_center">
					<input type="submit" class="list_cancel_btn btn_blue" value="빼기" />
					</div>
				</div>	
				<!-- 목록 게시글(한줄) 끝 -->
				
			</div>
			<!-- 목록 바디 끝 -->
			
			
		</div>
		<!-- 수강 구역 끝 -->
	</div>
	<!-- 목록 전체 구역 끝 -->
	
	<!-- 시간표 구역 시작 -->
	<div id="tbl_wrap">
		<!-- 시간표 시작 -->
		<div class="prs_tbl">		
			<table cellspacing="1" align="right"  cellpadding="8" width="600" height="500"> 
				<p></p> 
			
			
			<tr align="center"> 
				<td class="time" bgcolor="#EFEFEF"></td> 
				<td class="date" bgcolor="#EFEFEF">월</td> 
				<td class="date" bgcolor="#EFEFEF">화</td> 
				<td class="date" bgcolor="#EFEFEF">수</td> 
				<td class="date" bgcolor="#EFEFEF">목</td> 
				<td class="date" bgcolor="#EFEFEF">금</td> 
			</tr> 
			
			
			
			
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">1</td> 
				<td></td> 
				<td bgcolor="#EFEFEF"  rowspan="2" >전산실무</td> 
				<td></td> 
				<td></td> 
				<td></td> 
			</tr> 
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">2</td> 
				<td></td> 
				<td bgcolor="#EFEFEF">포토샾</td> 
				<td></td> <td></td> <td></td> 
			</tr> 
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">3</td> 
				<td bgcolor="#EFEFEF" rowspan="3" >플레시</td> 
				<td bgcolor="#EFEFEF">포토샾</td> 
				<td bgcolor="#EFEFEF">플래시</td> <td></td> 
				<td bgcolor="#EFEFEF" rowspan="3">컴퓨터그래픽</td> 
			</tr> 
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">4</td> 
				<td bgcolor="#EFEFEF">전산개론</td> 
				
			</tr> 
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">5</td> 
				<td></td> 
				<td bgcolor="#EFEFEF">전산개론</td> 
				<td></td> 
				<td></td> 
				<td></td> 
			</tr> 
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">6</td> 
				<td></td> 
				<td bgcolor="#EFEFEF">전산개론</td> 
				<td bgcolor="#EFEFEF" rowspan="3">웹디자인</td> 
				<td bgcolor="#EFEFEF">웹디자인</td> 
			</tr> 
			<tr align="center"> 
				<td bgcolor="#EFEFEF">7</td>  
				<td bgcolor="#EFEFEF" rowspan="3">운영체제</td> 
				<td></td> 
			</tr> 
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">8</td> 
			</tr> 
			
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">9</td> 
			</tr> 
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">10</td> 
			</tr> 
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">11</td> 
			</tr> 
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">12</td> 
				<td></td> 
			</tr> 
			
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">13</td> 
			</tr> 
			
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">14</td> 
			</tr> 
			
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">15</td> 
				<td></td> 
			</tr> 
			
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">16</td> 
				<td></td> <td></td> 
			</tr> 
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">17</td> 
				<td></td> <td></td> <td></td> 
				<td bgcolor="#EFEFEF" rowspan="3">알고리즘</td> 
				<td></td> 
			</tr> 
			
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">18</td> 
			</tr> 
			
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">19</td> 
				<td></td> 
			</tr> 
			
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">20</td> 
				<td></td> 
			</tr> 
			
			<tr align="center"> 
				<td bgcolor="#EFEFEF">21</td> 
				<td></td> <td></td>  
			</tr> 
			
			
			</table> 
		</div>
		<!-- 시간표 끝 -->
	</div>
	<!-- 시간표 구역 끝 -->
	</body> 
</html>
