package ch06;

public class Calculator {
	//static initializer
	static {
		System.out.println(2);
	}
	
	int sum;
	
	static double pi = 3.1415;
	static int plus(int a, int b) {
//		sum += a+b; // static 메소드 에서 non-static 필드에 접근 X
		return a + b;
	}
	
	static {
		System.out.println(1);
	}
}
