/**
 * 
 */
package edu.hogwarts.hogwartsreg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hogwarts.hogwartsreg.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author Hogwarts
 *
 */

@Repository
@Slf4j
public class StudentDAOImpl implements StudentDAO {
	
	@Autowired
	   private SqlSession sqlSession;
	
	@Override
	public StudentVO getStudent(int stuId) {
		 log.info("StudentDAOImpl.getStudent");         
		   return sqlSession.selectOne("student.getStudent", stuId);
	}

	@Override
	public void updateStudent(int stuId, String password) {
		 log.info("StudentDAOImpl.updateStudent");    
		
		 StudentVO studentVO = new StudentVO();
		 studentVO.setStuId(stuId);
		 studentVO.setPassword(password);
		sqlSession.update("student.updateStudent",studentVO);
	}

	@Override
	public List<StudentVO> getAllStudent() {
		log.info("StudentDAOImpl.getAllStudent");
	      return sqlSession.selectList("student.getAllStudent");
	}


	@Override
	public boolean isStudent(int stuId) {
		 log.info("StudentDAOImpl.isStudent");         
		 return (int)sqlSession.selectOne("student.isStudent", stuId)==1 ? true : false ;
	}
	
	@Override
	public boolean isPassword(String password) {
		log.info("StudentDAOImpl.isPassword");         
		return (int)sqlSession.selectOne("student.isPassword", password)==1 ? true : false ;
	}

	@Override
	public StudentVO checkLogin(int stuId, String password) {
		log.info("StudentDAOImpl.checkLogin");
		
		StudentVO studentVO = new StudentVO();
		StudentVO studentResultVO = null;
		studentVO.setStuId(stuId);
		studentVO.setPassword(password);
		studentResultVO = sqlSession.selectOne("student.checkLogin",studentVO);
		
		return studentResultVO;
	}

	@Override
	public StudentVO getStudentIdByStudentInfo(String stuName, String birth, String email) {
		log.info("StudentDAOImpl.getStudentIdByStudentInfo");
		
		StudentVO studentVO = new StudentVO();
		studentVO.setStuName(stuName);
		studentVO.setBirth(birth);
		studentVO.setEmail(email);
		return sqlSession.selectOne("student.getStudentIdByStudentInfo",studentVO);
	}

	
	@Override
	public StudentVO getStudentPwByStudentInfo(int stuId, String stuName, String email) {
		log.info("StudentDAOImpl.getStudentPwByStudentInfo");
		
		StudentVO studentVO = new StudentVO();
		studentVO.setStuId(stuId);
		studentVO.setStuName(stuName);
		studentVO.setEmail(email);
		return sqlSession.selectOne("student.getStudentPwByStudentInfo",studentVO);
	}	
}
