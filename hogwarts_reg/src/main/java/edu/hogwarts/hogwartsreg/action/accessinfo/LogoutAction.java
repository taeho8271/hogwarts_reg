package edu.hogwarts.hogwartsreg.action.accessinfo;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * Logout
 * @author Hogwarts
 *
 */
@Controller
@Slf4j
@RequestMapping("/accessinfo")
public class LogoutAction {
	
	//@Autowired
	//private LogoutService logoutService;
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session, Model model) {
		log.info("/accessinfo/logout.do"); 
		
		// 세션 종료
		if(session.getAttribute("LOGIN_SESS")!=null) {
			session.invalidate(); // 모든 세션 소멸
			model.addAttribute("msg","로그아웃되었습니다.");
		}
		
		// 
		return "login"; // 오류 페이지 있으면 오류 페이지로 연결시키면 됨
	}
}