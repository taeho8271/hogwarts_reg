/**
 * 
 */
package edu.hogwarts.hogwartsreg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import edu.hogwarts.hogwartsreg.dao.CartDAO;
import edu.hogwarts.hogwartsreg.dao.LectureDAO;
import edu.hogwarts.hogwartsreg.dao.SubjectDAO;
import edu.hogwarts.hogwartsreg.vo.CartVO;
import edu.hogwarts.hogwartsreg.vo.LectureVO;
import edu.hogwarts.hogwartsreg.vo.SearchVO2;
import edu.hogwarts.hogwartsreg.vo.SubjectVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 개설강의 관리 구현 클래스: 장바구니, 수강신청, 시간표
 * @author Hogwarts
 *
 */
@Service
@Slf4j
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Autowired
	private SubjectDAO subjectDAO;
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private LectureDAO lectureDAO;  

	@Override
	@Transactional(readOnly = true) // 읽기만 하는 것
	public List<SubjectVO> getAllSubject() {
		log.info("CourseService.getAllSubject");
		List<SubjectVO> subjects = null;
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());

		try {
			subjects = subjectDAO.getAllSubject();
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);  }
		 
		return subjects;
	}

	@Override
	@Transactional(readOnly = true) // 읽기만 하는 것
	public SubjectVO getSubjectBySubCode(int subCode) {
		log.info("CourseService.getSubjectBySubCode");
		SubjectVO subjectVO = null;
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());

		try {
			subjectVO = subjectDAO.getSubjectBySubCode(subCode);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);  }
		 
		return subjectVO;
	}

	@Override
	@Transactional(readOnly = true) // 읽기만 하는 것
	public List<SubjectVO> searchSubjects(SearchVO2 searchVO2) {
		log.info("CourseService.searchSubjects");
		List<SubjectVO> subjects = null;
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());

		try {
			subjects = subjectDAO.searchSubjects(searchVO2);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);  }
		 
		return subjects;
	}

	@Override
	@Transactional(readOnly = true) // 읽기만 하는 것
	public List<SubjectVO> searchSubjectsByWord(SearchVO2 searchVO2) {
		
		log.info("CourseService.searchSubjectsByWord");
		List<SubjectVO> subjects = null;
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());

		try {
			subjects = subjectDAO.searchSubjectsByWord(searchVO2);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);  }
		 
		return subjects;
	}

	@Override
	@Transactional(readOnly = true) // 읽기만 하는 것
	public int getAllRegNumBySubCode(int subCode) {
		log.info("CourseService.getAllRegNumBySubCode");
		int regNum = 0;
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());

		try {
			regNum = cartDAO.getAllRegNumBySubCode(subCode);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);  }
		 
		return regNum;
	}

	@Override
	@Transactional(readOnly = true) // 읽기만 하는 것
	public LectureVO getLecture(int subCode, int stuId) {
		log.info("CourseService.getLecture");
		LectureVO lectureVO = null;
		
		TransactionStatus txStatus 
			= transactionManager.getTransaction(new DefaultTransactionDefinition());

		try {
			lectureVO = lectureDAO.getLecture(subCode, stuId);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);  }
		 
		return lectureVO;
	}

	@Override
	@Transactional(readOnly = true) // 읽기만 하는 것
	public boolean checkLecture(int subCode, int stuId) {
		log.info("CourseService.checkLecture");
		boolean flag = false;
		
		TransactionStatus txStatus 
			= transactionManager.getTransaction(new DefaultTransactionDefinition());

		try {
			flag = lectureDAO.checkLecture(subCode, stuId);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus); 
		}
		 
		return flag;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void updateRegNum(int stuId, int subCode, int regNum, int success) {
		log.info("CourseService.updateRegNum");
		
		TransactionStatus txStatus 
			= transactionManager.getTransaction(new DefaultTransactionDefinition());

		try {
			lectureDAO.updateRegNum(stuId, subCode, regNum, success);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus); 
		}
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void updateAllRegNum(int subCode, int regNum) {
		log.info("CourseService.updateAllRegNum");
		
		TransactionStatus txStatus 
			= transactionManager.getTransaction(new DefaultTransactionDefinition());

		try {
			lectureDAO.updateAllRegNum(subCode, regNum);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus); 
		}
	}

	@Override
	@Transactional(readOnly = true) // 읽기만 하는 것
	public List<LectureVO> getLectureBySubCode(int subCode) {
		log.info("CourseService.getLectureBySubCode");
		List<LectureVO> lectureVOs = null;
		
		TransactionStatus txStatus 
			= transactionManager.getTransaction(new DefaultTransactionDefinition());

		try {
			lectureVOs = lectureDAO.getLectureBySubCode(subCode);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);  }
		 
		return lectureVOs;
	}
	
	@Override
	@Transactional(readOnly = true) // 읽기만 하는 것
	public List<LectureVO> getLectureByStuId(int stuId, int success) {
		log.info("CourseService.getLectureByStuId");
		List<LectureVO> lectureVOs = null;
		
		TransactionStatus txStatus 
			= transactionManager.getTransaction(new DefaultTransactionDefinition());

		try {
			lectureVOs = lectureDAO.getLectureByStuId(stuId, success);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);  }
		 
		return lectureVOs;
	}
	
	@Override
	@Transactional(readOnly = true) // 읽기만 하는 것
	public void insertLecture(SubjectVO lecture) {
		
		log.info("CourseService.insertLecture");
		TransactionStatus txStatus 
		= transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			lectureDAO.insertLecture(lecture);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);  }

	}

	@Override
	@Transactional(readOnly = true) 
	public List<CartVO> getAllSubjects() {
		
		log.info("CourseService.getAllSubjects");
		List<CartVO> cartview = null;
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		try {
			cartview = cartDAO.getAllSubjects();
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);  }
		 
		return cartview;
	}

}
