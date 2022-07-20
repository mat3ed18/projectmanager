<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<nav id="sidebar" class="sidebar">
    <a class="sidebar-brand" href="<%= BASE_URL %>/home">Project Manager</a>
    <div class="sidebar-content">
        <div class="sidebar-user">
            <img src="<%= BASE_URL %>/img/avatars/user.png" class="img-fluid rounded-circle mb-2" />
            <div class="fw-bold" id="username"></div>
            <small>Funcionário</small>
        </div>
        <ul class="sidebar-nav">
            <li class="sidebar-header">Project Manager</li>
            <li class="sidebar-item active">
                <a data-bs-target="#projects" data-bs-toggle="collapse" class="sidebar-link" aria-expanded="false"> <i class="align-middle me-2 fas fa-fw fa-project-diagram"></i> <span class="align-middle">Projeto</span> </a>
                <ul id="projects" class="sidebar-dropdown list-unstyled collapse show" data-bs-parent="#sidebar" style="">
                    <li class="sidebar-item"><a class="sidebar-link" href="<%= BASE_URL %>/project/add">Adicionar</a></li>
                    <li class="sidebar-item"><a class="sidebar-link" href="<%= BASE_URL %>/projects">Projetos</a></li>
                    <li class="sidebar-item"><a class="sidebar-link" href="<%= BASE_URL %>/kanban">Kanban <span class="sidebar-badge badge rounded-pill bg-primary">NOVO</span></a></li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a data-bs-target="#user" data-bs-toggle="collapse" class="sidebar-link collapsed" aria-expanded="false">
                    <i class="align-middle me-2 fas fa-fw fa-user"></i> <span class="align-middle">Minha Conta</span>
                </a>
                <ul id="user" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                    <li class="sidebar-item"><a class="sidebar-link" id="link_profile" href="<%= BASE_URL %>/user">Perfil</a></li>
                    <li class="sidebar-item"><a class="sidebar-link" href="<%= BASE_URL %>/settings">Configurações</a></li>
                    <li class="sidebar-item"><a class="sidebar-link" href="<%= BASE_URL %>/logout">Sair</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>