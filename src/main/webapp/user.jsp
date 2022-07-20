<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
    <html lang="en">
        <head>
            <title>Usuário | Project Manager</title>
            <jsp:include page="structure/head.jsp"/>
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
                                        <li class="breadcrumb-item"><a href="dashboard-default.html">Project Manager</a></li>
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
                                                                <th>Projetos</th>
                                                                <td class="lh-lg">
                                                                    <b id="count_member"></b> projetos <span class="badge bg-light-dark text-black ms-1">MEMBRO</span><br>
                                                                    <b id="count_manager"></b> projetos <span class="badge bg-dark-light ms-1 mt-1">GERENTE</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>Funcionário</th>
                                                                <td><span class="badge bg-success lh-lg"></span></td>
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
            </div>
            <jsp:include page="structure/scripts.jsp"/>
            <jsp:include page="structure/scripts-login.jsp"/>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Datatables clients
                    $("#datatables-clients").DataTable({
                        responsive: true,
                        order: [[1, "asc"]],
                    });
                });
            </script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    <% if (request.getAttribute("id") != null) { %>
                        $.get("<%= BASE_URL %>/projectmanager/pessoa", {id: "<%= request.getAttribute("id") %>"}, function (data) {
                            $("#nome, td#nome").html(data.nome);
                            $("#CPF").html(data.cpf);
                            $("#data_nascimento").html(data.dataNascimento);
                            $("#count_member").html(23);
                            $("#count_manager").html(24);
                        });
                    <% } else { %>
                        window.location.href = "<%= BASE_URL %>/home";
                    <% } %>
                });
            </script>
        </body>
    </html>
