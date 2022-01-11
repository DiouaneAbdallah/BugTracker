
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
		
		if(!(type.equals("tester"))){
			
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
    <title>Add bug</title>
    <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/jquery.vectormap/jquery-jvectormap-1.2.2.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/jqvmap/jqvmap.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
  </head>
  <body>
  
    <div class="be-wrapper be-fixed-sidebar">
    
      <jsp:include page="./TesterNavigation.jsp" /> 
   
      
      <div class="be-content">
      
      	<div class="main-content container-fluid">
         
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
							Entrer les information du nouveau bogue                        
						</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form role="form" method="post" action="AddBugTester" data-parsley-validate>
                                      
                                        <div class="form-group">
                                            <label>Nom</label>
                                            <input  name="name" type="text" class="form-control" placeholder="Entrer le nom" required>
                                        </div>
                                        
										<label>Description</label>
                                        
                                     <div class="form-group">
                                     
                                        <div style="margin:5px 0;padding:3px;"><textarea name="desc" rows="4" cols="100" style="width:100%;" placeholder="donnez une liste détaillée des étapes pour reproduire le problème que vous avez rencontré" required></textarea></div>
                                    	                                     
                                     </div>
                                                 
									<div class="form-group">
									
                                            <label>PRIORITÉ</label>
                                            <select name="pr"  class="form-control" required>
                                                <option value="2">ÉLEVÉE</option>
                                                <option value="1">HAUTE</option>
                                                <option value="0">BASSE</option>
                                            </select>
                                     </div>
                                        
										<div class="form-group">
                                            <label>TYPE</label>
                                            <select name="type" class="form-control" required>
                                                <option value="Arithmétique">Arithmétique</option>
                                                <option value="Logique">Logique</option>
                                                <option value="Syntaxe">Syntaxe</option>
                                                <option value="interface">interface</option>

                                            </select>
                                            
                                        </div>
                                      
                                        <button type="submit" class="btn btn-default">Submit </button>
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