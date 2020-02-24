/*
 * package edu.hogwarts.hogwartsreg.action.oldinfo;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam;
 * 
 * import edu.hogwarts.hogwartsreg.action.oldinfo.ChangePwAction; import
 * lombok.extern.slf4j.Slf4j;
 * 
 *//**
	 * Change password
	 * 
	 * @author Hogwarts
	 *
	 *//*
		 * 
		 * @Controller
		 * 
		 * @Slf4j
		 * 
		 * @RequestMapping("/info") public class ChangePwAction {
		 * 
		 * //@Autowired //private AuthService changePwService;
		 * 
		 * @RequestMapping("update.do") public String update() {
		 * log.info("/info/update.do"); return "change_pw"; }
		 * 
		 * 
		 * @RequestMapping("updateProc.do") public String
		 * updateProc(@RequestParam("cpw_id") String cpw_id,
		 * 
		 * @RequestParam("cpw_name") String cpw_name,
		 * 
		 * @RequestParam("cpw_pw") String cpw_pw,
		 * 
		 * @RequestParam("cpw_npw") String cpw_npw,
		 * 
		 * @RequestParam("cpw_cf") String cpw_cf) { log.info("/info/updateProc.do"); //
		 * 경로 정하기 String msg = "";
		 * 
		 * // 인자 처리 우선: 인쇄, 유효성 점검 log.info("cpw_id:"+cpw_id);
		 * log.info("cpw_name:"+cpw_name); log.info("cpw_pw:"+cpw_pw);
		 * log.info("cpw_npw:"+cpw_npw); log.info("cpw_cf:"+cpw_cf);
		 * 
		 * // DB 메서드 -> 인증 처리 //msg = loginService.checkLogin(id, pw); // 오류 메시징(이이디,
		 * 비번)
		 * 
		 * // 인쇄: 전달 -> jsp
		 * 
		 * // 오류 패치(기능) return "change_pw"; // 오류 페이지 있으면 오류 페이지로 연결시키면 됨 } }
		 */