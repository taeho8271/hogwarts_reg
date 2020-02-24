package edu.hogwarts.hogwartsreg;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.hogwarts.hogwartsreg.vo.SubjectVO;
import edu.hogwarts.hogwartsreg.vo.SubjectVO2;
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
public class GetSubjectMapperTest {
	
	@Autowired
	private SqlSession sqlSession;
	//@Autowired
	//private SubjectDAO dao;
	
	SubjectVO2 subjectVO2 = null;
	SubjectVO subjectVO = null;
	
	private String subName;
	private String daytime;
	
	@Before
	public void setUp() throws Exception {
		subjectVO2 = new SubjectVO2();
		subName="비행술";
		daytime="수 15,16,17";
	}

	@Test
	public void test2() {
		log.info("GetSubjectMapperTest");
		
		subjectVO2.setSubName(subName);
		subjectVO2.setDaytime(daytime);
		subjectVO2.setDay(daytime.charAt(0)+"");
		
		subjectVO = sqlSession.selectOne("subject.getSubject", subjectVO2);
		
		//assertEquals(524840, subjectVO.getSubCode());
		
		assertEquals("후치 부인", subjectVO.getProfessor());
	}

}
