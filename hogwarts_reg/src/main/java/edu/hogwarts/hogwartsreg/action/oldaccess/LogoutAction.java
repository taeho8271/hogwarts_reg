/*
 * package edu.hogwarts.hogwartsreg.action.oldaccess;
 * 
 * import javax.servlet.http.HttpSession;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam;
 * 
 * import lombok.extern.slf4j.Slf4j;
 * 
 *//**
	 * Logout
	 * 
	 * @author Hogwarts
	 *
	 *//*
		 * @Controller
		 * 
		 * @Slf4j
		 * 
		 * @RequestMapping("/access") public class LogoutAction {
		 * 
		 * //@Autowired //private LogoutService logoutService;
		 * 
		 * @RequestMapping("logout.do") public String logout(HttpSession session, Model
		 * model) { log.info("/access/logout.do");  String msg = "";
		 * 
		 * // 세션 종료 if(session.getAttribute("LOGIN_SESS")!=null) { session.invalidate();
		 * // 모든 세션 소멸 model.addAttribute("msg","로그아웃되었습니다."); }
		 * 
		 * // return "login"; // 오류 페이지 있으면 오류 페이지로 연결시키면 됨 } }
		 */