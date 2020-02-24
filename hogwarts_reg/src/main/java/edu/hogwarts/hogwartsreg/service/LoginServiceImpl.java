package edu.hogwarts.hogwartsreg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hogwarts.hogwartsreg.dao.StudentDAO;
import edu.hogwarts.hogwartsreg.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private StudentDAO studentDAO;

	@Override
	public String checkLogin(int stuId, String password) {
		log.info("LoginService.checkLogin");
		String msg = "";
		@SuppressWarnings("unused")
		StudentVO studentVO = null;
		
		if (studentDAO.isStudent(stuId) == true) {
			try {
				studentVO = studentDAO.checkLogin(stuId, password);
				if(studentVO != null)
					msg = "올바른 정보입니다";
				else {
					throw new NullPointerException();
				}
				
			} catch (NullPointerException e) {
				msg = "비밀번호가 일치하지 않습니다";
			}
		} else {
			msg = "회원정보가 존재하지 않습니다";
		}
		
		return msg;
	}

}
