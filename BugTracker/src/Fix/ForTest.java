package Fix;

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

@WebServlet("/ForTest")
public class ForTest extends HttpServlet {
private static final long serialVersionUID = 1L;
       
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session = request.getSession(false);
	user U =(user) session.getAttribute("profile");

	String user_name=U.getName();
	int user_id=U.getId();
		int bug_id=Integer.parseInt(request.getParameter("id_bug"));
		String comment=request.getParameter("comment");

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
			
			PreparedStatement pstmt1=con.prepareStatement("update bug set status = 'TESTING' where id = ? ");

			pstmt1.setInt(1,bug_id);
			
			pstmt1.executeUpdate();
						
			pstmt1.close();
			
			PreparedStatement pstmt9=con.prepareStatement("select name from bug where id = ?");
			pstmt9.setInt(1,bug_id);
    		ResultSet res9=pstmt9.executeQuery();
    		res9.next();
						
			PreparedStatement pstmt4=con.prepareStatement("insert into log (user_id, action,action_id,extra) values(?,?,'9',?)");
			pstmt4.setInt(1,user_id);
			pstmt4.setString(2," a corrigé le bug : "+res9.getString(1)+" et il l envoyer pour le retest");
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
			 * action_id=8 ---> corriger bug fixed
			 * action_id=9 ---> corriger bug for test
			 *******/
			
			
			response.sendRedirect("./Dev.jsp");
			
		}catch(SQLException e){
			
			System.out.print("ERREUR ForTest.java - "+e);
			
		}

	}

}
