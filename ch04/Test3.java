package ch04;

import java.util.Scanner;

public class Test3 {

	public static void main(String[] args) {
		// while (반복횟수가 정해지지 않은 경우, 코드를 반복적으로 수행하면서 변화에 따라 종료 결정)
//		{
//			int i = 0;
//			while( i< 10 ) {
//				System.out.println(i);
//				i++;
//			}
//		}
		
		//do while (최소 1회)
//		{
//			int i = 0;	//i를 10으로 변경하면 최소 1회 수행
//			do {
//				System.out.println(i);
//				i++;
//			}while(i<10);
//		}

		//교재 p133\
		//import : ctrl + 5
		Scanner sc = new Scanner(System.in);
		boolean run = true;
		int speed = 0;
		
		while (run) {
			System.out.println("-----------------------");
			System.out.println("1: 증속 | 2: 감속| 3: 중지");
			System.out.println("선택 : ");
			
			//사용자의 입력을 읽는다.
			int num = sc.nextInt();
			
			if(num == 1) {
				speed++;
				System.out.println("현재속도: " + speed);
			}else if (num == 2) {
				System.out.println("현재속도: " + (--speed));
			}else if (num == 3) {
				run = false;
			}
		}
		
		System.out.println("종료");
	}

}
