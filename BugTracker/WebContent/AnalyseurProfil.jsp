<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="pack.user" %>

<%



HttpSession session11 = request.getSession(false);

 
if(session11==null){  
	
	response.sendRedirect("./login.jsp");
	HttpSession  session2=request.getSession(true);
    session2.setAttribute("errorMessage", "vous n'êtes pas connecté");
    
}else{
	
	user u=(user)session11.getAttribute("profile");
	if(u!=null){
		String type=u.getType();
		if(!(type.equals("analyseur"))){
			response.sendRedirect("./login.jsp");
			HttpSession  session2=request.getSession(true);
	   	 	session2.setAttribute("errorMessage", "vous n'êtes pas connecté");
		}
	}if(u==null) {
		%>
		<jsp:forward page="login.jsp">
		<jsp:param name="errorMessage" value="vous n'êtes pas connecté" />
		</jsp:forward>
			
			<%
		}
             			
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="shortcut icon" href="images/favicon.png">
    <title>Analyseur profile</title>
    <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
  </head>
  <body>
  
    <div class="be-wrapper">
    
      <jsp:include page="./AnalyseurNavigation.jsp" /> 

      <div class="be-content">
      
        <div class="main-content container-fluid">
        
          <div class="user-profile">

<%
         
try{
        			
Class.forName("com.mysql.jdbc.Driver");
Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
            		        			
%>          
          
<div class="row">

              <div class="col-md-6 col-md-offset-3">
                <div class="user-display">
                  <div class="user-display-bg"><img src="assets/img/user-profile-display.png" alt="Profile Background"></div>
                  <div class="user-display-bottom">
                    <div class="user-display-avatar">
                  		<% out.print( u.getAvatar().equals("avatar.png") ? "<img src='assets/img/avatar.png' alt='Avatar'>" : u.getAvatar().equals("avatar1.png") ? "<img src='assets/img/avatar1.png' alt='Avatar'>" : u.getAvatar().equals("avatar2.png") ? "<img src='assets/img/avatar2.png' alt='Avatar'>" : u.getAvatar().equals("avatar3.png") ? "<img src='assets/img/avatar3.png' alt='Avatar'>" : u.getAvatar().equals("avatar4.png") ? "<img src='assets/img/avatar4.png' alt='Avatar'>" : u.getAvatar().equals("avatar5.png") ? "<img src='assets/img/avatar5.png' alt='Avatar'>" : u.getAvatar().equals("avatar6.png") ? "<img src='assets/img/avatar6.png' alt='Avatar'>" : "<img src='assets/img/avatar.png' alt='Avatar'>" ) ; %>
                    </div>
                    <div class="user-display-info">
                      <div class="name"><% out.println(u.getName()+" "+u.getPrenom() ); %></div>
                      <div class="nick"><span class="mdi mdi-account"></span> <% out.println(u.getName()); %></div>
                    </div>
                    <div class="row user-display-details">
                      <div class="col-xs-4">
                        <div class="title">Bugs signalé !</div>
                        <div class="counter"><% PreparedStatement pstmt1=con.prepareStatement("select count(*) from bug"); ResultSet res1=pstmt1.executeQuery();if(res1.next()) out.print(res1.getInt(1)); %></div>
                      </div>
                      <div class="col-xs-4">
                        <div class="title">En cours de traitement!</div>
                        <div class="counter"><% PreparedStatement pstmt2=con.prepareStatement("select count(*) from bug where status like 'IN_PROGRESS'"); ResultSet res2=pstmt2.executeQuery(); if(res2.next()) out.print(res2.getInt(1));  %></div>
                      </div>
                      <div class="col-xs-4">
                        <div class="title">Bugs résolus !</div>
                        <div class="counter"><% PreparedStatement pstmt3=con.prepareStatement("select count(*) from bug where status like 'FIXED'"); ResultSet res3=pstmt3.executeQuery(); if(res3.next()) out.print(res3.getInt(1)); %></div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="user-info-list panel panel-default">
                  <div class="panel-heading panel-heading-divider">A propos<span class="panel-subtitle"><% out.println(u.getApropos()); %></span></div>
                  <div class="panel-body">
                    <table class="no-border no-strip skills">
                      <tbody class="no-border-x no-border-y">
                      	<tr>
                          <td class="icon"><span class="mdi mdi-male-female"></span></td>
                          <td class="item">Gendre<span class="icon s7-portfolio"></span></td>
                          <td><% out.println(u.getGendre()); %></td>
                        </tr>
                        <tr>
                          <td class="icon"><span class="mdi mdi-case"></span></td>
                          <td class="item">Ocupation<span class="icon s7-portfolio"></span></td>
                          <td><% out.println(u.getType()); %></td>
                        </tr>
                        <tr>
                          <td class="icon"><span class="mdi mdi-time"></span></td>
                          <td class="item">Date d'ambauche<span class="icon s7-gift"></span></td>
                          <td><% out.println(u.getDate_created()); %></td>
                        </tr>
                        <tr>
                          <td class="icon"><span class="mdi mdi-smartphone-android"></span></td>
                          <td class="item">Mobile<span class="icon s7-phone"></span></td>
                          <td>(999) 999-9999</td>
                        </tr>
                        <tr>
                          <td class="icon"><span class="mdi mdi-globe-alt"></span></td>
                          <td class="item">Adresse<span class="icon s7-map-marker"></span></td>
                          <td><% out.println(u.getAdresse()); %></td>
                        </tr>
                        <tr>
                          <td class="icon"><span class="mdi mdi-email"></span></td>
                          <td class="item">Email<span class="icon s7-global"></span></td>
                          <td><% out.println(u.getEmail()); %></td>
                        </tr>
                        <tr>
                          <td class="icon"><span class="mdi mdi-pin"></span></td>
                          <td class="item">Website<span class="icon s7-global"></span></td>
                          <td>www.website.com</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>             
              
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="assets/lib/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/main.js" type="text/javascript"></script>
    <script src="assets/lib/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/lib/jquery-flot/jquery.flot.js" type="text/javascript"></script>
    <script src="assets/lib/jquery-flot/jquery.flot.pie.js" type="text/javascript"></script>
    <script src="assets/lib/jquery-flot/jquery.flot.resize.js" type="text/javascript"></script>
    <script src="assets/lib/jquery-flot/plugins/jquery.flot.orderBars.js" type="text/javascript"></script>
    <script src="assets/lib/jquery-flot/plugins/curvedLines.js" type="text/javascript"></script>
    <script src="assets/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="assets/js/app-page-profile.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(document).ready(function(){
      	//initialize the javascript
      	App.init();
      	App.pageProfile();
      });
    </script>
  </body>
</html>

<%


}catch(SQLException e){
	out.println("ERREUR STATS ADMIN - "+e);
}
        		
}
%>