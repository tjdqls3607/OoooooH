package ch06.b;

import ch06.a.A;

//  상속 관계에서 protected 에 접근 가능하다는 같은 객체 내에서만 허용
public class B extends A {
	
//	A aa = new A();
	
	public void m() {
		A a = new A();
//		int x = a.n4;;  // 접근 불가 (다른 객체)
			
	}
	
	public void m2() {
		int x = super.n4;
	}
}
