<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<nav class="navbar navbar-expand navbar-theme">
    <a class="sidebar-toggle d-flex me-2">
        <i class="hamburger align-self-center"></i>
    </a>

    <form class="d-none d-sm-inline-block">
        <input class="form-control form-control-lite" type="text" placeholder="Buscar" />
    </form>

    <div class="navbar-collapse collapse">
        <ul class="navbar-nav ms-auto">

            <li class="nav-item dropdown ms-lg-2">
                <a class="nav-link dropdown-toggle position-relative" id="userDropdown" data-bs-toggle="dropdown">
                    <i class="align-middle fas"></i>
                </a>
            </li>
        </ul>
    </div>
    <% if (request.getSession(false) != null) { %>
    <input type="hidden" id="user_login" value="<%= request.getSession(false).getAttribute("user_id") %>">
    <% } %>
</nav>
