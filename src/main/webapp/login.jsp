<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login | Project Manager</title>
        <jsp:include page="structure/head.jsp"/>
        <link href="<%= BASE_URL %>/css/pages/style_login.css" type="text/css" rel="stylesheet" />
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
                            <div class="card">
                                <div class="card-body">
                                    <div class="m-sm-4">
                                        <form id="validation-form" novalidate="novalidate">
                                            <div class="mb-3 error-placeholder">
                                                <label>CPF</label>
                                                <input class="form-control mt-2 form-control-lg" type="text" name="cpf" placeholder="Digite seu CPF" data-mask="000.000.000-00" data-reverse="true" autocomplete="off" maxlength="14" required/>
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
        <jsp:include page="structure/scripts.jsp"/>
        <script src="<%= BASE_URL %>/js/scripts/pages/script_login.js"></script>
    </body>
</html>