package delete;

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

@WebServlet("/Delprojet")
public class Delprojet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int dev=Integer.parseInt(request.getParameter("id"));
		
		try{
			try {
			Class.forName("com.mysql.jdbc.Driver");
			}catch (ClassNotFoundException e) {
					e.printStackTrace();
			}
			Connection  con;

			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
			
			PreparedStatement pstmt3=con.prepareStatement("select name FROM projet WHERE id=?");

			pstmt3.setInt(1,dev);
			
			ResultSet res=pstmt3.executeQuery();
			
			res.next();
						
			PreparedStatement pstmt4=con.prepareStatement("insert into log (user_id, action,action_id) values('1',?,'4')");
			pstmt4.setString(1,"a supprimé un projet : "+res.getString(1));
			pstmt4.executeUpdate();
			pstmt4.close();			
			pstmt3.close();
			/********
			 * action_id=1 ---> add user
			 * action_id=2 ---> del user
			 * action_id=3 ---> add projet
			 * action_id=4 ---> del projet
			 * action_id=5 ---> signaler un bug
			 *******/
			
			PreparedStatement pstmt2=con.prepareStatement("DELETE FROM bug WHERE project_id=?");

			pstmt2.setInt(1,dev);
			
			pstmt2.executeUpdate();
			
			pstmt2.close();
			
			PreparedStatement pstmt1=con.prepareStatement("DELETE FROM projet_dev WHERE projet_id=?");

			pstmt1.setInt(1,dev);
			
			pstmt1.executeUpdate();
			
			pstmt1.close();
			
			PreparedStatement pstmt=con.prepareStatement("DELETE FROM PROJET WHERE id=?");

			pstmt.setInt(1,dev);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
			
			
			response.sendRedirect("AdminProjectDel.jsp");
			HttpSession  session2=request.getSession(true);
            session2.setAttribute("projectd", "Suppression d'un projet avec succès !");
		}catch(SQLException e){
			System.out.print("ERREUR SUPPRIMER PROJECT - "+e);
		}
			
			
	
	}

}
