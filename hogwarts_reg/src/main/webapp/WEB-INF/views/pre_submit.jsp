<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.hogwarts.hogwartsreg.vo.CartVO" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--	// 세션 처리
	NavigableSet<CartVO> cartList 
		= (NavigableSet<CartVO>)session.getAttribute("CART_SESSION");
	for(CartVO vo:cartList){
		out.println(vo+"<br>");
	}
--%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>장바구니</title>

<!-- contextPath -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/js/prefixfree.min.js"></script>

<!-- CSS 외장화 -->
<link rel="stylesheet" href="${contextPath}/css/pre_submit.css">
<link rel="stylesheet" href="${contextPath}/css/nanumgothic.css">

<!-- jQuery -->
<script src="${contextPath}/jquery/3.4.1/jquery.min.js"></script>

<script>
// 시간표 과목별 색상 선정
function matchColor(subCode){
	var bgColor = "";
	console.log("##과목코드:"+subCode+"#");
	
	switch (subCode) {
		case "524840" : bgColor="#DEB887"; break;
		case "524860" : bgColor="#FF7F50"; break;
		case "312550" : bgColor="#6495ED"; break;
		case "448410" : bgColor="#F08080"; break;
		case "524880" : bgColor="#A9A9A9"; break;
		case "527850" : bgColor="#BDB76B"; break;
		case "527820" : bgColor="#FF8C00"; break;
		case "527200" : bgColor="#8FBC8F"; break;
		case "378260" : bgColor="#E9967A"; break;
		case "524890" : bgColor="#F0E68C"; break;
		case "524810" : bgColor="#FFDEAD"; break;
		case "383280" : bgColor="#B0E0E6"; break;
		case "527860" : bgColor="#E6E6FA"; break;
		case "527800" : bgColor="#90EE90"; break;
		case "418520" : bgColor="#66CDAA"; break;
		case "478500" : bgColor="#DDA0DD"; break;
		case "426630" : bgColor="#BC8F8F"; break;
		case "524710" : bgColor="#F4A460"; break;
		case "524870" : bgColor="#87CEEB"; break;
		case "403480" : bgColor="#D8BFD8"; break;
	}
	console.log("배경색:"+bgColor);
	return bgColor;
}

