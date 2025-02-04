package ch13;

public class Test {
    public static void main(String[] args) {
        // gengeric T
        Box<String> box1 = new Box<>();
        box1.content = "Hello";

        Box<Integer> box2 = new Box<>();
        box2.content = 10;
    }
}
