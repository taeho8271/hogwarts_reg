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
public class SearchPwAction {
	
	@Autowired
	private AccessInfoService accessInfoService;
	
	@RequestMapping("searchPw.do")
	public String searchPw() {
		log.info("/accessinfo/searchPw.do"); 
		return "search_pw";
	}
	
	@RequestMapping("SearchPwProc.do")
	public String SearchPwProc(@RequestParam("spwId") int spwId, @RequestParam("spwName") String spwName,  
			@RequestParam("spwMail") String spwMail, @RequestParam("sbMsv") String sbMsv,
			Model model) {
		log.info("/accessinfo/SearchPwProc.do"); 
		
		String msg = "";
		String email = spwMail+"@"+sbMsv;
		
		// DB 메서드 -> 인증 처리
		msg = accessInfoService.getStudentPwByStudentInfo(spwId, spwName, email);
		// 오류 메시징(아이디, 비번)
		model.addAttribute("msg", msg);
		// 인쇄: 전달 -> jsp
		return "search_pw"; // 오류 페이지 있으면 오류 페이지로 연결시키면 됨
	}
}
