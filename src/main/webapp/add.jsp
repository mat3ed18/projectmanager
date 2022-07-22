<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<%  String BASE_URL = Util.getURL(request); %>

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
                                    <%= (request.getAttribute("editar") != null) ? "Editar" : "Adicionar" %> Projeto
                                </h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="<%= BASE_URL %>/home">Project Manager</a></li>
                                        <li class="breadcrumb-item"><a href="#">Projeto</a></li>
                                        <li class="breadcrumb-item active" aria-current="page"><%= (request.getAttribute("editar") != null) ? "Editar" : "Adicionar" %></li>
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
                                            <form id="validation-form" novalidate="novalidate" class="row">
                                                <div class="col-12 mb-3 error-placeholder">
                                                    <label class="form-label">nome</label>
                                                    <input type="text" class="form-control" name="nome" required/>
                                                </div>
                                                <div class="col-2 mb-3 error-placeholder">
                                                    <label class="form-label">data inicial</label>
                                                    <input type="date" class="form-control" name="dataInicio" required/>
                                                </div>
                                                <div class="col-2 mb-3 error-placeholder">
                                                    <label class="form-label">data de previsão do fim</label>
                                                    <input type="date" class="form-control" name="dataPrevisaoFim" required/>
                                                </div>
                                                <div class="col-2 mb-3 error-placeholder">
                                                    <label class="form-label">data final</label>
                                                    <input type="date" class="form-control" name="dataFim" required/>
                                                </div>
                                                <div class="col-2 mb-3 error-placeholder">
                                                    <label class="form-label">orçamento</label>
                                                    <input type="number" class="form-control" name="orcamento" step="0.01" min="1" required/>
                                                </div>
                                                <div class="col-4 mb-3 error-placeholder">
                                                    <label class="form-label">gerente</label>
                                                    <div class="d-flex">
                                                        <select class="form-control select2-hidden-accessible" name="s_gerente" style="width: 100%" tabindex="-1" aria-hidden="true" aria-invalid="false" required>
                                                            <option value=""></option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-12 mb-3 error-placeholder">
                                                    <label class="form-label">descrição</label>
                                                    <div class="quill-textarea">
                                                        <div id="editor"></div>
                                                    </div>
                                                    <input type="text" name="descricao" id="descricao" class="form-control" required="">
                                                </div>
                                                <div class="col-12 mb-3 error-placeholder">
                                                    <label class="form-label">membros</label>
                                                    <div class="d-flex">
                                                        <select class="form-control select2-hidden-accessible" name="s_membros" multiple="" style="width: 100%" tabindex="-1" aria-hidden="true" aria-invalid="false" required>
                                                            <option value=""></option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-12 mb-3" id="send-area">
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
            <jsp:include page="structure/script-login.jsp"/>
            
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Initialize validation
                    $("#validation-form").validate({
                        focusInvalid: false,
                        rules: {
                            "nome": {
                                required: true
                            },
                            "dataInicio": {
                                required: true
                            },
                            "dataPrevisaoFim": {
                                required: true
                            },
                            "dataFim": {
                                required: true
                            },
                            "orcamento": {
                                required: true
                            },
                            "s_gerente": {
                                required: true
                            },
                            "descricao": {
                                required: true
                            },
                            "s_membros": {
                                required: true
                            }
                        },
                        messages: {
                            "nome": {
                                required: "Insira o nome do projeto"
                            },
                            "dataInicio": {
                                required: "Insira a data inicial do projeto"
                            },
                            "dataPrevisaoFim": {
                                required: "Insira a data de previsão final do projeto"
                            },
                            "dataFim": {
                                required: "Insira a data final do projeto"
                            },
                            "orcamento": {
                                required: "Insira o valor do orçamento do projeto"
                            },
                            "s_gerente": {
                                required: "Selecione o gerente do projeto"
                            },
                            "descricao": {
                                required: "Digite a descrição do projeto"
                            },
                            "s_membros": {
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
                    
                    $.get("<%= BASE_URL %>/projectmanager/funcionarios", {}, function (data) {
                        for (var i = 0; i < data.results.length; i++) {
                            $("select[name='s_gerente'], select[name='s_membros']").append("<option value='" + data.results[i].id + "'>" + data.results[i].nome + "</option>");
                        }
                    });

                    $(document).on("keyup", "#editor", function () {
                        var html = editor.root.innerHTML;
                        $("#descricao").val(html);
                    });
                    
                    $("select[name=\"s_membros\"]").select2({
                        theme: "bootstrap4",
                        placeholder: "Selecione os membros do projeto",
                        tokenSeparators: [".", ", ", " "]
                    }).change(function() {
                        $(this).valid();
                    });

                    $("select[name=\"s_gerente\"]").select2({
                        theme: "bootstrap4",
                        placeholder: "Selecione o gerente responsável pelo projeto"
                    }).change(function() {
                        $(this).valid();
                    });
                    
                    <% if (request.getAttribute("editar") != null) { %>
                        
                        $.get("<%= BASE_URL %>/projectmanager/projeto/membros", {projetoId: "<%= request.getAttribute("id") %>"}, function (data) {
                            var selected = [];
                            for (var i = 0; i < data.results.length; i++) {
                                selected.push(data.results[i].id + "");
                            }
                            
                            setTimeout(function(){
                                $("select[name=\"s_membros\"]").val(selected);
                                $("select[name=\"s_membros\"]").select2();
                            }, 2000);
                        });
                        
                        $.get("<%= BASE_URL %>/projectmanager/projeto", {id: "<%= request.getAttribute("id") %>"}, function (data) {
                            $("#send-area").prepend("<input type='hidden' name='id' value='" + data.id + "'>");
                            $("input[name='nome']").val(data.nome);
                            $("input[name='orcamento']").val(data.orcamento);
                            editor.root.innerHTML = data.descricao;
                            $("input[name='descricao']").val(data.descricao);
                            $("input[name='dataInicio']").val(data.dataInicio);
                            $("input[name='dataPrevisaoFim']").val(data.dataPrevisaoFim);
                            $("input[name='dataFim']").val(data.dataFim);
                            setTimeout(function(){
                                $("select[name=\"s_gerente\"]").val(data.gerente.id + "");
                                $("select[name=\"s_gerente\"]").select2();
                            }, 2000);
                        });
                        
                    <% } %>

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
                    
                    $("form").on("submit", function (e) {
                        e.preventDefault();
                        if ($(this).validate().errorList.length == 0) {
                            $(this).ajaxSubmit({
                                url: "<%= BASE_URL %>/projectmanager/projeto/<%= (request.getAttribute("editar") != null) ? "atualizar" : "salvar" %>",
                                type: "<%= (request.getAttribute("editar") != null) ? "PUT" : "POST" %>",
                                success: function (data, statusText, jqXHR) {
                                    toastr["success"]("O projeto foi <%= (request.getAttribute("editar") != null) ? "atualizado" : "cadastrado" %> com sucesso!", "", { positionClass: "toast-top-full-width", closeButton: true, progressBar: true, newestOnTop: false, timeOut: 2000, onHidden: function () {
                                        var id = "<%= (request.getAttribute("id") != null) ? request.getAttribute("id") : "" %>";
                                        if (typeof data.id !== "undefined") {
                                            id = data.id + "";
                                        }
                                        window.location.href = "<%= BASE_URL %>/project/" + id;
                                    }});
                                },
                                error: function (jqXHR, statusText, error) {
                                    toastr["error"]("" + jqXHR.responseJSON.message + "", "ERRO", { positionClass: "toast-top-full-width", closeButton: true, progressBar: true, newestOnTop: false, timeOut: 2000 });
                                }
                            });
                        }
                        return false;
                    });
                });
            </script>
        </body>
    </html>
</f:view>