package ch06;

public class GetterSetter {
	// 필드를 외부에서 직접 read/update ..하지 못하도록하고
	// 메소드를 통해서 가능하게 구조를 만든다.
	
	private int n = 10;
	
	void m() {
		System.out.println("GetterSetter n : " + n);
		
	}
	
	public void setN(int n) {
		// 조건 체크 ...분기 ...값을 조정 ...추가될 수 있다.
		this.n = n;
	}
	
	public int getN() {
		return this.n;
	}

}
