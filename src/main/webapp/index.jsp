<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Início | Project Manager</title>
        <jsp:include page="structure/head.jsp"/>
        <link href="<%= BASE_URL %>/css/pages/style_index.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <div class="splash">
            <div class="splash-icon"></div>
        </div>
        <div class="wrapper">
            <jsp:include page="structure/side-menu.jsp"/>
            <div class="main">
                <jsp:include page="structure/header.jsp"/>
                <main class="content">
                    <div class="container-fluid">
                        <div class="header">
                            <h1 class="header-title">
                                Project Manager
                            </h1>
                            <p class="header-subtitle user">Você está logado no Project Manager como</p>
                        </div>

                        <div class="row">
                            <div class="col-12 col-md-6 col-xxl-8">
                                <div class="card flex-fill">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">Introdução</h5>
                                    </div>
                                    <div class="card-body">
                                        Este é um dashboard para gerenciar os projetos de sua equipe
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-3 col-xxl-2">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">Projeto</h5>
                                    </div>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item"><a href="<%= BASE_URL %>/project/add">Adicionar Projeto</a></li>
                                        <li class="list-group-item"><a href="<%= BASE_URL %>/projects">Projetos</a></li>
                                        <li class="list-group-item"><a href="<%= BASE_URL %>/kanban">Kanban</a><span class="sidebar-badge badge rounded-pill bg-primary">NOVO</span></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-12 col-md-3 col-xxl-2">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">Minha Conta</h5>
                                    </div>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item"><a id="link_profile" href="<%= BASE_URL %>/user">Perfil</a></li>
                                        <li class="list-group-item"><a href="<%= BASE_URL %>/settings">Configurações</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>  
                <jsp:include page="structure/footer.jsp"/>
            </div>
        </div>
        <jsp:include page="structure/scripts.jsp"/>
        <jsp:include page="structure/script-login.jsp"/>
        <script src="<%= BASE_URL %>/js/scripts/pages/script_index.js"></script>
    </body>
</html>