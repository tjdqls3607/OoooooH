package ch16.ex3;

public class Test {

    // 리턴이 있는 람다식
    public static void main(String[] args) {
        Person person = new Person();

        // 덧셈
        person.action((x, y) -> {
            return x + y;
        });

        // 뺄셈
        // return 문을 생략 (처리 결과가 자동으로 리턴)
        person.action((x, y) ->  x-y);

        // 곱셈
        person.action((x, y) -> x *y);
    }
}
