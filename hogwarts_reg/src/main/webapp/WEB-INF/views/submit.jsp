<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>수강신청</title>

<!-- contextPath -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/js/prefixfree.min.js"></script>

<!-- CSS 외장화 -->
<link rel="stylesheet" href="${contextPath}/css/submit.css">
<link rel="stylesheet" href="${contextPath}/css/nanumgothic.css">

<!-- jQuery -->
<script src="${contextPath}/jquery/3.4.1/jquery.min.js"></script>

<script>
//시간표 과목별 색상 선정
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

// 과목코드별 등록인원 조회
function getRegNumBySubCode(subCode){
	
	console.log("###getRegNumBySubCode:");
	var returnRegNum = "";
	var contextPath = "/hogwarts_reg";
	

	 $.ajax ({
		 
         url : contextPath+'/course/lectureRest/'+subCode,
         type : 'post',
         dataType:'text',
         contentType : "application/json",
         async: false,
         
         success : function(data) {
        	console.log("@@@data:"+data);
        	var json = JSON.parse(data);
        	returnRegNum = json[0];
         },
         
         error : function(xhr, status) {
             console.log(xhr+" : "+status); // 에러 코드
         }
 	 });
	 
	 console.log("$$returnRegNum:"+returnRegNum);
 	 return returnRegNum;
}

