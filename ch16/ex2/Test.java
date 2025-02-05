package ch16.ex2;

import ch16.ex1.Person;

public class Test {
    public static void main(String[] args) {
        ch16.ex1.Person person = new Person(); // 일하는 사람을 만들고
        // 그 사람에게 할 일을 부여
        // 일의 종류머더 구현 클래스 및 객체를 만들지 않고
        // 일 각각을 람다식으로 표현전달

        
        // 실행문 한 개일 경우 {} 생략 가능


        person.action((name, job) -> {
            System.out.println(name + "이" + job + "을 수행합니다.");
        });

        person.action((name, job) -> {
            System.out.println(name + "이" + job + "을 수행하지 않습니다.");
        });

        person.action2( (content) -> System.out.println( content + "라고 말했다.") );

        person.action2( (content) -> System.out.println( content + "라고 말하지 않았다.") );


    }
}
