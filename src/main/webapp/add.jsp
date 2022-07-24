<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<%  String BASE_URL = Util.getURL(request); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Adicionar Projeto | Project Manager</title>
        <jsp:include page="structure/head.jsp"/>
        <link href="<%= BASE_URL %>/css/pages/style_add.css" type="text/css" rel="stylesheet" />
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
                                Projeto
                            </h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<%= BASE_URL %>/home">Project Manager</a></li>
                                    <li class="breadcrumb-item"><a href="#">Projeto</a></li>
                                    <li class="breadcrumb-item active action_page" aria-current="page"></li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">Insira as informações do projeto</h5>
                                    </div>
                                    <div class="card-body">
                                        <form id="validation-form" novalidate="novalidate" class="row">
                                            <div class="col-12 mb-3 error-placeholder">
                                                <label class="form-label">nome</label>
                                                <input type="text" class="form-control" name="nome" required/>
                                            </div>
                                            <div class="col-6 col-md-6 col-xxl-2 mb-3 error-placeholder">
                                                <label class="form-label">data inicial</label>
                                                <input type="date" class="form-control" name="dataInicio" required/>
                                            </div>
                                            <div class="col-6 col-md-6 col-xxl-2 mb-3 error-placeholder">
                                                <label class="form-label">data de previsão do fim</label>
                                                <input type="date" class="form-control" name="dataPrevisaoFim" required/>
                                            </div>
                                            <div class="col-6 col-md-6 col-xxl-2 mb-3 error-placeholder">
                                                <label class="form-label">data final</label>
                                                <input type="date" class="form-control" name="dataFim" required/>
                                            </div>
                                            <div class="col-6 col-md-6 col-xxl-4 mb-3 error-placeholder">
                                                <label class="form-label">gerente</label>
                                                <div class="d-flex">
                                                    <select class="form-control select2-hidden-accessible" name="s_gerente" style="width: 100%" tabindex="-1" aria-hidden="true" aria-invalid="false" required>
                                                        <option value=""></option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-12 col-xxl-2 mb-3 error-placeholder">
                                                <label class="form-label">orçamento</label>
                                                <input type="number" class="form-control" name="orcamento" step="0.01" min="1" required/>
                                            </div>
                                            <div class="col-12 mb-3 error-placeholder">
                                                <label class="form-label">descrição</label>
                                                <div class="quill-textarea">
                                                    <div id="editor"></div>
                                                </div>
                                                <input type="text" name="descricao" id="descricao" class="form-control" required="">
                                            </div>
                                            <div class="col-12 mb-3 error-placeholder">
                                                <label class="form-label">membros</label>
                                                <div class="d-flex">
                                                    <select class="form-control select2-hidden-accessible" name="s_membros" multiple="" style="width: 100%" tabindex="-1" aria-hidden="true" aria-invalid="false" required>
                                                        <option value=""></option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-3" id="send-area">
                                                <button type="submit" class="btn btn-primary action_page"></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="structure/footer.jsp"/>
            </div>
            <% if (request.getAttribute("editar") != null) { %>
            <input type="hidden" id="editar" value="<%= request.getAttribute("id") %>">
            <% } %>
        </div>
        <jsp:include page="structure/scripts.jsp"/>
        <jsp:include page="structure/script-login.jsp"/>
        <script src="<%= BASE_URL %>/js/scripts/pages/script_add.js"></script>
    </body>
</html>