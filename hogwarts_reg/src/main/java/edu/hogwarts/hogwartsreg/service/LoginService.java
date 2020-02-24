package edu.hogwarts.hogwartsreg.service;


public interface LoginService {

	/**
	 * login check
	 * @param stuId 학번
	 * @param password 비밀번호
	 * @return 에러메시지
	 */
	public String checkLogin(int stuId, String password); 
	
}
