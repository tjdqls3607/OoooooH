package ch07;

public class Test {

	public static void main(String[] args) {
		// 상속
//		{
//			Parent p = new Parent();
//			Child c = new Child();
//		}
		
		//Parent 생성자 추가
		{
			Child c = new Child();
			c.m();
		}
		
		// UP Casting, Down Casting
		{
			Parent p = new Child();
			
			Child c = new Child();
			Parent p2 = c;
			
			c.m();
//			p2.m();
			
			Child c2 = (Child) new Parent(1); // 문법적 오류는 없지만 ClassCastingException 발생
			
			// 명시적으로 Casting 하는 것은 되도록 지양 (부득이한 경우에 수행)
			
		}
		
	}

}


// 컴파일러가 자동을로 하는 일
// 1. 생성자가 없으면 기본 생성자를 추가
// 2. java.lang 자동 import
// 3. 생성자에 super() 가 없으면 자동으로 추가
// 4. 클래스가 아무것도 상속받지 않는 클래스는 자동으로 extends Object를 추가한다.


// OOP 3가지
// 1. Encapsulation <- access modifier 와 setter, getter 구조
// 2. Inheritance (상속 만들기, 부모자식 접근)
// 3. Polymorphism (타입 (상위타입, 하위타입), 메소드 (Overloading, Overriding )