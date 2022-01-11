<%@ page import="java.io.*" %>
<%@ page import="pack.user" %>
<%

HttpSession session11 = request.getSession(false);

user u=(user)session11.getAttribute("profile");



%>
<html>
<nav class="navbar navbar-default navbar-fixed-top be-top-header">
        <div class="container-fluid">
          <div class="navbar-header"><a href="Admin.jsp" class="navbar-brand"></a></div>
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
                  <li><a href="AdminTimeLine.jsp"><span class="icon mdi mdi-time"></span> Time line</a></li>
                  <li><a href="AdminProfil.jsp"><span class="icon mdi mdi-face"></span> Profil</a></li>
					<li><a href="AdminProfilEdit.jsp"><span class="icon mdi mdi-edit"></span>Modifier mon profil</a></li>
                  <li><a href="logout"><span class="icon mdi mdi-power"></span> Déconnexion</a></li>
                </ul>
              </li>
            </ul>
            <div class="page-title"><span>Admin Dashboard</span></div>
            <ul class="nav navbar-nav navbar-right be-icons-nav">
            </ul>
          </div>
        </div>
      </nav>
      
      
      <div class="be-left-sidebar">
        <div class="left-sidebar-wrapper"><a href="Admin.jsp" class="left-sidebar-toggle">Admin Dashboard</a>
          <div class="left-sidebar-spacer">
            <div class="left-sidebar-scroll">
              <div class="left-sidebar-content">
                <ul class="sidebar-elements">
                  <li class="active"><a href="Admin.jsp"><i class="icon mdi mdi-home"></i><span>Dashboard</span></a>
                  </li>
                  <li class="parent"><a href="#"><i class="icon mdi mdi-face"></i><span>Gestion des utilisateurs</span></a>
                    <ul class="sub-menu">
                      <li><a href="./AdminUserAdd.jsp">Ajouter un utilisateur</a></li>
                      <li><a href="AdminUserDell.jsp">Supprimer un utilisateur</a></li>
                    </ul>
                  </li>

                  <li class="parent"><a href="#"><i class="icon mdi mdi-folder"></i><span>Gestion des projets</span></a>
                    <ul class="sub-menu">
                      <li><a href="AdminProjectAdd.jsp">Ajouter un projet</a></li>
                      <li><a href="AdminProjectDel.jsp">Supprimer un projet</a></li>
                    </ul>
                  </li>
                  <li class="parent"><a href="#"><i class="icon mdi mdi-bug"></i><span>Gestion des Bogues</span></a>
                    <ul class="sub-menu">
                      <li><a href="AdminBugSelectProject.jsp">Signaler un bogue</a></li>
                    </ul>
                  </li>

                </ul>
              </div>
            </div>
          </div>

        </div>
      </div>
      
<script type="text/javascript">
	$('#chat').load(document.URL +  ' #chat');
</script>


</html>