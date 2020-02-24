package edu.hogwarts.hogwartsreg;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.hogwarts.hogwartsreg.service.LoginService;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/root-context.xml"
      })
@WebAppConfiguration
@Slf4j
public class ServiceTest {
	
	@Autowired
	private LoginService loginService;
	private int stu_id = 0;
	private String password = "";
	
	@Before
	public void setUp() throws Exception {
		stu_id = 20191001;
		//studentVO.setStu_id(20190000);
		//studentVO.setPassword("123456");
		password = "123456";
	}

	@Test
	public void test() {
		log.info("ServiceTest");
		//assertTrue("회원입니다", studentDAO.isStudent(20191000));
		//assertEquals("비밀번호가 일치하지 않습니다", loginService.checkLogin(stu_id, password));
		assertEquals("올바른 정보입니다", loginService.checkLogin(stu_id, password));
	}

}
