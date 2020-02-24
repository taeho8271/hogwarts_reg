package edu.hogwarts.hogwartsreg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hogwarts.hogwartsreg.vo.CartVO;
import edu.hogwarts.hogwartsreg.vo.CartViewVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public final class CartDAOImpl implements CartDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CartVO> getAllSubjects(){
		log.info("CartDAOImpl.getAllSubject");
		return sqlSession.selectList("cart.getAllSubjects");
	}

	@Override
	public void addSubject(int subCode, int stuId){
		log.info("CartDAOImpl.addSubject");
		
		CartViewVO cartViewVO=new CartViewVO();
		cartViewVO.setStuId(stuId);
		cartViewVO.setSubCode(subCode);
		sqlSession.selectOne("CartView.addSubject",cartViewVO);
		
	}

	@Override
	public int getAllRegNumBySubCode(int subCode) {
		log.info("CartDAOImpl.getAllRegNumBySubCode");
		return sqlSession.selectOne("cart.getAllRegNumBySubCode", subCode);
	}
	
}
