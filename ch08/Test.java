package ch08;

//team1
public class Test {

	public static void main(String[] args) {
		// 인터페이스와 이를 구현한 클래스의 객체
		
//		{
//			// 올바른 사용방법 X
//			MyIFImpl impl = new MyIFImpl();
//			MyIFImpl2 impl2 = new MyIFImpl2();
//			
//			impl.m();
//			impl2.m();
//			
//			// 인터페이스 타입으로 선언, 구현한 객체 생성 할당
//			// 타입 다형성
//			MyIF impl3 = new MyIFImpl();
//			MyIF impl4 = new MyIFImpl2();
//			
//			impl3.m();
//			impl4.m();
//		}
		
		//Test.java 입장에서 MyIF 에만 관심
		//그것의 실체 구현체에는 관심	
		{
			MyIF impl = getMyIFImpl();
			impl.m();
		}
		
		//YourIF 구현한 객체 팔요 의견
		{
			YourIF impl = getYourIFImpl();
			impl.m2();
			
			System.out.println(YourIF.MAX); //상수
			impl.m3(); //default method 호출
		
		}
	}
	
	static MyIF getMyIFImpl() {
		return new MyIFImpl();
//		return new MyIFImpl2();
	}
	
	static YourIF getYourIFImpl() {
//		return new MyIFImpl();
		return new YourIFImpl();
	}
}
