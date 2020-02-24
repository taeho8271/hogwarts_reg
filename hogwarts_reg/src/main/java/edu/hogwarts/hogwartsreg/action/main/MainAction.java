package edu.hogwarts.hogwartsreg.action.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * main
 * @author Hogwarts
 *
 */
@Controller
@Slf4j
@RequestMapping("/main")
public class MainAction {
	
	@RequestMapping("main.do")
	public String main() {
		log.info("/main/main.do");
		return "main";
	}
	
	@RequestMapping("location.do")
	public String location() {
		log.info("/main/location.do");
		return "location";
	}

	
}