// 검색 이벤트 핸들러: 검색 버튼 클릭 시, 검색어 필드 Enter키 입력 시
function searchHandler(){
	
	var contextPath = "/hogwarts_reg";
	
	$(function(){
		
	  console.log("검색");
	  // 인자
	  console.log("검색 구분:"+$("#prs_select_box").val());
	  console.log("검색어:"+$("#list_search_word").val());
	  
	  //console.log("월:"+$("#mon").prop("checked"));
	  console.log("월:"+$("#mon").prop("checked")); // 
	  console.log("화:"+$("#tue").prop("checked"));
	  console.log("수:"+$("#wed").prop("checked"));
	  console.log("목:"+$("#thu").prop("checked"));
	  console.log("금:"+$("#fri").prop("checked"));
	  
	  // 폼 점검
	  var prsSelectBox = $("#prs_select_box").val();
	  var listSearchWord = $("#list_search_word").val();
	  
	  // 전체 선택 체크박스
	  var searchAllCheckboxStatus = $("#searchAll").prop("checked");
	  console.log("searchAllCheckboxStatus:"+searchAllCheckboxStatus);
	  
	  // 요일 체크박스 체크 여부
	  console.log("개수:"+$("[name=weekday]").length);
	  var weekCheckboxCnt = 0;
	  
	  for(var i=0; i<$("[name=weekday]").length; i++){
		  console.log("체크여부:"+$("[name=weekday]:eq("+i+")").prop("checked"));
		  if ($("[name=weekday]:eq("+i+")").prop("checked") == true)
		  	weekCheckboxCnt++;
	  }
	  
	  if(prsSelectBox == '선택' && 
		 searchAllCheckboxStatus == false &&
		 weekCheckboxCnt == 0)
	  {
		  alert("검색 구분을 선택하십시오.");
	  } else if(listSearchWord.trim() == '' && 
			  	searchAllCheckboxStatus == false &&
			  	weekCheckboxCnt == 0)
	  {   //아무것도 없으면 전체 검색 
		  alert("검색어를 입력하십시오.");
	  } else { // 정상 입력
		  
		  // 전송
		$.ajax ({
           url : contextPath+'/course/search_presubmit.do',
           type : 'post',
           dataType:'text',
           
			data : {
				prsSelectBox : prsSelectBox,
				listSearchWord : listSearchWord,
				checkedLength: weekCheckboxCnt,
				mon: $("#mon").prop("checked")==true ? $("#mon").val() : '',
				tue: $("#tue").prop("checked")==true ? $("#tue").val() : '',
				wed: $("#wed").prop("checked")==true ? $("#wed").val() : '',
				thu: $("#thu").prop("checked")==true ? $("#thu").val() : '',
				fri: $("#fri").prop("checked")==true ? $("#fri").val() : '',
				searchAll: $("#searchAll").prop("checked")==true ? $("#searchAll").val() : ''
           },
            
           success : function(data) {
          	 
                   console.log("과목 정보 수신 성공");
                   console.log("data "+data);
                   var subjectJSON = JSON.parse(data);
                   
                   if(data=="[]" || data=="null"){ // 검색 결과 없을 때
                  	 
                  	 alert("검색 결과가 없습니다.");
                  	 $("#opened_subjects").html(""); // 개설강의 패널 초기화
                  	 
                   } else { // 검색 결과 있을 때
                  	 
	                     console.log("강사명:"+subjectJSON[0].professor);
	                     subjectRow = ""; // 초기화
	                     
	                     for(var i=0; i<subjectJSON.length; i++){
	                                    
	                     subjectRow += '<div id="subject_row_'+subjectJSON[i].subCode+'" class="list_row">' +
	     						   	 		'<div class="list_column_l div_align_center">'+subjectJSON[i].subCode+'</div>' +
	     									'<div class="list_column_l div_align_center">'+subjectJSON[i].subName+'</div>' +
	     									'<div class="list_column_l div_align_center">'+subjectJSON[i].professor+'</div>' +
	     									'<div class="list_column_l div_align_center">'+subjectJSON[i].daytime+'</div>' +
	     									'<div class="list_column_s div_align_center">'+subjectJSON[i].grade+'</div>' +
	     									'<div class="list_column_s div_align_center">'+subjectJSON[i].limitNum+'</div>' +
	     									'<div class="list_column_s div_align_center">&emsp;&nbsp;' +
	     										'<input id="addCart_'+subjectJSON[i].subCode+'" class="list_btn btn_blue" type="submit" value="담기"></input>' +
	     									'</div>' +
	     							  '</div>';
	                     } // for 끝
	     							  
	                     console.log("#subjectRow:"+subjectRow);
	                     
	                     // 개설강의 변경사항 적용
	                     $("#opened_subjects").html(subjectRow);
	                     
                   } // 검색 결과 유무 점검 
           },
           error : function(xhr, status) {
               
               console.log(xhr+" : "+status); // 에러 코드
           }
	  
		}); // 전송 끝
	  } // if 끝
	  
	}); // jQuery
} // searchHander 끝

