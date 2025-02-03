package ch06;

public class Test3 {

	public static void main(String[] args) {
		// final
		// 1. 생성자가 없을 때
//		{
//			MyClass mc = new MyClass();
//			System.out.println(mc.num);
//			mc.num++; // final field 수정 불가
//		}
		
		// 2. 생성자를 통한 초기화
		// final 필드를 지칭하는 생성자를 호출
		{
			MyClass mc = new MyClass(20);
			System.out.println(mc.num);
		}
	}

}
