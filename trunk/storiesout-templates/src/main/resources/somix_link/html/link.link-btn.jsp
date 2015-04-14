<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<c:if test="${jcr:isNodeType(currentNode, 'somix:link')}">
    <c:set var="linkType" value="${currentNode.properties['linkType'].string}"/>
    <c:set var="linkTitle"/>
    <c:set var="linkUrl"/>
    <c:choose>
        <c:when test="${linkType == 'internal'}">
            <c:set var="linkNode" value="${currentNode.properties.internalLink.node}"/>
            <c:set var="linkTitle" value="${currentNode.properties.linkTitle.string}"/>
            <c:if test="${! empty linkNode}">
                <c:if test="${empty linkTitle}">
                    <c:set var="linkTitle" value="${linkNode.displayableName}"/>
                </c:if>
                <c:url var="linkUrl" value="${linkNode.url}"/>
            </c:if>
        </c:when>
        <c:when test="${linkType == 'file'}">
            <c:set var="linkNode" value="${currentNode.properties.fileLink.node}"/>
            <c:set var="linkTitle" value="${currentNode.properties.linkTitle.string}"/>
            <c:if test="${! empty linkNode}">
                <c:if test="${empty linkTitle}">
                    <c:set var="linkTitle" value="${linkNode.displayableName}"/>
                </c:if>
                <c:url var="linkUrl" value="${linkNode.url}"/>
            </c:if>
        </c:when>        <c:when test="${linkType == 'external'}">
            <c:set var="linkTitle" value="${currentNode.properties.linkTitle.string}"/>
            <c:set var="linkUrl" value="${currentNode.properties.externalLink.string}"/>
        </c:when>
    </c:choose>
    <c:if test="${! empty linkUrl && linkUrl ne 'http://'}">
        <p><a class="btn btn-lg btn-primary" href="${linkUrl}" role="button"title="${fn:escapeXml(linkTitle)}"<c:if test="${linkType == 'external'}"><c:out value=" "/>target="_blank"></c:if>><i class="fa fa-arrow-right"></i>${linkTitle}</a></p>
    </c:if>
</c:if>
