<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="images/favicon.png">
    <title>BugTracker</title>
    <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
  </head>
  <body class="be-splash-screen">
    <div class="be-wrapper be-error be-error-404">
      <div class="be-content">
        <div class="main-content container-fluid">
          <div class="error-container">
            <div class="error-number">404</div>
            <div class="error-description">La page que vous cherchez n'existe pas.</div>
            <div class="error-goback-text">vous avez fait une faute de frappe en entrant l'adresse du site dans votre navigateur.</div>
            <div class="error-goback-button"><a href="login.jsp" class="btn btn-xl btn-primary">Revenir au page d'authentification</a></div>
            <div class="footer">&copy; BugTracker</div>
          </div>
        </div>
      </div>
    </div>
    <script src="assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="assets/lib/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/main.js" type="text/javascript"></script>
    <script src="assets/lib/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(document).ready(function(){
      	//initialize the javascript
      	App.init();
      });
      
    </script>
  </body>
</html>