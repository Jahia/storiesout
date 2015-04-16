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
    <c:when test="${jcr:isNodeType(siteNode,'somix:buzzList')}">
        <c:set var="buzzList" value="${siteNode.properties.buzzList.node}"/>
        <c:if test="${! empty buzzList}">
            <c:set var="parentPage" value="${jcr:getParentOfType(buzzList, 'jnt:page')}"/>
            <c:url var="allClientNews" value="${parentPage.url}"/>
            <p class="text-right"><a class="btn btn-primary btn-xs" href="${allClientNews}"><i
            class="fa fa-plus-circle"></i>&nbsp;<fmt:message key="sont_client.allBuzz"/></a>
        </c:if>
    </c:when>
    <c:otherwise>
        <c:if test="${renderContext.editMode}">
            <div class="alert alert-danger">
                Well well well... I think that the buzz list has not been set in the site properties.
            </div>
        </c:if>
    </c:otherwise>
</c:choose>

<c:set var="query" value="select * from [sont:buzz] as buzz where buzz.[relatedCampaign]='${currentNode.identifier}' order by buzz.[date] desc"/>
<jcr:sql var="buzzList" sql="${query}" limit="4"/>
<c:forEach items="${buzzList.nodes}" var="buzz">
    <template:module path="${buzz.path}" editable="false"/>
</c:forEach>
