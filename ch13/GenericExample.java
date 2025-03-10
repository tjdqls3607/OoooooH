package ch13;

public class GenericExample {
    public static void main(String[] args) {
        //모든 사람이 신청 가능
        Course.regiseterCourse1(new Applicant<Person>(new Person()));
        Course.regiseterCourse1(new Applicant<Worker>(new Worker()));
        Course.regiseterCourse1(new Applicant<Student>(new Student()));
        Course.regiseterCourse1(new Applicant<HighStudent>(new HighStudent()));
        Course.regiseterCourse1(new Applicant<MiddleStudent>(new MiddleStudent()));
        System.out.println();

        // 학생만 신청 가능
        //Course.registerCourse2(new Applicant<Person> (new Person())); (x)
        //Course.registerCourse2(new Applicant<Worker> (new Worker())); (x)
        Course.regiseterCourse2(new Applicant<Student>(new Student()));
        Course.regiseterCourse2(new Applicant<HighStudent>(new HighStudent()));
        Course.regiseterCourse2(new Applicant<MiddleStudent>(new MiddleStudent()));
        System.out.println();

        //직장인 및 일반인만 신청 가능
        Course.regiseterCourse3(new Applicant<Person>(new Person()));
        Course.regiseterCourse3(new Applicant<Worker>(new Worker()));
//        Course.regiseterCourse3(new Applicant<Student>(new Student()));   (x)
//        Course.regiseterCourse3(new Applicant<HighStudent>(new HighStudent()));  (x)
//        Course.regiseterCourse3(new Applicant<MiddleStudent>(new MiddleStudent()));   (x)


    }
}
