package Servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class lenhDB {

    public static UserAccount timUser(Connection conn, String username, String password) throws SQLException {
        String sql = "Select * from user_account a  where a.UserName = ? and a.password= ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, username);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            String email = rs.getString("email");
            int admin = rs.getInt("Admin");
            int libMan = rs.getInt("LibMan");
            UserAccount user = new UserAccount();
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setAdmin(admin);
            user.setLibMan(libMan);
            return user;
        }
        return null;
    }

    public static UserAccount findUser(Connection conn, String username) throws SQLException {

        String sql = "Select a.Username, a.Password, a.Email from user_account a  where a.Username = ? ";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, username);

        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            String password = rs.getString("Password");
            String email = rs.getString("Email");
            UserAccount user = new UserAccount();
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            return user;
        }
        return null;
    }

 

 

    public static List<UserAccount> timtktheousername(Connection conn, String txt) throws SQLException {
        String sql = "Select * from user_account where Username like '%" + txt + "%'";

        PreparedStatement pstm = conn.prepareStatement(sql);

        ResultSet rs = pstm.executeQuery();
        List<UserAccount> list = new ArrayList<UserAccount>();

        while (rs.next()) {
            String username = rs.getString("Username");
            String email = rs.getString("Email");
            String password = rs.getString("Password");
            int admin = rs.getInt("Admin");
            int libMan = rs.getInt("LibMan");

            UserAccount usr = new UserAccount();
            usr.setUsername(username);
            usr.setEmail(email);
            usr.setPassword(password);
            usr.setAdmin(admin);
            usr.setLibMan(libMan);
            list.add(usr);
        }
        return list;
    }

    public static List<UserAccount> danhsachtk(Connection conn) throws SQLException {
        String sql = "Select a.Username, a.Email, a.Password, a.Admin, a.LibMan from user_account a ";

        PreparedStatement pstm = conn.prepareStatement(sql);

        ResultSet rs = pstm.executeQuery();
        List<UserAccount> list = new ArrayList<UserAccount>();

        while (rs.next()) {
            String username = rs.getString("Username");
            String email = rs.getString("Email");
            String password = rs.getString("Password");
            int admin = rs.getInt("Admin");
            int libMan = rs.getInt("LibMan");

            UserAccount usr = new UserAccount();
            usr.setUsername(username);
            usr.setEmail(email);
            usr.setPassword(password);
            usr.setAdmin(admin);
            usr.setLibMan(libMan);
            list.add(usr);
        }
        return list;
    }

    public static UserAccount timtaikhoan(Connection conn, String username) throws SQLException {
        String sql = "Select a.Username, a.Email, a.Password ,a.Admin ,a.LibMan from user_account a  where a.Username = ? ";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, username);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            String password = rs.getString("password");
            String email = rs.getString("email");
            int admin = rs.getInt("admin");
            int libMan = rs.getInt("libMan");
            UserAccount usr = new UserAccount(username, email, password, admin, libMan);
            return usr;
        }
        return null;
    }

    public static void suataikhoan(Connection conn, String email, String password, int admin, int libMan, String username) throws SQLException {
        String sql = "Update user_account a set a.Email=?, a.Password=?, a.Admin=?,  a.LibMan=? where Username=? ";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        pstm.setString(2, password);
        pstm.setInt(3, admin);
        pstm.setInt(4, libMan);
        pstm.setString(5, username);
        pstm.executeUpdate();
    }

    public static void themtaikhoan(Connection conn, UserAccount user) throws SQLException {
        String sql = "Insert into user_account(Username, Email, Password, Admin, LibMan) values (?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, user.getUsername());
        pstm.setString(2, user.getEmail());
        pstm.setString(3, user.getPassword());
        pstm.setInt(4, user.getAdmin());
        pstm.setInt(5, user.getLibMan());
        pstm.executeUpdate();
    }

    public static void xoaTK(Connection conn, String username) throws SQLException {
        String sql = "Delete From user_account where Username= ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, username);
        pstm.executeUpdate();
    }

    public static void insertUserAccount(Connection conn, UserAccount user) throws SQLException {
        String sql = "Insert into user_account(Username, Email, Password, Admin, LibMan) values (?,?,?,0,0)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, user.getUsername());
        pstm.setString(2, user.getEmail());
        pstm.setString(3, user.getPassword());
        pstm.executeUpdate();
    }

}
