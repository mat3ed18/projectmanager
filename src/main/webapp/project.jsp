<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<f:view>
    <html lang="en">
        <head>
            <title>Projeto | Project Manager</title>
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
                                    Desenvolvimento de Software de Automação Comercial para o Supermercado Extra
                                </h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="dashboard-default.html">Project Manager</a></li>
                                        <li class="breadcrumb-item"><a href="#">Projetos</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Projeto</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="row">
                                <div class="col-xxl-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title mb-0">Descrição</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="row g-0">
                                                <div class="col-sm-12 col-xl-12 col-xxl-12">
                                                    <p>
                                                        html
                                                    </p>
                                                </div>
                                            </div>

                                            <table class="table table-striped table-lg table-responsive my-2">
                                                <tbody>
                                                    <tr class="text-center">
                                                        <th colspan="2">INFORMAçõES</th>
                                                    </tr>
                                                    <tr>
                                                        <th>Data Inicial</th>
                                                        <td>12 de julho de 2022</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Data de Previsão Final</th>
                                                        <td>10 de agosto de 2022</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Data Final</th>
                                                        <td>12 de setembro de 2022</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Orçamento (valor)</th>
                                                        <td>R$ 46.543,00</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Gerente</th>
                                                        <td><a href="#">José Santos</a></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Status</th>
                                                        <td><span class="badge bg-success">EM ANDAMENTO</span></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Risco</th>
                                                        <td><span class="badge bg-danger me-2">ALTO</span> 29 dias restantes</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Membros</th>
                                                        <td><a href="#" class="btn btn-md btn-primary">Visualizar</a></td>
                                                    </tr>
                                                    <tr class="text-center">
                                                        <td colspan="2">
                                                            <a href="#" class="btn btn-md btn-primary me-2">Editar Projeto</a>
                                                            <a href="#" class="btn btn-md btn-danger">Excluir Projeto</a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
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
            <jsp:include page="structure/script-login.jsp"/>
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
            <%
                if (request.getAttribute("id") != null) {
                    %>
                        $.get("<%= BASE_URL %>/projectmanager/projeto", {id: "<%= request.getAttribute("id") %>"}, function (data) {
                            console.log(data);
                        });
                    <%
                } else {
                    %>
                        window.location.href = "<%= BASE_URL %>/home";
                    <%
                }
            %>
            </script>
        </body>
    </html>
</f:view>