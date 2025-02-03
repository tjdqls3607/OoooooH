package ch11;

import java.io.FileInputStream;

public class Test {
    public static void main(String[] args) {
        // Error vs Exception
//      m1();

        m2();

        m3();
    }
// Exception in thread "main" java.lang.StackOverflowError
    static void m() {
        m();
    }
// Exception in thread "main" java.lang.NullPointerException
// compile error X
    static void m2() {
        String str = null;
        System.out.println(str.length());
    }
// Compile Error O
// Unhandled exception type file NtFoundException
    static void m3() {
        //throws FileNotFoundException 로 먼둘어진 메소드를 호출 할 때 만약 파일이 없으면 어떻게 대웅?
        // 대응책이 없으면 문법 오류 발생
//        FileInputStream fis = new FileInputStream("readme.md");
    }
}
