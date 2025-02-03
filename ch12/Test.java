package ch12;

public class Test {
    public static void main(String[] args) {
        // Boxing
        Integer obj = 100;
        System.out.println(obj);

        // Unboxing
        int value = obj;
        System.out.println(value);

        int result = obj + 100; // 자동으로 연산자에 의해 unboxing
        System.out.println(result);
    }
}
