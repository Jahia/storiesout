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


<div class="press-item-big">
    <h2 class="title"><a href="${linkUrl}">${currentNode.displayableName}</a></h2>

    <div class="toolbar">
        <a class="btn btn-link" href="#">
            <i class="fa fa-calendar"></i>
            <c:set var="date" value="${currentNode.properties.date.time}"/>
            <fmt:formatDate value="${date}" pattern="MMMM" var="month"/>
            <fmt:formatDate value="${date}" pattern="d" var="day"/>
            <fmt:formatDate value="${date}" pattern="yyyy" var="year"/>
            <span>${month} ${day}, ${year}</span>

        </a>
        <a class="btn btn-link" href="#">
            <i class="fa fa-user"></i>
            <span>${currentNode.properties.author.string} </span>
        </a>
        <c:forEach items="${currentNode.properties.relatedClient}" var="client">
            <c:set var="clientNode" value="${client.node}"/>
            <i class="fa fa-thumb-tack" style="padding-left:10px"></i>
            <c:url var="clientUrl" value="${clientNode.url}"/>
            <a href="${clientUrl}">${clientNode.displayableName}</a>
        </c:forEach>
        <%--
        <a class="btn btn-link" href="#comments">
            <i class="fa fa-comments"></i>
            <span>13 comments</span>
        </a>
        --%>
    </div>
    <div class="row">
        <c:set var="imageNode" value="${currentNode.properties.image.node}"/>
        <c:if test="${! empty imageNode}">
            <c:url var="imageUrl" value="${imageNode.url}"/>
            <div class="col-sm-12">
                <a href="${linkUrl}">
                    <img class="img-responsive center-block img-bottom-margin"
                         alt="${fn:escapeXml(imageNode.displayableName)}" width="848" height="364"
                         src="${imageUrl}">
                </a>
            </div>
        </c:if>

        <div class="col-sm-12">
            <c:set var="shortText" value="${currentNode.properties.shortText.string}"/>
            <c:choose>
                <c:when test="${! empty fn:trim(functions:removeHtmlTags(shortText))}">
                    ${shortText}
                </c:when>
                <c:otherwise>
                    <p>${functions:abbreviate(functions:removeHtmlTags(currentNode.properties.text.string), 200, 300, '...')}</p>
                </c:otherwise>
            </c:choose>
            <a class="btn btn-primary btn-xs" href="${linkUrl}"> <fmt:message key="sont_campaign.readMore"/></a>
        </div>
    </div>
    <hr>
</div>