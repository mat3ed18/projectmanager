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
                                <h1 class="header-title" id="nome"></h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="<%= BASE_URL %>/home">Project Manager</a></li>
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
                                                <div class="col-sm-12 col-xl-12 col-xxl-12" id="descricao">

                                                </div>
                                            </div>

                                            <table class="table table-lg table-responsive my-4">
                                                <tbody>
                                                    <tr class="text-center table-primary">
                                                        <th colspan="2">INFORMAÇÕES</th>
                                                    </tr>
                                                    <tr>
                                                        <th>Data Inicial</th>
                                                        <td id="dataInicio"></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Data de Previsão Final</th>
                                                        <td id="dataPrevisaoFim"></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Data Final</th>
                                                        <td id="dataFim"></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Orçamento (valor)</th>
                                                        <td id="orcamento">R$ 46.543,00</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Gerente</th>
                                                        <td id="gerente"></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Status</th>
                                                        <td id="status"></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Risco</th>
                                                        <td id="risco"></td>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="2" class="text-center table-primary">MEMBROS</th>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" class="p-0 pt-3 pb-3"><table id="example" class="table table-striped dataTable no-footer dtr-inline" style="width:100%"></table></td>
                                                    </tr>
                                                    <tr class="text-center">
                                                        <td colspan="2">
                                                            <a href="#" class="btn btn-md btn-primary me-2" id="edit">Editar Projeto</a>
                                                            <a class="btn btn-md btn-danger">Excluir Projeto</a>
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
                    $.get("<%= BASE_URL %>/projectmanager/projeto", {id: "<%= request.getAttribute("id") %>"}, function (data) {
                        $("#edit").attr("href", "<%= BASE_URL %>/project/" + data.id + "/edit");
                        $("#nome").html(data.nome);
                        $("#descricao").html(data.descricao);
                        $("#dataInicio").html(data.dataInicio.formatDate());
                        $("#dataPrevisaoFim").html(data.dataPrevisaoFim.formatDate());
                        $("#dataFim").html(data.dataFim.formatDate());
                        $("#orcamento").html(data.orcamento.toLocaleString("pt-br", {style: "currency", currency: "BRL"}));
                        data.gerente = "<a href='<%= BASE_URL %>/user/" + data.gerente.id + "'>" + data.gerente.nome + "</a>";
                        $("#gerente").html(data.gerente);
                        $("#status").html(data.status);
                        $("#risco").html(data.risco);
                    });
                    
                    $.get("<%= BASE_URL %>/projectmanager/projeto/membros", {projetoId: "<%= request.getAttribute("id") %>"}, function (data) {
                        var dataSet = [];
                        
                        for (var i = 0; i < data.results.length; i++) {
                            data.results[i].nome = "<a href='<%= BASE_URL %>/user/" + data.results[i].id + "'>" + data.results[i].nome + "</a>";
                            dataSet.push([data.results[i].id, data.results[i].nome, data.results[i].cpf, data.results[i].dataNascimento.formatDate()]);
                        }
                        
                        var datatablesMulti = $("#example").DataTable({
                            responsive: true,
                            select: {
                                style: "multi",
                            },
                            data: dataSet, 
                            columns: [
                                { title: 'id' },
                                { title: 'nome' },
                                { title: 'cpf' },
                                { title: 'data de nascimento' }
                            ]
                        });
                    });
                });
            </script>
        </body>
    </html>
</f:view>