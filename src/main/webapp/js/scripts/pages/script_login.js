$(document).ready(function() {
    // login.jsp
    
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
                url: `${window.location.origin}/projectmanager/login`,
                type: "POST",
                success: function (data, statusText, jqXHR) {
                    $("form").find(`button[type="submit"]`).addClass("disabled");
                    toastr["success"]("Login efetuado com sucesso!", "Seja bem-vindo(a) " + data.nome, { positionClass: "toast-top-full-width", closeButton: true, progressBar: true, newestOnTop: false, timeOut: 2000, onHidden: function () {
                        window.location.href = `${window.location.origin}/home`;
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