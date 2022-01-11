<!DOCTYPE html>

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

             			
%>

<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="shortcut icon" href="images/favicon.png">
    <title>Choisir Le projet</title>
    <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/jquery.vectormap/jquery-jvectormap-1.2.2.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/jqvmap/jqvmap.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
  </head>
  <body>
  
    <div class="be-wrapper be-fixed-sidebar">
    
      <jsp:include page="./AdminNavigation.jsp" /> 
   
      
      <div class="be-content">
      
      	<div class="main-content container-fluid">

    
               
	<div class="row">
	
		<div class="col-lg-12">
  
  	   	 	<div class="panel panel-red ">
  	
				<div class="panel-heading">Choisir Le projet ou vous avez detecter le bug</div>
         
				<div class="panel-body">
				  	   	 	
				<%@ page import="java.sql.*" %>
            	<%@ page import="java.io.*" %>
            	           	 
            	 <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example" >
            	 	<TR class="odd gradeX">
        			<TH style="width:15%;">Nom</TH>
        			<TH>description</TH>
        			<TH style="width:12%;">date de creation</TH>
        			<TH>Detecter un bug</TH>
        			
        		</TR>
            	<%

            	try{
        			
            		Class.forName("com.mysql.jdbc.Driver");
            		
            		Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
            		
            		PreparedStatement pstmt=con.prepareStatement("select * from projet");
            		
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
        			<TD align="center">
        			
        			
        				<form action="BugProject" method="post">
        				
        					<input name="id" type="hidden" value="<% out.print(res.getInt("id")); %>">
        					
        					<button class="btn btn-danger">Detecter un bug</button>
        					
        				</form>
        				
        			</TD>
        		</TR>            		
  			<%
        		}
  			%>
            	</table>            	
            	
            	<% 
            	}catch(SQLException e){
            		out.println("CHOISIR UN PROJET - BUG - "+e);
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
