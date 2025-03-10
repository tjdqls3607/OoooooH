package ch16;

public class Test {
    public static void main(String[] args) {
        // 람다를 사용하지 않았을 때
//        {
//            //Calculable 이용 덧셈
//            Calculable calcPlus = new CalculableImplPlus();
//            calcPlus.calculate(10, 20);
//
//            // Calcuable 이용 뺄셈
//            Calculable calcMinus = new CalculableImplMinus();
//            calcMinus.calculate(10, 20);
//        }

        {
            //Calculable 파라미터를 가진 메소드 호출
            Calculable calcPlus = new CalculableImplPlus();
            action(calcPlus);

            // Calcuable 파라미터를 가진 메소드 호출
            Calculable calcMinus = new CalculableImplMinus();
            action(calcMinus);

            // 익명 클래스 객체를 이용 덧셈
            action(new Calculable() {
                @Override
                public void calculate(int x, int y) {
                    System.out.println(x + y);
                }
            });

//          익명 클래스 객체 이용 뺄셈
            action(new Calculable() {
                @Override
                public void calculate(int x, int y) {
                    System.out.println(x - y);
                }
            });

            // 람다식 (더 간단히 구현)
            // 컴파일러 입장에서는 Functioanl Interface 를 구현한 객체를 어떻게 처리할 지는
            // 인터페이스에 있는 메소드의 파라미터와 그것을 구현하는 코드
            action( (x, y) -> { System.out.println(x + y); }   );
            action( (x, y) -> { System.out.println(x - y); }   );
            // 람다는 Functional Interface 에만 사용
        }

    }

    // Functional Interfae 타입의 파라미터
    public static void action(Calculable calculable) {
        // 하나의 메소드만 호출가능
        calculable.calculate(10, 20);
    }
}
