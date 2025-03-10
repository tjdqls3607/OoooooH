package ch11;

// 사용자 정의 예외
//extends RuntimeException 일 경우 compile 오류 발생 X
public class InsufficientException extends RuntimeException {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    public InsufficientException() {}

    public InsufficientException(String message) {
        super(message);
    }
}
