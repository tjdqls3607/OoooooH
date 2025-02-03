package ch11;

public class Account {
    private long balance;

    public long getBalance() {
        return this.balance;
    }

    public void deposit(int money) {
        this.balance += money;
    }

    public void withdraw(int money) throws InsufficientException {
        // 잔액 부족
        if (this.balance < money) {
            // 이곳에서 직접 부족관련 처리를 하지 않고
            // 위로 toss + BL 의 의미 부여
            // 사용자 정의 예외 처리 (발생 = 객체 생성 + toss)
//            InsufficientException ex = new InsufficientException("잔액이 부족합니다.");
//            throw ex;

            throw new InsufficientException("잔액이 부족합니다."); //간단
        }

        this.balance -= money;
    }
}
