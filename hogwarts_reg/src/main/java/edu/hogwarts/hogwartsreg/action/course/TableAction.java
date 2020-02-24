package edu.hogwarts.hogwartsreg.action.course;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.hogwarts.hogwartsreg.action.course.TableAction;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequestMapping("/course")
public class TableAction {

	@RequestMapping("table.do")
	public String table() {
		log.info("/course/table.do");
		return "table";
	}
	
	/*
	 * @RequestMapping("tableInit.do") public String tableInit() {
	 * log.info("/course/tableInit.do");
	 * 
	 * }
	 */
	
	
}

