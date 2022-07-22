$(document).ready(function () {
    
    function addCard(column, background, opacity, projeto, del = false) {
        $("#" + column).append(`
            <div class="card mb-3 ${background} ${opacity} cursor-grab" data-id="${projeto.id}">
                <div class="card-body p-3">
                    <p>${projeto.nome}</p>
                    <div class="float-end mt-n1">
                        <img src="../img/avatars/user.png" width="32" height="32" class="rounded-circle" alt="Avatar" />
                    </div>
                    <a class="btn btn-primary btn-sm" href="${window.location.origin}/project/${projeto.id}">Ver</a>
                    <a class="btn btn-primary btn-sm" href="${window.location.origin}/project/${projeto.id}/edit">Editar</a>
                    ${(del) ? `<a class="btn btn-danger btn-sm">Excluir</a>` : ``}
                </div>
            </div>
        `);
    }
    
    $.get(`${window.location.origin}/projectmanager/projetos`, {}, function (data) {
        for (var i = 0; i < data.results.length; i++) {
            switch (data.results[i].status) {
                case "em análise":
                    addCard("projetos-em-analise", "bg-warning", "bg-opacity-25", data.results[i], true);
                break;
                case "análise realizada":
                    addCard("projetos-analise-realizada", "bg-primary", "bg-opacity-10", data.results[i], true);
                break;
                case "análise aprovada":
                    addCard("projetos-analise-aprovada", "bg-primary", "bg-opacity-25", data.results[i], true);
                break;
                case "planejado":
                    addCard("projetos-planejados", "bg-secondary", "bg-opacity-10", data.results[i], true);
                break;
                // - - - - cartões que não podem ser excluídos - - - - 
                case "iniciado":
                    addCard("projetos-iniciado", "bg-secondary", "bg-opacity-25", data.results[i], false);
                break;
                case "em andamento":
                    addCard("projetos-em-andamento", "bg-success", "bg-opacity-10", data.results[i], false);
                break;
                case "encerrado":
                    addCard("projetos-encerrados", "bg-success", "bg-opacity-25", data.results[i], false);
                break;
                case "cancelado":
                    addCard("projetos-cancelados", "bg-danger", "bg-opacity-10", data.results[i], false);
                break;
                // - - - - - - - - - - - - - - - - - - - - - - - - - -
                default: // pendente
                    addCard("projetos-pendentes", "bg-dark", "bg-opacity-10", data.results[i], true);
                break;
            }
        }
    });
});