<!DOCTYPE html>

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
		
		if(!(type.equals("admin"))){
			
			response.sendRedirect("./login.jsp");
			HttpSession  session2=request.getSession(true);
	   	 	session2.setAttribute("errorMessage", "vous n'êtes pas connecté");
		}
	}
	if(u==null) {
		%>
<jsp:forward page="login.jsp">
<jsp:param name="errorMessage" value="vous n'êtes pas connecté" />
</jsp:forward>
		
		<%
	}
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");             			
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="shortcut icon" href="images/favicon.png">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/jquery.vectormap/jquery-jvectormap-1.2.2.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/jqvmap/jqvmap.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
    
<style>

	.scroll {
	    height: 300px;
	    overflow-y: scroll;
	}
	
</style>

  </head>
  <body >
  
    <div class="be-wrapper be-fixed-sidebar">
    
<!-- NAVIGATION -->  

 <jsp:include page="./AdminNavigation.jsp" />
 
 <!-- /NAVIGATION -->   
      
      <div class="be-content">
      
      	<div class="main-content container-fluid">

     	          <%
		String errorMessage = (String) session11.getAttribute("bug");
		if (null !=errorMessage) { %>
		
            <div class="row">
            	
            	<div class="col-lg-6 col-lg-offset-3">
            	
            	 <div role="alert" class="alert alert-contrast alert-success alert-dismissible">
                    <div class="icon"><span class="mdi mdi-check"></span></div>
                    <div class="message">
                      <button type="button" data-dismiss="alert" aria-label="Close" class="close"><span aria-hidden="true" class="mdi mdi-close"></span></button>
                      
                      <%=errorMessage %>
                      
                    </div>
                  </div>
					
				</div>
			</div>
		
		<%
		}
		session11.setAttribute("bug", null);
		%>
      	
            
        <!-- Stats -->
        
      <jsp:include page="./AdminStats.jsp" /> 
        <!-- stats -->         
            
	<jsp:include page="./AdminGraph.jsp" /> 
	                   
            
            <!-- Affichage du tableau des utilisateur -->        
            
	<div class="row" id="users">
            
       	<div class="col-lg-12">
            
   	 		<div class="panel panel-default">
   	          
            	<div class="panel-heading">Les utilisateurs</div>
			   	<div class="panel-body">
			
					<table class="table table-striped table-bordered table-hover" style="margin: 0px;">
            			<tr>
		        			<TH style="width: 10.3%;">Nom</TH>
		        			<TH style="width: 10.5%;">Prenom</TH>
		        			<TH style="width: 10.1%;">Sexe</TH>
		        			<TH style="width: 34.9%;">Adresse</TH>
		        			<TH style="width: 21.7%;">Email</TH>
			        		<TH style="width: 11.9%;">Type</TH> 
		        			 
		        		</tr>            	
            		</table>
            	 <div class="scroll"> 
            	 
            	 
            	 <table width="100%" class=" table table-striped table-bordered table-hover" >
            	 
        		
            	<%
            	try{
            		ResultSet res=con.prepareStatement("select * from user").executeQuery();
	       			while(res.next()){	
				%>
            	
        		
        		<TR>
        	
        			<TD style="width: 11%;">
        			<% 
        				out.println(res.getString("name")); 
        			%>
        			</TD>
        			<TD style="width: 11%;">
        			<% 
        				out.println(res.getString("prenom")); 
        			%>
        			</TD>
        			<TD style="width: 11%;">
        			<% 
        				out.println(res.getString("gendre")); 
        			%>
        			</TD>
        			<TD style="width: 40%;">
        			<% 
        				out.println(res.getString("adresse")); 
        			%>
        			</TD>        			
        			<TD style="width: 16%;">
        			<% 
        				out.println(res.getString("email")); 
        			%>
        			</TD>

        			<TD style="width: 11%;">
        			<% 
        				out.println(res.getString("type")); 
        			%>
        			</TD>
        		
        		
        		</TR>
            	<%
            		}
        			
        		%>
            	</table>
            	</div>
            	<div class="well">
            	<div class="row">
            
       				<div class="col-lg-6 col-md-6">
       				
       					<a class="btn btn-default btn-lg btn-block btn-success" href="./AdminUserAdd.jsp">Ajouter un utilisateur</a>
       				
       				</div>
       				
       				<div class="col-lg-6 col-md-6">
       				
							<a class="btn btn-default btn-lg btn-block btn-danger" href="AdminUserDell.jsp">Supprimer un utilisateur</a>
							
       				</div>
                                
                </div>
            	
            	
            	<%
            	}catch(Exception e){
            		out.println("Affichage du tableau des utilisateur "+e);
            	}

            	%>
            </div>
      	</div>
   	</div>  
