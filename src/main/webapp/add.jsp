<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Adicionar Projeto | Project Manager</title>
        <script src="js/settings.js"></script>
        <link href="css/modern.css" type="text/css" rel="stylesheet" />
        <style>
            #descricao {
                opacity: 0;
                height: 0px;
            }
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
                
                <main class="content">
                    <div class="container-fluid">
                        <div class="header">
                            <h1 class="header-title">
                                Adicionar Projeto
                            </h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="dashboard-default.html">Project Manager</a></li>
                                    <li class="breadcrumb-item"><a href="#">Projeto</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Adicionar</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">Insira as informações do projeto</h5>
                                    </div>
                                    <div class="card-body">
                                        <form id="validation-form" class="row" novalidate="novalidate">
                                            <div class="col-12 mb-3 error-placeholder">
                                                <label class="form-label">nome</label>
                                                <input type="text" class="form-control" name="nome" placeholder="Email" />
                                            </div>
                                            <div class="col-2 mb-3 error-placeholder">
                                                <label class="form-label">data inicial</label>
                                                <input type="date" class="form-control" name="data_inicial" />
                                            </div>
                                            <div class="col-2 mb-3 error-placeholder">
                                                <label class="form-label">data de previsão do fim</label>
                                                <input type="date" class="form-control" name="data_previsao_fim" />
                                            </div>
                                            <div class="col-2 mb-3 error-placeholder">
                                                <label class="form-label">data final</label>
                                                <input type="date" class="form-control" name="data_final" />
                                            </div>
                                            <div class="col-2 mb-3 error-placeholder">
                                                <label class="form-label">orçamento</label>
                                                <input type="text" class="form-control" name="orcamento" data-mask="#.###.###.###.##0,00" data-reverse="true" autocomplete="off" />
                                            </div>
                                            <div class="col-4 mb-3 error-placeholder">
                                                <label class="form-label">gerente</label>
                                                <div class="d-flex">
                                                    <select class="form-control select2-hidden-accessible" name="gerente" style="width: 100%" tabindex="-1" aria-hidden="true" aria-invalid="false">
                                                        <option value=""></option>
                                                        <option value="pitons">Pitons</option>
                                                        <option value="cams">Cams</option>
                                                        <option value="nuts">Nuts</option>
                                                        <option value="bolts">Bolts</option>
                                                        <option value="stoppers">Stoppers</option>
                                                        <option value="sling">Sling</option>
                                                        <option value="skis">Skis</option>
                                                        <option value="skins">Skins</option>
                                                        <option value="poles">Poles</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-3 error-placeholder">
                                                <label class="form-label">descrição</label>
                                                <div class="quill-textarea">
                                                    <div id="editor"></div>
                                                </div>
                                                <input type="text" name="descricao" id="descricao" class="form-control">
                                            </div>
                                            <div class="col-12 mb-3 error-placeholder">
                                                <label class="form-label">membros</label>
                                                <div class="d-flex">
                                                    <select class="form-control select2-hidden-accessible" name="membros" multiple="" style="width: 100%" tabindex="-1" aria-hidden="true" aria-invalid="false">
                                                        <option value=""></option>
                                                        <option value="pitons">Pitons</option>
                                                        <option value="cams">Cams</option>
                                                        <option value="nuts">Nuts</option>
                                                        <option value="bolts">Bolts</option>
                                                        <option value="stoppers">Stoppers</option>
                                                        <option value="sling">Sling</option>
                                                        <option value="skis">Skis</option>
                                                        <option value="skins">Skins</option>
                                                        <option value="poles">Poles</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-3">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </form>
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
                $("select[name=\"membros\"]").select2({
                    theme: "bootstrap4",
                    placeholder: "Selecione os membros do projeto",
                    tokenSeparators: [".", ", ", " "]
                }).change(function() {
                    $(this).valid();
                });
                
                $("select[name=\"gerente\"]").select2({
                    theme: "bootstrap4",
                    placeholder: "Selecione o gerente responsável pelo projeto"
                }).change(function() {
                    $(this).valid();
                });
                
                // Trigger validation on tagsinput change
                $("input[name=\"validation-bs-tagsinput\"]").on("itemAdded itemRemoved", function() {
                    $(this).valid();
                });
                
                $("select .select2-selection__rendered").css({
                    padding: "0.8rem 0.7rem 0.3rem 0.7rem"
                });
                
                $(".select2-search__field").css({
                    marginTop: "-10%"
                });
                
                // Initialize validation
                $("#validation-form").validate({
                    focusInvalid: false,
                    rules: {
                        "nome": {
                            required: true
                        },
                        "data_inicial": {
                            required: true
                        },
                        "data_previsao_fim": {
                            required: true
                        },
                        "data_final": {
                            required: true
                        },
                        "orcamento": {
                            required: true
                        },
                        "gerente": {
                            required: true
                        },
                        "descricao": {
                            required: true
                        },
                        "membros": {
                            required: true
                        }
                    },
                    messages: {
                        "nome": {
                            required: "Insira o nome do projeto"
                        },
                        "data_inicial": {
                            required: "Insira a data inicial do projeto"
                        },
                        "data_previsao_fim": {
                            required: "Insira a data de previsão final do projeto"
                        },
                        "data_final": {
                            required: "Insira a data final do projeto"
                        },
                        "orcamento": {
                            required: "Insira o valor do orçamento do projeto"
                        },
                        "gerente": {
                            required: "Selecione o gerente do projeto"
                        },
                        "descricao": {
                            required: "Digite a descrição do projeto"
                        },
                        "membros": {
                            required: "Selecione os membros do projeto"
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
                        
                        // Select2 and Tagsinput
                        if ($el.hasClass("select2-hidden-accessible") || $el.attr("data-role") === "tagsinput") {
                            $el.parent().addClass("is-invalid");
                        }
                    },
                    unhighlight: function (element) {
                        $(element).parents(".error-placeholder").find(".is-invalid").removeClass("is-invalid");
                    }
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                if (!window.Quill) {
                    return $("#editor, #toolbar").remove();
                }
                var editor = new Quill("#editor", {
                    modules: {
                        toolbar: [
                            [{"font": []}],
                            [{"size": ["small", false, "large", "huge"]}], // custom dropdown
                            ["bold", "italic", "underline", "strike"], // toggled buttons
                            [{"color": [] }, {"background": []}], // dropdown with defaults from theme
                            [{"script": "sub"}, {"script": "super"}], // superscript/subscript
                            [{"header": [1, 2, 3, 4, 5, 6, false]}],
                            [{"header": 1 }, {"header": 2}, "blockquote", "code-block"], // custom button values
                            [{"list": "ordered"}, {"list": "bullet"}, {"indent": "-1"}, {"indent": "+1"}],
                            [{"direction": "rtl"}, {"align": []}], // text direction
                            ["link", "image", "video"],
                            ["clean"] // remove formatting button
                        ]
                    },
                    placeholder: "Escreva a descrição do projeto",
                    theme: "snow"
                });
                
                $(document).on("keyup", "#editor", function () {
                    var html = editor.root.innerHTML;
                    
                    if (html.replace(/\s/g, "").indexOf("<p></p>") >= 0 || html.replace(/\s/g, "").indexOf("<p><br></p>") >= 0) {
                        $("#descricao").val(null);
                    } else {
                        $("#descricao").val(html);
                    }
                });
            });
        </script>
    </body>
</html>