// jQuery 시작
$(function(){
	
	// contextPath
	var contextPath = "/hogwarts_reg";
	
	// 수강신청 과목 빼기(장바구니)
	 $("#opened_subjects").on("click","input[id^=cart_delete_btn]",function(e){
		 	
		 	alert("취소");
		  	
			var id = e.currentTarget.id; 
			console.log("id:"+id);
			//과목코드
			var subCode = id.substring("cart_delete_btn_".length, id.length);
			//alert("빼기(과목)"+subCode);
			
			// 과목별 세부 정보 가져오기: REST 방식
			$.ajax ({
	 
	             url : contextPath+'/course/lectureRest/'+subCode,
	             type : 'post',
	             dataType:'text',
	             
	             success : function(data) {
	               
	                console.log("과목 정보 수신 성공");
	                console.log("data:"+data);
	                var json = JSON.parse(data);
	                var subjectJSON = json[1];
	               
	                console.log("#########subjectJSON:"+subjectJSON);	
	                
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
	    			
	    			//시간표 삭제
	    			//$("#opened_subjects #prs_tbl ")
	                
	             }, // success
	             
	             error : function(xhr, status) {
	                 
	                console.log(xhr+" : "+status); // 에러 코드
	            }
	 
		}); // $.ajax
	     
		// 장바구니 세션 삭제
		$.ajax ({

			url : contextPath+'/course/modifySubmitSess/'+subCode,
			type : 'post',
			dataType:'text',
			
			success : function(data) {
           	 
				console.log("data:"+data); // 장바구니에 성공적으로 저장했습니다.
				//location.reload(); // 화면 갱신
				//alert(data);
				//if 
				CHOSEN_SUBJECTS_ARR.splice(CHOSEN_SUBJECTS_ARR.indexOf(subCode), 1);
				
				var subjectRow=[""];
				$("div#subject_row_"+subCode).html();
				console.log("과목 빼기:"+$("div#lecture div.list_body").html());
				 
				console.log("삭제");
				$("div#opened_subjects div#subject_row_"+subCode).remove();
				 
				for(var i=0; i<CHOSEN_SUBJECTS_ARR.length; i++)
					console.log("신청과목 집계 변수(배열-과목코드) :"+i+"="+CHOSEN_SUBJECTS_ARR[i]);
				
			},
			error : function(xhr, status) {
                
				console.log(xhr+" : "+status); // 에러 코드
			}
	  
		}); // 장바구니 세션 삭제 끝
			
	  }); // 수강신청 과목 빼기 끝(장바구니)
	
	// 수강신청 과목 빼기(수강완료 목록 적용)
	 $("#opened_subjects").on("click","input[id^=submit_delete_btn]",function(e){
		 	
		 	//alert("취소");
		  	
			var id = e.currentTarget.id; 
			console.log("id:"+id);
			// 과목코드
			var subCode = id.substring("submit_delete_btn_".length, id.length);
			
			// 과목별 세부 정보 가져오기: REST 방식
			$.ajax ({
	 
	             url : contextPath+'/course/lectureRest/'+subCode,
	             type : 'post',
	             dataType:'text',
	             
	             success : function(data) {
	               
	                console.log("과목 정보 수신 성공");
	                console.log("data:"+data);
	                var json = JSON.parse(data);
	                var subjectJSON = json[1];
	               
	                console.log("#########subjectJSON:"+subjectJSON);	
	                
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
	     
		// 수강완료목록 세션 삭제
		$.ajax ({

			url : contextPath+'/course/modifySubmitSess/'+subCode,
			type : 'post',
			dataType:'text',
			
			success : function(data) {
           	 
				console.log("data:"+data); // 장바구니에 성공적으로 저장했습니다.
				//if 
				CHOSEN_SUBJECTS_ARR.splice(CHOSEN_SUBJECTS_ARR.indexOf(subCode), 1);
				
				var subjectRow=[""];
				$("div#submit_subject_row_"+subCode).html();
				console.log("과목 빼기:"+$("div#lecture div.list_body").html());
				 
				console.log("삭제");
				$("div#opened_subjects div#submit_subject_row_"+subCode).remove();
				 
				for(var i=0; i<CHOSEN_SUBJECTS_ARR.length; i++)
					console.log("신청과목 집계 변수(배열-과목코드) :"+i+"="+CHOSEN_SUBJECTS_ARR[i]);
				
			},
			error : function(xhr, status) {
                
				console.log(xhr+" : "+status); // 에러 코드
			}
	  
		}); // 수강완료목록 세션 삭제 끝
			
	  }); // 수강신청 과목 빼기 끝(수강완료 목록)
	  
	  ///////////////////////////////////////////////////////////////////////////////////////////
	
	// 기 수강신청 과목 출력 시작
	$.ajax ({
 
             url : contextPath+'/course/submitInitFromTable.do',
             type : 'post',
             dataType:'text',
             
             success : function(data) {
            	console.log("기 수강신청 과목 설정");
            	console.log(data);
            	// 테이블 상태 점검
            	// 1. 테이블(미수강 신청 상태) -> 세션 있을 경우 출력
            	// 2. 테이블(수강 신청 상태) -> 테이블 현황 출력
            	if(data == "[]") { //
            		
            		// 세션 존재하면 세션 출력
            		// session 장바구니 출력 시작
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
			            		 var inputSubCode = 0; // 과목코드
			            		 
			            		 if(sess == ""){
			            			 subjectRow = "";
			            		 } else {
			            			 
			            			 for(var i=0; i<sess.length; i++){ // 시간표 세션 과목들 출력
			            				 
			            				 //console.log("sess[i]:"+sess[i].);
			            				 inputSubCode = sess[i].subCode;
			            				 console.log("###--inputSubCode:"+inputSubCode);
			            			 
			            			 	 //////////////////////////////
			            			 	 // 각 과목별 신청현황 조회 시작
			            			 	 // 등록인원 출력 ex) 등록인원/제한인원
			            			 	 var regNum = getRegNumBySubCode(inputSubCode);
			            			 	 var regLimitNum = regNum+'/'+sess[i].limitNum; // 등록인원/제한인원
			            			 	 
			            			 	 console.log("등록인원:"+regNum);
			            			 	 console.log("regLimitNum:"+regLimitNum);
			            			 	 
			            			 	 // 각 과목별 신청현황 조회 끝
			            				 
					            		 // 장바구니 초기화(세션 정보 반영)
					            		 // 주의사항: 신청/제한인원 
					            		 subjectRow = '<div id="subject_row_'+sess[i].subCode+'" class="list_row">' +
												   	 		'<div class="list_column_l div_align_center">'+sess[i].subCode+'</div>' +
															'<div class="list_column_l div_align_center">'+sess[i].subName+'</div>' +
															'<div class="list_column_l div_align_center">'+sess[i].professor+'</div>' +
															'<div class="list_column_l div_align_center">'+sess[i].daytime+'</div>' +
															'<div class="list_column_s div_align_center">'+sess[i].grade+'</div>' +
															'<div id="regNum_'+sess[i].subCode+'" class="list_column_s div_align_center">'+regLimitNum+'</div>' +
															'<div class="list_column_s div_align_center">&emsp;&nbsp;' +
																'<input id="cart_submit_btn_'+sess[i].subCode+'" class="list_btn btn_blue" type="button" value="신청" />' +
															'</div>' +
													  '</div>';
													  
										if(i==0){
											$("#cart_subjects").html(subjectRow);
										} else {
											$("#cart_subjects").append(subjectRow);
										}
										 
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
				// session 장바구니 출력 끝
            		
            		
            	} else { // 
            		// 수강 테이블 등록 상태 출력
            		var json = JSON.parse(data);
                	var subjectRow = "";
                	
                	for(var i=0; i<json.length; i++){
                		
                		subjectRow += '<div id="submit_subject_row_'+json[i].subCode+'" class="list_row">' +
    							   	 		'<div class="list_column_l div_align_center">'+json[i].subCode+'</div>' +
    										'<div class="list_column_l div_align_center">'+json[i].subName+'</div>' +
    										'<div class="list_column_l div_align_center">'+json[i].professor+'</div>' +
    										'<div class="list_column_l div_align_center">'+json[i].daytime+'</div>' +
    										'<div class="list_column_s div_align_center">'+json[i].grade+'</div>' +
    										'<div class="list_column_s div_align_center">'+json[i].regNum+'/'+json[i].limitNum+'</div>' +
    										'<div class="list_column_s div_align_center">&emsp;&nbsp;' +
    											'<input id="submit_delete_btn_'+json[i].subCode+'" class="list_btn btn_blue" type="button" value="취소" />' +
    										'</div>' +
    								 '</div>';
                	}
                	
    				$("#opened_subjects").html(subjectRow);
            	} // 테이블 상태 점검 끝
            	
             }, // success
             error : function(xhr, status) {
                 
                console.log(xhr+" : "+status); // 에러 코드
            }
 
    }); // $.ajax
	// 기 수강신청 과목 출력 끝
	
	//신청과목 집계 변수(배열-과목코드) : 쿠키화(광역화) - 페이지 전환시에도 상태 유지
	var CHOSEN_SUBJECTS_ARR = [];
	
	// 수강신청 버튼 클릭 핸들러
	$("div#cart_subjects").on("click", "input[id^=cart_submit_btn_]", function(e){
		
		var id = e.currentTarget.id;
		var subCode = id.substring("cart_submit_btn_".length, id.length);
		console.log(subCode);
		//alert("신청:"+subCode);
		
		var subjectRow = "";
		var regNum = ""; //신청결과 인원
		
		$.ajax ({
			 
            url : contextPath+'/course/submit_lec.do',
            type : 'post',
            dataType:'text',
            data: {
            	subCode: subCode
            },
            
            success : function(data) {
            	console.log("######## 빼기 data : "+data);
        		
            	var json = JSON.parse(data);
            	alert(json[1].msg);  //메시지 출력
            	regNum = json[1].regNum;
            	console.log("msg : "+json[1].msg);
            	console.log("regNum : "+ json[1].regNum);
            	console.log("limitNum : "+ json[0].limitNum);
            	console.log("subCode : "+subCode);
            	
            	var str=json[1].regNum+"/"+json[0].limitNum;
            	console.log("str : "+str);
            	//변화상태 반영
            	$("#cart_subjects div#regNum_"+subCode).text(str);
            	
            	if(json[0].regNum==json[0].limitNum)
            		alert("등록인원이 가득 찼습니다");
            	else{
            		
            		 subjectRow = '<div id="submit_subject_row_'+subCode+'" class="list_row">' +
					   		   	 		'<div class="list_column_l div_align_center">'+subCode+'</div>' +
					   					'<div class="list_column_l div_align_center">'+json[0].subName+'</div>' +
					   					'<div class="list_column_l div_align_center">'+json[0].professor+'</div>' +
					   					'<div class="list_column_l div_align_center">'+json[0].daytime+'</div>' +
					   					'<div class="list_column_s div_align_center">'+json[0].grade+'</div>' +
					   					'<div class="list_column_s div_align_center">'+regNum+'/'+json[0].limitNum+'</div>' +
					   					'<div class="list_column_s div_align_center">&emsp;&nbsp;' +
					   						'<input id="submit_delete_btn_'+subCode+'" class="list_btn btn_blue" type="button" value="취소" />' +
					   					'</div>' +
				  	 			  '</div>';
  	 			  
            		
            		// 요일 치환: 예) 수요일 -> wed
     				console.log("요일:"+json[0].daytime.substring(0, 1));
     				var day = json[0].daytime.substring(0, 1);
     				var eng_day = "";
     				
     				switch (day) {
     				  case '월': eng_day="mon"; break;
     				  case '화': eng_day="tue"; break;
     				  case '수': eng_day="wed"; break;
     				  case '목': eng_day="thu"; break;
     				  case '금': eng_day="fri"; break;
     				}
     				
     			// 교시 추출
    				var times = json[0].daytime.substring(2, json[0].daytime.length);
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
    				}
    				
    				// 동일 과목 점검 메시지
    				var same_subjects_msg = "";
    				
    				// 동일 과목 추가 방지
    	        	if(CHOSEN_SUBJECTS_ARR.length == 0){
    	        		CHOSEN_SUBJECTS_ARR.push(subCode);
    	        		console.log("#############subRow1 : "+subjectRow );
    	        		$("#opend_subjects").html(subjectRow);
    	        	}
    	        	else{
    	        			var cnt=0;
    	        			for(var i=0; i<CHOSEN_SUBJECTS_ARR.length; i++){
    	        				if(CHOSEN_SUBJECTS_ARR[i]==subCode)
    	        						cnt++;		
    	        			}
    	        			 
    	        			if(cnt==0){
    	        				CHOSEN_SUBJECTS_ARR.push(subCode);
    	        			//	$("#opend_subjects").html(subjectRow);
    	        			
    	        			}
    	        			else {
    	        				
    	        				//alert("동일한 과목이 존재합니다");
    	        				same_subjects_msg = "동일한 과목이 존재합니다";
    	        			}
    	        				
    	        	}
    	        	// 동일 과목 추가 방지 끝
     				
    	        	// 시간표 추가: 과목별 대표 배경색 선정
    				for(var i=0; i<times.length; i++){
    					if(times.length>=3){
    						var halftime = Math.round(times.length/2)-1;
    						$("div#prs_tbl table td#"+eng_day+"_t"+times[halftime]).html(json[0].subName);
    					}
    					else {
    						$("div#prs_tbl table td#"+eng_day+"_t"+times[0]).html(json[0].subName);
    					}
    						
    					// var bgColor = "orange";
    					var bgColor = matchColor(subCode);
    					// 과목별 색상 선정
    						
    					$("div#prs_tbl table td#"+eng_day+"_t"+times[i]).css("backgroundColor", bgColor);
    				} // for 끝

    				// 장바구니 세션 저장/갱신
    				$.ajax ({
     
    			            url : contextPath+'/course/storeSubmitSess/'+subCode,
    			            type : 'post',
    			            dataType:'text',
    			             
    			            success : function(data) {
    			            	 
    			           	 	console.log("data:"+data); // 장바구니에 성공적으로 저장했습니다.
    			            	 
    			            },
    			            error : function(xhr, status) {
    			                 
    			                 console.log(xhr+" : "+status); // 에러 코드
    			             }
    			  
    			     }); // 장바구니 세션 저장/갱신 끝
    			     
     	 			console.log("#############subRow2 : "+subjectRow );
    				if(json[1].msg == "수강과목이 이미 존재합니다"){
    					
    					// 수강신청완료 목록에 기존 과목 존재여부 점검
    					//alert("기존 과목 개수:"+$("#opened_subjects [id^=subject_row_]").length);
    					var openedSubjectsLen = $("#opened_subjects [id^=subject_row_]").length;
    					
    					if(openedSubjectsLen == 0)
							$("#opened_subjects").html(subjectRow);
    					else {
    						// 동일과목 존재 시 추가 방지
    						if(same_subjects_msg != "동일한 과목이 존재합니다"){
    							$("#opened_subjects").append(subjectRow);	
    						}
    						else{
    							alert(same_subjects_msg);
    						}
    						
    					} //
    				} else{
    					
    					$("#opened_subjects").append(subjectRow);	
    				} //
					   	
	        	} //
		     },// success 끝
		        
		     error : function(xhr, status) {
		            
		           console.log(xhr+" : "+status); // 에러 코드
		     }
				
			}); // 수강신청 버튼 클릭 핸들러 끝
	
		//
	
}); // function 끝

	
}); // jQuery 끝
</script>

</head>
<body>
	
	<!-- 상단바 시작 -->
	<%@ include file="header.jsp" %>
	<!-- 상단바 끝 -->

	<!-- 목록 전체 구역 시작 -->
	<div id="list_wrap">
	
		<!-- 담겨진 강의(신청가능) 구역 시작 -->
		<div id="subject_wrap">
		
			<!-- 목록 헤더 시작 -->
			<div class="list_header">
				<div class="list_column_l div_align_center">과목코드</div>
				<div class="list_column_l div_align_center">과목명</div>
				<div class="list_column_l div_align_center">강사명</div>
				<div class="list_column_l div_align_center">요일/시간</div>
				<div class="list_column_s div_align_center">학점</div>
				<div class="list_column_s div_align_center">제한인원</div>
				<div class="list_column_s div_align_center">&emsp;&nbsp;신청</div>
			</div>
			<!-- 목록 헤더 끝 -->
			
			<!-- 목록 바디 시작 -->
			<div id="cart_subjects" class="list_body">
			
				<!-- 목록 게시글(한줄) 시작 -->
				
				<!-- 목록 게시글(한줄) 끝 -->				

			</div>			
			<!-- 목록 바디 끝 -->
			
		</div>
		<!-- 담겨진 강의(신청가능) 구역 끝 -->
		
	   	<%-- <div>
	   	submit session: ${sessionScope.SUBMIT_SESSION}<br>
		cart session: ${sessionScope.CART_SESSION}
	   	</div> --%>
	   	
		<!-- 신청완료 강의(취소가능) 구역 시작 -->
		<div id="lecture_wrap">		
			<!-- 목록 헤더 시작 -->
			<div class="list_header">				
				<div class="list_column_l div_align_center">과목코드</div>
				<div class="list_column_l div_align_center">과목명</div>
				<div class="list_column_l div_align_center">강사명</div>
				<div class="list_column_l div_align_center">요일/시간</div>
				<div class="list_column_s div_align_center">학점</div>
				<div class="list_column_s div_align_center">제한인원</div>
				<div class="list_column_s div_align_center">&emsp;&nbsp;취소</div>				
			</div>
			<!-- 목록 헤더 끝 -->
			
			<!-- 목록 바디 시작 -->
			<div id ="opened_subjects" class="list_body">			
			
			</div>
			<!-- 목록 바디 끝 -->		
				
		</div>
		<!-- 신청완료 강의(취소가능) 구역 끝 -->
	</div>
	<!-- 목록 전체 구역 끝 -->
	
	<!-- 시간표 구역 시작 -->
	
		<!-- 시간표 시작 -->
		<div id="prs_tbl"  class="prs_tbl">		
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
    