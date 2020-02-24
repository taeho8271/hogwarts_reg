package edu.hogwarts.hogwartsreg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hogwarts.hogwartsreg.vo.MyLecVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public final class MyLecDAOImpl implements MyLecDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MyLecVO> getMyLec (int stuId, int subCode) {
		log.info("MyLecDAOImpl.getMyLec");
	
		MyLecVO mylecVO=new MyLecVO();
		mylecVO.setStuId(stuId);
		mylecVO.setSubCode(subCode);
		return sqlSession.selectList("MyLecDAOImpl.getMyLec");
	}
}
