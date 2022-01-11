package Fix;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/corriger_new")
public class corriger_new extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String id=request.getParameter("id_bug");
		HttpSession session = request.getSession();
		session.setAttribute("id_bug",id);
		
		request.getRequestDispatcher("/DevFixingNew.jsp").forward(request, response);
		
	}

	
	
}
