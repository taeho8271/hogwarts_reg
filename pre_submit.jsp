<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 

<title>시간표</title> 

<style>

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	
	/* 상단바 */
	#prs_header {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		width: 100%;
		height: 40px;
		background-color: #522808;
		padding: 10px 0 20px;
		z-index: 2;
	}
	
	/*과목 검색 영역 전체*/
	#search_wrap {
		height: 50px;
		margin: 20px 0 20px 30px;
		padding-top: 90px;
		width: 100%;
		/* background-color:yellow; */
	}
	
	/* 목록 전체 */
	#list_wrap {
		width: 100%;
		height: 230px;
		margin: 0 30px 20px 30px;
		/* padding: 0 0 30px 0; */
		/* padding: 70px 0 30px 20px; */
		/* width: 600px; */
		/* background-color:red; */
		font-size : 1em;
		font-family : 나눔 고딕
		/* background-color:yellow; */
	}
	
	/* 개설강의 구역 전체 */
	#subject_wrap {
		width: 1000px;
		font-size: 1em;
		font-family: 나눔 고딕;
		margin: 0 30px 50px 0;
		/* background-color:yellow; */
	}
	
	/* 수강 구역 전체 */
	#lecture_wrap {
		width: 1000px;
		font-size: 1em;
		font-family: 나눔 고딕;
		margin: 50px 30px 0 0px;
		/* background-color:magenta; */
	}

	/* 과목 검색 영역 */
	/* 검색어 선택 */
	#select_box
	{ 
	   width: 80px;
	   height: 30px;
	   text-indent: 0.5em;
	   font-size: 1em;
	   font-family: nanumgothic;
	   -webkit-appearance: none;
	   -moz-appearance: none;
	   appearance: none;
	   background-color: white;
	   border-radius: 0px;
	   opacity: 0.5;
	   filter: alpha(opacity=0.5);
	}
	
	
	/* 과목 검색 입력필드 */
	#list_search_word {
		width: 200px;
		height: 30px;
		border: 1px solid #ccc;
		text-indent: 0.5em;
        font-size: 1em;
		font-family: Nanum Gothic;
	}
	

	/*검색 버튼*/
	.search_btn {	
		font-size: 1em;
		border-radius: 5px;
		border-width: 1px;
		border-style: solid;
		border-color: #ccc;
		/* padding : 10px 15px 10px 15px; */
		padding: 6px 12px;
		font-style: bold;
		width: auto;
		background-color: #522808;
		color: #fff;
	}
	
	/* 검색 버튼: 롤오버 효과 */
	.search_btn:hover {
		background-color: rgba(181,146,99,0.5);
		color: #fff;
	}
	
	/* 목록(개설 강의, 수강예정) 영역*/
	/* 목록 헤더*/
	.list_header {
		width: 1000px;
		height: 30px;
		background-color: #E7E3DE;
		padding: 10px 0px 10px;
		color: #522808;
		font-weight: bold;
	}
	
	/* 레이어 정렬 : 중앙정렬 */
	.div_align_center {
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	/* 목록 본체 */
	.list_body {
		width: 1000px;
		height: 230px;
		overflow-x: hidden;
		overflow-y: scroll;
		/* background-color:blue; */
	}
	
	/* 긴 속성명(과목코드, 과목명, 강사명, 요일/시간) */
	.list_column_l {
		float: left;
		width: 160px;
		margin-left: 10px;
	}
	
	
	/* 짧은 속성명(학점, 제한인원, 버튼) */
	.list_column_s {
		float: left;
		width: 80px;
		margin-left: 10px;
	}
	
	/* 강의(한줄) */
	.list_row {
		height: 30px;
		padding: 10px 0 10px ;
		border-bottom: 1px solid #ccc;
	}
	
	/* 강의(한줄) : 롤오버 효과(rollover)*/
	.list_row:hover {
	background-color: rgba(177,146,101,0.2);
	}
	
	/* 담기/빼기 버튼 */
	.list_btn {
		font-size: 1em;
		border-radius: 5px;
		width: auto;
		border: 1px solid #B59263;
		margin: 0 0 15px 0;
		padding: 5px 10px;
		font-weight: bold;
		align-items: center;
		justify-content: center;
	}
	
	.btn_blue {
		background-color: #522808;
		color: #fff;
	}
	
	.btn_blue:hover {
		background-color: rgba(181,146,99,0.5);
		color: #fff;
	}
	
	
	
	/* 시간표 영역 */
	/*시간표*/
	.prs_tbl {
		margin: 20px 20px ;
		position: absolute;
		left: 1050px;
		top: 143px;
	}
	
	table{
		cellspacing: 1px;
		align: right;  
		cellpadding: 8px; 
		width: 500px; 
		height: 500px;
	
	}
	
	/* 시간표 내부 */
	.time {
		width: 50px;
		height : 40px;
		font-weight: bold;
	}
	
	.date {
		width: 100px;
		height : 50px;
		font-weight: bold;
	}
	
	input[type="checkbox"] {
		display: none;
	}

	input[type="checkbox"] + label {
		width: 15px; 
		height: 15px; 
		background: #B59263; 
		cursor: pointer; 
		border-radius: 3px;
		margin: 0 20px 0 0;
		vertical-align: middle;		
	}
	
	
	input[type="checkbox"]:checked + label {
		background: url(check_mark.png) #B59263 no-repeat center/20px 20px; 
	}

	input[type="checkbox"] + label span {
		position: absolute; 
		/*position: relative;*/
		/*right: 10px;*/
		right: 10px;	
		display: block;
	}

</style>
</head> 

<body>
	<!-- 상단바 시작 -->
	<div id="prs_header">&nbsp;&nbsp;
		<img src="D:\HJ\PROJECT/logo.png" width="60px" height="55px">
		<img src="D:\HJ\PROJECT/hogwarts.png" width="150px" height="50px">
	</div>
	<!-- 상단바 끝 -->
	
	<!-- 검색 구역 시작 -->
	<div id="search_wrap">
	
		<select id="select_box" name="select_box">
			<option>선택</option>
			<option>과목명</option>
			<option>강사명</option>
		</select>&nbsp;&nbsp;

		<input type="text" id="list_search_word" name="list_search_word"> &nbsp;&nbsp;
		
		
		<input type="checkbox" id="mon"><label for="mon"></label>월
		<input type="checkbox" id="tue"><label for="tue"><span></span>화</label>
		<input type="checkbox" id="wed" ><label for="wed"><span></span>수</label>
		<input type="checkbox" id="thu"><label for="thu"><span></span>목</label>
		<input type="checkbox" id="fri"><label for="fri"><span></span>금</label>&nbsp;&nbsp;&nbsp;
		
		<!--
		<input type="checkbox" id = "mon" name="mon" value="3">월
		<input type="checkbox" id = "tue" name="tue" value="3">화
		<input type="checkbox" id = "wed" name="wed" value="3">수
		<input type="checkbox" id = "thu" name="thu" value="3">목
		<input type="checkbox" id = "fri" name="fri" value="3">금&nbsp;&nbsp;
		-->
		<input type="submit" id="search_btn" class="search_btn" value="검색">
		
	</div>
	
	<!-- 목록 전체 구역 시작 -->
	<div id="list_wrap">
	
		<!-- 개설 강의 구역 시작 -->
		<div id="subject_wrap">
		
			<!-- 목록 헤더 시작 -->
			<div class="list_header">
				
				<div class="list_column_l div_align_center">과목코드</div>
				<div class="list_column_l div_align_center">과목명</div>
				<div class="list_column_l div_align_center">강사명</div>
				<div class="list_column_l div_align_center">요일/시간</div>
				<div class="list_column_s div_align_center">학점</div>
				<div class="list_column_s div_align_center">제한인원</div>
				<div class="list_column_s div_align_center">&emsp;&nbsp;담기</div>
				
			</div>
			<!-- 목록 헤더 끝 -->
			
			<!-- 목록 바디 시작 -->
			<div class="list_body">
			
				<!-- 목록 게시글(한줄) 시작 -->
				<!--  -->
				<div class="list_row">
					<div class="list_column_l div_align_center">123456</div>
					<div class="list_column_l div_align_center">비행술</div>
					<div class="list_column_l div_align_center">후치 부인</div>
					<div class="list_column_l div_align_center">수 / 19,20,21</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">10/40</div>
					<div class="list_column_s div_align_center">&emsp;&nbsp;
						<input class="list_btn btn_blue" type="submit" value="담기"></input>
					</div>
				</div>
				<div class="list_row">
					<div class="list_column_l div_align_center">123456</div>
					<div class="list_column_l div_align_center">마법</div>
					<div class="list_column_l div_align_center">필리우스 플리트윅</div>
					<div class="list_column_l div_align_center">화 / 1,2,3,4,5,6</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">20/40</div>
					<div class="list_column_s div_align_center">&emsp;&nbsp;
						<input class="list_btn btn_blue" type="submit" value="담기"></input>
					</div>
				</div>
				<div class="list_row">
					<div class="list_column_l div_align_center">123456</div>
					<div class="list_column_l div_align_center">변신술</div>
					<div class="list_column_l div_align_center">미네르바 맥고나걸</div>
					<div class="list_column_l div_align_center">수 / 1,2,3,4,5,6</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">5/45</div>
					<div class="list_column_s div_align_center">&emsp;&nbsp;
						<input class="list_btn btn_blue" type="submit" value="담기"></input>
					</div>
				</div>
				<div class="list_row">
					<div class="list_column_l div_align_center">123456</div>
					<div class="list_column_l div_align_center">약초학</div>
					<div class="list_column_l div_align_center">포모나 스프라우트</div>
					<div class="list_column_l div_align_center">화 / 4,5,6,7,8,9</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">2/30</div>
					<div class="list_column_s div_align_center">&emsp;&nbsp;
						<input class="list_btn btn_blue" type="submit" value="담기"></input>
					</div>
				</div>
				<!-- 목록 게시글(한줄) 끝 -->

			</div>
			
			<!-- 목록 바디 끝 -->
			
		</div>
		<!-- 개설 강의 구역 끝 -->
	   
		<!-- 수강 구역 시작 -->
		<div id="lecture_wrap">
		
			<!-- 목록 헤더 시작 -->
			<div class="list_header">
				
				<div class="list_column_l div_align_center">과목코드</div>
				<div class="list_column_l div_align_center">과목명</div>
				<div class="list_column_l div_align_center">강사명</div>
				<div class="list_column_l div_align_center">요일/시간</div>
				<div class="list_column_s div_align_center">학점</div>
				<div class="list_column_s div_align_center">제한인원</div>
				<div class="list_column_s div_align_center">&emsp;&nbsp;빼기</div>
				
			</div>
			<!-- 목록 헤더 끝 -->
			
			<!-- 목록 바디 시작 -->
			<div class="list_body">
			
				<!-- 목록 게시글(한줄) 시작 -->
				
				<div class="list_row">
					<div class="list_column_l div_align_center">123456</div>
					<div class="list_column_l div_align_center">과목명</div>
					<div class="list_column_l div_align_center">강사명</div>
					<div class="list_column_l div_align_center">요일/시간</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">제한인원</div>
					<div class="list_column_s div_align_center">&emsp;&nbsp;
						<input class="list_btn btn_blue" type="submit" value="빼기"></input>
					</div>
				</div>	
				<!-- 목록 게시글(한줄) 끝 -->
				
				<!-- 목록 게시글(한줄) 시작 -->
				<div class="list_row">
					<div class="list_column_l div_align_center">123456</div>
					<div class="list_column_l div_align_center">과목명</div>
					<div class="list_column_l div_align_center">강사명</div>
					<div class="list_column_l div_align_center">요일/시간</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">제한인원</div>
					<div class="list_column_s div_align_center">&emsp;&nbsp;
						<input class="list_btn btn_blue" type="submit" value="빼기"></input>
					</div>
				</div>	
				<!-- 목록 게시글(한줄) 끝 -->
				
				<!-- 목록 게시글(한줄) 시작 -->
				<div class="list_row">
					<div class="list_column_l div_align_center">123456</div>
					<div class="list_column_l div_align_center">과목명</div>
					<div class="list_column_l div_align_center">강사명</div>
					<div class="list_column_l div_align_center">요일/시간</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">제한인원</div>
					<div class="list_column_s div_align_center">&emsp;&nbsp;
						<input class="list_btn btn_blue" type="submit" value="빼기"></input>
					</div>
				</div>	
				<!-- 목록 게시글(한줄) 끝 -->
				
				<!-- 목록 게시글(한줄) 시작 -->
				<div class="list_row">
					<div class="list_column_l div_align_center">123456</div>
					<div class="list_column_l div_align_center">과목명</div>
					<div class="list_column_l div_align_center">강사명</div>
					<div class="list_column_l div_align_center">요일/시간</div>
					<div class="list_column_s div_align_center">3</div>
					<div class="list_column_s div_align_center">제한인원</div>
					<div class="list_column_s div_align_center">&emsp;&nbsp;
						<input class="list_btn btn_blue" type="submit" value="빼기"></input>
					</div>
				</div>	
				<!-- 목록 게시글(한줄) 끝 -->
				
			</div>
			<!-- 목록 바디 끝 -->
			
		</div>
		<!-- 수강 구역 끝 -->
	</div>
	<!-- 목록 전체 구역 끝 -->
	
	
	<!-- 시간표 시작 -->
	<div class="prs_tbl">		
		<table> 
				<p></p> 
			
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE"></td> 
				<td class="date" bgcolor="#E7E3DE">월</td> 
				<td class="date" bgcolor="#E7E3DE">화</td> 
				<td class="date" bgcolor="#E7E3DE">수</td> 
				<td class="date" bgcolor="#E7E3DE">목</td> 
				<td class="date" bgcolor="#E7E3DE">금</td> 
			</tr> 	
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">1</td> 
				<td></td> 
				<td bgcolor="#E7E3DE"  rowspan="2" >전산실무</td> 
				<td></td> 
				<td></td> 
				<td></td> 
			</tr> 	
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">2</td> 
				<td></td> 
				<td bgcolor="#E7E3DE">포토샾</td> 
				<td></td> <td></td> <td></td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">3</td> 
				<td bgcolor="#E7E3DE" rowspan="3" >플레시</td> 
				<td bgcolor="#E7E3DE">포토샾</td> 
				<td bgcolor="#E7E3DE">플래시</td> <td></td> 
				<td bgcolor="#E7E3DE" rowspan="3">컴퓨터그래픽</td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">4</td> 
				<td bgcolor="#E7E3DE">전산개론</td> 
				
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">5</td> 
				<td></td> 
				<td bgcolor="#E7E3DE">전산개론</td> 
				<td></td> 
				<td></td> 
				<td></td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">6</td> 
				<td></td> 
				<td bgcolor="#E7E3DE">전산개론</td> 
				<td bgcolor="#E7E3DE" rowspan="3">웹디자인</td> 
				<td bgcolor="#E7E3DE">웹디자인</td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">7</td>  
				<td bgcolor="#E7E3DE" rowspan="3">운영체제</td> 
				<td></td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">8</td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">9</td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">10</td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">11</td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">12</td> 
				<td></td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">13</td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">14</td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">15</td> 
				<td></td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">16</td> 
				<td></td> <td></td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">17</td> 
				<td></td> <td></td> <td></td> 
				<td bgcolor="#E7E3DE" rowspan="3">알고리즘</td> 
				<td></td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">18</td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">19</td> 
				<td></td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">20</td> 
				<td></td> 
			</tr> 
			<tr align="center"> 
				<td class="time" bgcolor="#E7E3DE">21</td> 
				<td></td> <td></td>  
			</tr> 
						
		</table> 
	</div>
	<!-- 시간표 끝 -->
	</body> 
</html>
