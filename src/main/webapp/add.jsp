<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<% 
    String BASE_URL = Util.getURL(request); 
    boolean edit = (request.getAttribute("editar") != null) ? (boolean) request.getAttribute("editar") : false;
    Map<String, String> projeto = (request.getAttribute("editar") != null) ? (HashMap) request.getAttribute("projeto") : null;
%>

<!DOCTYPE html>
<f:view>
    <html lang="en">
        <head>
            <title>Adicionar Projeto | Project Manager</title>
            <jsp:include page="structure/head.jsp"/>
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
                <jsp:include page="structure/side-menu.jsp"/>
                <div class="main">
                    <jsp:include page="structure/header.jsp"/>
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
                                                    <input type="text" class="form-control" name="nome" />
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
                    <jsp:include page="structure/footer.jsp"/>
                </div>
            </div>
            <jsp:include page="structure/scripts.jsp"/>
            <jsp:include page="structure/scripts-login.jsp"/>
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
</f:view>