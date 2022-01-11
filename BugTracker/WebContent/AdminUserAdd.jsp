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
    <title>Ajouter un utilisateur</title>
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
      	
      	          <%
		String errorMessage = (String) session11.getAttribute("useradd");
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
		session11.setAttribute("useradd", null);
		%>
      	

		<div class="row">
 
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
							Entrer les information du nouveau utilisateur                        
						</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="myform" role="form" method="post" action="adduser" data-parsley-validate >
                                      
                                        <div class="form-group">
                                            <label>Nom</label>
                                            <input  name="name" type="text" class="form-control" placeholder="Entrer le nom" required autocomplete="off">
                                        </div>
                                     	<div class="form-group">
                                            <label>PRENOM</label>
                                            <input  name="prenom" type="text" class="form-control" placeholder="Entrer le prenom" required="">
                                        </div>
                                        
                                     	<div class="form-group">
                                        
	                                        <label>SEXE</label><br>
											<div class="be-radio-icon inline">
	                          					<input type="radio" checked name="gendre" value="female" id="female">
	                          					<label for="female"><span class="mdi mdi-female"></span></label>
                        					</div>
                        					<div class="be-radio-icon inline">
	                          					<input type="radio" name="gendre" value="male" id="male">
	                          					<label for="male"><span class="mdi mdi-male-alt"></span></label>
                        					</div>
                                            
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
                                        	
                                        <div style="margin:5px 0;padding:3px;"><textarea required="" name="adresse" rows="4" cols="100" style="width:100%;" placeholder="adresse"></textarea></div>
                                                                                
                                        </div>
                                                                           
                                          <div class="form-group">
                                            <label>Email</label>
                                            <input name="email" type="email" class="form-control" placeholder="Entrer l'email" required="">
                                        </div>
                                        
                                         <div class="form-group">
                                            <label>Mot de passe</label>
                                            <input  name="pwd" type="text" class="form-control" placeholder="Entrer le mot de passe" required="">
                                        </div>
                                        

                                      
                             
                                        <div class="form-group">
                                        
                                            <label>Type d'utilisateur</label>
                                            
											<div class="be-radio">
											
					                        	<input type="radio" value="tester" checked name="usertype" id="tester">
					                        	<label for="tester">tester</label>
					                        	
                        					</div>
                                            <div class="be-radio">
											
					                        	<input type="radio" name="usertype" id="dev" value="dev">
					                        	<label for="dev">Developpeur</label>
					                        	
                        					</div>                       					
                                        
                                        </div>
                                                                         
                                      	
                                        <button type="reset" class="btn btn-default">Reset</button>
                					
                					    <button data-toggle="modal" data-target="#mod-success" type="button" class="btn btn-space btn-success">Continue</button>
                                        
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
    <script src="assets/lib/jquery.niftymodals/src/js/jquery.niftymodals.js" type="text/javascript"></script>  
    <script src="assets/lib/jquery.niftymodals/Gruntfile.js" type="text/javascript"></script>            
    <script src="assets/js/app-dashboard.js" type="text/javascript"></script>
    <script src="assets/lib/jquery.niftymodals/dist/jquery.niftymodals.js" type="text/javascript"></script>
    <script type="text/javascript">
      $.fn.niftyModal('setDefaults',{
      	overlaySelector: '.modal-overlay',
      	closeSelector: '.modal-close',
      	classAddAfterOpen: 'modal-show',
      });
      
      $(document).ready(function(){
      	//initialize the javascript
      	App.init();
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
              <h3>Ajouter un nouveau utilisateur !</h3>
              <p>Voulez vous valider ?</p>
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