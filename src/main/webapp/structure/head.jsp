<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectmanager.util.Util"%>

<% String BASE_URL = Util.getURL(request); %>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<script src="<%= BASE_URL %>/js/settings.js"></script>
<link href="<%= BASE_URL %>/css/modern.css" type="text/css" rel="stylesheet" />
<style>
    #toast-container {
        margin-top: 2%;
    }
</style>