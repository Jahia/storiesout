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



<div class="row feature" id="${currentNode.identifier}">
    <div class="col-md-3">

        <a title="${fn:escapeXml(linkTitle)}" href="${linkUrl}">
            <c:set var="imageNode" value="${currentNode.properties.image.node}"/>
            <c:if test="${! empty imageNode}">
                <c:url var="imageUrl" value="${imageNode.url}"/>
                <img class="img-responsive" alt="${fn:escapeXml(imageNode.displayableName)}" src="${imageUrl}">
            </c:if>
        </a>
    </div>
    <div class="col-md-9">
        <h2><a href="${linkUrl}">${currentNode.displayableName}</a></h2>
        ${currentNode.properties.text.string}
        <c:if test="${! empty linkUrl && linkUrl ne '#' && linkUrl ne 'http://'}">
            <p class="text-right"><a class="btn  btn-primary" href="${linkUrl}"><i class="fa fa-plus-circle"></i> ${linkTitle}</a></p>
        </c:if>
    </div>
</div>
