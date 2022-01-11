package add;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Addproject")
public class Addproject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		String desc=request.getParameter("desc");
		String[] devs=request.getParameterValues("dev");
		try{
			try {
			Class.forName("com.mysql.jdbc.Driver");
			}catch (ClassNotFoundException e) {
					e.printStackTrace();
			}
			Connection  con;

			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
			
			
			PreparedStatement pstmt=con.prepareStatement("insert into projet (name, description) values(?,?)");

			pstmt.setString(1,name);
			pstmt.setString(2,desc);
			
			pstmt.executeUpdate();
						
			pstmt.close();


			
			ResultSet resultSet = null;

			PreparedStatement pstmt2=con.prepareStatement(" select id from projet where name=? ");
			
			pstmt2.setString(1,name);

			resultSet = pstmt2.executeQuery();
			
			int projetId=0;
			
			if (resultSet.next())
			{
				 projetId=resultSet.getInt("id");
			}

	        resultSet.close();
			resultSet = null;

			
			PreparedStatement pstmt1=con.prepareStatement("insert into projet_dev (projet_id, dev_id) values(?,?)");
			
			for(int i=0;i<devs.length;i++) {
				
				pstmt1.setInt(1,projetId);
				pstmt1.setInt(2,Integer.parseInt(devs[i]));
				pstmt1.executeUpdate();
				
			}
			PreparedStatement pstmt4=con.prepareStatement("insert into log (user_id, action,action_id) values('1',?,'3')");
			pstmt4.setString(1," a ajouté un nouveau projet : "+name);
			pstmt4.executeUpdate();
			pstmt4.close();
			/********
			 * action_id=1 ---> add user
			 * action_id=2 ---> del user
			 * action_id=3 ---> add projet
			 * action_id=4 ---> del projet
			 * action_id=5 ---> signaler un bug
			 *******/
			pstmt1.close();		
			response.sendRedirect("AdminProjectAdd.jsp");
			HttpSession  session2=request.getSession(true);
            session2.setAttribute("project", "Ajout du nouveau projet avec succès !");
		}catch(SQLException e){
			System.out.print("ERREUR AJOUTER UN PROJET "+e);
		}
			
			
	
	
	
	}

}
