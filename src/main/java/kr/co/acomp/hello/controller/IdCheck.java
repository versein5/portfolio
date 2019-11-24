package kr.co.acomp.hello.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * Servlet implementation class IdCheck
 */
@WebServlet(name="check" ,urlPatterns="/check")
public class IdCheck extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("application/json");
		 
		 String id = request.getParameter("id");
		 System.out.println(id);
	      PrintWriter out = response.getWriter();
	    JSONObject json = new JSONObject();
	   
	    String SQL = "SELECT id FROM user WHERE id='" + id + "'";
	    try {
	    	
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String url = "jdbc:mysql://localhost:3306/spring"
				+ "?serverTimezone=Asia/Seoul&useSSL=true";
		
			String user= "spring";
			String pass= "spring";
			Connection conn = null;
			try {
				conn = DriverManager.getConnection(url, user, pass);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Statement st;
			ResultSet rs;
	    try {
	        st = conn.createStatement();
	        rs = st.executeQuery(SQL);


	        if (rs.next()) {

	            out.print("{\"valid\" : false }");
	            json.put("valid", false);
	            System.out.println("false");


	        } else {

	            out.print("{\"valid\" : true }");
	            json.put("valid", true);
	            System.out.println("true");


	        }


	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {

	        out.close();
	    }



	}

}
