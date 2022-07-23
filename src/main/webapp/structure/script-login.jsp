<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        <% if (request.getSession(false).getAttribute("user_id") != null) { %>
            $.get("<%= BASE_URL %>/projectmanager/pessoa", {id: "<%= request.getSession(false).getAttribute("user_id") %>"}, function (data) {
                $("#username").html(data.nome);
                $(".header-subtitle.user").html($(".header-subtitle.user").html() + " <b>" + data.nome + "</b>");
                $("#link_profile").attr("href", $("#link_profile").attr("href") + "/" + data.id);
            });
        <% } else { %>
            window.location.href = "<%= BASE_URL %>/";
        <% } %>
            
            
        $(".sidebar-link").map(function() {
            if ($(this).attr("href") == window.location.href) {
                $(this).parent().addClass("active");
                $(this).parent().parent().addClass("show");
                $(this).parent().parent().parent().addClass("active");
                $(this).parent().parent().parent().find("a[data-bs-toggle='collapse']").removeClass("collapsed");
            }
        });
        
        String.prototype.formatDate = function () {
            var arr = this.split("-");
            return arr[2] + "/" + arr[1] + "/" + arr[0];
        }
    });
</script>