package ch13;

public class Test {
    public static void main(String[] args) {
        // gengeric T
        Box<String> box1 = new Box<>();
        box1.content = "Hello";

        Box<Integer> box2 = new Box<>();
        box2.content = 10;

        // 복수개의 generic
        Product<TV, String> product1 = new Product<>();
        product1.setKind(new TV());
        product1.setModel("OLED");

        Product<Car, String> product2 = new Product<>();
        product2.setKind(new Car());
        product2.setModel("제네시스");
    }
}
