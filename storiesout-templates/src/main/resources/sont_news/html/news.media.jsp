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
<div class="media">
    <div class="media-left media-middle">
        <c:set var="imageNode" value="${currentNode.properties.image.node}"/>
        <c:if test="${! empty imageNode}">
            <a href="${linkUrl}" target="${target}">
                <c:url var="imageUrl" value="${imageNode.url}"/>
                <a href="${linkUrl}"><img class="img-responsive media-object" alt="${imageNode.displayableName}" src="${imageUrl}"></a>
            </a>
        </c:if>
    </div>
    <div class="media-body">
        <h4 class="media-heading"><a href="${linkUrl}">${currentNode.displayableName}</a></h4>
        <p>${functions:abbreviate(functions:removeHtmlTags(currentNode.properties.text.string), 200, 300, '...')}</p>
    </div>
</div>
