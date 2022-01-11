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
    <title>Time line</title>
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

            <div class="col-md-12">
            
              <ul class="timeline">
				<%

            	try{
        			
            		Class.forName("com.mysql.jdbc.Driver");
            		Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
            		
            		
            		PreparedStatement pstmt=con.prepareStatement("select user_id,action_id,DATE_FORMAT(date,'%M %d, %Y'),DATE_FORMAT(date,'%H:%i'),action,extra from log order by date desc");
            		
            		ResultSet res=pstmt.executeQuery();
            		
        		while(res.next()){
        			
        			ResultSet res1=con.prepareStatement("select name,prenom,avatar from user where id="+res.getInt("user_id")).executeQuery();
            		res1.next();
        			int action=res.getInt("action_id");

				%>              
              	<%
              	if(action==0||action==1||action==2||action==3||action==4||action==5) {
              			out.println("<li class='timeline-item'> <div class='timeline-date'><span>"+res.getString(3)+"</span></div><div class='timeline-content'>");
                  		out.print( res1.getString("avatar").equals("avatar.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar.png' alt='Avatar' class='circle'></div>" : res1.getString("avatar").equals("avatar1.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar1.png' alt='Avatar' class='circle'></div>" : res1.getString("avatar").equals("avatar2.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar2.png' alt='Avatar' class='circle'></div>" : res1.getString("avatar").equals("avatar3.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar3.png' alt='Avatar' class='circle'></div>" : res1.getString("avatar").equals("avatar4.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar4.png' alt='Avatar' class='circle'></div>" : res1.getString("avatar").equals("avatar5.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar5.png' alt='Avatar' class='circle'></div>" : res1.getString("avatar").equals("avatar6.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar6.png' alt='Avatar' class='circle'></div>" : "<div class='timeline-avatar'><img src='assets/img/avatar.png' alt='Avatar' class='circle'></div>" ) ;
                  		out.print("<div class='timeline-header'><span class='timeline-time'>"+res.getString(4)+"</span><span class='timeline-autor'>"+res1.getString("name")+" "+res1.getString("prenom")+"</span><br><p class='timeline-activity'>"+res.getString(5)+".</p></div></div></li>");
              	}
              	if(action==6||action==7||action==8||action==9||action==10||action==11){
              		
              		out.print("<li class='timeline-item timeline-item-detailed'><div class='timeline-date'><span>"+res.getString(3)+"</span></div><div class='timeline-content' >");
              		out.print( res1.getString("avatar").equals("avatar.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar.png' alt='Avatar' class='circle'></div>" : res1.getString("avatar").equals("avatar1.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar1.png' alt='Avatar' class='circle'></div>" : res1.getString("avatar").equals("avatar2.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar2.png' alt='Avatar' class='circle'></div>" : res1.getString("avatar").equals("avatar3.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar3.png' alt='Avatar' class='circle'></div>" : res1.getString("avatar").equals("avatar4.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar4.png' alt='Avatar' class='circle'></div>" : res1.getString("avatar").equals("avatar5.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar5.png' alt='Avatar' class='circle'></div>" : res1.getString("avatar").equals("avatar6.png") ? "<div class='timeline-avatar'><img src='assets/img/avatar6.png' alt='Avatar' class='circle'></div>" : "<div class='timeline-avatar'><img src='assets/img/avatar.png' alt='Avatar' class='circle'></div>" ) ;
              		out.print("<div class='timeline-header'><span class='timeline-time'>"+res.getString(4)+"</span><span class='timeline-autor'>"+res1.getString("name")+" "+res1.getString("prenom")+" "+"</span><br><p class='timeline-activity'>"+res.getString(5)+".</p><blockquote class='timeline-blockquote'><p>"+res.getString(6)+". </p></blockquote></div></div></li>");
              	}
              	}
              	
                %>
				</ul>
                
              <%
              
              }catch(Exception e){
            		out.println("Affichage du tableau des utilisateur "+e);
				}
              %>
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