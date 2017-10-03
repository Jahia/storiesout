<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<div class="logo-container">
    <c:if test="${renderContext.mainResource.node.path eq renderContext.site.home.path}">
        <div class="h1-home"><span>${currentNode.properties.siteName.string}</span></div>
        <div class="h2-home"><span>${currentNode.properties.siteTeaser.string}</span></div>
    </c:if>
    <c:url var="homePageURL" value="${renderContext.site.home.url}"/>
    <jcr:nodeProperty var="logo" node="${currentNode}" name="logo"/>
    <c:if test="${! empty logo.node }">
        <c:url var="logoUrl" value="${logo.node.url}"/>
        <a class="navbar-brand" href="${homePageURL}"><img alt="StoriesOut" height="120" src="${logoUrl}"></a>
    </c:if>
    <%--

    <jcr:nodeProperty var="slogan" node="${currentNode}" name="slogan"/>
    <c:if test="${! empty slogan.node }">
        <c:url var="sloganUrl" value="${slogan.node.url}"/>
        <img class="img-slogan hidden-print" alt="StoriesOut" height="25" src="${sloganUrl}">
    </c:if>
    --%>

</div>