$(document).ready(function() {
    // add.jsp
    
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
            
            if ($el.hasClass("select2-hidden-accessible") || $el.attr("data-role") === "tagsinput") $el.parent().addClass("is-invalid");
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

    $.get(`${window.location.origin}/projectmanager/funcionarios`, {}, function (data) {
        for (var i = 0; i < data.results.length; i++) {
            $(`select[name="s_gerente"], select[name="s_membros"]`).append(`<option value="${data.results[i].id}">${data.results[i].nome}</option>`);
        }
    });

    $(document).on("keyup", "#editor", function () {
        var html = editor.root.innerHTML;
        $("#descricao").val(html);
    });
    
    $(`select[name="s_gerente"]`).select2({
        theme: "bootstrap4",
        placeholder: "Selecione o gerente responsável pelo projeto"
    }).change(function() {
        $(this).valid();
    });

    $(`select[name="s_membros"]`).select2({
        theme: "bootstrap4",
        placeholder: "Selecione os membros do projeto",
        tokenSeparators: [".", ", ", " "]
    }).change(function() {
        $(this).valid();
    });
    
    var action = "Cadastrar";

    if ($("#editar").length > 0) { 
        action = "Atualizar";

        $.get(`${window.location.origin}/projectmanager/projeto/membros`, {projetoId: $("#editar").val()}, function (data) {
            var selected = [];
            for (var i = 0; i < data.results.length; i++) {
                selected.push(data.results[i].id + "");
            }

            setTimeout(function(){
                $(`select[name="s_membros"]`).val(selected);
                $(`select[name="s_membros"]`).select2();
            }, 2000);
        });

        $.get(`${window.location.origin}/projectmanager/projeto`, {id: $("#editar").val()}, function (data) {
            $("#send-area").prepend("<input type='hidden' name='id' value='" + data.id + "'>");
            
            $("input[name='nome']").val(data.nome);
            $("input[name='orcamento']").val(data.orcamento);
            $("input[name='dataInicio']").val(data.dataInicio);
            $("input[name='dataPrevisaoFim']").val(data.dataPrevisaoFim);
            $("input[name='dataFim']").val(data.dataFim);
            $("input[name='descricao']").val(data.descricao);
            editor.root.innerHTML = data.descricao;
            
            setTimeout(function(){
                $(`select[name="s_gerente"]`).val(data.gerente.id + "");
                $(`select[name="s_gerente"]`).select2();
            }, 2000);
        });
    }
    
    $(".header-title").prepend(`${action} `);
    $("* .action_page").html(action);
    
    $("form").on("submit", function (e) {
        e.preventDefault();
        if ($(this).validate().errorList.length == 0) {
            $(this).ajaxSubmit({
                url: `${window.location.origin}/projectmanager/projeto/${(action == "Cadastrar") ? "salvar" : "atualizar"}`,
                type: `${(action == "Cadastrar") ? "POST" : "PUT"}`,
                success: function (data, statusText, jqXHR) {
                    $("form").find(`button[type="submit"]`).addClass("disabled");
                    toastr["success"](`O projeto foi ${(action == "Cadastrar") ? "cadastrado" : "atualizado"} com sucesso!`, "", { positionClass: "toast-top-full-width", closeButton: true, progressBar: true, newestOnTop: false, timeOut: 2000, onHidden: function () {
                        var id = (action == "Cadastrar") ? data.id : $(`input[name='id']`).val();
                        window.location.href = `${window.location.origin}/project/${id}`;
                    }});
                },
                error: function (jqXHR, statusText, error) {
                    toastr["error"](jqXHR.responseJSON.message, "ERRO", { positionClass: "toast-top-full-width", closeButton: true, progressBar: true, newestOnTop: false, timeOut: 2000 });
                }
            });
        }
        return false;
    });
    
    $(`input[name="validation-bs-tagsinput"]`).on("itemAdded itemRemoved", function() {
        $(this).valid();
    });

    $("select .select2-selection__rendered").css({
        padding: "0.8rem 0.7rem 0.3rem 0.7rem"
    });

    $(".select2-search__field").css({
        marginTop: "-10%"
    });
});