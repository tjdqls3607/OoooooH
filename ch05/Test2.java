package ch05;

public class Test2 {
	public static void main(String[] args) {
			{
			String str1 = new String("Hello"); //heap 100 주소에 문자열 객체 생성
			String str2 = new String("Hello"); //heap 200 주소에 문자열 객체 생성
			String str3 = "Hello"; // heap 300주소에 문자열 객체 생성
			String str4 = "Hello"; // heap 300주소에 있는 문자열 사용
			
			// == 
			System.out.println(str1 == str2);
			System.out.println(str3 == str4);
			System.out.println(str1 == str2);
			
			// equals() <- 내용을 비교하는 것
			System.out.println(str1.equals(str2)); //heap 위치와 상관없이 문자욜 내용 비교
			System.out.println(str3.equals(str4));
			System.out.println(str1.equals(str4));
			
			//MyClass 객체의 equals()비교
			MyClass mc1 = new MyClass();
			mc1.name = "Hello";
			MyClass mc2 = new MyClass();
			mc2.name = "Hello";
			
			System.out.println(mc1.name);
			System.out.println(mc2.name); 
			System.out.println(mc1.equals(mc2)); //false <= 같은 참조타입의 객체가 무조건 equals()로 내용비교가 true 가 되는건 아니다.
		}
		
		// String 의 다양한 메소드
		
		{
			String str = "Hello";
			//length()
			System.out.println(str.length());
			
			//charAt()
			System.out.println(str.charAt(4)); // 범위를 벗어나면 StringIOPBE 발생
			
			// replace()
			System.out.println(str.replace("He", "AA")); // 새로운 문자열 return 먼저 선언된 문자열을 가지고 해당 문자열을 바꾼 새로운 문자열을 return 하는 것이다.
			System.out.println(str);
			
			// indexOf()
			System.out.println(str.indexOf("l")); // 2
			
			// substring()
			System.out.println(str.substring(0, 2));
			System.out.println(str.substring(0, str.indexOf("l")) + "X" + str.substring(str.indexOf("l") + 1, + str.length()));
			
			
		}
		
	}
}
