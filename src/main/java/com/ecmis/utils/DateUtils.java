package com.ecmis.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	public static Date parse1(String source,String pattern){
		try {
			Date date=new SimpleDateFormat(pattern).parse(source);
			return date;
		} catch (Exception e) {
			System.out.println("转换日期失败:"+source);
		}
		return null;
	}
}
