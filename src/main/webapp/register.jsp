<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<f:view>
    <html lang="en">
        <head>
            <title>Cadastro | Project Manager</title>
            <jsp:include page="structure/head.jsp"/>
        </head>
        <body class="theme-blue">
            <div class="splash">
                <div class="splash-icon"></div>
            </div>
            <main class="main h-100 w-100">
                <div class="container h-100">
                    <div class="row h-100">
                        <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
                            <div class="d-table-cell align-middle">
                                <div class="text-center mt-4 pb-3">
                                    <h1 class="h2">Project Manager</h1>
                                    <p class="lead mt-2">
                                        Faça seu cadastro para gerenciar seus projetos
                                    </p>
                                </div>
                                <div class="card">
                                    <div class="card-body">
                                        <div class="m-sm-4">
                                            <form id="validation-form" novalidate="novalidate">
                                                <div class="mb-3 error-placeholder">
                                                    <label>nome</label>
                                                    <input class="form-control mt-2 form-control-lg" type="text" name="nome" placeholder="Digite seu nome" />
                                                </div>
                                                <div class="mb-3 error-placeholder">
                                                    <label>cpf</label>
                                                    <input class="form-control mt-2 form-control-lg" type="text" name="cpf" placeholder="Digite seu CPF" data-mask="000.000.000-00" data-reverse="true" autocomplete="off" maxlength="14" />
                                                </div>
                                                <div class="mb-3 error-placeholder">
                                                    <label>data de nascimento</label>
                                                    <input class="form-control mt-2 form-control-lg" type="date" name="dataNascimento" placeholder="Digite sua data de nascimento" />
                                                </div>
                                                <div class="mb-3">
                                                    <input id="customControlInline" type="checkbox" class="form-check-input" name="isFuncionario" />
                                                    <label class="form-check-label text-small ps-2" for="customControlInline">Sou um funcionário</label>
                                                    <a class="float-end" href="<%= BASE_URL %>/">Login</a>
                                                </div>
                                                <div class="text-center mt-3">
                                                     <button type="submit" class="btn btn-lg btn-primary">Cadastrar</button> 
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="structure/scripts.jsp"/>
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