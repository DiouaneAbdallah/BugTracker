package add;

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

@WebServlet("/AddBug")
public class AddBug extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		//if(session==null)
		//	response.sendRedirect("./login.jsp");

		
		int id=Integer.parseInt((String) session.getAttribute("id")); 	
		user U =(user) session.getAttribute("profile");
		
		String user_name=U.getName();
		String name=request.getParameter("name");
		String desc=request.getParameter("desc");
		String status="NEW";
		int priority=Integer.parseInt(request.getParameter("pr"));
		String type=request.getParameter("type");
		
		try{
			try {
			Class.forName("com.mysql.jdbc.Driver");
			}catch (ClassNotFoundException e) {
					e.printStackTrace();
			}
			Connection  con;

			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
			
			ResultSet resultSet = null;
			
			PreparedStatement pstmt1=con.prepareStatement(" select id from user where name=? ");
			
			pstmt1.setString(1, user_name);

			resultSet = pstmt1.executeQuery();
			

			int userId=0;
			
			if (resultSet.next())
			{
				 userId=resultSet.getInt("id");
			}

	        resultSet.close();

			resultSet = null;
			
			PreparedStatement pstmt=con.prepareStatement("insert into bug (name, description, status, priority,type,project_id,user_detect) values(?,?,?,?,?,?,?)");

			pstmt.setString(1,name);
			pstmt.setString(2,desc);
			pstmt.setString(3,status);
			pstmt.setInt(4,priority);
			pstmt.setString(5,type);
			pstmt.setInt(6,id);
			pstmt.setInt(7,userId);

			pstmt.executeUpdate();
			
			pstmt.close();
			
			PreparedStatement pstmt9=con.prepareStatement("select name from projet where id = ?");
			pstmt9.setInt(1,id);
    		ResultSet res9=pstmt9.executeQuery();
    		res9.next();
			
						
			PreparedStatement pstmt4=con.prepareStatement("insert into log (user_id, action,action_id) values('1',?,'5')");
			pstmt4.setString(1," a signalé un bug dans le projet : "+res9.getString("name"));
			pstmt4.executeUpdate();
			pstmt4.close();
			pstmt9.close();			

			/********
			 * action_id=1 ---> add user
			 * action_id=2 ---> del user
			 * action_id=3 ---> add projet
			 * action_id=4 ---> del projet
			 * action_id=5 ---> signaler un bug
			 *******/
			
			
			response.sendRedirect("./Admin.jsp");
			HttpSession  session2=request.getSession(true);
            session2.setAttribute("bug", "Signale du bogue avec succès !");
		}catch(SQLException e){
			System.out.print("ERREUR ADD BUG - "+e);
		}
			
			
	
	}
	
	
	}


