<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="propertyDefinition" type="org.jahia.services.content.nodetypes.ExtendedPropertyDefinition"--%>
<%--@elvariable id="type" type="org.jahia.services.content.nodetypes.ExtendedNodeType"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<c:set var="siteNode" value="${currentNode.resolveSite}"/>
<c:choose>
    <c:when test="${jcr:isNodeType(siteNode,'somix:newsList')}">
        <c:set var="newsList" value="${siteNode.properties.newsList.node}"/>
        <c:if test="${! empty newsList}">
        <c:set var="listName" value="${newsList.name}"/>
            <c:set var="parentPage" value="${jcr:getParentOfType(newsList, 'jnt:page')}"/>

        <c:set var="identifier" value="${currentNode.identifier}"/>
        <c:set var="identifier2" value="${fn:replace(identifier, '-', '\\\-')}"/>
        <c:set var="qs" value="relatedCampaign###"/>
        <c:set var="qs" value="${qs}${identifier}"/>
        <c:set var="qs" value="${qs}###0\\\:FACET\\\:relatedCampaign:${identifier2}"/>
        <%
            String qs = (String) pageContext.findAttribute("qs");
            String encodedParams = org.jahia.utils.Url.encodeUrlParam(qs);
            pageContext.setAttribute("encodedParams", encodedParams);
        %>
        <c:url var="allClientNews" value="${parentPage.url}">
            <c:param name="N-${listName}" value="${encodedParams}"/>
        </c:url>
            <p class="text-right"><a class="btn btn-primary btn-xs" href="${allClientNews}"><i
            class="fa fa-plus-circle"></i>&nbsp;<fmt:message key="sont_client.allNews"/></a>
        </c:if>
    </c:when>
    <c:otherwise>
        <c:if test="${renderContext.editMode}">
            <div class="alert alert-danger">
                Well well well... I think that the news list has not been set in the site properties.
            </div>
        </c:if>
    </c:otherwise>
</c:choose>

<c:set var="query" value="select * from [sont:news] as news where news.[relatedCampaign]='${currentNode.identifier}' order by news.[date] desc"/>
<jcr:sql var="newsList" sql="${query}"/>
<c:forEach items="${newsList.nodes}" var="news">
    <template:module path="${news.path}" editable="false"/>
</c:forEach>
