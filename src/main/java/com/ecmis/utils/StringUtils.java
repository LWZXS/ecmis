package com.ecmis.utils;

public class StringUtils {

	public static boolean isInt(String str){
		try {
			Integer.parseInt(str);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public static boolean isNullOrEmpty(String str){
		return str==null || "".equals(str);
	}
	
	public static Integer str2Integer(String str){
		try {
			return Integer.parseInt(str);
		} catch (Exception e) {

		}
		return null;
	}
}
