$(document).ready(function() {
    // settings.jsp
    
    if ($("#user_id").length > 0) {
        $.get(`${window.location.origin}/projectmanager/pessoa`, {id: $("#user_id").attr("data-id")}, function (data) {
            $("#send-area").append(`<input type="hidden" name="id" value="${data.id}">`);
            $("input[name='nome']").val(data.nome);
            $("input[name='cpf']").val(data.cpf);
            $("input[name='dataNascimento']").val(data.dataNascimento);
            $("input[name='isFuncionario']").prop("checked", data.funcionario);
        });
    } else {
        window.location.href = `${window.location.origin}/home`;
    }

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

    $("form").on("submit", function (e) {
        e.preventDefault();
        if ($(this).validate().errorList.length == 0) {
            $(this).ajaxSubmit({
                url: `${window.location.origin}/projectmanager/pessoa/atualizar`,
                type: "PUT",
                success: function (data, statusText, jqXHR) {
                    $("form").find(`button[type="submit"]`).addClass("disabled");
                    toastr["success"](data.mensagem, "", { positionClass: "toast-top-full-width", closeButton: true, progressBar: true, newestOnTop: false, timeOut: 2000, onHidden: function () {
                       window.location.href = `${window.location.origin}/settings`;
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