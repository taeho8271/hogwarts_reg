package edu.hogwarts.hogwartsreg.vo;

import lombok.Data;

@Data
public class SubjectVO2 {
	
	/** 과목코드 */
	private int subCode;
	
	/** 과목명 */
	private String subName;
	
	/** 강사명 */
	private String professor;
	
	/** 요일 및 시간 */
	private String daytime;
	
	/** 요일 */
	private String day;
	
}
