<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--
TOTO: Hardoded
--%>
<div class="header-lang">
    <a class="btn btn-sm btn-primary active" title="French" href="#"><img src="${url.currentModule}/img/fr.png" alt="French"></a>
    <a class="btn btn-sm btn-inverse" title="English" href="#"><img src="${url.currentModule}/img/us.png" alt="English"></a>
</div>
<!-- Button trigger modal -->
<a href="#" class="btn-login" data-toggle="modal" data-target="#myModal">
    <i class="fa fa-lock"></i> Se connecter
</a>

<div class="dropdown btn-logout">
    <img src="${url.currentModule}/img/anne.png" alt="Nom Prénom" class="img-user img-circle">
    <a id="dLabel" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" role="button"
       aria-expanded="false">
        Hello Nom Prénom
        <span class="caret"></span>
    </a>

    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-cogs"></i>
            Administration</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-pencil-square-o"></i> Edit
            Mode</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-eye"></i> Mode
            Aperçu</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-globe"></i> En
            ligne</a></li>
        <li role="presentation" class="divider"></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-power-off"></i> Logout</a>
        </li>

    </ul>
</div>
