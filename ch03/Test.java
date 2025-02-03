package ch03;


public class Test {

	public static void main(String[] args) {
		// 증감 연산자
//		{
//			int x = 10;
//			int y = 10;
//					
//			x++;
//			++x;
//			
//			System.out.println(x);
//			System.out.println(++x); // println()에 값이 전달되기 전에 x가 1증가한다
//			System.out.println(x++); // println()에 값이 전달되고 난 후 x가 1증가한다
//			System.out.println(x);
//			
//			--y;
//			y--;
//			
//			System.out.println(y);
//			System.out.println(y--);
//			System.out.println(--y);
//			System.out.println(y);
//		}
		
		//논리 연산자
//		{
//			int x = 10;
//			int y = 10;
			
//			if (++x == 10 && y++ == 10) {
//				System.out.println("A");
//			}else {
//				 System.out.println("B");
//			}
//			
//			if (++x == 11 && y++ == 10) {
//				System.out.println("A");
//			}else {
//				 System.out.println("B");
//			}
			
			//x,y 모두 11
//			System.out.println(x);
//			System.out.println(y);
//			
//			
//			if (++x == 12 && y++ == 11) {
//				System.out.println("C");
//			}else {
//				 System.out.println("D");
//			}
			
			//x,y 모두 12
//			System.out.println(x);
//			System.out.println(y);
			
			//&& -> ||
			// || -> | : 이미 전체 판명이 나더라도 나머지 판명을 이어간다. 결과적으로 y도 13이 된다.
//			if (++x == 13 | y++ == 12) {
//				System.out.println("E");
//			}else {
//				 System.out.println("F");
//			}
			
			/*
			x눈 먼저 비교되어 true로 판명 (x는 증가)
			y는 앞의 x비교식에서 true로 이미 판명이 나서 전체 OR연산이 true로 판명됨 -> y++ == 12비교식은 수행 X
			x는 13 y = 12 
			*/
//			System.out.println(x);
//			System.out.println(y);
			
			// OR || 로 진행하면서 &&, & 하는 예제를 만들기
			// 조별 활동에서 결과값을 예측하는 퀴즈로 만들기
//		}
		
		// 삼항 연산자
//		{
//			int score = 75;
//			/* score > 90 일 때 'A'
//			 * 80 <= score <= 90 일 때 'B'
//			 * score < 80 일 때 'C'
//			 */
//			char grade = score > 90 ? 'A' : ((score >= 80 ) ? 'B' : 'C');
//			System.out.println(grade);
//		}
		
		// 나누기 연산자
	{
		int a = 10;
		int b = a / 3;
		System.out.println(b);
	}
		
	}
}

