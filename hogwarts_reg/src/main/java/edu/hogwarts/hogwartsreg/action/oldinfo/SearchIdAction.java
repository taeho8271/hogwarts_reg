/*
 * package edu.hogwarts.hogwartsreg.action.oldinfo;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam;
 * 
 * import edu.hogwarts.hogwartsreg.action.oldinfo.SearchIdAction; import
 * lombok.extern.slf4j.Slf4j;
 * 
 *//**
	 * Search ID
	 * 
	 * @author Hogwarts
	 *
	 *//*
		 * 
		 * @Controller
		 * 
		 * @Slf4j
		 * 
		 * @RequestMapping("/info") public class SearchIdAction {
		 * 
		 * @RequestMapping("searchId.do") public String searchId() {
		 * log.info("/info/searchId.do"); return "search_id"; }
		 * 
		 * 
		 * @RequestMapping("SearchIdProc.do") public String
		 * SearchIdProc(@RequestParam("name") String name, @RequestParam("birth") String
		 * birth,
		 * 
		 * @RequestParam("email") String email) { log.info("/info/SearchIdProc.do"); //
		 * 경로 정하기
		 * 
		 * // 인자 처리 우선: 인쇄, 유효성 점검 log.info("name:"+name); log.info("birth:"+birth);
		 * log.info("email:"+email);
		 * 
		 * // DB 메서드 -> 인증 처리
		 * 
		 * // 오류 메시징(이이디, 비번)
		 * 
		 * // 인쇄: 전달 -> jsp
		 * 
		 * // 오류 패치(기능) return "search_id"; // 오류 페이지 있으면 오류 페이지로 연결시키면 됨 } }
		 * 
		 * 
		 * 
		 * 
		 */