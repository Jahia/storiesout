<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<c:set var="linkUrl" value="#"/>
<c:set var="linkType" value="noLink"/>
<c:if test="${jcr:isNodeType(currentNode, 'somix:link')}">
    <c:set var="linkType" value="${currentNode.properties['linkType'].string}"/>
    <c:choose>
        <c:when test="${linkType == 'internal'}">
            <c:set var="linkNode" value="${currentNode.properties.internalLink.node}"/>
            <c:url var="linkUrl" value="${linkNode.url}"/>
            <c:set var="target" value="_self"/>
        </c:when>
        <c:when test="${linkType == 'file'}">
            <c:set var="linkNode" value="${currentNode.properties.fileLink.node}"/>
            <c:url var="linkUrl" value="${linkNode.url}"/>
            <c:set var="target" value="_self"/>
        </c:when>
        <c:when test="${linkType == 'external'}">
            <c:set var="linkUrl" value="${currentNode.properties.externalLink.string}"/>
            <c:set var="target" value="_blank"/>
        </c:when>
    </c:choose>
</c:if>
<c:set var="date" value="${currentNode.properties.date.time}"/>
<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>
<c:choose>
    <c:when test="${language eq 'fr'}">
        <fmt:formatDate value="${date}" pattern="d MMMM yyyy" var="formatedDate"/>
    </c:when>
    <c:otherwise>
        <fmt:formatDate value="${date}" pattern="MMMM d, yyyy" var="formatedDate"/>
    </c:otherwise>
</c:choose>


<p style="clear:both;">
    <c:set var="imageNode" value="${currentNode.properties.image.node}"/>
    <c:if test="${! empty imageNode}">
        <c:url var="imageUrl" value="${imageNode.url}"/>
        <a class="media-photo" href="${linkUrl}"><img src="${imageUrl}" alt="${imageNode.displayableName}"></a>
    </c:if>

    <strong><a href="${linkUrl}">${currentNode.displayableName}</a></strong><br/>
    <small>${formatedDate}</small>
</p>
