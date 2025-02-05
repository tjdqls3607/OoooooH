package ch16.ex3;

public class Person {
    public void action (Calculable calculable) {
        int result = calculable.calculate(3, 7);
        System.out.println(result);
    }
}
