<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<c:set var="linkUrl" value="#"/>
<c:set var="linkType" value="noLink"/>
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
    <c:set var="linkTitle" value="${currentNode.properties.linkTitle.string}"/>
    <c:if test="${empty linkTitle}">
        <fmt:message key="sont_feature.readMore" var="linkTitle"/>
    </c:if>
</c:if>

<div class="row text-box clearfix" id="${currentNode.identifier}">
    <div class="col-sm-6">
        <c:choose>
            <c:when test="${! empty linkUrl && linkUrl ne '#' && linkUrl ne 'http://'}">
                <h3 class="title"><a href="${linkUrl}">${currentNode.displayableName} 1</a></h3>
                ${currentNode.properties.text.string}
                <a class="btn btn-primary btn-sm" href="#">${linkTitle}</a>
            </c:when>
            <c:otherwise>
                <h3 class="title">${currentNode.displayableName}</h3>
                ${currentNode.properties.text.string}
            </c:otherwise>
        </c:choose>
    </div>
    <div class="col-sm-6">
        <c:set var="imageNode" value="${currentNode.properties.image.node}"/>
        <c:if test="${! empty imageNode}">
            <c:url var="imageUrl" value="${imageNode.url}"/>
            <img class="center-block" alt="${fn:escapeXml(imageNode.displayableName)}" src="${imageUrl}">
        </c:if>
    </div>
</div>
