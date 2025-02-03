package ch05;

public class Test {

	public static void main(String[] args) {
		// 참조타임 객체 생성 == 비교 <- heap 의 객체 위치 비교
		MyClass mc1 = new MyClass();
		MyClass mc2 = new MyClass();
		MyClass mc3 = mc1;
		
		System.out.println(mc1==mc2);
		System.out.println(mc1 == mc3);
		
		//null
		System.out.println(mc1);
		// local 변수는 사용 전 반드시 초기화가 되어야 한다.
		MyClass mc4 = null; // <-지역 변수 가리키는 객체가 없다. 명시적으로 표현할 때 null;
		System.out.println(mc4);
		
		//메소드를 통한 객체 return
		mc4 = getObject();
		System.out.println(mc4); // 정상적인 객체일 경우 클래스정보 + heap 참조 출력, null일 경우 문자열"null" 이 출력
		System.out.println(mc4.getName()); //mc4 가 null 인 경우 NullPointerException 발생
	}

	static MyClass getObject() {
		//return new MyClass();
		return null;
	}
}
