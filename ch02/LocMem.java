package ch02;

public class LocMem {
		//클래스로 표현하려는 객체별로 변수(상태)와 메소드(동작)를 선언
		
		//member variable
		//객체가 존재하는 한 지속된다. (객체)가 가비지가 되면 사라진다.
		int num;
		String name;
		
		// 기능을 수행하는 메소드
		//파라미터의 메소드 내에서 변수 모두 메소드가 호출될 때 만들어 지고, 종료될 때 사라진다
		public int sum(int n1, int n2) {
			int n3 = 3;
			//안쪽 scope 에서는 바깥 scope에 선언된 변수와 동일한 변수를 선언할 수 없다.
//			if (n1 > n2) {
//				int n3 = 10;
//			}
			return n1 +n2 + n3;
		}
}
