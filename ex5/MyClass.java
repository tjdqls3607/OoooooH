package ch18.ex5;

import java.io.Serializable;

public class MyClass implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 2L;

    int n;
    String str;

    // transient
    transient String ssn;

    //serialVersionUID가 동일하면 추가된 필드가 있어도 역직렬화가 가능
    int n2;

    // serialVersionUID 가 직렬화 시점의 값과 다르면 역직렬화 불가능
}
