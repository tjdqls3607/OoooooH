package ch07.abstr;

public class MyMouseAdaptor extends MouseAdaptor {

	@Override
	public void over() {
		System.out.println("MyMouseAdaptor over()");
		
	}

	@Override
	public void out() {
		System.out.println("MyMouseAdaptor out()")	;	
	}

}
