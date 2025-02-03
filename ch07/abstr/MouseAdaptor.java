package ch07.abstr;

// 추상 클래스는 상속 관계에서 객체 생성의 목적이 아닌 구조 상 필요하고 추상적인 틀을 제공한다.
public abstract class MouseAdaptor {	// 추상 클래스 abstract
	public void click() {
		System.out.println("click");
	}
	
	public void dblClick() {
		System.out.println("Double click");
	}
	
	// 추상 메소드
	public abstract void over();
	public abstract void out();
}
