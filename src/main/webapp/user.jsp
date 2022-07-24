<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Usuário | Project Manager</title>
        <jsp:include page="structure/head.jsp"/>
        <link href="<%= BASE_URL %>/css/pages/style_user.css" type="text/css" rel="stylesheet" />
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
                            <h1 class="header-title" id="nome"></h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<%= BASE_URL %>/home">Project Manager</a></li>
                                    <li class="breadcrumb-item"><a href="#">Membros</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Usuário</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-xxl-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0" id="nome"></h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row g-0">
                                            <div class="col-sm-2 col-xl-2 col-xxl-1 text-center">
                                                <img src="<%= BASE_URL %>/img/avatars/user.png" width="64" height="64" class="rounded-circle" />
                                            </div>
                                            <div class="col-sm-10 col-xl-10 col-xxl-11">
                                                <table class="table table-lg table-responsive my-2 mt-0">
                                                    <tbody>
                                                        <tr>
                                                            <th>Nome</th>
                                                            <td id="nome"></td>
                                                        </tr>
                                                        <tr>
                                                            <th>CPF</th>
                                                            <td id="CPF"></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Data de Nascimento</th>
                                                            <td id="data_nascimento"></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Funcionário</th>
                                                            <td><span class="badge bg-success lh-lg" id="boolFuncionario"></span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="structure/footer.jsp"/>
            </div>
            <% if (request.getAttribute("id") != null) { %>
            <input type="hidden" id="user" value="<%= request.getAttribute("id") %>">
            <% } %>
        </div>
        <jsp:include page="structure/scripts.jsp"/>
        <script src="<%= BASE_URL %>/js/scripts/pages/script_user.js"></script>
    </body>
</html>