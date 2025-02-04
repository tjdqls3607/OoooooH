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

        //인터페이스와 generic
//        HomeAgency homeAgency = new HomeAgency();
//        Home home = homeAgency.rent();
//
//        CarAgency carAgency = new CarAgency();
//        Car car = carAgency.rent();

        // 인터펭스를 쓰는 더 나은 코드
        Rentable<Home> homeAgency = new HomeAgency();
        Home home = homeAgency.rent();

        Rentable<Car> carAgency = new CarAgency();
        Car car = carAgency.rent();

        // 메소드와 generic
        // main() 과 별개의 static method 생성
        // Test 클래스에는 generic 이 없다.
        Box<Integer> box3 = boxing(100);
        System.out.println(box3.content);

        Box<String> box4 = boxing("Hello");
        System.out.println(box4.content);
    }

    // Parameter 로 T 타입의 객체를 받는다.
    // Box<T> 객체를 return
    public static <T> Box<T> boxing(T t){
        Box<T> box = new Box<>();
        box.content = t;
        return box;
    }

}
