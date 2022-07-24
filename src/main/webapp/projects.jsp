<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Projetos | Project Manager</title>
        <jsp:include page="structure/head.jsp"/>
        <link href="<%= BASE_URL %>/css/pages/style_projects.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <div class="splash">
            <div class="splash-icon"></div>
        </div>
        <div class="wrapper">
            <jsp:include page="structure/side-menu.jsp"/>
            <div class="main">
                <jsp:include page="structure/header.jsp"/>
                <main class="content">
                    <div class="container-fluid">
                        <div class="header">
                            <h1 class="header-title">
                                Projetos
                            </h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<%= BASE_URL %>/home">Project Manager</a></li>
                                    <li class="breadcrumb-item"><a href="#">Projeto</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Projetos</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title">Ver Projetos</h5>
                                        <h6 class="card-subtitle text-muted">
                                            Acompanhe todos os projetos onde você está participando. Para visualizá-los em um formato mais dinâmico, abra o <a href="<%= BASE_URL %>/kanban">Kanban</a>.
                                        </h6>
                                    </div>
                                    <div class="card-body">
                                        <table id="example" class="table table-striped dataTable no-footer dtr-inline" style="width:100%"></table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="structure/footer.jsp"/>
            </div>
        </div>
        <jsp:include page="structure/scripts.jsp"/>
        <script src="<%= BASE_URL %>/js/scripts/pages/script_projects.js"></script>
    </body>
</html>