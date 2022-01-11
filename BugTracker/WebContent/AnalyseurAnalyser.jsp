
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
	}if(u==null) {
		%>
		<jsp:forward page="login.jsp">
		<jsp:param name="errorMessage" value="vous n'êtes pas connecté" />
		</jsp:forward>
			
			<%
		}
    
	
	int id_bug=0;
	int project_id=0;
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="shortcut icon" href="images/favicon.png">
    <title>Analyser Le Bug</title>
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

        
               <!-- Affichage du tableau des Bugs -->
            
<div class="row" id="bugs">
            
   	<div class="col-lg-12">
            
   	 	<div class="panel panel-default">
   	           
			   	
			   	<div class="panel-body">            	
			    
				<div class="panel-heading">les informations du bogue</div>
            	           	 
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
            	
        		
        		<TR >
        		
        			 <TH style="width: 23%;">Nom</TH>
        			
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
         		
        			<TH>Date</TH>
        			
        			<TD>
        			<% 
        				out.println(res.getDate("date")); 
        			%>
        			</TD>
        			
         		</TR>
        			
         		<TR>
         		
        			<TH>Priorite</TH>

        			<TD>
        			<% 
        			
        			int tp=res.getInt("priority");
        			
        			if(tp==2) out.println("<a style='text-decoration:none;color: #fff;background-color: #d9534f;border-color: #d43f3a;padding: 4px;border-radius: 6px;'>ÉLEVÉE</a>"); 

        			if(tp==1) out.println("<a style='text-decoration:none;color: #fff;background-color: #f0ad4e;border-color: #eea236;padding: 4px;border-radius: 6px;'>HAUTE</a>"); 
        			
        			if(tp==0) out.println("<a style='text-decoration:none;color: #fff;background-color: #5bc0de;border-color: #46b8da;padding: 4px;border-radius: 6px;'>BASSE</a>"); 
        			
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
         		
        			<TH>L'utilisateur qui a signalé le bug</TH>
        			
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
         		
        			<TH>le projet où le bug a été signaler</TH>
        			
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
            	<%
            		}
        			
        		%>
            	</table>

            	
            	<%
            	}catch(SQLException e){
            		System.out.println("Affichage du details de bug - ANALYSEUR "+e);
            	}

            	%>
       	</div>
       	</div>
             

</div>
</div>


<div class="row">

<div class="col-lg-6">

	<div class="panel panel-default">
	
		<div class="panel-heading">Ce bogue ne peut pas etre résolu</div>

		<div class="panel-body">
		
			<div class="tab-content" style="margin-bottom: 0px;">
			
				<div class="tab-pane fade in active" id="home-pills">
             		
             		<ul class="nav nav-pills" style="text-align:center;">
			
						<li class="active"><a href="#Pas_Un_Bug" data-toggle="tab">Pas Un Bug</a></li>
						<li><a href="#Rejeter" data-toggle="tab">Rejeter</a></li>
						<li><a href="#Differed" data-toggle="tab">Différé</a></li>
				
					</ul>
                    
				</div>
        
			</div>
			
			<div class="tab-content">
					
				<div class="tab-pane fade in active" id="Pas_Un_Bug">
             		
					<div class="row">
                                <div class="col-lg-12">
                                    <form role="form" method="post" action="Unsolved" data-parsley-validate>
                                    <input name="id_bug" type="hidden" value=<% out.print(id_bug); %> >
                                    <input name="status" type="hidden" value="Pas_Un_Bug">
                                   	
									<br>
									<div class="form-group">
                                        <label>Commentaire</label><br>
                                        
                                        <div style="margin:5px 0;padding:3px;"><textarea name="comment" rows="8" cols="100" style="width:100%;" placeholder="Pourquoi c'est pas un bug ?" required></textarea></div>
                                    
                                    </div>    
                                        <button type="submit" class="btn btn-default">Submit</button>
                                    
                                    </form>
                                </div>
                           
                   	</div>

                </div>
				
				<div class="tab-pane fade " id="Rejeter">
             		
             		<div class="row">
                                <div class="col-lg-12">
                                    <form role="form" method="post" action="Unsolved" data-parsley-validate>
									<br>
										<div class="form-group">
                                    <input name="id_bug" type="hidden" value=<% out.print(id_bug); %> >
									
                                    	<input name="status" type="hidden" value="Rejeter">
                                    
                                        <label>Commentaire</label><br>
                                        
                                        <div style="margin:5px 0;padding:3px;"><textarea name="comment" rows="8" cols="100" style="width:100%;" placeholder="Pourquoi ce bug sera Rejeter ?" required></textarea></div>
                                    
                                    </div>    
                                        <button type="submit" class="btn btn-default">Submit</button>
                                    
                                    </form>
                                </div>
                           
                   	</div>
                    
				</div>				
				
				<div class="tab-pane fade" id="Differed">
             		
             		<div class="row">
             		
                                <div class="col-lg-12">
                                    <form role="form" method="post" action="Unsolved" data-parsley-validate>
                                    <input name="id_bug" type="hidden" value=<% out.print(id_bug); %> >                                    
                                    <input name="status" type="hidden" value="Differed">
									
									<br>
									<div class="form-group">
                                    
                                        <label>Commentaire</label><br>
                                        
                                        <div style="margin:5px 0;padding:3px;"><textarea name="comment" rows="8" cols="100" style="width:100%;" placeholder="Pourquoi ce bug sera Différé ?" required></textarea></div>
                                    
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


                   
<div class="col-lg-6">

