<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<footer class="footer">
    <div class="container-fluid">
        <div class="row text-muted">
            <div class="col-8 text-start">
                <ul class="list-inline">
                    <li class="list-inline-item">
                        <a class="text-muted" href="#">Suporte</a>
                    </li>
                    <li class="list-inline-item">
                        <a class="text-muted" href="#">Privacidade</a>
                    </li>
                    <li class="list-inline-item">
                        <a class="text-muted" href="#">Termos de serviço</a>
                    </li>
                    <li class="list-inline-item">
                        <a class="text-muted" href="#">Contato</a>
                    </li>
                </ul>
            </div>
            <div class="col-4 text-end">
                <p class="mb-0">2022 - <a href="#" class="text-muted">Project Manager</a></p>
            </div>
        </div>
    </div>
    <button id="buttonRecorder" class="btn btn-lg btn-danger"><i class="fas fa-microphone"></i></button>
    <style>
        #buttonRecorder {
            position: fixed;
            bottom: 0;
            right: 0;
            margin-right: 1%;
            margin-bottom: 1%;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 1.4em;
        }
    </style>
</footer>