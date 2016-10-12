<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<div class="container-fluid relative">
    <c:choose>
        <c:when test="${renderContext.editMode}">
            <div class="media">
                <div class="media-left">
                <span class="fa-stack fa-2x">
                  <i class="fa fa-square fa-stack-2x"></i>
                  <i class="fa fa-code fa-stack-1x fa-inverse"></i>
                </span>
                </div>
                <div class="media-body">
                    <p>${fn:escapeXml(currentNode.properties.free.string)}</p>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            ${currentNode.properties.free.string}
        </c:otherwise>
    </c:choose>
</div>