</div>  
 </div>
            <!--Fin  Affichage du tableau des utilisateur -->
            
               <!-- Affichage du tableau des Bugs -->
            
<div class="row" id="bugs">
            
   	<div class="col-lg-12">
            
   	 	<div class="panel panel-default">
   	           
            <div class="panel-heading">Les bogues signalés</div>
			   	
			   	<div class="panel-body">            	
			    
			    
            	
            	
            	<table class="table table-striped table-bordered table-hover" style="margin: 0;">
            						<tr>
	        			<TH style="width: 11.8%;">Nom</TH>
	        			<TH style="width: 45.3%;">Description</TH>
	        			<TH style="width: 8.6%;">date</TH>
	        			<TH style="width: 16.4%;">status</TH>
	        			<TH style="width: 7.15%;">Priorite</TH>
	        			<TH>type</TH>
	        		</tr>            	
            	</table>
            	
            	<div class="scroll">          	
            	<table class="table table-striped table-bordered table-hover" >
				
        		<tbody>
            	<%
            	try{
        			ResultSet res=con.prepareStatement("select * from bug order by priority desc").executeQuery();
        			while(res.next()){      			
				%>
            	
				
        		
        		<TR>
        		
        			<TD style="width: 12%;">
        			<% 
        				out.println(res.getString("name")); 
        			%>
        			</TD>
        			<TD >
        			<% 
        				out.println(res.getString("description")); 
        			%>
        			</TD>
        			<TD style="width:8.8%;">
        			<% 
        				out.println(res.getDate("date")); 
        			%>
        			</TD>
        			<TD style="width: 16.7%;">
        			<% 
        			String status=res.getString("status");
        			if (status.equals("IN_PROGRESS")||status.equals("TESTING")||status.equals("Test Invalide")) out.println("En cours de traitement");
                    if (status.equals("NEW")) out.println("Pas encore traité");
                    if (status.equals("FIXED")) out.println("Résolus");
                    if (status.equals("Pas_Un_Bug")||status.equals("Rejeter")||status.equals("Differed")) out.println("Irésolus");
        			%>
        			</TD>
        			<TD style="width: 7.15%;">
        				<center>
        			<% 
        			
        			int tp=res.getInt("priority");
        			
        			if(tp==2) out.println("<span class='label label-danger'>ÉLEVÉE</span>");
					
        			if(tp==1) out.println("<span class='label label-warning'>HAUTE</span>"); 
        			
        			if(tp==0) out.println("<span class='label label-primary'>BASSE</span>");
        			

        			%>
        			
        				</center>
        			
        			</TD>
        			<TD>
        			
        				<% out.println(res.getString("type")); %>

        			</TD>
        		</TR>
				

            	<%
            		}
        			
        		%>
        		</tbody>
            	</table>
            	</div>
            	<div class="well">
                                <a class="btn btn-default btn-lg btn-block btn-warning" href="./AdminBugSelectProject.jsp">Signaler un bogue</a>
                </div>
            	
            	<%
            	}catch(Exception e){
            		out.println("Affichage du tableau des bugs "+e);
            	}

            	%>
       	</div>
       	</div>
  	</div>
