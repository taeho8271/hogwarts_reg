package edu.hogwarts.hogwartsreg.util;

import java.sql.Connection;
import java.sql.SQLException;

import lombok.extern.slf4j.Slf4j;

/**
 * 예외처리 유틸리티
 * 
 * @author A
 *
 */
@Slf4j
public class ExceptionMetadata {

	private StackTraceElement ste; // 예외처리 리플렉션(reflection) 정보객체
	private String className; // 클래스명
	private String methodName; // 메서드명

	/**
	 * @param ste 예외처리 리플렉션(reflection) 정보객체
	 */
	public ExceptionMetadata(StackTraceElement ste) {
		this.ste = ste;
		this.className = ste.getClassName();
		this.methodName = ste.getMethodName();
	}

	public void setSte(StackTraceElement ste) {
		this.ste = ste;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public void printErr(SQLException se, boolean b) {
		// TODO Auto-generated method stub

	}

	/**
	 * 예외처리 메시지 출력
	 * 
	 * @param e          예외처리
	 * @param con        DB 연결 객체
	 * @param isRollback rollback 여부
	 */
	public void printErr(Exception e, Connection con, boolean b) {

		String temp[] = className.split("\\.");
		log.info(temp[temp.length - 1] + "." + methodName + " ");
		log.info(e.getClass().getName().split("\\.")[2] + " :\n");
		e.printStackTrace();

	}

}