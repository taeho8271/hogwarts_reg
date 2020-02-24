package edu.hogwarts.hogwartsreg;

import static org.junit.Assert.*;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.hogwarts.hogwartsreg.service.CourseService;
import lombok.extern.slf4j.Slf4j;

import org.junit.Before;
import org.junit.Test;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/root-context.xml"
      })
@WebAppConfiguration
@Slf4j
public class CourseMapperTest {
	
	@Autowired
	private CourseService courseService;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test2() {
		log.info("수강신청 점검");
		
		//assertEquals(25, sqlSession.selectOne("cart.getAllRegNumBySubCode", 524840));
		//assertEquals(25, sqlSession.selectOne("cart.getAllRegNumBySubCode", 524860));
		//assertEquals(25, courseService.getAllRegNumBySubCode(524840));
		assertEquals(25, courseService.getAllRegNumBySubCode(524860));
	}

}
