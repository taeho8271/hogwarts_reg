package edu.hogwarts.hogwartsreg;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.hogwarts.hogwartsreg.vo.SearchVO2;
import edu.hogwarts.hogwartsreg.vo.SubjectVO;
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
public class SubjectMapperTest2 {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	SubjectVO subjectVO;
	SearchVO2 searchVO2;
	List<SubjectVO> subjects;
	List<String> days;
	
	@Before
	public void setUp() throws Exception {
		searchVO2 = new SearchVO2();
		//searchVO2.setPrsSelectBox("sub_name");
		//searchVO2.setListSearchWord("비행술");
		searchVO2.setPrsSelectBox("professor");
		searchVO2.setListSearchWord("후치 부인");
		days = new ArrayList<>();
		//days.add("월");
		//days.add("화");
		//days.add("수");
		//days.add("목");
		//days.add("금");
		//searchVO2.setDays(days);
	}

	@Test
	public void test2() {
		log.info("MapperTest2");
		
		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("prsSelectBox", "professor");
		//map.put("listSearchWord", "후치 부인");
		map.put("prsSelectBox", "sub_name");
		map.put("listSearchWord", "마법");
		map.put("days", days == null ? "" : days);
		log.info("days:"+map.get("days"));
		log.info("listSearchWord:"+map.get("listSearchWord"));
		
		subjects = sqlSession.selectList("subject.searchSubjects", map);
		
		assertEquals(2, subjects.size());
		assertEquals(418520, subjects.get(1).getSubCode());
	}

}
