package ch16.ex4;

// 1개의 추상메소드 = @FunctionalInterface
@FunctionalInterface
public interface Calculable {
    int calculate(int x, int y);   // <- 추상메소드
}