</div>


            <!--Fin  Affichage du tableau des bugs -->
            
               <!-- Affichage du tableau des Projets -->
            
<div class="row">
            
   	<div class="col-lg-12">
            
   	 	<div class="panel panel-default">
   	           
            <div class="panel-heading">Les Projets</div>
			   	
			   	<div class="panel-body">            	
			    
            	  <table class="table table-striped table-bordered table-hover" style="margin: 0px;">
            			<tr>
		        			<TH style="width: 15.7%;">Nom</TH>
		        			<TH style="width: 53.1%;">Description</TH>
		        			<TH style="width: 15.8%;">date de creation</TH>
		        			<TH style="width: 16%;">Nombre de bugs</TH> 
		        		</tr>            	
            		</table>
            	 <div class="scroll">          	 
            	 <table class="table table-striped table-bordered table-hover " >
				
            	<%
            	try{
            		ResultSet res=con.prepareStatement("select * from projet").executeQuery();
            		while(res.next()){       			
				%>
            	
        		
        		<TR>

        			<TD style="width: 16%;">
        			<% 
        				out.println(res.getString("name")); 
        			%>
        			</TD>
        			<TD style="width: 54%;">
        			<% 
        				out.println(res.getString("description")); 
        			%>
        			</TD>
        			<TD style="width: 16%;">
        			<% 
        				out.println(res.getDate("date")); 
        			%>
        			</TD>
					<td style="width: 16%;">
					<%
						PreparedStatement pstmt12=con.prepareStatement("select count(*) from bug where project_id="+res.getInt("id"));
						ResultSet res12=pstmt12.executeQuery();
						if(res12.next())out.print(res12.getInt(1));
					%>
					</td>

        		</TR>
            	<%
            		}
        			
        		%>
            	</table>
            	</div>
            	<div class="well">
            	<div class="row">
            
       				<div class="col-lg-6 col-md-6">
       				
       					<a class="btn btn-primary btn-lg btn-block btn-info" href="AdminProjectAdd.jsp">Ajouter un projet</a>
       				
       				</div>
       				
       				<div class="col-lg-6 col-md-6">
       				
							<a class="btn btn-default btn-lg btn-block btn-warning" href="AdminProjectDel.jsp">Supprimer un projet</a>
							
       				</div>
                                
                </div>
            	
            	
            	<%
            	}catch(Exception e){
            		out.println("Affichage du tableau des utilisateur "+e);
            	}

            	%>
            </div>
       	</div>
       	</div>
  	</div>
</div>


            <!--Fin  Affichage du tableau des Projets -->                       

         </div>
        
	</div>                
                   
</div>
        
         


    <script src="assets/lib/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/main.js" type="text/javascript"></script>
    <script src="assets/lib/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/lib/jquery-flot/jquery.flot.js" type="text/javascript"></script>
    <script src="assets/lib/jquery-flot/jquery.flot.pie.js" type="text/javascript"></script>
    <script src="assets/lib/jquery-flot/jquery.flot.resize.js" type="text/javascript"></script>
    <script src="assets/lib/jquery-flot/plugins/jquery.flot.orderBars.js" type="text/javascript"></script>
    <script src="assets/lib/jquery-flot/plugins/curvedLines.js" type="text/javascript"></script>
    <script src="assets/lib/jquery.sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <script src="assets/lib/countup/countUp.min.js" type="text/javascript"></script>
    <script src="assets/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="assets/lib/jqvmap/jquery.vmap.min.js" type="text/javascript"></script>
    <script src="assets/lib/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
    <script src="assets/js/app-dashboard.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(document).ready(function(){
      	//initialize the javascript
      	App.init();
      	App.dashboard();
      
      });
    </script>

  </body>
</html>
<%
}
%>