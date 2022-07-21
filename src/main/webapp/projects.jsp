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
                                        <li class="breadcrumb-item"><a href="<%= BASE_URL %>/home">Project Manager</a></li>
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
                                            <table id="example" class="table table-striped dataTable no-footer dtr-inline" style="width:100%"></table>
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
                    var projetos = [];
                    
                    $.ajaxSetup({async: false});
                    
                    $.get("<%= BASE_URL %>/projectmanager/projetos", {}, function (data) {
                        projetos = data.results;
                    });
                    
                    var dataSet = [];
                    
                    for (var i = 0; i < projetos.length; i++) {
                        projetos[i].nome = "<a href='<%= BASE_URL %>/project/" + projetos[i].id + "'>" + projetos[i].nome + "</a>";
                        projetos[i].gerente = "<a href='<%= BASE_URL %>/user/" + projetos[i].gerente.id + "'>" + projetos[i].gerente.nome + "</a>";
                        dataSet.push([projetos[i].id, projetos[i].nome, projetos[i].dataInicio.formatDate(), projetos[i].dataPrevisaoFim.formatDate(), projetos[i].dataFim.formatDate(), projetos[i].status, projetos[i].orcamento.toLocaleString("pt-br", {style: "currency", currency: "BRL"}), projetos[i].risco, projetos[i].gerente]);
                    }
                    
                    // Datatables with Multiselect
                    var datatablesMulti = $("#example").DataTable({
                        responsive: true,
                        select: {
                            style: "multi",
                        },
                        data: dataSet, 
                        columns: [
                            { title: 'id' },
                            { title: 'nome' },
                            { title: 'data inicial' },
                            { title: 'previsão' },
                            { title: 'data final' },
                            { title: 'status' },
                            { title: 'orçamento' },
                            { title: 'risco' },
                            { title: 'gerente' }
                        ]
                    });
                });
            </script>
        </body>
    </html>
</f:view>