$(function(){
	
	const contextPath="/hogwarts_reg";
	
	// 초기 session 설정(초기화) -> 장바구니 출력, 시간표 출력
	// 화면 새로고침/이동할 경우 기존 장바구니 및 시간표 유지 
	$.ajax ({
 
             url : contextPath+'/course/cartInit.do',
             type : 'post',
             dataType:'text',
             
             success : function(data) {
            	 
            	 console.log("###data:"+data);
            	 
            	 console.log("session 초기 설정");
            	 
            	 if(data.trim() == ''){
            		 var sess = "session 없음";
            	 } else {
            		 
            		 var sess = JSON.parse(data.trim());
            		 // 세션 과목 정보 변수
            		 var subjectRow = "";
            		 
            		 if(sess == ""){
            			 subjectRow = "";
            		 } else {
            			 
            			 for(var i=0; i<sess.length; i++){ // 시간표 세션 과목들 출력
            				 
            				 //console.log("sess[i]:"+sess[i].);
            				 
		            		 // 장바구니 초기화(세션 정보 반영)
		            		 subjectRow = '<div id="subject_row_'+sess[i].subCode+'" class="list_row">' +
									   	 		'<div class="list_column_l div_align_center">'+sess[i].subCode+'</div>' +
												'<div class="list_column_l div_align_center">'+sess[i].subName+'</div>' +
												'<div class="list_column_l div_align_center">'+sess[i].professor+'</div>' +
												'<div class="list_column_l div_align_center">'+sess[i].daytime+'</div>' +
												'<div class="list_column_s div_align_center">'+sess[i].grade+'</div>' +
												'<div class="list_column_s div_align_center">'+sess[i].limitNum+'</div>' +
												'<div class="list_column_s div_align_center">&emsp;&nbsp;' +
													'<input id="cart_delete_btn_'+sess[i].subCode+'" class="list_btn btn_blue" type="submit" value="빼기" />' +
												'</div>' +
										  '</div>';
							if(i==0){
								$("#chosen_subjects").html(subjectRow);
							} else {
								$("#chosen_subjects").append(subjectRow);
							}
							 
	            			 //////////////// 시간표 초기화
	            			// 교시 추출
	            			console.log("##################################");
	            			console.log("과목:"+sess[i].subName);
	         				var times = sess[i].daytime.substring(2, sess[i].daytime.length);
	         				console.log("교시:"+times);
	         				
	         				console.log("-----요일:"+sess[i].daytime);
	         				times = times.split(",");
	         				console.log("교시 개수:"+times.length);
	         				for(var j=0; j<times.length; j++){
	         					console.log("교시:"+times[j]);
	         				}
	         				
	         				console.log("--요일:"+sess[i].daytime);
	         				// 요일 치환: 예) 수요일 -> wed
	        				console.log("요일:"+sess[i].daytime.substring(0, 1));
	        				var day = sess[i].daytime.substring(0, 1);
	         				var eng_day = "";
	        				
	        				switch (day) {
	        				  case '월': eng_day="mon"; break;
	        				  case '화': eng_day="tue"; break;
	        				  case '수': eng_day="wed"; break;
	        				  case '목': eng_day="thu"; break;
	        				  case '금': eng_day="fri"; break;
	        				}
	        				
	        				console.log("요일:"+eng_day);
	         				
	         				// 교시 중복 검사
	         				// 셀 내용(공백) 여부 검사
	         				for(var k=0; k<times.length; k++){
	         					var color = $("div#prs_tbl table td#"+eng_day+"_t"+times[k]).css("backgroundColor");
	         					console.log("color:"+color);
	         					
	         					// 비었을 때
	         					if(color=='rgba(0, 0, 0, 0)'){
	         						console.log("공백");
	         					}
	         					
	         					console.log("셀 내용:"+$("div#prs_tbl table td#"+eng_day+"_t"+times[k]).css("backgroundColor"));
	         				} // for 끝
	         				
	         				// 시간표 출력
	         				// 시간표 추가: 과목별 대표 배경색 선정
	    					for(var l=0; l<times.length; l++){
	    						if(times.length>=3){
	    							var halftime = Math.round(times.length/2)-1;
	    							$("div#prs_tbl table td#"+eng_day+"_t"+times[halftime]).html(sess[i].subName);
	    						}
	    						else {
	    							$("div#prs_tbl table td#"+eng_day+"_t"+times[0]).html(sess[i].subName);
	    						}
	    						
	    						// var bgColor = "orange";
	    						console.log("과목코드:"+sess[i].subCode);
	    						var bgColor = matchColor(String(sess[i].subCode));
	    						// 과목별 색상 선정
	    						console.log("시간표 배경색:"+bgColor);
	    						
	    						$("div#prs_tbl table td#"+eng_day+"_t"+times[l]).css("backgroundColor", bgColor);
	    					} // for 끝
            			 
            			}// for 끝(시간표 세션 과목들 출력 끝)
            			 // 시간표 초기화 끝
            		 }
            		 
            	 }
            	 //console.log("sess:"+sess);
            	 
			}, // success
             
             error : function(xhr, status) {
                 
                console.log(xhr+" : "+status); // 에러 코드
            }
 
    }); // $.ajax
     
	//신청과목 집계 변수(배열-과목코드) : 쿠키화(광역화) - 페이지 전환시에도 상태 유지
	var CHOSEN_SUBJECTS_ARR = [];
	
	
	// 담기 버튼 누를 경우
	$("div#opened_subjects").on("click","[id^=addCart]", function(e){
		
		console.log("담기");
		
		var id = e.currentTarget.id;
		
		// 과목코드
		//배열형태 cookie - 중복확인
	
		// 장바구니 담기
		var subCode = id.substring("addCart_".length, id.length);	
		
		// 기존 장바구니 현황 가져오기
		var legacyCart = $("#chosen_subjects").html();
		
		// 개설강의 한줄
		var subjectRow = "";
		// 교시 중복 플래그
		var doubleflag = 0; // 0이면 중복 안됨, 1 이상이면 중복 교시 존재
		
		// 과목별 세부 정보 가져오기: REST 방식
		$.ajax ({
 
             url : contextPath+'/course/courseRest/'+subCode,
             type : 'post',
             dataType:'text',
             
             success : function(data) {
               
                console.log("과목 정보 수신 성공");
                console.log("data:"+data);
                var subjectJSON = JSON.parse(data);
                
                console.log("강사명:"+subjectJSON.professor);
                               
                subjectRow = '<div id="subject_row_'+subCode+'" class="list_row">' +
						   	 		'<div class="list_column_l div_align_center">'+subCode+'</div>' +
									'<div class="list_column_l div_align_center">'+subjectJSON.subName+'</div>' +
									'<div class="list_column_l div_align_center">'+subjectJSON.professor+'</div>' +
									'<div class="list_column_l div_align_center">'+subjectJSON.daytime+'</div>' +
									'<div class="list_column_s div_align_center">'+subjectJSON.grade+'</div>' +
									'<div class="list_column_s div_align_center">'+subjectJSON.limitNum+'</div>' +
									'<div class="list_column_s div_align_center">&emsp;&nbsp;' +
										'<input id="cart_delete_btn_'+subCode+'" class="list_btn btn_blue" type="submit" value="빼기"></input>' +
									'</div>' +
							  '</div>';
							  
                console.log("#subjectRow:"+subjectRow);
                
            	//	console.log($("#chosen_subjects").html(legacyCart+subjectRow));
        		
        		// 신청과목 집계 변수(배열-과목코드): 예) cookie, 광역변수
        		
        		console.log("##subjectRow:"+subjectRow);
				
				// 요일 치환: 예) 수요일 -> wed
				console.log("요일:"+subjectJSON.daytime.substring(0, 1));
				var day = subjectJSON.daytime.substring(0, 1);
				var eng_day = "";
				
				switch (day) {
				  case '월': eng_day="mon"; break;
				  case '화': eng_day="tue"; break;
				  case '수': eng_day="wed"; break;
				  case '목': eng_day="thu"; break;
				  case '금': eng_day="fri"; break;
				}
				
				console.log("요일:"+eng_day);
				
				// 교시 추출
				var times = subjectJSON.daytime.substring(2, subjectJSON.daytime.length);
				console.log("교시:"+times);
				
				var times = times.split(",");
				console.log("교시 개수:"+times.length);
				for(var i=0; i<times.length; i++)
					console.log("교시:"+times[i]);
				
				// 교시 중복 검사
				// 셀 내용(공백) 여부 검사
				for(var i=0; i<times.length; i++){
					var color = $("div#prs_tbl table td#"+eng_day+"_t"+times[i]).css("backgroundColor");
					console.log("color:"+color);
					
					// 비었을 때
					if(color=='rgba(0, 0, 0, 0)'){
						console.log("공백");
					}
					else {
						// 교시 중복 있을 때
						console.log("교시 중복");
						doubleflag++;
						console.log("###doubleflag:"+doubleflag);
					}
					//console.log("셀 내용:"+$("div#prs_tbl table td#"+eng_day+"_t"+times[i]).text());
					console.log("셀 내용:"+$("div#prs_tbl table td#"+eng_day+"_t"+times[i]).css("backgroundColor"));
				}
				
				// 
				console.log("###doubleflag:"+doubleflag);
				
				if(doubleflag > 0) { // 중복일 때
					alert("중복 교시가 존재합니다.");
				} else { // 중복 아닐 때
					// 교시 추가
					
					// 동일 과목 추가 방지
	        		if(CHOSEN_SUBJECTS_ARR.length == 0){
	        			CHOSEN_SUBJECTS_ARR.push(subCode);	 
	        			$("#chosen_subjects").html(legacyCart+subjectRow);
	        		}
	        		else{
	        				var cnt=0;
	        				for(var i=0; i<CHOSEN_SUBJECTS_ARR.length; i++){
	        					if(CHOSEN_SUBJECTS_ARR[i]==subCode)
	        							cnt++;		
	        				}
	        			 
	        				if(cnt==0){
	        					CHOSEN_SUBJECTS_ARR.push(subCode);
	        					$("#chosen_subjects").html(legacyCart+subjectRow);
	        				}
	        				else
	        					alert("동일한 과목이 존재합니다");
	        			
	        		}
	        		// 동일 과목 추가 방지 끝
					// 시간표 추가: 과목별 대표 배경색 선정
					for(var i=0; i<times.length; i++){
						if(times.length>=3){
							var halftime = Math.round(times.length/2)-1;
							$("div#prs_tbl table td#"+eng_day+"_t"+times[halftime]).html(subjectJSON.subName);
						}
						else {
							$("div#prs_tbl table td#"+eng_day+"_t"+times[0]).html(subjectJSON.subName);
						}
						
						// var bgColor = "orange";
						var bgColor = matchColor(subCode);
						// 과목별 색상 선정
						
						/* if(subCode=='524860') {
							bgColor = "orange";
						}
						else if(subCode=='527850') {
							bgColor = "cyan";
						} */
						$("div#prs_tbl table td#"+eng_day+"_t"+times[i]).css("backgroundColor", bgColor);
					} // for 끝
					
					// 장바구니 세션 저장/갱신
					$.ajax ({
 
			             url : contextPath+'/course/storeCartSess/'+subCode,
			             type : 'post',
			             dataType:'text',
			             
			             success : function(data) {
			            	 
			            	 console.log("data:"+data); // 장바구니에 성공적으로 저장했습니다.
			            	 //alert(data);
			            	 //location.reload(); // 화면 갱신
			            	 
			             },
			             error : function(xhr, status) {
			                 
			                 console.log(xhr+" : "+status); // 에러 코드
			             }
			  
			        }); // 장바구니 세션 저장/갱신 끝
					
				} // 중복 아닐 때 끝
				
        		for(var i=0; i<CHOSEN_SUBJECTS_ARR.length; i++)
        			console.log("신청과목 집계 변수(배열-과목코드) :"+i+"="+CHOSEN_SUBJECTS_ARR[i]);    
            }, // success
             
             error : function(xhr, status) {
                 
                console.log(xhr+" : "+status); // 에러 코드
            }
 
     }); // $.ajax
     
	});// 담기 버튼 누를 경우 끝
	
	// 전체 선택 체크박스 이벤트 핸들러
    $("#searchAll").click(function(){
   	
   	 console.log("전체 선택");
   	 //if($("#searchAll").prop("checked")==true){
   		 $("#list_search_word").val(""); // 검색어 초기화
   		 
   		 // 요일 체크박스 초기화
   		 for(var i=0; i<$("[name=weekday]").length; i++){
   			 $("[name=weekday]").prop("checked", "");
   		 }
   	 //}
   	 
    });
	
	   // 장바구니에서 과목 빼기
	   $("#chosen_subjects").on("click","input[id^=cart_delete_btn]",function(e){
		   
		  	// alert("빼기");
			var id = e.currentTarget.id; 
			console.log("id:"+id);
			//과목코드
			var subCode = id.substring("cart_delete_btn_".length, id.length);
			
			// 과목별 세부 정보 가져오기: REST 방식
			$.ajax ({
	 
	             url : contextPath+'/course/courseRest/'+subCode,
	             type : 'post',
	             dataType:'text',
	             
	             success : function(data) {
	               
	                console.log("과목 정보 수신 성공");
	                console.log("data:"+data);
	                var subjectJSON = JSON.parse(data);
	                
	                console.log("강사명:"+subjectJSON.professor);
	                
	                // 시간표에서 빼기
	    				
	    			// 요일 치환: 예) 수요일 -> wed
	    			console.log("요일:"+subjectJSON.daytime.substring(0, 1));
	    			var day = subjectJSON.daytime.substring(0, 1);
	    			var eng_day = "";
	    			
	    			switch (day) {
	    				case '월': eng_day="mon"; break;
	    				case '화': eng_day="tue"; break;
	    				case '수': eng_day="wed"; break;
	    				case '목': eng_day="thu"; break;
	    				case '금': eng_day="fri"; break;
	    			}
	    			
	    			console.log("요일:"+eng_day);
	    			
	    			// 교시 추출
	    			var times = subjectJSON.daytime.substring(2, subjectJSON.daytime.length);
	    			console.log("교시:"+times);
	    			
	    			var times = times.split(",");
	    			console.log("교시 개수:"+times.length);
	    			
	    			for(var i=0; i<times.length; i++){
	    				console.log("교시:"+times[i]);
	    				$("div#prs_tbl table td#"+eng_day+"_t"+times[i]).css("backgroundColor","rgba(0, 0, 0, 0)");
	    				 console.log("셀 내용:"+$("div#prs_tbl table td#"+eng_day+"_t"+times[i]).css("backgroundColor"));
	    				 $("div#prs_tbl table td#"+eng_day+"_t"+times[i]).html(""); // 초기화
	    			}
	                
	             }, // success
	             
	             error : function(xhr, status) {
	                 
	                console.log(xhr+" : "+status); // 에러 코드
	            }
	 
		}); // $.ajax
	     
		// 장바구니 삭제
		$.ajax ({

			url : contextPath+'/course/modifyCartSess/'+subCode,
			type : 'post',
			dataType:'text',
			
			success : function(data) {
            	 
				console.log("data:"+data); // 장바구니에 성공적으로 저장했습니다.
				//location.reload(); // 화면 갱신
				alert(data);
			},
			error : function(xhr, status) {
                 
				console.log(xhr+" : "+status); // 에러 코드
			}
	  
		}); // 장바구니 세션 삭제 끝
			
			//신청과목 집계 변수(배열-과목코드)에서 해당 과목 코드 삭제
			//div#subject_row_과목코드  삭제
						  
			//if 
			CHOSEN_SUBJECTS_ARR.splice(CHOSEN_SUBJECTS_ARR.indexOf(subCode), 1);
			
			var subjectRow=[""];
			$("div#subject_row_"+subCode).html();
			console.log("과목 빼기:"+$("div#lecture div.list_body").html());
			 
			console.log("삭제");
			$("div#chosen_subjects div#subject_row_"+subCode).remove();
			 
			for(var i=0; i<CHOSEN_SUBJECTS_ARR.length; i++)
				console.log("신청과목 집계 변수(배열-과목코드) :"+i+"="+CHOSEN_SUBJECTS_ARR[i]);
			
	   }); // 장바구니에서 과목 빼기 끝
	   
	   // 검색
	   $("#search_btn").click(function(e){
		  
		  searchHandler();
		  
	   }); // 검색 끝
	   
	   // 검색어 필드 Enter키 이벤트 핸들러
	   $("#list_search_word").keydown(function(e){
		  console.log("키값:"+e.keyCode);
		  if(e.keyCode=='13'){
			  console.log("Enter");
			  searchHandler();
		  }
	   });
	
});
</script>

