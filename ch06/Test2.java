package ch06;

public class Test2 {
	
	static {
		System.out.println("X");
	}
	public static void main(String[] args) {
		// static 필드
		System.out.println(Calculator.pi);
		
		// static 메소드
		System.out.println(Calculator.plus(10, 20));
		
		// 객체로뷰터 접근 가능하나 올바르지 않다.
		Calculator c = new Calculator();
		System.out.println(c.pi);
		
		// non-static method call
		//hello(): // 호출 불가
		hello2();
	}
	
	static {
		System.out.println("Y");
	}
	
	public void hello() {} // non-static method
	public static void hello2() {}

}


/*
X <- Test2 static initializer
Y <- Test2 static initializer
2 <- Calculator static initializer
1 <- Calculator static initializer
3.1415
30
3.1415
*/