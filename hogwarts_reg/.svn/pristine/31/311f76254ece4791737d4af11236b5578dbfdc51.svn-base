package edu.hogwarts.hogwartsreg.action.accessinfo;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.hogwarts.hogwartsreg.service.AccessInfoService;
import lombok.extern.slf4j.Slf4j;

/**
 * Search ID
 * @author Hogwarts
 *
 */

@Controller
@Slf4j
@RequestMapping("/accessinfo")
public class SearchIdAction {
	
	@Autowired
	private AccessInfoService accessInfoService;

	@RequestMapping("searchId.do")
	public String searchId() {
		log.info("/accessinfo/searchId.do"); 
		return "search_id";
	}
	
	
	@RequestMapping("SearchIdProc.do")
	public String SearchIdProc(@RequestParam("sidName") String sidName, @RequestParam("sidBirth") String sidBirth, 
			@RequestParam("sidMail") String sidMail, @RequestParam("sbMsv") String sbMsv,
			Model model) {
		
		log.info("/accessinfo/SearchIdProc.do"); 
		
		// 인자 처리 우선: 인쇄, 유효성 점검
		log.info("name:"+sidName);
		log.info("birth:"+sidBirth);
		log.info("email:"+sidMail+"@"+sbMsv);
		
		String msg = "";
		String email = sidMail+"@"+sbMsv;
		
		// DB 메서드 -> 인증 처리
		msg = accessInfoService.getStudentIdByStudentInfo(sidName, sidBirth, email);
		// 오류 메시징(아이디, 비번)
		model.addAttribute("msg", msg);
		// 인쇄: 전달 -> jsp
		
		return "search_id"; // 오류 페이지 있으면 오류 페이지로 연결시키면 됨
	}
}




