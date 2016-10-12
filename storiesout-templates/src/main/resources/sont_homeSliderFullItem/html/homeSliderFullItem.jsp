<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="text" value="${currentNode.properties.text.string}"/>
<c:set var="image" value="${currentNode.properties.image.node}"/>
<c:if test="${! empty image}">
    <c:url var="imageUrl" value="${image.url}"/>
</c:if>
<c:choose>
    <c:when test="${renderContext.editMode}">
        <div class="media">
            <div class="media-left">
                <img class="media-object" src="${imageUrl}" style="max-width: 64px"/>
            </div>
            <div class="media-body">
                <h4 class="media-heading">${title}</h4>
                    ${text}
                <template:include view="link"/>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="container-fluid relative"
             style="background: url('${imageUrl}') no-repeat center center;-webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;">
            <div class="container">
                <h2><span style="font-family:blackout_two_am">${title}</span></h2>
                <div clas="lead">${text}</div>
                <template:include view="link-btn"/>
            </div>
        </div>
    </c:otherwise>
</c:choose>
