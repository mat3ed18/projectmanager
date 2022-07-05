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
        </body>
    </html>
</f:view>
