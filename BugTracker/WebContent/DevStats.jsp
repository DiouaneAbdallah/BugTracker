<html>
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="pack.user" %>

<%
HttpSession session3 = request.getSession(false);

user us=(user)session3.getAttribute("profile");

int id=us.getId();
try{
        			
Class.forName("com.mysql.jdbc.Driver");
Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
            		        			
%>
<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="panel panel-full">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-folder-open fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                    
<% PreparedStatement pstmt4=con.prepareStatement("select count(*) from projet_dev where dev_id="+id); ResultSet res4=pstmt4.executeQuery();if(res4.next()) out.print(res4.getInt(1)); %>

									</div>
                                    <div>Projets que je développe !</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="panel panel-full-warning">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-check-circle fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
   
<% PreparedStatement pstmt3=con.prepareStatement("select count(*) from user_bug where id_dev="+id); ResultSet res3=pstmt3.executeQuery(); if(res3.next()) out.print(res3.getInt(1)); %>                                   

									</div>
                                    <div>Bogues que j'ai résolu !</div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
</div>

<% 

}catch(SQLException e){out.println("erreur develppeur stats - "+e);}
        		
%>
            
</html>