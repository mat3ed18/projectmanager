<!DOCTYPE html>
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
                                    <li class="breadcrumb-item"><a href="dashboard-default.html">Project Manager</a></li>
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
                                        <div id="projetos-pendentes">
                                            
                                            <div class="card mb-3 bg-dark bg-opacity-10 cursor-grab">
                                                <div class="card-body p-3">
                                                    <p>Projeto 1</p>
                                                    <div class="float-end mt-n1">
                                                        <img src="../img/avatars/user.png" width="32" height="32" class="rounded-circle" alt="Avatar" />
                                                    </div>
                                                    <a class="btn btn-primary btn-sm" href="#">Ver</a>
                                                    <a class="btn btn-primary btn-sm" href="#">Editar</a>
                                                    <a class="btn btn-danger btn-sm" href="#">Excluir</a>
                                                </div>
                                            </div>
                                        </div>
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
                                        <div id="projetos-em-analise">
                                            
                                            <div class="card mb-3 bg-warning bg-opacity-25 cursor-grab">
                                                <div class="card-body p-3">
                                                    <p>Projeto 2</p>
                                                    <div class="float-end mt-n1">
                                                        <img src="../img/avatars/user.png" width="32" height="32" class="rounded-circle" alt="Avatar" />
                                                    </div>
                                                    <a class="btn btn-primary btn-sm" href="#">Ver</a>
                                                    <a class="btn btn-primary btn-sm" href="#">Editar</a>
                                                    <a class="btn btn-danger btn-sm" href="#">Excluir</a>
                                                </div>
                                            </div>
                                        </div>
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
                                        <div id="projetos-analise-realizada">
                                            
                                            <div class="card mb-3 bg-primary bg-opacity-10 cursor-grab">
                                                <div class="card-body p-3">
                                                    <p>Projeto 3</p>
                                                    <div class="float-end mt-n1">
                                                        <img src="../img/avatars/user.png" width="32" height="32" class="rounded-circle" alt="Avatar" />
                                                    </div>
                                                    <a class="btn btn-primary btn-sm" href="#">Ver</a>
                                                    <a class="btn btn-primary btn-sm" href="#">Editar</a>
                                                    <a class="btn btn-danger btn-sm" href="#">Excluir</a>
                                                </div>
                                            </div>
                                        </div>
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
                                        <div id="projetos-analise-aprovada">
                                            
                                            <div class="card mb-3 bg-primary bg-opacity-25 cursor-grab">
                                                <div class="card-body p-3">
                                                    <p>Projeto 4</p>
                                                    <div class="float-end mt-n1">
                                                        <img src="../img/avatars/user.png" width="32" height="32" class="rounded-circle" alt="Avatar" />
                                                    </div>
                                                    <a class="btn btn-primary btn-sm" href="#">Ver</a>
                                                    <a class="btn btn-primary btn-sm" href="#">Editar</a>
                                                    <a class="btn btn-danger btn-sm" href="#">Excluir</a>
                                                </div>
                                            </div>
                                        </div>
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
                                        <div id="projetos-planejados">
                                            
                                            <div class="card mb-3 bg-secondary bg-opacity-10 cursor-grab">
                                                <div class="card-body p-3">
                                                    <p>Projeto 5</p>
                                                    <div class="float-end mt-n1">
                                                        <img src="../img/avatars/user.png" width="32" height="32" class="rounded-circle" alt="Avatar" />
                                                    </div>
                                                    <a class="btn btn-primary btn-sm" href="#">Ver</a>
                                                    <a class="btn btn-primary btn-sm" href="#">Editar</a>
                                                    <a class="btn btn-danger btn-sm" href="#">Excluir</a>
                                                </div>
                                            </div>
                                        </div>
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
                                        <div id="projetos-iniciado">
                                            
                                            <div class="card mb-3 bg-secondary bg-opacity-25 cursor-grab">
                                                <div class="card-body p-3">
                                                    <p>Projeto 6</p>
                                                    <div class="float-end mt-n1">
                                                        <img src="../img/avatars/user.png" width="32" height="32" class="rounded-circle" alt="Avatar" />
                                                    </div>
                                                    <a class="btn btn-primary btn-sm" href="#">Ver</a>
                                                    <a class="btn btn-primary btn-sm" href="#">Editar</a>
                                                </div>
                                            </div>
                                        </div>
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
                                        <div id="projetos-em-andamento">
                                            
                                            <div class="card mb-3 bg-success bg-opacity-10 cursor-grab">
                                                <div class="card-body p-3">
                                                    <p>Projeto 7</p>
                                                    <div class="float-end mt-n1">
                                                        <img src="../img/avatars/user.png" width="32" height="32" class="rounded-circle" alt="Avatar" />
                                                    </div>
                                                    <a class="btn btn-primary btn-sm" href="#">Ver</a>
                                                    <a class="btn btn-primary btn-sm" href="#">Editar</a>
                                                </div>
                                            </div>
                                        </div>
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
                                        <div id="projetos-encerrados">
                                            
                                            <div class="card mb-3 bg-success bg-opacity-25 cursor-grab">
                                                <div class="card-body p-3">
                                                    <p>Projeto 8</p>
                                                    <div class="float-end mt-n1">
                                                        <img src="../img/avatars/user.png" width="32" height="32" class="rounded-circle" alt="Avatar" />
                                                    </div>
                                                    <a class="btn btn-primary btn-sm" href="#">Ver</a>
                                                    <a class="btn btn-primary btn-sm" href="#">Editar</a>
                                                </div>
                                            </div>
                                        </div>
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
                                        <div id="projetos-cancelados">
                                            
                                            <div class="card mb-3 bg-danger bg-opacity-10 cursor-grab">
                                                <div class="card-body p-3">
                                                    <p>Projeto 9</p>
                                                    <div class="float-end mt-n1">
                                                        <img src="../img/avatars/user.png" width="32" height="32" class="rounded-circle" alt="Avatar" />
                                                    </div>
                                                    <a class="btn btn-primary btn-sm" href="#">Ver</a>
                                                    <a class="btn btn-primary btn-sm" href="#">Editar</a>
                                                    <a class="btn btn-danger btn-sm" href="#">Excluir</a>
                                                </div>
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
                dragula([document.querySelector("#projetos-pendentes"), document.querySelector("#projetos-em-analise"), document.querySelector("#projetos-analise-realizada"), document.querySelector("#projetos-analise-aprovada"), document.querySelector("#projetos-planejados"), document.querySelector("#projetos-iniciado"), document.querySelector("#projetos-em-andamento"), document.querySelector("#projetos-encerrados"), document.querySelector("#projetos-cancelados")]);
            });
        </script>
    </body>
</html>