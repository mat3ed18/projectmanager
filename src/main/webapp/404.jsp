<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<%  String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Erro 404</title>
        <jsp:include page="structure/head.jsp"/>
    </head>
    <body class="theme-blue">
        <div class="splash">
            <div class="splash-icon"></div>
        </div>
        
        <main class="main h-100 w-100">
            <div class="container h-100">
                <div class="row h-100">
                    <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
                        <div class="d-table-cell align-middle">
                            <div class="text-center">
                                <h1 class="display-1 fw-bold">404</h1>
                                <p class="h1">Página não encontrada.</p>
                                <p class="h2 fw-normal mt-3 mb-4">A página que você está procurando pode ter sido removida.</p>
                                <a href="<%= BASE_URL %>/home" class="btn btn-primary btn-lg">início</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="structure/scripts.jsp"/>
    </body>
</html>
