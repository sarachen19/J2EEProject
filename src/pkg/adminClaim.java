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
 * Servlet implementation class adminClaim
 */
@WebServlet("/adminClaim")
public class adminClaim extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminClaim() {
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
		int claimid = Integer.parseInt(request.getParameter("claimid"));
		int status = Integer.parseInt(request.getParameter("status"));

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3306/nov23-project?autoReconnect=true&useSSL=false";
			String username = "root";
			String password = "12345";
			Connection connection = DriverManager.getConnection(dbURL, username, password);
			PreparedStatement prepStmt = connection.prepareStatement("UPDATE claim SET status=? WHERE (claimId = ?)");
			if (status == 1)
				prepStmt.setString(1, "approved");
			else
				prepStmt.setString(1, "rejected");
			prepStmt.setInt(2, claimid);
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
