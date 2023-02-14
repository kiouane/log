import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String uname = request.getParameter("uname");
		String pass = String.valueOf(request.getParameter("pass"));

		String JDBC_DRIVER ="com.mysql.jdbc.Driver";
		String DB_URL = "jdbc:mysql://localhost/user";
		String DB_USER = "user";
		String DB_PASS = "1181";
		String SQL = "SELECT * FROM login WHERE uname='" + uname + "';";

		try{
			Class.forName(JDBC_DRIVER);
			Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
			Statement smt = conn.createStatement();
			ResultSet result = smt.executeQuery(SQL);

			if(result.next()){
				String pwd = result.getString("pass");
				if(pwd.equals(pass)){
					HttpSession session = request.getSession(true);
					session.setAttribute("login_status","yes");
					session.setAttribute("uname",uname);
					RequestDispatcher rd = request.getRequestDispatcher("portal.jsp");
					rd.forward(request, response);
				}
				else{
					HttpSession session = request.getSession(true);
					session.setAttribute("login_status","Invalid password");
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
				}
			}
			else{
				HttpSession session = request.getSession(true);
				session.setAttribute("login_status","Invalid username");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}
		}
		catch(Exception e){
			out.println("<h4 style='color:red'>" + e.toString() + "</h4>");
		}
	}
}