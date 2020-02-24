package edu.hogwarts.hogwartsreg.vo;


public class LectureVO implements Comparable<LectureVO> {
	
	/** 과목명 */
	private String subName;
	/** 교수명 */
	private String professor;
	/** 학점 */
	private int grade;
	/** 과목코드 */
	private int subCode;
	/** 수강완료여부 */
	private int success;
	
	public int getSuccess() {
		return success;
	}

	public void setSuccess(int success) {
		this.success = success;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getProfessor() {
		return professor;
	}

	public void setProfessor(String professor) {
		this.professor = professor;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}


	private String daytime; 	// 요일 및 시간
	private int RegNum; 		// 수강신청 인원
	private int LimitNum; 		// 제한 인원
	private int stuId; 			// 학번
	
	// 기본 생성자
	public LectureVO() {}
	
	public int getSubCode() {
		return subCode;
	}

	public void setSubCode(int subCode) {
		this.subCode = subCode;
	}
	
	
	public String getDaytime() {
		return daytime;
	}

	public void setDaytime(String daytime) {
		this.daytime = daytime;
	}
	
	public int getRegNum() {
		return RegNum;
	}

	public void setRegNum(int RegNum) {
		this.RegNum = RegNum;
	}
	
	
	public int getLimitNum() {
		return LimitNum;
	}

	public void setLimitNum(int LimitNum) {
		this.LimitNum = LimitNum;
	}
	
	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + LimitNum;
		result = prime * result + RegNum;
		result = prime * result + ((daytime == null) ? 0 : daytime.hashCode());
		result = prime * result + grade;
		result = prime * result + ((professor == null) ? 0 : professor.hashCode());
		result = prime * result + stuId;
		result = prime * result + subCode;
		result = prime * result + ((subName == null) ? 0 : subName.hashCode());
		result = prime * result + success;
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
		LectureVO other = (LectureVO) obj;
		if (LimitNum != other.LimitNum)
			return false;
		if (RegNum != other.RegNum)
			return false;
		if (daytime == null) {
			if (other.daytime != null)
				return false;
		} else if (!daytime.equals(other.daytime))
			return false;
		if (grade != other.grade)
			return false;
		if (professor == null) {
			if (other.professor != null)
				return false;
		} else if (!professor.equals(other.professor))
			return false;
		if (stuId != other.stuId)
			return false;
		if (subCode != other.subCode)
			return false;
		if (subName == null) {
			if (other.subName != null)
				return false;
		} else if (!subName.equals(other.subName))
			return false;
		if (success != other.success)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "LectureVO [subName=" + subName + ", professor=" + professor + ", grade=" + grade + ", subCode="
				+ subCode + ", success=" + success + ", daytime=" + daytime + ", RegNum=" + RegNum + ", LimitNum="
				+ LimitNum + ", stuId=" + stuId + "]";
	}

	@Override
	public int compareTo(LectureVO lectureVO) {
		
		return Integer.compare(this.subCode, lectureVO.getSubCode());
	}
	
}

