/**
 * 
 */
package edu.hogwarts.hogwartsreg.dao;

import edu.hogwarts.hogwartsreg.vo.LectureVO;
import edu.hogwarts.hogwartsreg.vo.SubjectVO;

import java.util.List;

/**
 * @author Hogwarts
 *
 */
public interface LectureDAO {

	/**
	 * 과목 정보 생성
	 * 
	 * @param lecture 수강예정과목
	 */
	void insertLecture(SubjectVO lecture);

	
	/**
	 * 장바구니에서 한 학생의 수강완료 과목 가져오기
	 * 
	 * @param subCode 과목코드
	 * @return 과목정보
	 */
	LectureVO getLecture(int subCode, int stuId);
	
	/**
	 * 한 학생의 수강완료 과목 모두 가져오기
	 * @param stuId 학번
	 * @param success 수강신청여부 예) 0=미수강,  1=수강
	 * @return 전체 수강신청 완료 과목 
	 */
	List<LectureVO> getLectureByStuId(int stuId, int success);
	
	/**
	 * 장바구니에서 과목코드로 수강완료 과목 가져오기
	 * 
	 * @param subCode 과목코드
	 * @return 과목정보
	 */
	List<LectureVO> getLectureBySubCode(int subCode);

	/**
	 * 이미 담겨 있는 과목을 담으려고 할 때 중복으로 담지 못 하게
	 * 
	 * @param subCode 과목코드
	 * @param stuId   학번
	 * @return 중복 여부
	 */
	boolean checkLecture(int subCode, int stuId);

	/**
	 * 수강완료 과목 취소
	 * 
	 * @param subCode 과목코드
	 */
	void cancelLecture(int subCode, int stuId);

	/**
	 * 신청인원 변경 시 현 신청인원을 실시간으로 반영
	 * 
	 * @param stuId 학번
	 * @param subCode 과목코드
	 * @param regNum 현 신청인원
	 * @param success 수강완료여부
	 */
	void updateRegNum(int stuId, int subCode, int regNum, int success);
	
	/**
	 * 신청인원 변경 시 해당 과목 모든 신청인원 반영
	 * 
	 * @param subCode 과목코드
	 * @param regNum 현 신청인원
	 */
	void updateAllRegNum(int subCode, int regNum);
	
	/**
	 * 시간 및 요일 뷰 생성
	 * 
	 * @param daytime 요일/시간
	 * @return ?
	 */
	void selectDaytime(String daytime);
	
	/**
	 * 시간 중복 검사
	 * 
	 * @param daytime 요일/시간
	 * @return ?
	 */
	int checkDaytime(int subCode);

	/**
	 * 신청 완료한 학생 수 count
	 * 
	 * @param regNum    현 신청인원
	 * @param limitNum 제한인원
	 * @return ?
	 */
	boolean checkLimitNum(int regNum, int limitNum);
}

