package analyse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pack.user;


@WebServlet("/Unsolved")
public class Unsolved extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		user U =(user) session.getAttribute("profile");
		
		int id_user=U.getId();
		String status=request.getParameter("status");
		String comment=request.getParameter("comment");
		int bug_id=Integer.parseInt(request.getParameter("id_bug"));

		try{
			try {
			Class.forName("com.mysql.jdbc.Driver");
			}catch (ClassNotFoundException e) {
					e.printStackTrace();
			}
			Connection  con;

			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
			
			
			PreparedStatement pstmt=con.prepareStatement("update bug set comment = ? where id = ? ");

			pstmt.setString(1,comment);
			pstmt.setInt(2,bug_id);
			
			pstmt.executeUpdate();
						
			pstmt.close();

			PreparedStatement pstmt1=con.prepareStatement("update bug set status = ? where id = ? ");

			pstmt1.setString(1,status);
			pstmt1.setInt(2,bug_id);
			
			pstmt1.executeUpdate();
						
			pstmt1.close();
			
			PreparedStatement pstmt9=con.prepareStatement("select name from bug where id = ?");
			pstmt9.setInt(1,bug_id);
    		ResultSet res9=pstmt9.executeQuery();
    		res9.next();
						
			PreparedStatement pstmt4=con.prepareStatement("insert into log (user_id, action,action_id,extra) values(?,?,'7',?)");
			pstmt4.setInt(1,id_user);
			pstmt4.setString(2," a analysé le bug : "+res9.getString(1)+" ,et il change son status à irésolus ");
			pstmt4.setString(3,comment);
			pstmt4.executeUpdate();
			pstmt4.close();
			pstmt9.close();			

			/********
			 * action_id=1 ---> add user
			 * action_id=2 ---> del user
			 * action_id=3 ---> add projet
			 * action_id=4 ---> del projet
			 * action_id=5 ---> signaler un bug
			 * action_id=6 ---> analyse en progress
			 * action_id=7 ---> analyse Unsolved
			 *******/
			
			response.sendRedirect("./Analyseur.jsp");
			
		}catch(SQLException e){
			
			System.out.print("ERREUR UPDATE UN BUG "+e);
			
		}
			
			
	
	
	
	}
       
}
