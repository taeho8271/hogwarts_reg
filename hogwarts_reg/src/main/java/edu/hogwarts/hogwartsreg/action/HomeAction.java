package edu.hogwarts.hogwartsreg.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author Hogwarts
 *
 */
@Controller
@Slf4j
public class HomeAction {
	
	@RequestMapping("/")
	public String home() {
		log.info("home");
		//return "home";
		return "redirect:/accessinfo/login.do";
	}

}
