<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Login | Project Manager</title>
        <script src="js/settings.js"></script>
        <link href="css/modern.css" type="text/css" rel="stylesheet" />
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
                                        
                                        <!-- FORMULÁRIO DE LOGIN -->
                                        
                                        <form>
                                            <div class="mb-3">
                                                <label>CPF</label>
                                                <input class="form-control mt-2 form-control-lg" type="email" name="cpf" placeholder="Digite seu CPF" data-mask="000.000.000-00" data-reverse="true" autocomplete="off" maxlength="14"/>
                                            </div>
                                            <div>
                                                <div class="form-check align-items-center">
                                                    <input id="customControlInline" type="checkbox" class="form-check-input" value="remember-me" name="remember-me" />
                                                    <label class="form-check-label text-small" for="customControlInline">Lembre-me na próxima vez que entrar</label>
                                                </div>
                                            </div>
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
    </body>
</html>