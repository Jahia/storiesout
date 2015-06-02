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
<c:set var="list" value="${currentNode.properties.list.node}"/>
<c:if test="${! empty list}">
    <c:set var="query"
           value="select * from [somix:calendarEntry] as calendarEntry WHERE ISDESCENDANTNODE('${list.path}') order by buzz.[entry] desc"/>
    <jcr:sql var="calendarEntries" sql="${query}" limit="${currentNode.properties.size.long}"/>
    <c:set var="entries" value="${calendarEntries.nodes}"/>
    <c:choose>
        <c:when test="${fn:length(entries) > 0}">
            <ul class="media-list">
                <c:forEach items="${entries}" var="entry">
                    <li class="media-small">
                        <template:module path="${entry.path}" editable="false" view="list"/>
                    </li>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            <c:if test="${renderContext.editMode}">
                <div class="alert alert-warning">
                    Could not get entry entry; check that your list is correct.
                </div>
            </c:if>
        </c:otherwise>
    </c:choose>
</c:if>
