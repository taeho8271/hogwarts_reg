package edu.hogwarts.hogwartsreg.vo;

import java.util.List;

import lombok.Data;

@Data
public class SearchVO2 {
	
	/** 검색 구분 */
	private String prsSelectBox;
	/** 검색어 */
	private String listSearchWord;
	/**요일*/
	private List<String> days; 		 

}
