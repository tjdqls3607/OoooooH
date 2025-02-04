package ch13;

// 뭔가를 빌려주는 기능을 표현
// 뭔가의 타입을 여러개로 표현 (Car, Home)
public interface Rentable<P>{
//    String rent();
    P rent();
}
