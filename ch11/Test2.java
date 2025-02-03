package ch11;

import java.io.FileNotFoundException;

public class Test2 {
    public static void main(String[] args) {
        // throws RuntimeException 계열과 Checked Exception 계열
//        {
//            m1();
//            m2();
//            m3(); //Unchecked Exception
//        }

        {
            try {
                m1();
                m2();
            }catch (ClassNotFoundException e) {
                // 처리 코드
            }catch (FileNotFoundException e){
                //처리 코드
            }

            try {
                m1();
                m2();
            }catch (ClassNotFoundException | FileNotFoundException e) {
                // 처리 코드
            }

            try {
                m1();
                m2();
            }catch (Exception e) {
                // 처리 코드
            }

//            try {
//                m1();
//                m2();
//            }catch (Exception e) {
//                // 처리 코드
//            }catch (FileNotFoundException e){   //오류 발생
//                //처리 코드
//            }

        }

    }

    static void m1() throws ClassNotFoundException {

    }

    static void m2() throws FileNotFoundException {

    }

    static void m3() throws NullPointerException {

    }
}
