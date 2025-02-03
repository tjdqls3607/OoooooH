package ch06.a;

public class Test {

	public static void main(String[] args) {
		// 같은 패키지에서 default에 대한 접근
		A a = new A(); //import 필요X
		int x = a.n3; // 같은 패키지로 접근 가능

	}

}
