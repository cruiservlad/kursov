package kursovoy.jdbc;

import kursovoy.model.*;

//import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by zaporozhec on 5/6/15.
 */
public class JDBCUtil {
    final static String jdbcDriver = "com.mysql.jdbc.Driver";
    final static String connectionString = "jdbc:mysql://localhost/myblog";
    final static String userName = "root";
    final static String password = "482701";

    /*public List<User> getAllUsers() {
        List<User> userList = new ArrayList<User>();
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName(jdbcDriver);
            conn = DriverManager.getConnection(connectionString, userName, password);
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM USERS";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                userList.add(new User(rs.getInt("USER_ID"), rs.getString("FIRST_NAME"), rs.getString("LAST_NAME"), rs.getInt("AGE")));
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                try {
                    if (conn != null)
                        conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            return userList;
        }
    }*/

    public List<User> getMyProfile(String email, String pass)
    {
    	//System.out.println(email+" "+pass);
    	List<User> userList = new ArrayList<User>();
    	Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName(jdbcDriver);
            conn = DriverManager.getConnection(connectionString, userName, password);
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM `user` WHERE `email`='" +email+ "' AND `pass` = '"+pass+"'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
            	 userList.add(new User(rs.getInt("idx"), rs.getString("FirstName"), rs.getString("SecondName"), rs.getInt("Age"), rs.getBoolean("Admin"), rs.getString("Login")));
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                try {
                    if (conn != null)
                        conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            return userList;
        }
    }
    
    public List<ErrorEmail> getAllEmail(String email)
    {
    	//System.out.println(email+" "+pass);
    	List<ErrorEmail> userList = new ArrayList<ErrorEmail>();
    	Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName(jdbcDriver);
            conn = DriverManager.getConnection(connectionString, userName, password);
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT `idx` FROM `user` WHERE `email`='" +email+ "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
            	userList.add(new ErrorEmail(rs.getInt("idx")));
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                try {
                    if (conn != null)
                        conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            return userList;
        }
    }
    
    public List<ErrorLogin> getAllLogin(String login)
    {
    	//System.out.println(email+" "+pass);
    	List<ErrorLogin> userList = new ArrayList<ErrorLogin>();
    	Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName(jdbcDriver);
            conn = DriverManager.getConnection(connectionString, userName, password);
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT `idx` FROM `user` WHERE `Login`='" +login+ "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
            	userList.add(new ErrorLogin(rs.getInt("idx")));
            }
            
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                try {
                    if (conn != null)
                        conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            return userList;
        }
    }
    
    public List<Post> getAllPost() {
    	List<Post> postList = new ArrayList<Post>();
    	Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName(jdbcDriver);
            conn = DriverManager.getConnection(connectionString, userName, password);
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM `post` WHERE `public` = '1' ORDER BY `datePublic` DESC LIMIT 10";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
            	postList.add(new Post(rs.getString("datePublic"), rs.getString("HeaderPost"), rs.getString("TextPost"), rs.getString("idPostMan"), rs.getInt("idx")));
            }
            
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                try {
                    if (conn != null)
                        conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            return postList;
        }
    }
    
    public boolean RegisterUser(String userEmail, String userPass, String uName, String uSurName, String uGroup, String uUniver, String uTextArea, String uAge, String userLogin) {
    	Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName(jdbcDriver);
            conn = DriverManager.getConnection(connectionString, userName, password);
            String sql;
            sql = "INSERT INTO `user` (`FirstName`, `SecondName`, `Age`, `email`, `pass`, `Login`, `univer`, `group`, `FutereUser`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uName);
            stmt.setString(2, uSurName);
            stmt.setString(3, uAge);
            stmt.setString(4, userEmail);
            stmt.setString(5, userPass);
            stmt.setString(6, userLogin);
            stmt.setString(7, uUniver);
            stmt.setString(8, uGroup);
            stmt.setString(9, uGroup);
            stmt.executeUpdate();



            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                try {
                    if (conn != null)
                        conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            return true;
        }
    }
    
    public boolean NewPost(String Text, String Header, String Public, String login) {
    	Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName(jdbcDriver);
            conn = DriverManager.getConnection(connectionString, userName, password);
            String sql;
            sql = "INSERT INTO `post` (`TextPost`, `HeaderPost`, `public`, `idPostMan`) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, Text);
            stmt.setString(2, Header);
            stmt.setString(3, Public);
            stmt.setString(4, login);
            stmt.executeUpdate();



            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                try {
                    if (conn != null)
                        conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            return true;
        }
    }

    /*public List<User> getUser(String userId) {
        List<User> userList = new ArrayList<User>();
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName(jdbcDriver);
            conn = DriverManager.getConnection(connectionString, userName, password);
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM USERS WHERE USER_ID='" + userId + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                userList.add(new User(rs.getInt("USER_ID"), rs.getString("FIRST_NAME"), rs.getString("LAST_NAME"), rs.getInt("AGE")));
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                try {
                    if (conn != null)
                        conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            return userList;
        }
    }*/
}
