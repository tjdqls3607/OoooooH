package ch08;

//team2
public class MyIFImpl implements MyIF, YourIF {

	@Override
	public void m() {
		System.out.println("MyIFImpl m()");
	}
	
	public void m2() {
		System.out.println("MyIFImpl m2()");
	}
}
