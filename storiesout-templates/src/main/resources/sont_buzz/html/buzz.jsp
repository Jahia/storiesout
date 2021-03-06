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

<div class="press-item">
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
        <c:set var="linkTitle" value="${currentNode.properties.linkTitle.string}"/>
    </c:if>
    <h3 class="title"><a href="${linkUrl}" target="_blank">${currentNode.displayableName}</a></h3>
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

    <div class="toolbar">
        <p>
            <i class="fa fa-calendar"></i>
            <span>${formatedDate}</span>
            <c:set var="author" value="${currentNode.properties.author.string}"/>
            <c:if test="${! empty author}">
                <i class="fa fa-user" style="padding-left:10px;margin-right:4px"></i>${author}
            </c:if>
            <c:forEach items="${currentNode.properties.relatedClient}" var="client">
                <c:set var="clientNode" value="${client.node}"/>
                <i class="fa fa-thumb-tack" style="padding-left:10px"></i>
                <c:url var="clientUrl" value="${clientNode.url}"/>
                <a href="${clientUrl}">${clientNode.displayableName}</a>
            </c:forEach>
        </p>
    </div>
    <div class="clearfix">

        <div>
            <c:set var="imageNode" value="${currentNode.properties.image.node}"/>
            <c:if test="${! empty imageNode}">
                <div class="img-float-left border-gray print-display-block">
                    <a href="${linkUrl}" target="${target}">
                        <c:url var="imageUrl" value="${imageNode.url}"/>
                        <img class="img-press img-responsive" alt="${imageNode.displayableName}" src="${imageUrl}">
                    </a>
                </div>
            </c:if>
            <p>${functions:removeHtmlTags(currentNode.properties.text.string)}</p>
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
        </div>
    </div>
    <hr>
</div>