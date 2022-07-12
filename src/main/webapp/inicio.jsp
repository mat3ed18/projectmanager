<%@page contentType="text/html" pageEncoding="UTF-8"%>

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>teste</title>
        </head>
        <body>
            <% String[] nomes = {"teste 1", "teste 2", "teste 3"}; %>
            
            <% 
                for (int i = 0; i < nomes.length; i++) {
                    %><i><%= nomes[i] %></i><br><%
                } 
            %>
            
            <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
            <script>
                $(document).ajaxError(function (e, jqXHR, settings, exception) {
                    console.log(jqXHR);
                });
                
                $.get("http://localhost:8080/projectmanager/pessoa", {id: 1}, function (data) {
                    console.log(data);
                }, "json");
            </script>
        </body>
    </html>
</f:view>
