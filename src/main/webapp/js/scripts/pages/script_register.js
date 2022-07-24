$(document).ready(function() {
    // register.jsp
    
    $("#validation-form").validate({
        focusInvalid: false,
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
        if ($(this).validate().errorList.length == 0) {
            $(this).ajaxSubmit({
                url: `${window.location.origin}/projectmanager/pessoa/salvar`,
                type: "POST",
                success: function (data, statusText, jqXHR) {
                    $("form").find(`button[type="submit"]`).addClass("disabled");
                    toastr["success"]("Cadastro efetuado com sucesso!", `Seja bem-vindo(a) ${data.nome}`, { positionClass: "toast-top-full-width", closeButton: true, progressBar: true, newestOnTop: false, timeOut: 2000, onHidden: function () {
                       window.location.href = `${window.location.origin}/`;
                    }});
                },
                error: function (jqXHR, statusText, error) {
                    toastr["error"](jqXHR.responseJSON.message, "ERRO", { positionClass: "toast-top-full-width", closeButton: true, progressBar: true, newestOnTop: false, timeOut: 2000 });
                }
            });
        }
        return false;
    });
});