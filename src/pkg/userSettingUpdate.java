package pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userSettingUpdate
 */
@WebServlet("/userSettingUpdate")
public class userSettingUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public userSettingUpdate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String uname = request.getParameter("username");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String cellno = request.getParameter("cellno");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		// response.getWriter().append(uname + fname + address);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3306/nov23-project?autoReconnect=true&useSSL=false";
			String username = "root";
			String password = "12345";
			Connection connection = DriverManager.getConnection(dbURL, username, password);
			PreparedStatement prepStmt = connection.prepareStatement(
					"UPDATE user SET fname=?, lname=?, cellno=?, email=?, address=?  WHERE (uname = ?)");
			prepStmt.setString(1, fname);
			prepStmt.setString(2, lname);
			prepStmt.setString(3, cellno);
			prepStmt.setString(4, email);
			prepStmt.setString(5, address);
			prepStmt.setString(6, uname);
			prepStmt.executeUpdate();
			prepStmt.close();
			connection.close();

		} catch (SQLException e) {
			for (Throwable t : e)
				t.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
