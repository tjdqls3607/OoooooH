package ch16;

// 덧셈 수행 구현
public class CalculableImplPlus implements Calculable {

    @Override
    public void calculate(int x, int y) {
        System.out.println(x + y);
    }
}
