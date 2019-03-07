package kr.co.acomp.hello.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestJDBC {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3306/spring"
				+ "?serverTimezone=Asia/Seoul&useSSL=true";
		  String user= "spring";
		  String pass= "spring";
		 

		 
		  Connection conn = null;
		 
		  try
		  {
		   Class.forName("com.mysql.cj.jdbc.Driver");
		   System.out.println("드라이버 검색 성공");
		   conn =DriverManager.getConnection(url, user, pass);
		   System.out.println("접속성공"+conn);
		  
		  }
		  catch(ClassNotFoundException e)
		  {
		   System.out.println("드라이버 검색 실패");
		   e.printStackTrace();
		  }
		  catch(SQLException e)
		  {
		   e.printStackTrace();
		  }
	}

}
