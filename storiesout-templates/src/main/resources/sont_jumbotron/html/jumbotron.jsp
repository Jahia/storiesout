<%@ page language="java" contentType="text/html;charset=UTF-8" %>
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

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="lead" value="${currentNode.properties.lead.string}"/>
<c:set var="image" value="${currentNode.properties.image.node}"/>

<c:choose>
    <c:when test="${! empty image}">
        <c:url var="backgroundImage" value="${image.url}"/>
    </c:when>
    <c:otherwise>
        <c:url var="backgroundImage" value="${url.currentModule}/img/book.jpg"/>
    </c:otherwise>
</c:choose>

<section class="teaser hidden-print">
    <div class="container">
        <div class="jumbotron jumbotron-so jumbotron-img" style="background-image: url('${backgroundImage}')">
            <div class="row">
                <div class="col-md-6 jumbotron-text">
                    <c:if test="${! empty title}">
                        <h2>${title}</h2>
                    </c:if>
                    ${lead}
                    <template:include view="link-btn"/>
                </div>
                <div class="col-md-6">
                    <template:include view="social-big"/>
                </div>
            </div>
        </div>
    </div>
</section>