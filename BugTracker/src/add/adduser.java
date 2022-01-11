package add;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

@WebServlet("/adduser")
public class adduser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String prenom=request.getParameter("prenom");
		String gendre=request.getParameter("gendre");
		String adresse=request.getParameter("adresse");		
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		String type=request.getParameter("usertype");
		String avatar=request.getParameter("avatar");
		
		try{
			try {
			Class.forName("com.mysql.jdbc.Driver");
			}catch (ClassNotFoundException e) {
					e.printStackTrace();
			}
			Connection  con;

			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
			
			/*****MD5*******/
			
		    MessageDigest md = MessageDigest.getInstance("MD5");
		    md.update(pwd.getBytes());

		    byte byteData[] = md.digest();

		    StringBuffer sb = new StringBuffer();
		    for (int i = 0; i < byteData.length; i++)
		        sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));

		    
		    
			/*****MD5*******/
			
			PreparedStatement pstmt=con.prepareStatement("insert into user (name, prenom,gendre, adresse, pwd, email, type,avatar) values(?,?,?,?,?,?,?,?)");
			
			PreparedStatement pstmt1=con.prepareStatement("insert into log (user_id, action,action_id) values('1',?,'1')");
			pstmt1.setString(1,"a ajouté un nouveau utilisateur : "+name+" "+prenom);

			/********
			 * action_id=1 ---> add user
			 * action_id=2 ---> del user
			 * action_id=3 ---> add projet
			 * action_id=4 ---> del projet
			 * action_id=5 ---> signaler un bug
			 *******/
			pstmt.setString(1,name);
			pstmt.setString(2,prenom);
			pstmt.setString(3,gendre);
			pstmt.setString(4,adresse);
			pstmt.setString(5,sb.toString());
			pstmt.setString(6,email);
			pstmt.setString(7,type);
			pstmt.setString(8,avatar);
			
			pstmt.executeUpdate();
			pstmt1.executeUpdate();

			pstmt.close();
			pstmt1.close();
			
			response.sendRedirect("./AdminUserAdd.jsp");
			HttpSession  session2=request.getSession(true);
            session2.setAttribute("useradd", "Ajout de l'utilisateur avec succès !");
		}catch(SQLException e){
			System.out.print("AJOUER UN UTILISATEUR - ADMIN "+e);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
			
			
	
	}

}
