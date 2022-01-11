package add;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pack.user;

@WebServlet("/updateuser")
public class updateuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		user U =(user) session.getAttribute("profile");
		
		int id_user=U.getId();
		String type=U.getType();

		String name=request.getParameter("name");
		String prenom=request.getParameter("prenom");
		String adresse=request.getParameter("adresse");
		String apropos=request.getParameter("apropos");		
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		String avatar=request.getParameter("avatar");
		
		try{
			try {
			Class.forName("com.mysql.jdbc.Driver");
			}catch (ClassNotFoundException e) {
					e.printStackTrace();
			}
			Connection  con;

			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
			
			/********MD5*********/
			
			MessageDigest md = MessageDigest.getInstance("MD5");
		    md.update(pwd.getBytes());

		    byte byteData[] = md.digest();

		    StringBuffer sb = new StringBuffer();
		    for (int i = 0; i < byteData.length; i++)
		        sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			
			/********MD5*********/
			
			PreparedStatement pstmt=con.prepareStatement(" UPDATE USER SET NAME=? , PRENOM=? , APROPOS=? , ADRESSE=? , PWD=? , EMAIL=? , AVATAR=? WHERE ID=?");
			
			PreparedStatement pstmt1=con.prepareStatement("insert into log (user_id, action,action_id) values(?,?,'0')");
			pstmt1.setString(2,"a modifié son profil");
			pstmt1.setInt(1,id_user);

			/********
			 * action_id=0 ---> update user
			 * action_id=1 ---> add user
			 * action_id=2 ---> del user
			 * action_id=3 ---> add projet
			 * action_id=4 ---> del projet
			 * action_id=5 ---> signaler un bug
			 *******/
			pstmt.setString(1,name);
			pstmt.setString(2,prenom);
			pstmt.setString(3,apropos);
			pstmt.setString(4,adresse);			
			pstmt.setString(5,sb.toString());
			pstmt.setString(6,email);
			pstmt.setString(7,avatar);
			pstmt.setInt(8,id_user);
			
			pstmt.executeUpdate();
			pstmt1.executeUpdate();

			pstmt.close();
			pstmt1.close();
			
			if(type.equals("dev")) {
				response.sendRedirect("./DevProfil.jsp");
	            session.setAttribute("Edit", "Modification de votre profil avec succès !");
			}else if(type.equals("admin")) {
				response.sendRedirect("./AdminProfil.jsp");
				session.setAttribute("Edit", "Modification de votre profil avec succès !");
			}else if(type.equals("analyseur")) {
				response.sendRedirect("./AnalyseurProfil.jsp");
				session.setAttribute("Edit", "Modification de votre profil avec succès !");
			}else {
				response.sendRedirect("./TesterProfil.jsp");
				session.setAttribute("Edit", "Modification de votre profil avec succès !");
			}
		}catch(SQLException e){
			System.out.print("MODIFIER SON PROFIL - DEV "+e);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
			
	
	}

}
