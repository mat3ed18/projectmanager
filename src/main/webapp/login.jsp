<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<f:view>
    <html lang="en">
        <head>
            <title>Login | Project Manager</title>
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <script src="js/settings.js"></script>
            <link href="css/modern.css" type="text/css" rel="stylesheet" />
            <style>
                #toast-container {
                    margin-top: 2%;
                }
            </style>
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
                                <div class="text-center mt-4">
                                    <h1 class="h1">Project Manager</h1>
                                    <p class="lead mt-2">
                                        Conecte-se para gerenciar os projetos
                                    </p>
                                </div>
                                <!-- // request.getSession(false).getAttribute("token") -->
                                <div class="card">
                                    <div class="card-body">
                                        <div class="m-sm-4">
                                            <form id="validation-form" novalidate="novalidate">
                                                <div class="mb-3 error-placeholder">
                                                    <label>CPF</label>
                                                    <input class="form-control mt-2 form-control-lg" type="text" name="cpf" placeholder="Digite seu CPF" data-mask="000.000.000-00" data-reverse="true" autocomplete="off" maxlength="14"/>
                                                </div>
                                                <a href="<%= BASE_URL %>/register">Cadastro</a>
                                                <div class="text-center mt-3">
                                                     <button type="submit" class="btn btn-lg btn-primary">Acessar</button>
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
            <script src="js/app.js"></script>
            <script src="js/jquery.form.min.js"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    $("#validation-form").validate({
                        focusInvalid: false,
                        rules: {
                            "cpf": {
                                required: true,
                                minlength: 14
                            }
                        },
                        messages: {
                            "cpf": {
                                required: "Insira o seu CPF"
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
                            $el.addClass("is-invalid");
                        },
                        unhighlight: function (element) {
                            $(element).parents(".error-placeholder").find(".is-invalid").removeClass("is-invalid");
                        }
                    });
                    
                    $("form").on("submit", function (e) {
                        e.preventDefault();
                        $(this).ajaxSubmit({
                            url: "<%= BASE_URL %>/projectmanager/login",
                            type: "POST",
                            success: function (data, statusText, jqXHR) {
                                toastr["success"]("Login efetuado com sucesso!", "Seja bem-vindo(a) " + data.nome, { positionClass: "toast-top-full-width", closeButton: true, progressBar: true, newestOnTop: false, timeOut: 5000, onHidden: function () {
                                    window.location.href = "<%= BASE_URL %>/home";
                                }});
                            },
                            error: function (jqXHR, statusText, error) {
                                toastr["error"]("" + jqXHR.responseJSON.message + "", "ERRO", { positionClass: "toast-top-full-width", closeButton: true, progressBar: true, newestOnTop: false, timeOut: 5000 });
                            }
                        });
                        return false;
                    });
                });
            </script>
        </body>
    </html>
</f:view>