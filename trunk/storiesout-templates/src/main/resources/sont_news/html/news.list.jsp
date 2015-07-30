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

<article>
    <c:set var="imageNode" value="${currentNode.properties.image.node}"/>
    <c:if test="${! empty imageNode}">
        <c:url var="imageUrl" value="${imageNode.url}"/>
        <a class="media-photo" href="${linkUrl}"><img src="${imageUrl}" alt="${imageNode.displayableName}"></a>
    </c:if>

    <div class="media-body">

        <h4 class="media-heading"><a href="${linkUrl}">${currentNode.displayableName}</a></h4>

        <p class="media-info"><span class="small"><i class="fa fa-newspaper-o"></i> ${formatedDate}</span></p>
        <c:set var="shortText" value="${currentNode.properties.shortText.string}"/>
        <c:choose>
            <c:when test="${! empty fn:trim(functions:removeHtmlTags(shortText))}">
                ${functions:abbreviate(fn:trim(functions:removeHtmlTags(shortText)),280,300,'...')}
            </c:when>
            <c:otherwise>
                <p>${functions:abbreviate(functions:removeHtmlTags(currentNode.properties.text.string), 100, 120, '...')}</p>
            </c:otherwise>
        </c:choose>
    </div>
</article>