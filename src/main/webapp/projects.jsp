<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<f:view>
    <html lang="en">
        <head>
            <title>Projetos | Project Manager</title>
            <jsp:include page="structure/head.jsp"/>
            <style>
                body {
                    opacity: 0;
                }
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
                                    Projetos
                                </h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="dashboard-default.html">Project Manager</a></li>
                                        <li class="breadcrumb-item"><a href="#">Projeto</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Projetos</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title">Ver Projetos</h5>
                                            <h6 class="card-subtitle text-muted">
                                                Acompanhe todos os projetos onde você está participando. Para visualizá-los em um formato mais dinâmico, abra o <a href="<%= BASE_URL %>/kanban">Kanban</a>.
                                            </h6>
                                        </div>
                                        <div class="card-body">
                                            <table id="example" class="table table-striped dataTable no-footer dtr-inline" style="width:100%">
                                                <thead>
                                                    <tr>
                                                        <th>id</th>
                                                    </tr>
                                                </thead>
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
            <jsp:include page="structure/scripts-login.jsp"/>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Datatables with Multiselect
                    var datatablesMulti = $("#example").DataTable({
                        responsive: true,
                        select: {
                            style: "multi",
                        },
                        data: [
                            [
                                1
                            ], 
                            [
                                2
                            ]
                        ]
                    });
                });
            </script>
        </body>
    </html>
</f:view>