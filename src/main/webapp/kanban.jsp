<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>KANBAN | Project Manager</title>
        <jsp:include page="structure/head.jsp"/>
        <link href="<%= BASE_URL %>/css/pages/style_kanban.css" type="text/css" rel="stylesheet" />
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

                            <div class="col-12 col-lg-6 col-xl-3 coluna-projetos">
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

                            <div class="col-12 col-lg-6 col-xl-3 coluna-projetos">
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

                            <div class="col-12 col-lg-6 col-xl-3 coluna-projetos">
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

                            <div class="col-12 col-lg-6 col-xl-3 coluna-projetos">
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

                            <div class="col-12 col-lg-6 col-xl-3 coluna-projetos">
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

                            <div class="col-12 col-lg-6 col-xl-3 coluna-projetos">
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

                            <div class="col-12 col-lg-6 col-xl-3 coluna-projetos">
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

                            <div class="col-12 col-lg-6 col-xl-3 coluna-projetos">
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

                            <div class="col-12 col-lg-6 col-xl-3 coluna-projetos">
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
        <script src="<%= BASE_URL %>/js/scripts/pages/script_kanban.js"></script>
    </body>
</html>