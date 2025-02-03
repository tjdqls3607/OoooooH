package ch09;

public class Test {
    public static void main(String[] args) {
        // 필드에 익명 객체
        Car car = new Car();
        car.run();

        // 메소드 파라미터에 익명 객체, 인터페이스 타입 선언 객체 생성
        Home home = new Home();
        // RemoteControl 인터페이스를 구현한 클래스를 만들고
        // 그 객체를 전달해야 하지만, 간단히 익명 객체를 생성전달할 수 있다.
        home.use(new RemoteControl() {

            @Override
            public void turnOn() {
                System.out.println("익명 remote control 사용");
            }
        });

        home.use(new RemoteControl() {

            @Override
            public void turnOn() {
                System.out.println("익명 remote control 사용2");
            }
        });

        // static inner class
//        MyClass mc = new MyClass();
//        MyClass mc2 = new MyClass2();   // 오류 발생
        MyClass3 mc3 = new MyClass3();
    }

    class MyClass2{}
    static class MyClass3{}
}
// class MyClass()