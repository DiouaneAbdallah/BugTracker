

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
		
		if(!(type.equals("dev"))){
			
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
	int id=u.getId();
	int project_id = 0;
	int id_bug = 0 ;             			
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="shortcut icon" href="images/favicon.png">
    <title>Corriger le bug</title>
    <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/jquery.vectormap/jquery-jvectormap-1.2.2.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/jqvmap/jqvmap.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
  </head>
  <body>
  
    <div class="be-wrapper be-fixed-sidebar">
    
      <jsp:include page="./DevNavigation.jsp" /> 
   
      
      <div class="be-content">
      
      	<div class="main-content container-fluid">

 
<div class="row" id="bugs">
            
   	<div class="col-lg-12">
            
   	 	<div class="panel panel-default">
   	           
            <div class="panel-heading">Les informations du bogue (Ne passe pas le test)</div>
			   	
			   	<div class="panel-body">            	
			    

            	           	 
            	 <table class="table table-striped table-bordered table-hover" id="dataTables-example" >
            	<%

            	try{
            		id_bug=Integer.parseInt((String)session.getAttribute("id_bug"));
        			
            		Class.forName("com.mysql.jdbc.Driver");
            		
            		Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
            		
            		PreparedStatement pstmt=con.prepareStatement("select * from bug where id=?");
            		
            		pstmt.setInt(1, id_bug);
            		
            		ResultSet res=pstmt.executeQuery();
            		
            	
        		if(res.next()){
        			
				%>
            	
        		
        		<TR>
        		
        			 <TH>Nom</TH>
        			
        			<TD>
        			<% 
        				out.println(res.getString("name")); 
        			%>
        			</TD>
        			
        		</TR>
        		
        		<TR>
        		
        			<TH>Description</TH>
        			
        			<TD>
        			<% 
        				out.println(res.getString("description")); 
        			%>
        			</TD>
        			
         		</TR>
        		<TR>
         		
        			<TH>Date de detection</TH>
        			
        			<TD>
        			<% 
        				out.println(res.getDate("date")); 
        			%>
        			</TD>
        			
         		</TR>
        			

         		
         		<TR>
         		
        			<TH>type</TH>
        			
        			<TD>
        			
        				<% out.println(res.getString("type")); %>

        			</TD>
        		</TR>
        		
        		<TR>
         		
        			<TH>L'utilisateur qui signale le bogue</TH>
        			
        			<TD>
        			
        				<%
        				
        				int user_id=Integer.parseInt(res.getString("user_detect")); 
        			            		
        				PreparedStatement pstmt1=con.prepareStatement("select name,prenom from user where id=?");
                		
                		pstmt1.setInt(1, user_id);
                		
                		ResultSet res1=pstmt1.executeQuery();
                		
                		if(res1.next())
                	
                		out.println(res1.getString(1)+" "+res1.getString(2));
                		
        				%>

        			</TD>
        		</TR>
        		
        		<TR>
         		
        			<TH>le projet où le bogue a été signaler</TH>
        			
        			<TD>
        			
        				<%
        				
        				project_id=Integer.parseInt(res.getString("project_id")); 
        			            		
        				PreparedStatement pstmt2=con.prepareStatement("select name from projet where id=?");
                		
                		pstmt2.setInt(1, project_id);
                		
                		ResultSet res2=pstmt2.executeQuery();
                		
                		if(res2.next())
                	
                		out.println(res2.getString(1));
                		
        				%>

        			</TD>
        		</TR>
        		
				<TR>
					<th>Commentaire de tester</th>
					<td><% out.println(res.getString("comment")); %></td>
				</TR>
            	<%
            		}
        			
        		%>
            	</table>

            	
            	<%
            	}catch(SQLException e){
            		System.out.println("Affichage du details de bug - FIXING_new.JSP- - DEVELOPPEUR "+e);
            	}

            	%>
       	</div>
       	</div>
             

</div>
</div>

<!-- fin tableau -->

<div class="row">

<div class="col-lg-12">

	<div class="panel panel-default">
	
		<div class="panel-heading">Envoyer le projet au tester pour le retester (une autre fois):</div>

		<div class="panel-body">
		
		<div class="row">
                                <div class="col-lg-12">
                                    <form role="form" method="post" action="ForTest" data-parsley-validate>
                                    <input name="id_bug" type="hidden" value=<% out.print(id_bug); %> >
                                   	
									<br>
									<div class="form-group">
                                        <label>Commentaire</label><br>
                                        
                                        <div style="margin:5px 0;padding:3px;"><textarea name="comment" rows="8" cols="100" style="width:100%;" placeholder="Ecrire un commentaire pour le tester !" required></textarea></div> <br>
                                    
                                    </div>    
                                        <button type="submit" class="btn btn-default">Submit</button>
                                    
                                    </form>
                                </div>
                           
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