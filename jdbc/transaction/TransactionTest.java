package jdbc.transaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

// JDBC 를 이용한 MySQL DB Transaction Test
// transaction 작업의 성공 여부를 boolean 변수로 처리
public class TransactionTest {

    public static void main(String[] args) {
        Connection con = null;
        PreparedStatement pstmt = null;

        String sql = "insert into customer values ( ?, ? );";
        int ret = -1;

        // transaction 성공 여부
        boolean isSuccess = false;

        try {
            // JDBC 의 Connection 객체는 default 로 autocommit 이 true 로 설정되어 있음.
            con = DBManager.getConnection();

            // transaction  시작
            // autocommit 을 off
            con.setAutoCommit(false);

            pstmt = con.prepareStatement(sql);

            // insert 3건
            pstmt.setInt(1, 1);
            pstmt.setString(2, "홍길동");

            ret = pstmt.executeUpdate();
            System.out.println(ret);


            pstmt.setInt(1, 2);
            pstmt.setString(2, "이길동");

            ret = pstmt.executeUpdate();
            System.out.println(ret);

            pstmt.setInt(1, 3); // 3 -> 1 : Dup 발생
            pstmt.setString(2, "삼길동");

            ret = pstmt.executeUpdate();
            System.out.println(ret);

            // 모든 transaction 작업 완료
            isSuccess = true;

        }catch(SQLException e) {
            e.printStackTrace();
            isSuccess = false;

        }finally {

            try {
                if( isSuccess ) con.commit();
                else con.rollback();
            }catch(SQLException se) {
                se.printStackTrace();
            }

            DBManager.releaseConnection(pstmt, con);
        }

    }

}