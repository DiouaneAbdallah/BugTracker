<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.png" type="image/x-icon"/>


    <title>Connexion</title>
    
	<link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>

</head>

  <body class="be-splash-screen">
    <div class="be-wrapper be-login">
      <div class="be-content">
      
          <%
    	HttpSession  session3=request.getSession(false);
		String errorMessage = (String) session3.getAttribute("errorMessage");
		if (null !=errorMessage) { %>
		
            <div class="row">
            
            	<div class="col-lg-4"></div>
            
				<div class="col-lg-4">
				
            		 <div style="text-align:center;" class="alert alert-danger alert-dismissable">
            		 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            		 
						<%=errorMessage %>
			
					</div>
					
				<div class="col-lg-4"></div>
					
				</div>
			
			</div>
		<%}%>
      
      
        <div class="main-content container-fluid">
          <div class="splash-container">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
              <div class="panel-heading"><img src="assets/img/logo-xx.png" alt="logo" width="102" height="27" class="logo-img"><span class="splash-description">Entrez vos informations.</span></div>
              <div class="panel-body">
                <form action="login_control" method="post">
                  <div class="form-group">
                    <input name="name" type="text" placeholder="nom" autocomplete="off" class="form-control">
                  </div>
                  <div class="form-group">
                    <input name="pwd" type="password" placeholder="mot de passe" class="form-control">
                  </div>
                  
                  <div class="form-group login-submit">
                    <button data-dismiss="modal" type="submit" class="btn btn-primary btn-xl">Connecter</button>
                  </div>
                </form>
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

  </body>

</html>