</head> 
<body>
	
	<!-- 상단바 시작 -->
	<%@ include file="header.jsp" %>
	<!-- 상단바 끝 -->
	
	<!-- 검색 구역 시작 -->
	<div id="search_wrap">
	
		<select id="prs_select_box" name="prs_select_box">
			<option>선택</option>
			<option value="sub_name">과목명</option>
			<option value="professor">강사명</option>
		</select>&nbsp;&nbsp;

		<input type="text" id="list_search_word" name="list_search_word"> &nbsp;&nbsp;
		
		
		<!-- <input type="checkbox" id="mon" name="mon" value="월" checked><label for="mon"></label>월
		<input type="checkbox" id="tue" name="tue" value="화"><label for="tue">화</label>
		<input type="checkbox" id="wed" name="wed" value="수"><label for="wed">수</label>
		<input type="checkbox" id="thu" name="thu" value="목"><label for="thu">목</label>
		<input type="checkbox" id="fri" name="fri" value="금"><label for="fri">금</label>&nbsp;&nbsp;&nbsp; -->
		
		<input type="checkbox" id="mon" name="weekday" value="월"><label for="mon">월</label>
		<input type="checkbox" id="tue" name="weekday" value="화"><label for="tue">화</label>
		<input type="checkbox" id="wed" name="weekday" value="수"><label for="wed">수</label>
		<input type="checkbox" id="thu" name="weekday" value="목"><label for="thu">목</label>
		<input type="checkbox" id="fri" name="weekday" value="금"><label for="fri">금</label>&nbsp;&nbsp;&nbsp;
		
		&nbsp;&nbsp;&nbsp;<input type="checkbox" id="searchAll" name="searchAll" value="전체 검색"><label for="searchAll"><b>전체 검색</b></label>&nbsp;
		
		<!--
		<input type="checkbox" id = "mon" name="mon" value="3">월
		<input type="checkbox" id = "tue" name="tue" value="3">화
		<input type="checkbox" id = "wed" name="wed" value="3">수
		<input type="checkbox" id = "thu" name="thu" value="3">목
		<input type="checkbox" id = "fri" name="fri" value="3">금&nbsp;&nbsp;
		-->
		<input type="button" id="search_btn" class="search_btn" value="검색">
		<%-- <span>
		장바구니 과목 수: ${sessionScope.CART_SESSION.size()},
		
		<c:forEach items="${sessionScope.CART_SESSION}" var="vo">
			${vo.subCode}<br>
		</c:forEach>
		</span> --%>
	</div>
	<!-- 검색 구역 끝 -->
	
	
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
			<div id="opened_subjects" class="list_body">
			
				<!-- 목록 게시글(한줄) 시작 -->
				<!--  -->    <!--장바구니에 담을 때 중복 검사 -->
				<c:forEach var="subject" items="${subjects}">
					<div class="list_row">
						<div class="list_column_l div_align_center">${subject.subCode}</div>
						<div id="subName" class="list_column_l div_align_center">${subject.subName}</div>
						<div id="professor" class="list_column_l div_align_center">${subject.professor}</div>
						<div id="daytime" class="list_column_l div_align_center">${subject.daytime}</div>
						<div id="grade" class="list_column_s div_align_center">${subject.grade}</div>
						<div id="limitNum" class="list_column_s div_align_center">${subject.limitNum}</div>
						<div class="list_column_s div_align_center">&emsp;&nbsp;
							<input id="addCart_${subject.subCode}" class="list_btn btn_blue" type="submit" value="담기"></input>
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
			<div id="chosen_subjects" class="list_body">
			
				<!-- 목록 게시글(한줄) 시작 -->

				<!-- 목록 게시글(한줄) 끝 -->
				
			</div>
			<!-- 목록 바디 끝 -->
			
		</div>
		<!-- 수강 구역 끝 -->
	</div>
	<!-- 목록 전체 구역 끝 -->
	
	
	<!-- 시간표 시작 -->
	<div id="prs_tbl" class="prs_tbl">
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
			
			<c:forEach begin="1" end="21" step="1" varStatus="st">
			<tr align="center"> 
				<td id="t${st.count}" class="time" bgcolor="#E7E3DE">${st.count}</td> 
				<td id="mon_t${st.count}"></td>
				<td id="tue_t${st.count}"></td>
				<td id="wed_t${st.count}"></td>
				<td id="thu_t${st.count}"></td>
				<td id="fri_t${st.count}"></td>
			</tr>
			</c:forEach>
			
		</table> 
	</div>
	<!-- 시간표 끝 -->
	</body> 
</html>