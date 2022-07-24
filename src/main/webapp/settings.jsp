<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Configurações | Project Manager</title>
        <jsp:include page="structure/head.jsp"/>
        <link href="<%= BASE_URL %>/css/pages/style_settings.css" type="text/css" rel="stylesheet" />
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
                                Configurações
                            </h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<%= BASE_URL %>/home">Project Manager</a></li>
                                    <li class="breadcrumb-item"><a href="#">Minha Conta</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Configurações</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">

                            <!-- SUBMENU LATERAL (TABS) -->

                            <div class="col-md-3 col-xl-2">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">Configurações</h5>
                                    </div>

                                    <div class="list-group list-group-flush" role="tablist">
                                        <a class="list-group-item list-group-item-action active" data-bs-toggle="list" href="#account" role="tab" aria-selected="true">
                                            Minha Conta
                                        </a>
                                        <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#security" role="tab">
                                            Segurança
                                        </a>
                                        <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#custom" role="tab">
                                            Personalização
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- PAINEIS (TABS) -->

                            <div class="col-md-9 col-xl-10">
                                <div class="tab-content">

                                    <!-- TAB -->

                                    <div class="tab-pane fade active show" id="account" role="tabpanel">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="card-title mb-0">Minha Conta</h5>
                                            </div>
                                            <div class="card-body">
                                                <form id="validation-form" novalidate="novalidate">
                                                    <div class="row">
                                                        <div class="mb-3 col-md-6 error-placeholder">
                                                            <label>nome</label>
                                                            <input class="form-control mt-2" type="text" name="nome" placeholder="Digite seu nome" />
                                                        </div>
                                                        <div class="mb-3 col-md-6 error-placeholder">
                                                            <label>cpf</label>
                                                            <input class="form-control mt-2" type="text" name="cpf" placeholder="Digite seu CPF" data-mask="000.000.000-00" data-reverse="true" autocomplete="off" maxlength="14" />
                                                        </div>
                                                    </div>
                                                    <div class="mb-3 error-placeholder">
                                                        <label>data de nascimento</label>
                                                        <input class="form-control mt-2" type="date" name="dataNascimento" placeholder="Digite sua data de nascimento" />
                                                    </div>
                                                    <div class="mb-3" id="send-area">
                                                        <input id="customControlInline" type="checkbox" class="form-check-input" name="isFuncionario" />
                                                        <label class="form-check-label text-small ps-2" for="customControlInline">Sou um funcionário</label>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Atualizar</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- TAB -->

                                    <div class="tab-pane fade" id="security" role="tabpanel">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Segurança</h5>
                                                <div>
                                                    <div class="mb-3">
                                                        <label>Quer apagar a sua conta? Lembre-se que esta ação é irreversí­vel e não pode ser voltada atrás caso haja arrependimento.</label>
                                                        <label>A exclusão é definitiva e sem volta, mas ao invés de apagar, você pode <a href="<%= BASE_URL %>/logout">sair</a> desta conta.</label>
                                                    </div>
                                                    <button class="btn btn-danger">Deletar minha conta</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="custom" role="tabpanel">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Personalização</h5>
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
            <% if (request.getSession(false).getAttribute("user_id") != null) { %>
            <input type="hidden" id="user_id" data-id="<%= request.getSession(false).getAttribute("user_id") %>">
            <% } %>
        </div>
        <jsp:include page="structure/scripts.jsp"/>
        <jsp:include page="structure/script-login.jsp"/>
        <script src="<%= BASE_URL %>/js/scripts/pages/script_settings.js"></script>
    </body>
</html>