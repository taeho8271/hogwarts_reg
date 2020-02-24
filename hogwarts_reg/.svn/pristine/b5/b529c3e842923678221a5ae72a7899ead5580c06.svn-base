package edu.hogwarts.hogwartsreg.vo;

public class MyLecVO {
	
	/** 시퀀스 */
	private int sequence;
	/** 학번 */
	private int stuId;
	/** 과목코드 */
	private int subCode;
	
	// 기본 생성자
	public MyLecVO() {
		
	}
	
	/**
	 * 멤버 필드 초기화 : 생성자
	 * 
	 * @param sequence 시퀀스
	 * @param stuId 학번
	 * @param subCode 과목코드
	 */	
	public MyLecVO(int sequence, int stuId, int subCode) {
		
		this.sequence=sequence;
		this.stuId=stuId;
		this.subCode=subCode;
	}
	

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public int getSubCode() {
		return subCode;
	}

	public void setSubCode(int subCode) {
		this.subCode = subCode;
	}

	@Override
	public String toString() {
		return "MyLecVO [sequence=" + sequence + ", stuId=" + stuId + ", subCode=" + subCode + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + sequence;
		result = prime * result + stuId;
		result = prime * result + subCode;
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
		MyLecVO other = (MyLecVO) obj;
		if (sequence != other.sequence)
			return false;
		if (stuId != other.stuId)
			return false;
		if (subCode != other.subCode)
			return false;
		return true;
	}
		
}
