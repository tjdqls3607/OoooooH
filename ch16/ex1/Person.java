package ch16.ex1;

public class Person {
    // Person 은 전달되는 일을 수행
    public void action(Workable workable) {
        workable.work("홍길동", "코딩");
    }

    public void action2(Object o) {

    }
}
