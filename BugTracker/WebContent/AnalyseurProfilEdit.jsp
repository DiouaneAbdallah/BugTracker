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
    <title>Modifier vos informations</title>
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
 

<div class="col-lg-8 col-lg-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-heading">
							Entrer vos nouvelles informations                       
						</div>
						
						<%
		
		            	try{
		            		
		            		Class.forName("com.mysql.jdbc.Driver");
		            		
		            		Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
		            		
		            		PreparedStatement pstmt=con.prepareStatement("select * from user where id=?");
		            		
		            		pstmt.setInt(1, u.getId());
		            		
		            		ResultSet res=pstmt.executeQuery();
		            		
		        			res.next();
		        			
						%>						
						
						
                        <div class="panel-body">
                            
                           <form id="myform" role="form" method="post" action="updateuser" data-parsley-validate >
                                      
                              <div class="form-group">
                                        
                                 <label>Nom</label>
                                 
                                  <% out.println("<input  name='name' value='"+res.getString("name")+"' type='text' class='form-control' placeholder='Entrer le nom' required autocomplete='off'>"); %>      
                              </div>
                              
                              <div class="form-group">
                                 <label>PRENOM</label>
                                  <% out.println("<input  name='prenom' value='"+res.getString("prenom")+"' type='text' class='form-control' placeholder='Entrer le prenom' required autocomplete='off'>"); %>      
                                 
                              </div>
                                                                                
                             <div class="form-group">
                                        
	                                <label>Avatar</label><br>
	                                        
											<div class="be-radio inline">
	                          					<input type="radio" checked name="avatar" value="avatar.png" id="avatar">
	                          					<label for="avatar"><img src="assets/img/avatar.png" style="border-radius: 50%;"></label>
                        					</div>
                        					
                        					<div class="be-radio inline">
	                          					<input type="radio" name="avatar" value="avatar1.png" id="avatar1">
	                          					<label for="avatar1"><img src="assets/img/avatar1.png" style="border-radius: 50%;"></label>
                        					</div>
                        					
                                            <div class="be-radio inline">
	                          					<input type="radio"  name="avatar" value="avatar2.png" id="avatar2">
	                          					<label for="avatar2"><img src="assets/img/avatar2.png" style="border-radius: 50%;"></label>
                        					</div>
                        					
                        					<div class="be-radio inline">
	                          					<input type="radio" name="avatar" value="avatar3.png" id="avatar3">
	                          					<label for="avatar3"><img src="assets/img/avatar3.png" style="border-radius: 50%;"></label>
                        					</div>
                        					
                        					<div class="be-radio inline">
	                          					<input type="radio"  name="avatar" value="avatar4.png" id="avatar4">
	                          					<label for="avatar4"><img src="assets/img/avatar4.png" style="border-radius: 50%;"></label>
                        					</div>
                        					
                        					<div class="be-radio inline">
	                          					<input type="radio" name="avatar" value="avatar5.png" id="avatar5">
	                          					<label for="avatar5"><img src="assets/img/avatar5.png" style="border-radius: 50%;"></label>
                        					</div>
                        					
                        					<div class="be-radio inline">
	                          					<input type="radio" name="avatar" value="avatar6.png" id="avatar6">
	                          					<label for="avatar6"><img src="assets/img/avatar6.png" style="border-radius: 50%;"></label>
                        					</div>
                                        </div>
                                        
										<div class="form-group">
                                        
                                        <label>ADRESSE</label><br>
                                        	
                                        <div style="margin:5px 0;padding:3px;"><textarea required name="adresse" rows="4" cols="100" style="width:100%;"><% out.println(res.getString("adresse")); %></textarea></div>
                                                                                
                                        </div>
                                        
                						<div class="form-group">
                                        
                                        <label>A propos de moi</label><br>
                                        	
                                        <div style="margin:5px 0;padding:3px;">
                                        	<textarea required name="apropos" rows="4" cols="100" style="width:100%;"><% out.println(res.getString("apropos")); %></textarea>
                                        </div>
                                                                                
                                        </div>                        
                                                                           
                                          <div class="form-group">
                                            <label>Email</label>
                                  						<% out.println("<input  name='email' value='"+res.getString("email")+"' type='email' class='form-control' required autocomplete='off'>"); %>      
                                          </div>
                                        
                                         <div class="form-group">
                                            <label>Mot de passe</label>                                            
                                            <input  name="pwd" type="text" class="form-control" placeholder="Entrer le mot de passe" required>
                                        </div>
                                       <button type="reset" class="btn btn-default">Reset</button>
                					
                					    <button data-toggle="modal" data-target="#mod-success" type="button" class="btn btn-space btn-success">Continue</button>
                                       
                                    </form>                      
                                    
							<%
			            	}catch(SQLException e){
			            		System.out.println("EDIT ADMIN PROFILE - ADMIN "+e);
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
    <script src="assets/js/app-dashboard.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(document).ready(function(){
      	//initialize the javascript
      	App.init();
      	App.dashboard();
      
      });
    </script>

     <div id="mod-success" tabindex="-1" role="dialog" style="" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" data-dismiss="modal" aria-hidden="true" class="close"><span class="mdi mdi-close"></span></button>
          </div>
          <div class="modal-body">
            <div class="text-center">
              <div class="text-success"><span class="modal-main-icon mdi mdi-check"></span></div>
              <h3>Modifier vos informations !</h3>
              <p>Voulez vous valider cette modification  ?</p>
              <div class="xs-mt-50">
                <button type="button" data-dismiss="modal" class="btn btn-space btn-default">Annuler</button>
                <input value="Continue" type="submit" form="myform"  class="btn btn-space btn-success">
              </div>
            </div>
          </div>
          <div class="modal-footer"></div>
        </div>
      </div>
    </div>
    
  </body>
</html>
<%
}
%>