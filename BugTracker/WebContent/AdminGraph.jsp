<html>
    <script src="assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="./vendor/metisMenu/metisMenu.min.js"></script>
    <script src="./vendor/flot/excanvas.min.js"></script>
    <script src="./vendor/flot/jquery.flot.js"></script>
    <script src="./vendor/flot/jquery.flot.pie.js"></script>
    <script src="./vendor/flot/jquery.flot.resize.js"></script>
    <script src="./vendor/flot/jquery.flot.time.js"></script>
    <script src="./vendor/flot-tooltip/jquery.flot.tooltip.min.js"></script>
    <script src="./data/flot-data.js"></script>

    <script src="./dist/js/sb-admin-2.js"></script>
    
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%

Class.forName("com.mysql.jdbc.Driver");
Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugdb", "root","");

try{
        			           		
ResultSet res=con.prepareStatement("select count(*) from bug where status like 'FIXED'").executeQuery();
ResultSet res4=con.prepareStatement("select count(*) from bug where status in('TESTING','Test Invalide','IN_PROGRESS')").executeQuery();
ResultSet res5=con.prepareStatement("select count(*) from bug where status in('Pas_Un_Bug','Rejeter','Differed')").executeQuery();
ResultSet res6=con.prepareStatement("select count(*) from bug where status like 'NEW'").executeQuery();
ResultSet res1=con.prepareStatement("select DATE_FORMAT(date,'%d-%m'),COUNT(id) FROM bug GROUP BY DATE_FORMAT(date,'%d-%m-%Y') ORDER BY DATE_FORMAT(date,'%d-%m-%Y') DESC LIMIT 7").executeQuery();
            		
res.next();
res4.next();
res5.next();
res6.next();


DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-Y");

LocalDateTime nowq = LocalDateTime.now();
LocalDateTime now= nowq.minusDays(0);
LocalDateTime Day1= nowq.minusDays(1);
LocalDateTime Day2= nowq.minusDays(2);
LocalDateTime Day3= nowq.minusDays(3);
LocalDateTime Day4= nowq.minusDays(4);
LocalDateTime Day5= nowq.minusDays(5);
LocalDateTime Day6= nowq.minusDays(6);

%>

<script>

var dataSet = [
	
    {label: "Bugs en cours de traitement", data:<%=res4.getInt(1) %> , color: "#F0AD4E" },
    {label: "Bugs irésolus", data:<%=res5.getInt(1) %> , color: "#5867ff" },
    {label: "Bugs résolus", data: <%=res.getInt(1) %>, color: "#5CB85C" },
    {label: "Bugs pas encore traité", data: <%=res6.getInt(1) %>, color: "#D9534F" },

];

var options1 = {
    series: {
        pie: {
            show: true,
            label: {
                show: true,
                radius: 3/4,
                formatter: function (label, series) {
                    return '<div style="border:1px solid grey;font-size:8pt;text-align:center;padding:5px;color:white;">' +
                    label + ' : ' +
                    Math.round(series.percent) +
                    '%</div>';
                },
                background: {
                    opacity: 0.8,
                    color: '#000'
                }
            }
        }
    },
    legend: {
        show: false
    },
    grid: {
        hoverable: true
    }
};



$(document).ready(function () {
    $.plot($("#flot-placeholder"), dataSet, options1);
});


<%

            		
int i=0;

%>



var data1 = [  
	
	<%
	String Day0 = String.format(now.format(format)) ;
	PreparedStatement p1=con.prepareStatement(" select COUNT(id) FROM bug Where DATE_FORMAT(date,'%d-%m-%Y')=?  GROUP BY DATE_FORMAT(date,'%d-%m-%Y') ");
	p1.setString(1,Day0);
	ResultSet res12=p1.executeQuery();

	if(res12.next())
		out.print("[0 , "+ res12.getInt(1) +"],");
	else
		out.print("[0 , 0],");
	
	String Day11 = String.format(Day1.format(format)) ;
	PreparedStatement p2=con.prepareStatement(" select COUNT(id) FROM bug Where DATE_FORMAT(date,'%d-%m-%Y')=?  GROUP BY DATE_FORMAT(date,'%d-%m-%Y') ");
	p2.setString(1,Day11);
	ResultSet res13=p2.executeQuery();

	if(res13.next())
		out.print("[1 , "+ res13.getInt(1) +"],");
	else
		out.print("[1 , 0],");
	
	String Day12 = String.format(Day2.format(format)) ;
	PreparedStatement p3=con.prepareStatement(" select COUNT(id) FROM bug Where DATE_FORMAT(date,'%d-%m-%Y')=?  GROUP BY DATE_FORMAT(date,'%d-%m-%Y') ");
	p3.setString(1,Day12);
	ResultSet res14=p3.executeQuery();
	
	if(res14.next())
		out.print("[2 , "+ res14.getInt(1) +"],");
	else
		out.print("[2 , 0],");
	
	String Day13 = String.format(Day3.format(format)) ;
	PreparedStatement p4=con.prepareStatement(" select COUNT(id) FROM bug Where DATE_FORMAT(date,'%d-%m-%Y')=?  GROUP BY DATE_FORMAT(date,'%d-%m-%Y') ");
	p4.setString(1,Day13);
	ResultSet res15=p4.executeQuery();
	
	if(res15.next())
		out.print("[3 , "+ res15.getInt(1) +"],");
	else
		out.print("[3 , 0],");
	
	String Day14 = String.format(Day4.format(format)) ;
	PreparedStatement p5=con.prepareStatement(" select COUNT(id) FROM bug Where DATE_FORMAT(date,'%d-%m-%Y')=?  GROUP BY DATE_FORMAT(date,'%d-%m-%Y') ");
	p5.setString(1,Day14);
	ResultSet res16=p5.executeQuery();
	
	if(res16.next())
		out.print("[4 , "+ res16.getInt(1) +"],");
	else
		out.print("[4 , 0],");
	
	String Day15 = String.format(Day5.format(format)) ;
	PreparedStatement p6=con.prepareStatement(" select COUNT(id) FROM bug Where DATE_FORMAT(date,'%d-%m-%Y')=?  GROUP BY DATE_FORMAT(date,'%d-%m-%Y') ");
	p6.setString(1,Day15);
	ResultSet res17=p6.executeQuery();
	
	if(res17.next())
		out.print("[5 , "+ res17.getInt(1) +"],");
	else
		out.print("[5 , 0],");
	
	String Day16 = String.format(Day6.format(format)) ;
	PreparedStatement p7=con.prepareStatement(" select COUNT(id) FROM bug Where DATE_FORMAT(date,'%d-%m-%Y')=?  GROUP BY DATE_FORMAT(date,'%d-%m-%Y') ");
	p7.setString(1,Day16);
	ResultSet res18=p7.executeQuery();
	
	if(res18.next())
		out.print("[6 , "+ res18.getInt(1) +"],");
	else
		out.print("[6 , 0],");
	%>
		
];
	

var dataset = [
    { label: "  Nombre de bugs signalés", data: data1, color: "#5482FF" }
];

var ticks = [ 
	
	<%
	
	out.print("[0 , '"+String.format(now.format(format))+"'],");
	
	out.print("[1 , '"+String.format(Day1.format(format))+"'],");	
	
	out.print("[2 , '"+String.format(Day2.format(format))+"'],");	
	
	out.print("[3 , '"+String.format(Day3.format(format))+"'],");	
	
	out.print("[4 , '"+String.format(Day4.format(format))+"'],");	
	
	out.print("[5 , '"+String.format(Day5.format(format))+"'],");	
	
	out.print("[6 , '"+String.format(Day6.format(format))+"']");	
	
	%>
	
];

var options = {
    series: {
        bars: {
            show: true
        }
    },
    bars: {
        align: "center",
        barWidth: 0.5
    },
    legend: {
        noColumns: 0,
        labelBoxBorderColor: "#000000",
        position: "nw"
    },
    grid: {
        hoverable: true,
        borderWidth: 2,        
        backgroundColor: { colors: ["#ffffff", "#EDF5FF"] }
    },   
    xaxis: {
        axisLabelUseCanvas: true,
        axisLabelFontSizePixels: 12,
        axisLabelFontFamily: 'Verdana, Arial',
        axisLabelPadding: 10,
        ticks: ticks
        
    },
    yaxis: {
        axisLabelUseCanvas: true,
        axisLabelFontSizePixels: 12,
        axisLabelFontFamily: 'Verdana, Arial',
        axisLabelPadding: 3,
        tickFormatter: function (v, axis) {
            return v ;
     	}
    }
};

$(document).ready(function () {
    $.plot($("#flot-placeholder1"), dataset, options);    
    $("#flot-placeholder1").UseTooltip();
});




function gd(year, month, day) {
    return new Date(year, month, day).getTime();
}

var previousPoint = null, previousLabel = null;



</script>

<% 

}catch(SQLException e){
	
	out.println("ERREUR GRAPH - "+e);
}
            			
%>

<div class="row">

	<div class="col-lg-6">
	
		<div class="panel panel-default">

			<div class="panel-heading">Les bogues signalès</div>
	
			<div class="panel-body">
		               
				<div id="flot-placeholder" style="width:100%;height:300px;margin:0 auto"></div>

			</div>
			
		</div>	

	</div>

	<div class="col-lg-6">
	
		<div class="panel panel-default">

			<div class="panel-heading">Nombre des bogues signalès les 7 derniers jours</div>
	
			<div class="panel-body">
		               
				<div id="flot-placeholder1" style="width:100%;height:300px;margin:0 auto"></div>

			</div>
			
		</div>	

	</div>
	
</div>

</html>