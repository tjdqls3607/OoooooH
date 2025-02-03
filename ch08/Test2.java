package ch08;

public class Test2 {
    public static void main(String[] args) {
        // 타입의 다형성
        // interface 타입, 구현 타입
        {
//        IFC ifc = new IFImpl();   // implements IFC O
//        IFC ifc2 = new IFImpl();    // implements IFB X
//        IFB ifb = new IFImpl();     // implements IFB O
        IFA ifa = new IFImpl();     // implements IFB O (상속받은 객체이기 때문)
        }

        // 인터페이스 타입 선언 및 메소드 호출
        // 선언된 인터페이스에 정의된 메소드만 호출 가능
        {
            IFB ifb = new IFImpl();
            ifb.ma();
            ifb.mb();
//            ifb.mc(); //X
            IFA ifa = new IFImpl();
            ifa.ma();
//            ifa.mb(); //X
        }
    }
}
