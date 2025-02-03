package ch07.methodpoly;

import java.io.FileNotFoundException;

public class Sub extends Super {
	// 부모 클래스의 primitive type 이 같아야 함
	int m() {
		System.out.println("Sub - m()");
		return 1;
	}
	
	//Super 의 m2() 리턴 타입이 B 이지만 B 와 B 의 하위 클래스 타입을 리턴할 수 있다.	
//	D m2() {
//		System.out.println("Sub + m2()");
//		return new D();
//	}
//	
	// 리턴하는 타입이 B 이지만 타입 다형성에 의해 B 의 하위 클래스타입을 리턴할 수 있다.
//	B m2() {
//		System.out.println("Sub + m2()");
//		return new D();
//	}
//	
	// 리턴하는 타입이 C 이지만 타입 다형성에 의해 C 의 하위 클래스타입을 리턴할 수 있다.
	C m2() {
		System.out.println("Sub - m2()");
		return new C();
	}
	
	// 부모 클래스의 접근 제한을 더 줄일 수 없다. (반대는 가능)
	public void m3() {
		System.out.println("sub - m3()");
	}
	
	//부모 클래스의 처리 예외보다 더 일반적인 예외를 처리할 수 있다. (반대는 가능)
	void m4() throws FileNotFoundException {
		System.out.println("sub - m4()");
	}
	
}
