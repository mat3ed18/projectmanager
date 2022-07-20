<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<f:view>
    <html lang="en">
        <head>
            <title>Usuário | Project Manager</title>
            <jsp:include page="structure/head.jsp"/>
            <style>
                
            </style>
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
                                    Mariana Silva
                                </h1>
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
                                            <h5 class="card-title mb-0">Mariana Silva</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="row g-0">
                                                <div class="col-sm-2 col-xl-2 col-xxl-1 text-center">
                                                    <img src="img/avatars/avatar-3.jpg" width="64" height="64" class="rounded-circle" alt="Angelica Ramos" />
                                                </div>
                                                <div class="col-sm-10 col-xl-10 col-xxl-11">
                                                    <table class="table table-lg table-responsive my-2 mt-0">
                                                        <tbody>
                                                            <tr>
                                                                <th>Nome</th>
                                                                <td>Mariana Silva</td>
                                                            </tr>
                                                            <tr>
                                                                <th>CPF</th>
                                                                <td>495.***.***-21</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Data de Nascimento</th>
                                                                <td>30 de maio de 2003</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Projetos</th>
                                                                <td class="lh-lg">
                                                                    <b>12.546</b> projetos <span class="badge bg-light-dark text-black ms-1">MEMBRO</span><br>
                                                                    <b>678.546</b> projetos <span class="badge bg-dark-light ms-1 mt-1">GERENTE</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>Funcionário</th>
                                                                <td><span class="badge bg-success">ATIVO</span></td>
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
        </body>
    </html>
</f:view>