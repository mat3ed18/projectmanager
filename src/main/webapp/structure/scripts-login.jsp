<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<script>
    document.addEventListener("DOMContentLoaded", function () {
    <% if (request.getSession(false).getAttribute("user_id") != null) { %>
        $.get("<%= BASE_URL %>/projectmanager/pessoa", {id: "<%= request.getSession(false).getAttribute("user_id") %>"}, function (data) {
            console.log(data);
            $("#username").html(data.nome);
        });
    <% } else { %>
        window.location.href = "<%= BASE_URL %>/";
    <% } %>
    });
</script>