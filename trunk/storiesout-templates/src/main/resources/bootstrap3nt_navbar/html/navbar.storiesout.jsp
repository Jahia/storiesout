<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addResources type="javascript" resources="jquery.min.js"/>
<template:addResources type="javascript" resources="bootstrap.min.js"/>
<template:addResources type="javascript" resources="bootstrap-hover-dropdown.min.js"/>

<c:set var="navbarClass" value="navbar navbar-default"/>
<c:if test="${jcr:isNodeType(currentNode, 'bootstrap3mix:navbarAdvanced')}">
    <c:set var="navbarClass" value="${currentNode.properties['navbarClass'].string}"/>
    <c:set var="ulClass" value="${currentNode.properties['ulClass'].string}"/>
</c:if>

<nav class="${navbarClass}" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse navbar-responsive-collapse">
            <c:choose>
                <c:when test="${fn:startsWith(renderContext.mainResource.path,'/templateSets/')}">
                    no render on studio
                </c:when>
                <c:otherwise>
                    <template:module node="${currentNode}" view="menu"/>
                </c:otherwise>
            </c:choose>
            <%--
            TODO: hardcoded form
            --%>
            <form class="navbar-form navbar-right" role="search">
                <div class="input-group">
                    <input type="text" placeholder="Rechercher" class="form-control">
                                  <span class="input-group-btn">
                                    <button class="btn btn-primary" type="button"><i class="fa fa-search"></i>
                                    </button>
                                  </span>
                </div>

            </form>
        </div>
    </div>
</nav>