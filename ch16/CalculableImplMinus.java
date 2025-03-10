package ch16;

// 뺄셈 수행 구현
public class CalculableImplMinus implements Calculable {

    @Override
    public void calculate(int x, int y) {
        System.out.println(x - y);
    }
}
