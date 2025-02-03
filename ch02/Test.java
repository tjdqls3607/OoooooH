package ch02;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 형 변환
//		byte b1 = 10;
//		int i1 = b1; //큰 타입 int <- 작은 타입 byte (자동 형변환)
//		System.out.println(b1); //byte value 10
//		System.out.println(i1); //integer value 10
//		
//		//byte b2 = i1; //작은타입 byte <- 큰타입 int(자동 형 변환X)
//		
//		byte b2 = (byte) i1; //강제 형 변환
//		System.out.println(b2);
//		
//		byte b3 = (byte) 10000; //강제 형 변환 값 손실
//		System.out.println(b3);
//		
//		
//		//산술 연산과정에서 int 자동 형변환
//		byte b4 = 10;
//		byte b5 = 20;
//		//byte b6 = b4+b5; // b4와 b5가 덧셈전에 int로 형변환 후 연산 수행 -> 결과도 int (컴파일 오류)
//		int i6 = b4 +b5;
//		byte b6 = (byte) (b4+b5);
//		System.out.println(i6);
//		System.out.println(b6);
//		
//		
//		//String <->int
//		String intstr = "999";
//		int intVal = Integer.parseInt(intstr);
//		System.out.println(intVal);
//		
//		String intstr2 = String.valueOf(intVal + 1);
//		System.out.println(intstr2);
		
		//LocMem
		LocMem locMem1 = new LocMem();
		locMem1.num = 10;
		locMem1.name = "AAA";
		
		LocMem locMem2 = new LocMem();
		locMem2.num = 20;
		locMem2.name = "BBB";
		
		System.out.println(locMem1.sum(100, 200));
		System.out.println(locMem2.sum(300,  400));
	}

}
