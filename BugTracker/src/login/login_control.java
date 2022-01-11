package login;

import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import pack.user;

@WebServlet("/login_control")

public class login_control extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
 
	private static final long serialVersionUID = 1L;

public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
{
    
	String user=request.getParameter("name");
	String password=request.getParameter("pwd");
	

	
		try{
			
		Class.forName("com.mysql.jdbc.Driver");
		Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
		
		/********MD5*********/
		
		MessageDigest md = MessageDigest.getInstance("MD5");
	    md.update(password.getBytes());

	    byte byteData[] = md.digest();

	    StringBuffer sb = new StringBuffer();
	    for (int i = 0; i < byteData.length; i++)
	        sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		
		/********MD5*********/
		
		PreparedStatement pstmt=con.prepareStatement("select * from user where name=? and pwd=?");
		pstmt.setString(1,user);
		pstmt.setString(2,sb.toString());
		
		ResultSet rs=pstmt.executeQuery();
		
				
		int i=0;
	
		while(rs.next())
		{
			
			
			PreparedStatement pstmt1=con.prepareStatement("select avatar,id,name,prenom,gendre,adresse,DATE_FORMAT(date_created,'%d-%m-%Y'),email,type,apropos from user where name=?");
    		
			pstmt1.setString(1, user);
			
    		ResultSet res1=pstmt1.executeQuery();
    		
    		res1.next();
			int id=res1.getInt("id"); 
			String name=res1.getString("name"); 
			String prenom=res1.getString("prenom"); 
			String gendre=res1.getString("gendre"); 
			String adresse=res1.getString("adresse"); 
			String date=res1.getString(7); 
			String email=res1.getString("email"); 
			String type=res1.getString("type"); 
			String avatar=res1.getString("avatar"); 
			String apropos=res1.getString("apropos"); 

			user u=new user(id,avatar,name, prenom,gendre, adresse, email, date, type,apropos);
			
			i++;			
			
			if(rs.getString("type").equals("admin"))
			{			
				HttpSession session = request.getSession();
				session.setAttribute("user",user);
				session.setAttribute("profile", u);
				response.sendRedirect("./Admin.jsp");
				
			}
			
			if(rs.getString("type").equals("tester"))
			{
				HttpSession session = request.getSession();
				session.setAttribute("user",user);
				session.setAttribute("profile", u);
				response.sendRedirect("./Tester.jsp");						
			}
			
			if(rs.getString("type").equals("dev"))
			{
				HttpSession session = request.getSession();
				session.setAttribute("user",user);
				session.setAttribute("profile", u);
				response.sendRedirect("./Dev.jsp");						
			}
			
			if(rs.getString("type").equals("analyseur"))
			{
				HttpSession session = request.getSession();
				session.setAttribute("user",user);
				session.setAttribute("profile", u);
				response.sendRedirect("./Analyseur.jsp");						
			}
		
		}
	
	
		
		if(i==0)
		{
			response.sendRedirect("login.jsp"); //error
	          HttpSession  session2=request.getSession(true);
	            session2.setAttribute("errorMessage", "nom d'utilisateur ou mot de passe incorrect");
		}
		
		
		}catch(SQLException | ClassNotFoundException e)
		{
			System.out.println("ERREUR LOGIN - "+e);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
}

}  	  	
