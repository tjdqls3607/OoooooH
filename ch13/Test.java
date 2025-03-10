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

        // 제한된 generic T
        System.out.println(compare(10, 20)); //정수
        System.out.println(compare(10.5, 20.4)); //실수
//      System.out.println(compare("Hello", "World"));
    }

    // Parameter 로 T 타입의 객체를 받는다.
    // Box<T> 객체를 return
    public static <T> Box<T> boxing(T t){
        Box<T> box = new Box<>();
        box.content = t;
        return box;
    }

    // T는 모든 타입 객체가 아닌 Number 를 포함한 Number 의 하위 클래스로 제한
    public static <T extends Number> boolean compare(T t1, T t2){
        return t1.doubleValue() == t2.doubleValue();
    }

    //제한된 타입은 super 를 사용 (상위 클래스) 할 수 없다.
//  public static <T super Number> boolean compare(T t1, T t2){
//      return t1.doubleValue() == t2.doubleValue();
//  }
}
