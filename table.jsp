<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 

<title>내 수강목록</title> 

<style>

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	
	/* 상단바 */
	div#prs_header {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		height: 40px;
		background-color: #522808;
		padding: 10px 0 20px;
		z-index: 2;
	}
	

	
	/* 시간표 영역 */
	/*시간표*/
	div.prs_tbl {
		margin:20px 10px;
		position: absolute;
		left: 5px;
		top: 70px;
	}
	
	table{
		cellspacing: 1px;
		align: right;  
		cellpadding: 8px; 
		width: 2100px; 
		height: 500px;
	}
	
	/* 시간표 내부 */
	td.time {
		width: 120px;
		height: 50px;
		font-weight: bold;
	}
	
	td.date {
		width: 282px;
		font-weight: bold;
	}
	
	td{
    color: #522808;
    }
	
	figcaption{
      font-size : 20px;
      color : #522808;
   }

</style>
</head> 

<body>
	<!-- 상단바 시작 -->
	<div id="prs_header">&nbsp;&nbsp;
		<img src="E:\KTH\Project\header_logo.png" width="191px" height="55px">
	</div>
	<!-- 상단바 끝 -->	
	
	<!-- 시간표 구역 시작 -->
	
		<!-- 시간표 시작 -->
		<div class="prs_tbl">		
			<table>
				<figcaption><b>&nbsp;내 수강목록</figcaption>
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
	</div>
	<!-- 시간표 구역 끝 -->
</body> 
</html>
