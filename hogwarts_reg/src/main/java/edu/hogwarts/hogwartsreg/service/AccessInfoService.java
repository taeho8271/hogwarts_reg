package edu.hogwarts.hogwartsreg.service;

/**
 * 계정 접속 및 정보 관리: 로그인, 로그아웃, 학번/비번 찾기 및 변경
 * @author Hogwarts
 *
 */
public interface AccessInfoService {

	/**
	 * login check
	 * @param stuId 학번
	 * @param password 비밀번호
	 * @return 에러메시지
	 */
	public String checkLogin(int stuId, String password);
	
	/**
	 * change password
	 * @param cpwId 학번
	 * @param cpwName 이름
	 * @param cpwPw 기존 비밀번호
	 * @param cpwNpw 새 비밀번호
	 * @param cpwCf 새 비밀번호 확인
	 * @return 에러메시지
	 * 
	 */
	public String changePassword(int cpwId, String cpwName, String cpwPw, String cpwNpw, String cpwCf);
	
	
	/**
	 * 학번 분실시 이름, 생년월일, 이메일로 학번 검색
	 * 
	 * @param stuName 학생 이름
	 * @param birth 생년월일
	 * @param email 이메일
	 * @return 학번 혹은 메시지
	 * @throws Exception 예외처리
	 */
	public String getStudentIdByStudentInfo(String stuName, String birth, String email);

	/**
	 * 패쓰워드 분실시 학번, 학생이름, 이메일로 패쓰워드 검색
	 * 
	 * @param stuId 학번
	 * @param stuName 학생이름
	 * @param email 이메일
	 * @return 패쓰워드 혹은 메시지
	 * @throws Exception 예외처리
	 */
	public String getStudentPwByStudentInfo(int stuId, String stuName, String email);
}
