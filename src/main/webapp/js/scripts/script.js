$(document).ready(function () {
    // todas as páginas
    
    String.prototype.formatDate = function () {
        var arr = this.split("-");
        return arr[2] + "/" + arr[1] + "/" + arr[0];
    }
    
    $(".sidebar-link").map(function () {
        if (window.location.href.indexOf($(this).attr("href")) >= 0) {
            $(this).parent().addClass("active");
            $(this).parent().parent().addClass("show");
            $(this).parent().parent().parent().addClass("active");
            $(this).parent().parent().parent().find("a[data-bs-toggle='collapse']").removeClass("collapsed");
        }
    });
    
    $.get(`${window.location.origin}/projectmanager/pessoa`, {id: $("#user_login").val()}, function (data) {
        $("#username").html(data.nome);
        $(".header-subtitle.user").html($(".header-subtitle.user").html() + " <b>" + data.nome + "</b>");
        $("* #link_profile").attr("href", $("#link_profile").attr("href") + "/" + data.id);
    });
});