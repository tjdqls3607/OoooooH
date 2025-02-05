package ch16.ex4;

public class Test {

    //Method Reference <- Lambda 간단 표현식
    public static void main(String[] args) {
        Person person = new Person();

        // Computer.staticMethod 를 호출1
        person.action( (x,y) ->{
            return Computer.staticMethod(x, y);
        });

        // Computer.staticMethod 를 호출2 (더 간단)
        person.action( (x,y) -> Computer.staticMethod(x, y) );

        //Method Reference (static)
        // 파라미터와 그 사용이 명확할 때
        person.action(Computer :: staticMethod);

        // Computer 객체의 instanceMethod 를 호출
        Computer computer = new Computer();
        person.action( (x,y) -> {
            return computer.instanceMethod(x, y);
        });

        // Computer 객체의 instanceMethod를 호출2
        person.action( (x,y) -> computer.instanceMethod(x, y) );

        // Method Reference ( non static )
        // 파라미터와 그 사용이 명확할 때
        person.action(computer :: instanceMethod);
    }
}
