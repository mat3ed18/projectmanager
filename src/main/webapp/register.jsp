<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        
        <title>Cadastro | Project Manager</title>
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
                            
                            <!-- HEADER -->
                            
                            <div class="text-center mt-4 pb-3">
                                <h1 class="h2">Project Manager</h1>
                                <p class="lead mt-2">
                                    Faça seu cadastro para gerenciar seus projetos
                                </p>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <div class="m-sm-4">
                                        
                                        <!-- FORMULÁRIO DE CADASTRO -->
                                        
                                        <form>
                                            <div class="mb-3">
                                                <label>nome</label>
                                                <input class="form-control mt-2 form-control-lg" type="text" name="nome" placeholder="Digite seu nome" />
                                            </div>
                                            <div class="mb-3">
                                                <label>cpf</label>
                                                <input class="form-control mt-2 form-control-lg" type="text" name="cpf" placeholder="Digite seu CPF" data-mask="000.000.000-00" data-reverse="true" autocomplete="off" maxlength="14" />
                                            </div>
                                            <div class="mb-3">
                                                <label>data de nascimento</label>
                                                <input class="form-control mt-2 form-control-lg" type="date" name="data_nascimento" placeholder="Digite sua data de nascimento" />
                                            </div>
                                            <div class="mb-3">
                                                <input id="customControlInline" type="checkbox" class="form-check-input" value="isFuncionario" name="isFuncionario" />
                                                <label class="form-check-label text-small ps-2" for="customControlInline">Sou um funcionário</label>
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
        <script src="js/app.js"></script>
    </body>
</html>