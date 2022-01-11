package add;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BugProject")
public class BugProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String id=request.getParameter("id");
				
		HttpSession session = request.getSession();
		session.setAttribute("id",id);
		
		request.getRequestDispatcher("/AdminBugAdd.jsp").forward(request, response);
	}
}
