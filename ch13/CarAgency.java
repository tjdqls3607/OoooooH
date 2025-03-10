package ch13;


// Car를 빌려주는 실제 구현체
// generic P 를 가진 Rentable 인처페이스를 사용하므로 이 때, 타입을 지정
public class CarAgency implements Rentable<Car>{


    @Override
    public Car rent() {
        return new Car();
    }
}
