package ch06;

//import java.util.Random;

public class Test4 {

	public static void main(String[] args) {
		// String class import?
		String set = "Hello";
		
		// package 를 import 해야 한다.
		//Random rad = new Random();
		
		// 컴파일러는 java.lang.package 를 자동으로 import 해 준다.
		java.util.Random rad2 = new java.util.Random(); // package 를 포함한 Random 클래스의 full name

	}

}
