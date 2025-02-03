package ch07.methodpoly;

import java.util.Objects;

public class MyClass { // extends Object
	int n;
	String str;
	
	//toString() 재정의하지 않은경우 Object의 toString() 호출한다
//	@Override
//	public String toString() {
//        return "n = " + n + " , str = " + str;
//    }

	
	@Override
	public String toString() {
		return "MyClass [n=" + n + ", str=" + str + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(n, str);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MyClass other = (MyClass) obj;
		return n == other.n && Objects.equals(str, other.str);
	}
	

	
}
