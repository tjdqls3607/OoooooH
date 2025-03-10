package jdbc.transaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

// JDBC 를 이용한 MYSQL DB Transaction Test
public class TransactionTest {

    public static void main(String[] args) {
        Connection con = null;
        PreparedStatement pstmt = null;

        String sql = "insert into customer values(?,?);";
        int ret = -1;

        try {
            // JDBC의 Connection 객체는 default 로 autocommit 이 true 로 설정되어 있음.
            con = DBManager.getConnection();

            // transaction 시작
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

            pstmt.setInt(1, 3);
            pstmt.setString(2, "삼길동");

            ret = pstmt.executeUpdate();
            System.out.println(ret);

            // 모든 transaction 작업 완료
               con.commit();  // <=생략되면 DB에 반영되지 않는다.

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                con.rollback();
            } catch (SQLException se) {
                se.printStackTrace();
            }


        } finally {
            DBManager.releaseConnection(pstmt, con);
        }

    }
}
