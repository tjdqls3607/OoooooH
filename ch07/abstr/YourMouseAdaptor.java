package ch07.abstr;

public class YourMouseAdaptor extends MouseAdaptor {

	@Override
	public void over() {
		System.out.println("YourMouseAdaptor over()");
		
	}

	@Override
	public void out() {
		System.out.println("YourMouseAdaptor out()")	;	
	}
	
	public void click() {
		System.out.println("YourMouseAdaptor click")	;	
	}
	
}