<div class="panel panel-default">
	
		<div class="panel-heading">Ce bogue sera envoyer à un développeur</div>

		<div class="panel-body">
		
			<div class="tab-content" style="margin-bottom: 0px;">
			
				<div class="tab-pane fade in active" id="home-pills">
             		
             		<ul class="nav nav-pills" style="text-align:center;">
			
						<li class="active"><a href="#Nouveau" data-toggle="tab">Nouveau</a></li>
						<li><a href="#Duplique" data-toggle="tab">Dupliqué</a></li>
				
					</ul>
                    
				</div>
        
			</div>
			
			<div class="tab-content">
					
				<div class="tab-pane fade in active" id="Nouveau">
             		
					<div class="row">
                                <div class="col-lg-12">
                                    <form role="form" method="post" action="IN_PROGRESS" data-parsley-validate>
									<input name="id_bug" type="hidden" value=<% out.print(id_bug); %> >                                    
                                    <input name="status" type="hidden" value="Nouveau">                                   
									
									<div class="form-group">
                                    
                                        <label>Commentaire</label><br>
                                        
                                        <div style="margin:5px 0;padding:3px;"><textarea name="comment" rows="4" cols="100" style="width:100%;" placeholder="Nouveau" required></textarea></div>
                                    
                                    </div>
                                    <div class="form-group">
                                    
                                        <label>Assigner a un développeur</label><br>
                                        
                                        <select name="dev" class="form-control">
                                        
                                        <%

										try{
									        			
											Class.forName("com.mysql.jdbc.Driver");
									            		
									      	Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
									            		
									       	PreparedStatement pstmt1=con.prepareStatement("select id,prenom,name from user join projet_dev on dev_id=id where projet_id=?");
									       	pstmt1.setInt(1, project_id);
									       	ResultSet res1=pstmt1.executeQuery();
									            		            	
									       	while(res1.next()){
									        		

										%>
													
											<option value=<% out.print(res1.getInt("id")); %>>
													
												<% out.print(res1.getString("name")+" "+res1.getString("prenom")); %>
																										
											</option>
                                    	<%
										}
										  		 
										}catch(SQLException e){
											out.println("ERREUR CHOISIR DEV - BUG ANALYSE "+e);
										}
										        		
										%>
                                        
                                        </select>
                                                                            
                                    </div>    
                                        
                                  	<button type="submit" class="btn btn-default">Submit</button>
                                    
                                    </form>
                                </div>
                           
                   	</div>

                </div>
				
				<div class="tab-pane fade " id="Duplique">
             		
             		<div class="row">
                                <div class="col-lg-12">
                                    <form role="form" method="post" action="IN_PROGRESS" data-parsley-validate>
                                    <input name="id_bug" type="hidden" value=<% out.print(id_bug); %> >									
                                    <input name="status" type="hidden" value="Duplique">                                   									
									
									<div class="form-group">
                                    
                                        <label>Commentaire</label><br>
                                        
                                        <div style="margin:5px 0;padding:3px;"><textarea name="comment" rows="4" cols="100" style="width:100%;" placeholder="Duplique" required></textarea></div>
                                    
                                    </div>
                                    
                                    <div class="form-group">
                                    
                                        <label>Assigner a un développeur</label><br>
                                        
                                        <select name="dev" class="form-control">
                                        
                                        <%

										try{
									        			
											Class.forName("com.mysql.jdbc.Driver");
									            		
									      	Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
									            		
									       	PreparedStatement pstmt1=con.prepareStatement("select id,name,prenom from user join projet_dev on dev_id=id where projet_id=?");
									       	pstmt1.setInt(1, project_id);
									       	ResultSet res1=pstmt1.executeQuery();
									            		            	
									       	while(res1.next()){
									        		

										%>
													
											<option value=<% out.print(res1.getInt("id")); %>>
													
												<% out.print(res1.getString("name")+" "+res1.getString("prenom")); %>
																										
											</option>
                                    	<%
										}
										  		 
										}catch(SQLException e){
											out.println("ERREUR CHOISIR DEV - BUG ANALYSE "+e);
										}
										        		
										%>
                                        
                                        </select>
                                                                            
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