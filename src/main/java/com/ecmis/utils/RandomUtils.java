package com.ecmis.utils;

import java.util.Random;

public class RandomUtils {

	public static Random random=new Random();
	
	public static int getNextInt(){
		return random.nextInt(100000);
	}
}
