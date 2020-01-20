package edu.hogwarts.hogwartsreg.vo;


import java.util.Objects;


public class CartVO {
	
	/*과목코드 */
	private int sub_code;
	/*과목명*/
	private String sub_name;
	/*교수명 */
	private String professor;
	/*요일 및 시간 */
	private String daytime;
	/*학점 */
	private int grade;
	/*신청 인원 */
	private int reg_num;
	/*제한 인원 */
	private int limit_num;
	
	
	/**
	 * 기본 생성자
	 */
	public CartVO() {
		
	}
	
	/**
	 * 멤버 필드 초기화 : 생성자
	 * 
	 * @param sub_code 과목코드
	 * @param sub_name 과목이름
	 * @param professor 교수명
	 * @param daytime 요일시간
	 * @param grade 학점
	 * @param reg_num 신청인원
	 * @param limit_num 제한인원
	 */
	public CartVO(int sub_code, String sub_name, String professor, String daytime, 
					 int grade, int reg_num, int limit_num) {
		
		this.sub_code=sub_code; 
		this.sub_name=sub_name;
		this.professor=professor;
		this.daytime=daytime; 
		this.grade=grade;
		this.reg_num=reg_num;
		this.limit_num=limit_num;
	
	}
	

	public int getLectureCode() {
		return sub_code;
	}	

	public void setLectureCode(int sub_code) {
		this.sub_code=sub_code;
	}
	
	public String getLecturename() {
		return sub_name;
	}
	
	public void setLecturename(String sub_name) {
		this.sub_name=sub_name;
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
		return reg_num;
	}
	
	public void setRegNum(int reg_num){
		this.reg_num=reg_num;
	}
	
	public int getLimitNum(){
		return limit_num;
	}
	
	public void setLimitNum(int limit_num){
		this.limit_num=limit_num;
	}
	
	
	@Override
	public String toString() {
		return String.format(
				"MemberVO [sub_code=%d, sub_name=%s, professor=%s, daytime=%s, grade=%d, reg_num=%d, limit_num=%d]",
				sub_code, sub_name, professor, daytime, grade, reg_num, limit_num
				);
	}

	
	@Override
	public int hashCode() {
		return Objects.hash(sub_code, sub_name, professor, daytime, grade, reg_num, limit_num);
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
		return Objects.equals(sub_code, other.sub_code)
				&& Objects.equals(sub_name, other.sub_name)
				&& Objects.equals(professor, other.professor) && Objects.equals(daytime, other.daytime)
				&& Objects.equals(grade, other.grade) && Objects.equals(reg_num, other.reg_num)
				&& Objects.equals(limit_num, other.limit_num);
	}

}