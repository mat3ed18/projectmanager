$(document).ready(function() {
    // projects.jsp
    
    var projetos = [];

    $.ajaxSetup({async: false});

    $.get(`${window.location.origin}/projectmanager/projetos`, {}, function (data) {
        projetos = data.results;
    });

    var dataSet = [];

    for (var i = 0; i < projetos.length; i++) {
        projetos[i].nome = `<a href="${window.location.origin}/project/${projetos[i].id}">${projetos[i].nome}</a>`;
        projetos[i].gerente = `<a href="${window.location.origin}/user/${projetos[i].gerente.id}">${projetos[i].gerente.nome}</a>`;
        dataSet.push([projetos[i].id, projetos[i].nome, projetos[i].dataInicio.formatDate(), projetos[i].dataPrevisaoFim.formatDate(), projetos[i].dataFim.formatDate(), projetos[i].status, projetos[i].orcamento.toLocaleString("pt-br", {style: "currency", currency: "BRL"}), projetos[i].risco, projetos[i].gerente]);
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
            { title: "data inicial" },
            { title: "previsão" },
            { title: "data final" },
            { title: "status" },
            { title: "orçamento" },
            { title: "risco" },
            { title: "gerente" }
        ]
    });
});