package ch11;

// 사용저 정의 예외, throw
public class Test3 {
    public static void main(String[] args) {
        Account account = new Account();
        // 입금
        account.deposit(100000);
        System.out.println(account.getBalance());

        //출금
        try {
            account.withdraw(500000);
        } catch (InsufficientException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }

        System.out.println(account.getBalance());

    }
}
