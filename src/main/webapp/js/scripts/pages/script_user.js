$(document).ready(function() {
    // user.jsp
    
    $.get(`${window.location.origin}/projectmanager/pessoa`, {id: $("input#user").val()}, function (data) {
        if (data != "") {
            $("#nome, td#nome").html(data.nome);
            $("#CPF").html(data.cpf);
            $("#data_nascimento").html(`${data.dataNascimento}`.formatDate());
            if (data.funcionario) $("#boolFuncionario").html("ATIVO");
        } else {
            window.location.href = `${window.location.origin}/404`;
        }
    });
});