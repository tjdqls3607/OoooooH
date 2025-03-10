package ch16;

// 1개의 추상메소드 = @FunctionalInterface
@FunctionalInterface
public interface Calculable {
    void calculate(int x, int y);   // <- 추상메소드
}
