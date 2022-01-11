
<%@ page import="java.io.*" %>
<%@ page import="pack.user" %>
<%

user u=(user)session.getAttribute("profile");
%>
<html>
<nav class="navbar navbar-default navbar-fixed-top be-top-header">
        <div class="container-fluid">
          <div class="navbar-header"><a href="Tester.jsp" class="navbar-brand"></a></div>
          <div class="be-right-navbar">
            <ul class="nav navbar-nav navbar-right be-user-nav">
              <li class="dropdown"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="dropdown-toggle">
                  		<% out.print( u.getAvatar().equals("avatar.png") ? "<img src='assets/img/avatar.png' alt='Avatar'>" : u.getAvatar().equals("avatar1.png") ? "<img src='assets/img/avatar1.png' alt='Avatar'>" : u.getAvatar().equals("avatar2.png") ? "<img src='assets/img/avatar2.png' alt='Avatar'>" : u.getAvatar().equals("avatar3.png") ? "<img src='assets/img/avatar3.png' alt='Avatar'>" : u.getAvatar().equals("avatar4.png") ? "<img src='assets/img/avatar4.png' alt='Avatar'>" : u.getAvatar().equals("avatar5.png") ? "<img src='assets/img/avatar5.png' alt='Avatar'>" : u.getAvatar().equals("avatar6.png") ? "<img src='assets/img/avatar6.png' alt='Avatar'>" : "<img src='assets/img/avatar.png' alt='Avatar'>" ) ; %>
              <span class="user-name"></span></a>
                <ul role="menu" class="dropdown-menu">
                  <li>
                    <div class="user-info">
                      <div class="user-name"><% out.print( u.getName() +" "+u.getPrenom()); %></div>
                      <div class="user-position online">Disponible</div>
                    </div>
                  </li>
                  <li><a href="TesterProfil.jsp"><span class="icon mdi mdi-face"></span> Profil</a></li>
                  <li><a href="TesterProfilEdit.jsp"><span class="icon mdi mdi-edit"></span>Modifier mon profil</a></li>
                  <li><a href="logout"><span class="icon mdi mdi-power"></span> Déconnexion</a></li>
                </ul>
              </li>
            </ul>
            <div class="page-title"><span>Tester Dashboard</span></div>
            <ul class="nav navbar-nav navbar-right be-icons-nav">
            </ul>
          </div>
        </div>
      </nav>
      
      
      <div class="be-left-sidebar">
        <div class="left-sidebar-wrapper"><a href="Tester.jsp" class="left-sidebar-toggle">Tester Dashboard</a>
          <div class="left-sidebar-spacer">
            <div class="left-sidebar-scroll">
              <div class="left-sidebar-content">
                <ul class="sidebar-elements">
                  <li class="active"><a href="Tester.jsp"><i class="icon mdi mdi-home"></i><span>Dashboard</span></a>
                  </li>
                  
                  <li class="parent"><a href="#"><i class="icon mdi mdi-bug"></i><span>Gestion des bogues</span></a>
                    <ul class="sub-menu">
                      <li><a href="Tester.jsp#prj">Corriger un bogue</a></li>
                      <li><a href="TesterBugSelectProject.jsp">Signaler un bogue</a></li>
                      
                    </ul>
                  </li>

                </ul>
              </div>
            </div>
          </div>

        </div>
      </div>
      
</html>