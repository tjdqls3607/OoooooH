package ch07.abstr;

public class Test {

	public static void main(String[] args) {
		MyMouseAdaptor adaptor = new MyMouseAdaptor();
		adaptor.click();
		
		YourMouseAdaptor adaptor2 = new YourMouseAdaptor();
		adaptor2.click();
		adaptor.over();

	}

}
