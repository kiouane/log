import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession(true);
		session.setAttribute("login_status","Logged out");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);		
	}
}