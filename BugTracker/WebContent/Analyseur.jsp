
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
		
		if(!(type.equals("analyseur"))){
			
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
             			
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="shortcut icon" href="images/favicon.png">
    <title>Analyseur Dashboard</title>
    <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/jquery.vectormap/jquery-jvectormap-1.2.2.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/jqvmap/jqvmap.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
  </head>
  <body>
  
    <div class="be-wrapper be-fixed-sidebar">
    
      <jsp:include page="./AnalyseurNavigation.jsp" /> 
   
      
      <div class="be-content">
      
      	<div class="main-content container-fluid">

 
            
        <!-- Stats -->
        
      <jsp:include page="./AnalyseurStats.jsp" /> 
        <!-- stats -->         
            
            
            
<div class="row" id="bugs">
            
   	<div class="col-lg-12">
            
   	 	<div class="panel panel-default">
   	           
            <div class="panel-heading">Les Bogues par priorité</div>
			   	
			   	<div class="panel-body">            	
			    
			    <%@ page import="java.sql.*" %>
            	<%@ page import="java.io.*" %>
            	           	 
            	 <table class="table table-striped table-bordered table-hover" id="dataTables-example" >
            	 	<TR>
        			<TH style="width:11%;">Nom</TH>
        			<TH>Description</TH>
        			<TH style="width:9%;">date</TH>
        			<TH style="width:13%;">status</TH>
        			<TH>Priorite</TH>
        			<TH>type</TH>
        			<TH>Analyser</TH>
        			
        		</TR>
            	<%

            	try{
        			
            		Class.forName("com.mysql.jdbc.Driver");
            		Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
            		
            		
            		PreparedStatement pstmt=con.prepareStatement("select * from bug where status like 'NEW' order by priority desc");
            		
            		ResultSet res=pstmt.executeQuery();
            		
            	
        		while(res.next()){
        			
				%>
            	
        		
        		<TR>
        		
        			<TD>
        			<% 
        				out.println(res.getString("name")); 
        			%>
        			</TD>
        			<TD>
        			<% 
        				out.println(res.getString("description")); 
        			%>
        			</TD>
        			<TD>
        			<% 
        				out.println(res.getDate("date")); 
        			%>
        			</TD>
        			<TD>
        			<% 
        			String status=res.getString("status");
        			if (status.equals("IN_PROGRESS")||status.equals("TESTING")||status.equals("Test Invalide")) out.println("En cours de traitement");
                    if (status.equals("NEW")) out.println("Pas encore traité");
                    if (status.equals("FIXED")) out.println("Résolus");
                    if (status.equals("Pas_Un_Bug")||status.equals("Rejeter")||status.equals("Differed")) out.println("Irésolus");
        			%>
        			</TD>
        			<TD>
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
        			<TD align="center">
        			
        			
        				<form action="AnalyseBug" method="post">
        				
        					<input name="id_bug" type="hidden" value="<% out.print(res.getInt("id")); %>">
        					
        					<button class="btn btn-primary">Analyser ce bug</button>
        					
        				</form>
        				
        			</TD>
        		</TR>
            	<%
            		}
        			
        		%>
            	</table>
            	
            	<%
            	}catch(Exception e){
            		out.println("Affichage du tableau des bugs "+e);
            	}

            	%>
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