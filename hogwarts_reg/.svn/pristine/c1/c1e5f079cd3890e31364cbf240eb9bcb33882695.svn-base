package edu.hogwarts.hogwartsreg;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.hogwarts.hogwartsreg.vo.StudentVO;
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
public class MapperTest {
	
	@Autowired
	private SqlSession sqlSession;
	StudentVO studentVO = null;
	
	@Before
	public void setUp() throws Exception {
		studentVO = new StudentVO();
		studentVO.setStuId(20191001);
		//studentVO.setStuId(20190000);
		//studentVO.setPassword("123456");
		studentVO.setPassword("0000000");
	}

	/*
	 * @Test public void test() { log.info("MapperTest");
	 * assertNotNull("정보가 존재합니다.",sqlSession.selectOne("student.checkLogin",
	 * studentVO)); }
	 */
	
	@Test
	public void test2() {
		log.info("MapperTest2");
		StudentVO studentResultVO =  
				sqlSession.selectOne("student.checkLogin",studentVO);
		assertEquals(20191001, studentResultVO.getStuId()); 
	}

}
