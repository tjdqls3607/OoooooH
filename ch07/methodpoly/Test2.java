package ch07.methodpoly;

public class Test2 {

	public static void main(String[] args) throws Exception{
		// 오버라이딩 조건
		{
//			Super s = new Sub();
//			s.m();
//			s.m2();
//			s.m3();
//			s.m4();
		}

		
		// 오버라이딩 호출 관꼐
		{
//			A x = new B();
//			x.a();
//			x.b();  // a 타입으로 호출을 받았고 b에 대해서는 호출받지 않았기 때문에 컴파일 에러가 뜬다
//			x.a(10);
			
//			B x = new C();
//			x.a();	// C - a()
//			x.c();
			
//			A x = new C();
//			x.a();
			
			C x = new D();
			x.b(); // D - b();
			x.a(10);	// D - a(int i)
		}
		
		// 조별 워크샾 할 때, 각자 1인 1문제 만들어서 상호 풀기
		
		// instanceOf
		{
			A a = new A();
			B b = new B();
			C c = new C();
			D d = new D();
			
//			System.out.println(a instanceof A);
//			System.out.println(b instanceof B);
//			System.out.println(c instanceof C);
//			System.out.println(d instanceof D);
			
//			System.out.println(a instanceof A);
//			System.out.println(b instanceof A);
//			System.out.println(c instanceof A);
//			System.out.println(d instanceof A);
		
//			System.out.println(a instanceof B);
//			System.out.println(b instanceof B);
//			System.out.println(c instanceof B);
//			System.out.println(d instanceof B);
		
//			System.out.println(a instanceof C);
//			System.out.println(b instanceof C);
//			System.out.println(c instanceof C);
//			System.out.println(d instanceof C);
			
			System.out.println(a instanceof D);
			System.out.println(b instanceof D);
			System.out.println(c instanceof D);
			System.out.println(d instanceof D);
		
			// A 의 객체 (B, C ,D 의 객체일 수도 있는) 가 전달되었을 때
			// 서로 다른 객체를 구별 처리???
			// 아래처럼 X
//			A x = new C();
//			if (x instanceof A) {
//				System.out.println("A 객체");
//			}else if ( x instanceof B) {
//				System.out.println("B 객체");
//			}else if ( x instanceof C) {
//				System.out.println("C 객체");
//			}else if ( x instanceof D) {
//				System.out.println("D 객체");
//			}
			
			// 하위 클래스 부터 적용
			A x = new C();
			if (x instanceof D) {
				System.out.println("D 객체");
			}else if ( x instanceof C) {
				System.out.println("C 객체");
			}else if ( x instanceof B) {
				System.out.println("B 객체");
			}else if ( x instanceof A) {
				System.out.println("A 객체");
			}
		}
	}
	
}
