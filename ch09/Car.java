package ch09;

public class Car {

    // 필드 익명 객체
    private Tire tire1 = new Tire();
//    private Tire tire2 = new Tire();    // roll()을 다르게 구현 - 익명 객체 이용
    private Tire tire2 = new Tire() {
        @Override
        public void roll() {
            System.out.println("익명 타이어가 굴러간다.");
    }
};

    public void run() {
        tire1.roll();
        tire2.roll();
    }
}
