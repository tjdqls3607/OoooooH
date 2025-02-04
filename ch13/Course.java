package ch13;


//과목 등옥
// Course 가 generic 타입을 사용 X
// Course 의 메소드가 파라미터를 갖는데, 그 파라미터 타입(Applicant) 이 generic 타입을 가진다.
public class Course {
    public static void registerCouse1(Applicant<?> applicant) {
        System.out.println(applicant.kind);
    }

    public static void registerCouse2(Applicant<? extends Student> applicant) {

    }
    public static void registerCouse3(Applicant<? super Worker> applicant) {}
}
