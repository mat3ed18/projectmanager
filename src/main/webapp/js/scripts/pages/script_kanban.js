$(document).ready(function() {
    // kanban.jsp
    
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

    dragula([$("#projetos-pendentes"), $("#projetos-em-analise"), $("#projetos-analise-realizada"), $("#projetos-analise-aprovada"), $("#projetos-planejados"), $("#projetos-iniciado"), $("#projetos-em-andamento"), $("#projetos-encerrados"), $("#projetos-cancelados")]).on("drop", function (el) {
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