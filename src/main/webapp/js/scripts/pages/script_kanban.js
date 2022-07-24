$(document).ready(function() {
    // kanban.jsp
    
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
    
    var scroll = autoScroll([
        document.querySelector(".columns-kanban")
    ], {
        margin: 30,
        maxSpeed: 30,
        scrollWhenOutside: true,
        autoScroll: function () {
            return this.down;
        }
    });

    dragula([document.querySelector("#projetos-pendentes"), document.querySelector("#projetos-em-analise"), document.querySelector("#projetos-analise-realizada"), document.querySelector("#projetos-analise-aprovada"), document.querySelector("#projetos-planejados"), document.querySelector("#projetos-iniciado"), document.querySelector("#projetos-em-andamento"), document.querySelector("#projetos-encerrados"), document.querySelector("#projetos-cancelados")]).on("drop", function (el) {
        var card = $(el);
        var main = card.parent();
        card.attr("class", "card mb-3 " + main.attr("data-class"));

        if (card.find(".btn-danger").length == 0) card.find(".card-body").append('<a class="btn btn-danger btn-sm">Excluir</a>');
        
        if (main.attr("data-status").match("iniciado|em andamento|encerrado")) card.find(".card-body .btn-danger").remove();

        $.ajax({
            url: `${window.location.origin}/projectmanager/projeto/atualizar/status`,
            type: "PUT",
            dataType: "json",
            data: {
                id: card.attr("data-id"),
                status: main.attr("data-status")
            }, 
            success: function (data) {
                toastr["success"]("", data.mensagem, { positionClass: "toast-bottom-right", closeButton: false, progressBar: true, newestOnTop: false, timeOut: 1000 });
            }
        });
    });
    
});