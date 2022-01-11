<html>
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%

try{
        			
Class.forName("com.mysql.jdbc.Driver");
Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");
            		        			
%>
<div class="row">

                <div class="col-lg-4 col-md-4">
                    <div class="panel panel-full-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-bug fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                    
<% PreparedStatement pstmt1=con.prepareStatement("select count(*) from bug"); ResultSet res1=pstmt1.executeQuery();if(res1.next()) out.print(res1.getInt(1)); %>                                    

									</div>
                                    <div>Bogues signalé !</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="panel panel-full-warning">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-spinner fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">

<% PreparedStatement pstmt2=con.prepareStatement("select count(*) from bug where status like 'IN_PROGRESS'"); ResultSet res2=pstmt2.executeQuery(); if(res2.next()) out.print(res2.getInt(1));  %>   

									</div>
                                    <div>En cours de traitement!</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="panel panel-full-success">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-check-circle fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
   
<% PreparedStatement pstmt3=con.prepareStatement("select count(*) from bug where status like 'FIXED'"); ResultSet res3=pstmt3.executeQuery(); if(res3.next()) out.print(res3.getInt(1)); %>                                   

									</div>
                                    <div>Bogues résolus !</div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
</div>

<% 

}catch(SQLException e){out.println("erreur analyseur stats "+e);}
        		
%>
            
</html>