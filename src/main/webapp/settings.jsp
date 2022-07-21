<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<f:view>
    <html lang="en">
        <head>
            <title>Configurações | Project Manager</title>
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
                                    Configurações
                                </h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="dashboard-default.html">Project Manager</a></li>
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
                                                        <div class="mb-3">
                                                            <input id="customControlInline" type="checkbox" class="form-check-input" value="isFuncionario" name="isFuncionario" />
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
                                                    <form>
                                                        <div class="mb-3">
                                                            <label>Quer apagar a sua conta? Lembre-se que esta ação é irreversí­vel e não pode ser voltada atrás caso haja arrependimento.</label>
                                                            <label>A exclusão é definitiva e sem volta, mas ao invés de apagar, você pode <a href="#">sair</a> desta conta.</label>
                                                            <input type="hidden" class="form-control mt-2" name="id" id="inputPasswordNew" />
                                                        </div>
                                                        <button type="submit" class="btn btn-danger">Deletar minha conta</button>
                                                    </form>
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
            </div>
            <jsp:include page="structure/scripts.jsp"/>
            <jsp:include page="structure/script-login.jsp"/>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    <% if (request.getSession(false).getAttribute("user_id") != null) { %>
                        $.get("<%= BASE_URL %>/projectmanager/pessoa", {id: "<%= request.getSession(false).getAttribute("user_id") %>"}, function (data) {
                            $("input[name='nome']").val(data.nome);
                            $("input[name='cpf']").val(data.cpf);
                            $("input[name='dataNascimento']").val(data.dataNascimento);
                            $("input[name='isFuncionario']").prop("checked", data.funcionario);
                        });
                    <% } else { %>
                        window.location.href = "<%= BASE_URL %>/home";
                    <% } %>
                });
            </script>
            <script>
                $("#validation-form").validate({
                    focusInvalid: true,
                    rules: {
                        "nome": {
                            required: true
                        },
                        "cpf": {
                            required: true,
                            minlength: 14
                        },
                        "dataNascimento": {
                            required: true
                        }
                    },
                    messages: {
                        "nome": {
                            required: "Insira o seu nome"
                        },
                        "cpf": {
                            required: "Insira o seu CPF"
                        },
                        "dataNascimento": {
                            required: "Insira a sua data de nascimento"
                        }
                    },
                    // Errors
                    errorPlacement: function errorPlacement(error, element) {
                        var $parent = $(element).parents(".error-placeholder");
                        if ($parent.find(".jquery-validation-error").length) {
                            return;
                        }
                        $parent.append(error.addClass("jquery-validation-error small form-text invalid-feedback"));
                    },
                    highlight: function (element) {
                        var $el = $(element);
                        var $parent = $el.parents(".error-placeholder");
                    },
                    unhighlight: function (element) {
                        $(element).parents(".error-placeholder").find(".is-invalid").removeClass("is-invalid");
                    }
                });
            </script>
        </body>
    </html>
</f:view>