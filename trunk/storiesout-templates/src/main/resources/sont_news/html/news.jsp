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
<c:url var="linkUrl" value="${currentNode.url}"/>
<div class="press-item">

    <h3 class="title"><a href="${linkUrl}">${currentNode.displayableName}</a></h3>
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

    <%--
    <fmt:formatDate value="${date}" pattern="MMMM" var="month"/>
    <fmt:formatDate value="${date}" pattern="d" var="day"/>
    <fmt:formatDate value="${date}" pattern="yyyy" var="year"/>
    --%>

    <div class="toolbar">
        <p>
            <i class="fa fa-calendar"></i>
            <span>${formatedDate}</span>
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
            <c:set var="shortText" value="${currentNode.properties.shortText.string}"/>
            <c:choose>
                <c:when test="${! empty fn:trim(functions:removeHtmlTags(shortText))}">
                    ${shortText}
                </c:when>
                <c:otherwise>
                    <p>${functions:abbreviate(functions:removeHtmlTags(currentNode.properties.text.string), 200, 300, '...')}</p>
                </c:otherwise>
            </c:choose>
            <fmt:message key="sont_news.readMore" var="linkTitle"/>
            <p class="text-right"><a class="btn btn-primary" href="${linkUrl}"><i class="fa fa-external-link"></i> ${linkTitle}</a></p>
        </div>
    </div>
    <hr>
</div>