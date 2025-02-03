package ch11;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;


//자바는 기본적으로 돌다리도 두드려보고 건너라 개념
// 생성자나 메소드를 만들 때 발생할 수 이쑨 문제를 예외로 만들고, 그 상황에 대한 대응책도 미리 만들어 둔다.
// 워크샾 시간에 각 조별로 모든 인원이 한번씩 설명하기
public class Test {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        // Error vs Exception
        {
//            //      m1();
//
//            m2();
//
//            m3();
//
//            m4();   //대응책이 없다.
        }

        // 대응 코드
        {
            // #1 내가 직접 처리 try-catch 로 처리된 m3() 호출
            m3();

            try {
                m4();
            }catch (FileNotFoundException e) {
                System.out.println("예외 처리");
            } finally {
                System.out.println("항상 수행");
            }

            // #3 RuntimeException 처리
            // Throws 가 없어도 자동으로 위로 toss
            // try-catch 적용 가능
            m2();
        }
    }
// Exception in thread "main" java.lang.StackOverflowError
    static void m1() {
        m1();

    }
// Exception in thread "main" java.lang.NullPointerException
// compile error X
    static void m2() {
        String str = null;
        // #3 RuntimeException 처리
        try {
            System.out.println(str.length());
        } catch (NullPointerException e) {
            System.out.println("NullPointerException 발생");
        }

    }
// Compile Error O
// Unhandled exception type file NtFoundException
//    static void m3() {
//        //throws FileNotFoundException 로 먼둘어진 메소드를 호출 할 때 만약 파일이 없으면 어떻게 대웅?
//        // 대응책이 없으면 문법 오류 발생
//        FileInputStream fis = new FileInputStream("readme.md");
//    }

    // 대응코드를 포함한 코드
    static void m3() throws FileNotFoundException {
        //throws FileNotFoundException 로 먼둘어진 메소드를 호출 할 때 만약 파일이 없으면 어떻게 대웅?
        // 대응책이 없으면 문법 오류 발생
        // #1 내가 직접 처리
//        try {
//            FileInputStream fis = new FileInputStream("readme.txt");
//            System.out.println("정상 수행");
//        } catch (IOException e) {
//            System.out.println("파일이 없으면 이렇게 한다.");
//        } finally {
//            System.out.println("항상 수행된다.");
//        }

        // #2 회피 : 나를 호출한 곳으로 toss
        FileInputStream fis = new FileInputStream("readme.md");
    }

    static void m4() throws FileNotFoundException {
        System.out.println("m4()");
    }
}
