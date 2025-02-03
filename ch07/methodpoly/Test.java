package ch07.methodpoly;

public class Test {

	public static void main(String[] args) {
		// MyClass vs Object
		MyClass mc = new MyClass();
		
		// toString()
		System.out.println(mc.toString()); // println() 이 전달하는 객체의 toString()을 호출하고 그 결과를 출력한다.
		
		// equals(), hashCode()
		// 두 객체의 융통성 비교
		MyClass mc1 = new MyClass();
		mc1.n = 10;
		mc1.str = "Hello";
		
		MyClass mc2 = new MyClass();
		mc2.n = 10;
		mc2.str = "Hello";
		
		System.out.println(mc1==mc2);
		System.out.println(mc1.equals(mc2));
	}

}
