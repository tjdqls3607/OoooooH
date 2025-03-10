package ch16.ex4;

public class Person {
    public void action (Calculable calculable) {
        int result = calculable.calculate(6, 3);
        System.out.println(result);
    }
}
