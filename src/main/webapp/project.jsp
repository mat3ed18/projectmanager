<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Projeto | Project Manager</title>
        <script src="js/settings.js"></script>
        <link href="css/modern.css" type="text/css" rel="stylesheet" />
        <style>
            
        </style>
    </head>

    <body>
        <div class="splash">
            <div class="splash-icon"></div>
        </div>

        <div class="wrapper">
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
                                <a class="nav-link dropdown-toggle position-relative">
                                    <i class="align-middle fas"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
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
                // Datatables clients
                $("#datatables-clients").DataTable({
                    responsive: true,
                    order: [[1, "asc"]],
                });
            });
        </script>
    </body>
</html>
