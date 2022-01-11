
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
    <title>Ajouter un projet</title>
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
   
    	          <%
    	HttpSession  session3=request.getSession(false);
		String errorMessage = (String) session3.getAttribute("project");
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
		session3.setAttribute("project", null);
		%>
      	
      
      <div class="be-content">
      
      	<div class="main-content container-fluid">


            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
							Entrer les information du nouveau projet                        
						</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="myform" method="post" action="Addproject" data-parsley-validate>
      
                                        <div class="form-group">
                                            <label>Nom</label>
                                            <input  name="name" type="text" class="form-control" placeholder="Entrer le nom" required>
                                        </div>
                                        	
										<div class="form-group">
										
                                            <label>Description</label><br>
                                            
                                        	<div style="margin:5px 0;padding:3px;"><textarea required name="desc" rows="8" cols="100" style="width:100%;" placeholder="Description de projet"></textarea></div>
                                                                              
                                        </div>                            
                                        
                                        <div class="form-group">
                                        <label>Les developpeur(s)</label>
                                        <select multiple="multiple" name="dev" class="form-control" required>
                                                	<%@ page import="java.sql.*" %>
            										<%@ page import="java.io.*" %>
            	           	 						<%

									            	try{
									        			
									            		Class.forName("com.mysql.jdbc.Driver");
									            		
									            		Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
									            		
									            		PreparedStatement pstmt=con.prepareStatement("select * from user where type like 'dev'");
									            		
									            		ResultSet res=pstmt.executeQuery();
									            		            	
									        		while(res.next()){
									        			

													%>
													
													<option value=<% out.println(res.getInt("id")); %>>
													
													        				<% out.println(res.getString("name")); %>
													
													
													</option>
                                                	<%
										        		}
										  		 
										            	}catch(Exception e){
										            		out.println("erreur"+e);
										            	}
										        		
										        		%>
                                                
                                
                                            </select>
                                        </div>
                                        
                                  
                                      
                					    <button data-toggle="modal" data-target="#mod-success" type="button" class="btn btn-space btn-success">Continue</button>
                                        <button type="reset" class="btn btn-default">Reset </button>
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
    
         <div id="mod-success" tabindex="-1" role="dialog" style="" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" data-dismiss="modal" aria-hidden="true" class="close"><span class="mdi mdi-close"></span></button>
          </div>
          <div class="modal-body">
            <div class="text-center">
              <div class="text-success"><span class="modal-main-icon mdi mdi-check"></span></div>
              <h3>Ajouter un nouveau projet !</h3>
              <p>Êtes-vous sûr ?</p>
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