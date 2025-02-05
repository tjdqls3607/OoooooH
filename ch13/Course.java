package ch13;

public class Course {
    public static void regiseterCourse1 (Applicant<?> applicant) {
        System.out.println(applicant.kind.getClass().getSimpleName() + "이(가) Course1을 등록함");
    }

    // 학생만 등록 가능
    public static void regiseterCourse2 (Applicant<? extends Student> applicant) {
        System.out.println(applicant.kind.getClass().getSimpleName() + "이(가) Course2를 등록함");
    }

    // 직장인 및 일반인만 등록 가능
    public static void regiseterCourse3 (Applicant<? super Worker> applicant ) {
        System.out.println(applicant.kind.getClass().getSimpleName() + "이(가) Course3을 등록함");
    }
}
