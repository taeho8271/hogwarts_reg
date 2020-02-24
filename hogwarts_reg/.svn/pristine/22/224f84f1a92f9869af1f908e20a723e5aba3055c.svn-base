<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 

<title>장바구니</title>

<!-- contextPath -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/js/prefixfree.min.js"></script>

<!-- CSS 외장화 -->
<link rel="stylesheet" href="${contextPath}/css/course.css">
<link rel="stylesheet" href="${contextPath}/css/nanumgothic.css">

</head> 
<body>
	<!-- 상단바 시작 -->
	<%@ include file="header.jsp" %>
	<!-- 상단바 끝 -->
	
	<!-- 검색 구역 시작 -->
	<div id="search_wrap">
	
		<select id="prs_select_box" name="prs_select_box">
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
				<c:forEach var="subject" items="${subjects}">
					<div class="list_row">
						<div class="list_column_l div_align_center">${subject.subCode}</div>
						<div class="list_column_l div_align_center">${subject.subName}</div>
						<div class="list_column_l div_align_center">${subject.professor}</div>
						<div class="list_column_l div_align_center">${subject.daytime}</div>
						<div class="list_column_s div_align_center">${subject.grade}</div>
						<div class="list_column_s div_align_center">${subject.limitNum}</div>
						<div class="list_column_s div_align_center">&emsp;&nbsp;
							<input class="list_btn btn_blue" type="submit" value="담기"></input>
						</div>
					</div>
				</c:forEach>
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