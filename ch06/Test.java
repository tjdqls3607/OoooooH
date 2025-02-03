package ch06;

public class Test {

	public static void main(String[] args) {
		// 생성자 없는 경우
		// 컴파일러가 기본생성자를 추가
//		{
//			Car car = new Car();
//			System.out.println(car);
//			Car car2 = new Car(1); // 오류
//		}
		
		// 생성자 1개 추가
		// 컴파일러가 기본생성자를 추가X
//		{
//			Car car2 = new Car(1); //
//			System.out.println(car2);
//			Car car = new Car(); // 오류
		
//		}
		
		// 생성자 여러 개 (Overloading)
		{
			
			Car car1 = new Car(1);
			Car car2 = new Car("소나타", 10);
			
			// 5. this() 활용 후 출력
			System.out.println(car1.name);
			System.out.println(car1.speed);
			
			System.out.println(car2.name);
			System.out.println(car2.speed);
			
			// 6. 메소드 테스트
			car1.drive();
			car2.drive();
			
			System.out.println(car1.getDriveInfo());
			System.out.println(car2.getDriveInfo());
			
			System.out.println(car1.getDriveInfo("고속도로"));
			System.out.println(car2.getDriveInfo("남해도로"));
		}
	
	}

}
