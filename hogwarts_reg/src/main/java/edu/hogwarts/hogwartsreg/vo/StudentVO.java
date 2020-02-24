package edu.hogwarts.hogwartsreg.vo;

/**
 * 학생정보 VO(값 객체)
 * 
 * @author Hogwarts
 * 
 */
public class StudentVO {
	
	/** 학번 */
	private int stuId;
	
	/** 이름 */
	private String stuName;
	
	/** 비밀번호 */
	private String password;
	
	/** 이메일 */
	private String email;
	
	/** 생년월일 */
	private String birth;

	// 기본 생성자
	public StudentVO() {
		
	}
	
	/**
	 * 학생 필드 초기화 : 생성자
	 * 
	 * @param stuId 아이디
	 * @param stuName 이름
	 * @param password 비밀번호
	 * @param email 이메일
	 * @param birth 생년월일
	 */
	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "StudentVO [stuId=" + stuId + ", stuName=" + stuName + ", password=" + password + ", email=" + email
				+ ", birth=" + birth + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((birth == null) ? 0 : birth.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + stuId;
		result = prime * result + ((stuName == null) ? 0 : stuName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StudentVO other = (StudentVO) obj;
		if (birth == null) {
			if (other.birth != null)
				return false;
		} else if (!birth.equals(other.birth))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (stuId != other.stuId)
			return false;
		if (stuName == null) {
			if (other.stuName != null)
				return false;
		} else if (!stuName.equals(other.stuName))
			return false;
		return true;
	}
	
}