$(document).ready(function() {
    // project.jsp
    
    $.get(`${window.location.origin}/projectmanager/projeto`, {id: $("#project").attr("data-id")}, function (data) {
        if (data != null) {
            $("#edit").attr("href", `${window.location.origin}/project/${data.id}/edit`);
            $("#nome").html(data.nome);
            $("#descricao").html(data.descricao);
            $("#dataInicio").html(data.dataInicio.formatDate());
            $("#dataPrevisaoFim").html(data.dataPrevisaoFim.formatDate());
            $("#dataFim").html(data.dataFim.formatDate());
            $("#orcamento").html(data.orcamento.toLocaleString("pt-br", {style: "currency", currency: "BRL"}));
            data.gerente = `<a href="${window.location.origin}/user/${data.gerente.id}">${data.gerente.nome}</a>`;
            $("#gerente").html(data.gerente);
            $("#status").html(data.status);
            $("#risco").html(data.risco);
        } else {
            window.location.href = `${window.location.origin}/404`;
        }
    });

    $.get(`${window.location.origin}/projectmanager/projeto/membros`, {projetoId: $("#project").attr("data-id")}, function (data) {
        var dataSet = [];

        for (var i = 0; i < data.results.length; i++) {
            data.results[i].nome = `<a href="${window.location.origin}/user/${data.results[i].id}">${data.results[i].nome}</a>`;
            dataSet.push([data.results[i].id, data.results[i].nome, data.results[i].cpf, data.results[i].dataNascimento.formatDate()]);
        }

        var datatablesMulti = $("#example").DataTable({
            responsive: true,
            select: {
                style: "multi",
            },
            data: dataSet, 
            columns: [
                { title: "id" },
                { title: "nome" },
                { title: "cpf" },
                { title: "data de nascimento" }
            ]
        });
    });
});