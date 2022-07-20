<!DOCTYPE html>
<html lang="en">
    <head>
        <title>KANBAN | Project Manager</title>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <script src="js/settings.js"></script>
        <link href="css/modern.css" type="text/css" rel="stylesheet" />
        <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
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

    <body class="">
        <div class="splash">
            <div class="splash-icon"></div>
        </div>

        <div class="wrapper">
            
            <!-- MENU LATERAL -->
            
            <nav id="sidebar" class="sidebar">
                <a class="sidebar-brand" href="index.html">
                    <svg>
                        <use xlink:href="#ion-ios-pulse-strong"></use>
                    </svg>
                    Spark
                </a>
                <div class="sidebar-content">
                    <div class="sidebar-user">
                        <img src="img/avatars/avatar.jpg" class="img-fluid rounded-circle mb-2" alt="Mateus Silva" />
                        <div class="fw-bold">Mateus Silva</div>
                        <small>Funcionário</small>
                    </div>

                    <ul class="sidebar-nav">
                        <li class="sidebar-header">
                            Project Manager
                        </li>
                        <li class="sidebar-item active">
                            <a data-bs-target="#projects" data-bs-toggle="collapse" class="sidebar-link" aria-expanded="false"> <i class="align-middle me-2 fas fa-fw fa-project-diagram"></i> <span class="align-middle">Projeto</span> </a>
                            <ul id="projects" class="sidebar-dropdown list-unstyled collapse show" data-bs-parent="#sidebar" style="">
                                <li class="sidebar-item"><a class="sidebar-link" href="dashboard-default.html">Adicionar</a></li>
                                <li class="sidebar-item"><a class="sidebar-link" href="dashboard-analytics.html">Projetos</a></li>
                                <li class="sidebar-item"><a class="sidebar-link" href="dashboard-e-commerce.html">Kanban <span class="sidebar-badge badge rounded-pill bg-primary">NOVO</span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item">
                            <a data-bs-target="#user" data-bs-toggle="collapse" class="sidebar-link collapsed" aria-expanded="false">
                                <i class="align-middle me-2 fas fa-fw fa-user"></i> <span class="align-middle">Minha Conta</span>
                            </a>
                            <ul id="user" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                                <li class="sidebar-item"><a class="sidebar-link" href="dashboard-default.html">Perfil</a></li>
                                <li class="sidebar-item"><a class="sidebar-link" href="dashboard-e-commerce.html">Configurações</a></li>
                                <li class="sidebar-item"><a class="sidebar-link" href="dashboard-analytics.html">Sair</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            
            <div class="main">
                
                <!-- HEADER COM PESQUISA E NOTIFICAÇÕES -->
                
                <nav class="navbar navbar-expand navbar-theme">
                    <a class="sidebar-toggle d-flex me-2">
                        <i class="hamburger align-self-center"></i>
                    </a>
                    
                    <!-- FORMULÁRIO DE BUSCA -->

                    <form class="d-none d-sm-inline-block">
                        <input class="form-control form-control-lite" type="text" placeholder="Search projects..." />
                    </form>
                    
                    <!-- BOTÕES -->

                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            
                            <!-- OPÇÕES -->
                            
                            <li class="nav-item dropdown ms-lg-2">
                                <a class="nav-link dropdown-toggle position-relative" href="#" id="userDropdown" data-bs-toggle="dropdown">
                                    <i class="align-middle fas fa-sign-out-alt"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                
                <!-- MAIN -->
                
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
                                                        <img src="img/avatars/avatar-4.jpg" width="32" height="32" class="rounded-circle" alt="Avatar" />
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
                                                        <img src="img/avatars/avatar-2.jpg" width="32" height="32" class="rounded-circle" alt="Avatar" />
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
                                                        <img src="img/avatars/avatar-2.jpg" width="32" height="32" class="rounded-circle" alt="Avatar" />
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
                                                        <img src="img/avatars/avatar-2.jpg" width="32" height="32" class="rounded-circle" alt="Avatar" />
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
                                                        <img src="img/avatars/avatar-2.jpg" width="32" height="32" class="rounded-circle" alt="Avatar" />
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
                                                        <img src="img/avatars/avatar-2.jpg" width="32" height="32" class="rounded-circle" alt="Avatar" />
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
                                                        <img src="img/avatars/avatar-2.jpg" width="32" height="32" class="rounded-circle" alt="Avatar" />
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
                                                        <img src="img/avatars/avatar-2.jpg" width="32" height="32" class="rounded-circle" alt="Avatar" />
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
                                                        <img src="img/avatars/avatar-2.jpg" width="32" height="32" class="rounded-circle" alt="Avatar" />
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
                
                <!-- FOOTER -->
                
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row text-muted">
                            <div class="col-8 text-start">
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <a class="text-muted" href="#">Suporte</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="text-muted" href="#">Privacidade</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="text-muted" href="#">Termos de serviço</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="text-muted" href="#">Contato</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-4 text-end">
                                <p class="mb-0">2022 - <a href="dashboard-default.html" class="text-muted">Project Manager</a></p>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

        <svg width="0" height="0" style="position: absolute;">
            <defs>
                <symbol viewBox="0 0 512 512" id="ion-ios-pulse-strong">
                    <path
                        d="M448 273.001c-21.27 0-39.296 13.999-45.596 32.999h-38.857l-28.361-85.417a15.999 15.999 0 0 0-15.183-10.956c-.112 0-.224 0-.335.004a15.997 15.997 0 0 0-15.049 11.588l-44.484 155.262-52.353-314.108C206.535 54.893 200.333 48 192 48s-13.693 5.776-15.525 13.135L115.496 306H16v31.999h112c7.348 0 13.75-5.003 15.525-12.134l45.368-182.177 51.324 307.94c1.229 7.377 7.397 11.92 14.864 12.344.308.018.614.028.919.028 7.097 0 13.406-3.701 15.381-10.594l49.744-173.617 15.689 47.252A16.001 16.001 0 0 0 352 337.999h51.108C409.973 355.999 427.477 369 448 369c26.511 0 48-22.492 48-49 0-26.509-21.489-46.999-48-46.999z"
                    ></path>
                </symbol>
            </defs>
        </svg>
        
        <script src="js/app.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                dragula([document.querySelector("#projetos-pendentes"), document.querySelector("#projetos-em-analise"), document.querySelector("#projetos-analise-realizada"), document.querySelector("#projetos-analise-aprovada"), document.querySelector("#projetos-planejados"), document.querySelector("#projetos-iniciado"), document.querySelector("#projetos-em-andamento"), document.querySelector("#projetos-encerrados"), document.querySelector("#projetos-cancelados")]);
            });
        </script>
    </body>
</html>