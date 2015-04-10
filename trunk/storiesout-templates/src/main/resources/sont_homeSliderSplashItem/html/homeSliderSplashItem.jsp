<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="lead" value="${currentNode.properties.lead.string}"/>
<c:set var="image" value="${currentNode.properties.image.node}"/>

<c:choose>
    <c:when test="${renderContext.editMode}">
        <div class="media">
            <div class="media-left">
                <c:if test="${! empty image}">
                    <c:url var="imageUrl" value="${image.url}"/>
                </c:if>
                <img class="media-object" src="${imageUrl}" style="max-width: 64px"/>
            </div>
            <div class="media-body">
                <h4 class="media-heading">${title}</h4>
                    ${lead}
                <template:include view="link"/>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="container-fluid">
            <div class="carousel-caption">
                <c:if test="${! empty title}">
                    <h2>${title}</h2>
                </c:if>
                    ${lead}
                <template:include view="link-btn"/>
            </div>
            <div class="carousel-img">
                <c:if test="${! empty image}">
                    <c:url var="imageUrl" value="${image.url}"/>
                    <img class="img-responsive" src="${imageUrl}" alt="alt">
                </c:if>
            </div>
        </div>
    </c:otherwise>
</c:choose>
