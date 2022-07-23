<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<f:view>
    <html lang="en">
        <head>
            <title>KANBAN | Project Manager</title>
            <jsp:include page="structure/head.jsp"/>
            <style>
                .card-body div[id*="projetos"] {
                    min-height: 50px;
                }

                .columns-kanban {
                    overflow-x: auto;
                    white-space: nowrap;
                }

                .columns-kanban .coluna-projetos {
                    display: inline-block;
                    white-space: initial;
                }

                .wrapper::before {
                    z-index: -1;
                }

                .bg-gold {
                    background-color: gold;
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

                            <!-- HEADER -->

                            <div class="header">
                                <h1 class="header-title">
                                    KANBAN
                                </h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="<%= BASE_URL %>/home">Project Manager</a></li>
                                        <li class="breadcrumb-item"><a href="#">Projeto</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Kanban</li>
                                    </ol>
                                </nav>
                            </div>

                            <!-- CONTENT -->

                            <div class="columns-kanban">

                                <!-- COLUNA DO TRELLO #projetos-pendentes -->

                                <div class="col-5 col-lg-6 col-xl-3 coluna-projetos">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title btn bg-dark bg-opacity-50 text-white rounded-pill my-0 mx-0">pendente</h5>
                                        </div>
                                        <div class="card-body py-0 px-3.5 pb-3">
                                            <div id="projetos-pendentes" data-status="" data-class="bg-dark bg-opacity-10"></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- COLUNA DO TRELLO #projetos-em-analise -->

                                <div class="col-5 col-lg-6 col-xl-3 coluna-projetos">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title btn bg-gold text-dark rounded-pill my-0 mx-0">em análise</h5>
                                        </div>
                                        <div class="card-body py-0 px-3.5 pb-3">
                                            <div id="projetos-em-analise" data-status="em análise" data-class="bg-warning bg-opacity-25"></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- COLUNA DO TRELLO #projetos-analise-realizada -->

                                <div class="col-5 col-lg-6 col-xl-3 coluna-projetos">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title btn bg-primary-light text-white rounded-pill my-0 mx-0">análise realizada</h5>
                                        </div>
                                        <div class="card-body py-0 px-3.5 pb-3">
                                            <div id="projetos-analise-realizada" data-status="análise realizada" data-class="bg-primary bg-opacity-10"></div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- COLUNA DO TRELLO #projetos-analise-aprovada -->

                                <div class="col-5 col-lg-6 col-xl-3 coluna-projetos">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title btn bg-primary text-white rounded-pill my-0 mx-0">análise aprovada</h5>
                                        </div>
                                        <div class="card-body py-0 px-3.5 pb-3">
                                            <div id="projetos-analise-aprovada" data-status="análise aprovada" data-class="bg-primary bg-opacity-25"></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- COLUNA DO TRELLO #projetos-planejados -->

                                <div class="col-5 col-lg-6 col-xl-3 coluna-projetos">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title btn bg-secondary-light text-white rounded-pill my-0 mx-0">planejado</h5>
                                        </div>
                                        <div class="card-body py-0 px-3.5 pb-3">
                                            <div id="projetos-planejados" data-status="planejado" data-class="bg-secondary bg-opacity-10"></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- COLUNA DO TRELLO #projetos-iniciado -->

                                <div class="col-5 col-lg-6 col-xl-3 coluna-projetos">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title btn bg-secondary text-white rounded-pill my-0 mx-0">iniciado</h5>
                                        </div>
                                        <div class="card-body py-0 px-3.5 pb-3">
                                            <div id="projetos-iniciado" data-status="iniciado" data-class="bg-secondary bg-opacity-25"></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- COLUNA DO TRELLO #projetos-em-andamento -->

                                <div class="col-5 col-lg-6 col-xl-3 coluna-projetos">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title btn bg-success-light text-white rounded-pill my-0 mx-0">em andamento</h5>
                                        </div>
                                        <div class="card-body py-0 px-3.5 pb-3">
                                            <div id="projetos-em-andamento" data-status="em andamento" data-class="bg-success bg-opacity-10"></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- COLUNA DO TRELLO #projetos-encerrados -->

                                <div class="col-5 col-lg-6 col-xl-3 coluna-projetos">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title btn bg-success-dark text-white rounded-pill my-0 mx-0">encerrado</h5>
                                        </div>
                                        <div class="card-body py-0 px-3.5 pb-3">
                                            <div id="projetos-encerrados" data-status="encerrado" data-class="bg-success bg-opacity-25"></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- COLUNA DO TRELLO #projetos-cancelados -->

                                <div class="col-5 col-lg-6 col-xl-3 coluna-projetos">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title btn btn-danger text-white rounded-pill my-0 mx-0">cancelado</h5>
                                        </div>
                                        <div class="card-body py-0 px-3.5 pb-3">
                                            <div id="projetos-cancelados" data-status="cancelado" data-class="bg-danger bg-opacity-10"></div>
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
            <script src="js/kanban.js"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var scroll = autoScroll([
                        document.querySelector(".columns-kanban")
                    ], {
                        margin: 30,
                        maxSpeed: 50,
                        scrollWhenOutside: true,
                        autoScroll: function () {
                            return this.down
                        }
                    });
                    
                    dragula([document.querySelector("#projetos-pendentes"), document.querySelector("#projetos-em-analise"), document.querySelector("#projetos-analise-realizada"), document.querySelector("#projetos-analise-aprovada"), document.querySelector("#projetos-planejados"), document.querySelector("#projetos-iniciado"), document.querySelector("#projetos-em-andamento"), document.querySelector("#projetos-encerrados"), document.querySelector("#projetos-cancelados")]).on('drop', function (el) {
                        var card = $(el);
                        var main = card.parent();
                        card.attr("class", "card mb-3 " + main.attr("data-class"));
                        
                        if (card.find(".btn-danger").length == 0) {
                            card.find(".card-body").append('<a class="btn btn-danger btn-sm">Excluir</a>');
                        }
                        
                        if (main.attr("data-status").match("iniciado|em andamento|encerrado")) {
                            card.find(".card-body .btn-danger").remove();
                        }
                        
                        $.ajax({
                            url: "<%= BASE_URL %>/projectmanager/projeto/atualizar/status",
                            type: "PUT",
                            dataType: "json",
                            data: {
                                id: card.attr("data-id"),
                                status: main.attr("data-status")
                            }, 
                            success: function (data) {
                                toastr["success"]("", data.mensagem, { positionClass: "toast-bottom-right", closeButton: false, progressBar: true, newestOnTop: false, timeOut: 1000 });
                            }
                        });
                    });
                });
            </script>
        </body>
    </html>
</f:view>