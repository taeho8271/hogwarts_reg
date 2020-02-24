package edu.hogwarts.hogwartsreg.vo;


import java.util.Objects;


public class CartVO implements Comparable<CartVO> {
	
	/** 과목코드 */
	private int subCode;
	/** 과목명 */
	private String subName;
	/** 강사명 */
	private String professor;
	/** 요일 및 시간 */
	private String daytime;
	/** 학점 */
	private int grade;
	/** 수강신청 인원 */
	private int regNum;
	/** 제한인원 */
	private int limitNum;
	
	
	// 기본 생성자
	public CartVO() {
		
	}
	
	/**
	 * 멤버 필드 초기화 : 생성자
	 * 
	 * @param subCode 과목코드
	 * @param subName 과목명
	 * @param professor 강사명
	 * @param daytime 요일 및 시간
	 * @param grade 학점
	 * @param regNum 수강신청 인원
	 * @param limitNum 제한 인원
	 */
	public CartVO(int subCode, String subName, String professor, String daytime, 
					 int grade, int regNum, int limitNum) {
		
		this.subCode=subCode; 
		this.subName=subName;
		this.professor=professor;
		this.daytime=daytime; 
		this.grade=grade;
		this.regNum=regNum;
		this.limitNum=limitNum;
	}
	
	/**
	 * 장바구니에 담은 과목들을 CartVO로 치환하는 부분
	 * @param subjectVO 과목 객체
	 */
	public CartVO(SubjectVO subjectVO) {
		this.subCode=subjectVO.getSubCode(); 
		this.subName=subjectVO.getSubName();
		this.professor=subjectVO.getProfessor();
		this.daytime=subjectVO.getDaytime(); 
		this.grade=subjectVO.getGrade();
		//this.regNum=subjectVO.getRegNum();
		this.limitNum=subjectVO.getLimitNum();
	}
	

	public int getLectureCode() {
		return subCode;
	}	

	public void setLectureCode(int subCode) {
		this.subCode=subCode;
	}
	
	public String getLecturename() {
		return subName;
	}
	
	public void setLecturename(String subName) {
		this.subName=subName;
	}
	
	public String getLectureProfessor(){
		return professor;	
	}
	
	public void setLectureProfessor(String professor){
		this.professor=professor;
	}
	
	public String getLectureDaytime(){
		return daytime;
	}
	
	public void setLectureDaytime(String daytime){
		this.daytime=daytime;
	}
	
	public int getLectureGrade(){
		return grade;
	}
	
	public void setLectureGrade(int grade){
		this.grade=grade;
	}
	
	public int getRegNum(){
		return regNum;
	}
	
	public void setRegNum(int regNum){
		this.regNum=regNum;
	}
	
	public int getLimitNum(){
		return limitNum;
	}
	
	public void setLimitNum(int limitNum){
		this.limitNum=limitNum;
	}
	
	
	@Override
	public String toString() {
		return String.format(
				"MemberVO [subCode=%d, subName=%s, professor=%s, daytime=%s, grade=%d, regNum=%d, limitNum=%d]",
				subCode, subName, professor, daytime, grade, regNum, limitNum
				);
	}

	
	@Override
	public int hashCode() {
		return Objects.hash(subCode, subName, professor, daytime, grade, regNum, limitNum);
	}
	

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof CartVO)) {
			return false;
		}
		CartVO other = (CartVO) obj;       
		return Objects.equals(subCode, other.subCode)
				&& Objects.equals(subName, other.subName)
				&& Objects.equals(professor, other.professor) && Objects.equals(daytime, other.daytime)
				&& Objects.equals(grade, other.grade) && Objects.equals(regNum, other.regNum)
				&& Objects.equals(limitNum, other.limitNum);
	}
	
	/**
	 * 중복 비교대상
	 * subCode 과목코드
	 * 
	 */
	@Override
	public int compareTo(CartVO o) {
		
		return Integer.compare(this.subCode, o.subCode);
	}

}