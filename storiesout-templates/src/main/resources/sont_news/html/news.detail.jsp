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

<c:set var="parentPage" value="${jcr:getParentOfType(renderContext.mainResource.node, 'jnt:page')}" />
<c:choose>
    <c:when test="${! empty parentPage}">
        <c:url var="parentUrl" value='${parentPage.url}'/>
    </c:when>
    <c:otherwise>
        <c:set var="parentUrl">javascript:history.back()</c:set>
    </c:otherwise>
</c:choose>

<p><a href="${parentUrl}" class="btn btn-primary"><i class="fa fa-angle-left"></i> <fmt:message key="sont_news.backToList"/></a></p>
<c:set var="imageNode" value="${currentNode.properties.image.node}"/>
<c:if test="${! empty imageNode}">
    <div class="img-float-left border-gray">
        <c:url var="imageUrl" value="${imageNode.url}"/>
        <img class="img-press img-responsive" alt="${imageNode.displayableName}" src="${imageUrl}">
    </div>
</c:if>

<div class="news">
    ${currentNode.properties.text.string}
</div>

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
<c:if test="${! empty linkUrl && linkUrl ne '#' && linkUrl ne 'http://'}">
    <c:choose>
        <c:when test="${linkType eq 'file'}">
            <c:if test="${empty linkTitle}">
                <fmt:message key="sont_buzz.viewFile" var="linkTitle"/>
            </c:if>
            <p class="text-right"><a target="${target}" class="btn  btn-danger" href="${linkUrl}"><i class="fa fa-file-pdf-o"></i> ${linkTitle}</a></p>
        </c:when>
        <c:otherwise>
            <c:if test="${empty linkTitle}">
                <fmt:message key="sont_buzz.readMore" var="linkTitle"/>
            </c:if>
            <p class="text-right"><a target="${target}" class="btn  btn-primary" href="${linkUrl}"><i class="fa fa-external-link"></i> ${linkTitle}</a></p>
        </c:otherwise>
    </c:choose>
</c:if>

