package ch13;

// Home 을 빌려주ㅡㄴ 실제 구현체
public class HomeAgency implements Rentable<Home>{

    @Override
    public Home rent() {
        return new Home();
    }
}
