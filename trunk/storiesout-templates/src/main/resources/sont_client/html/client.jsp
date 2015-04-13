<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="logo" value="${currentNode.properties.logo.node}"/>
<c:if test="${currentNode.properties.status.string eq 'active'}">
    <span class="client-active"><fmt:message key="sont_client.status.active"/></span>
</c:if>
<c:url var="clientUrl" value="${currentNode.url}"/>
<c:if test="${! empty logo}">
    <c:url var="logoUrl" value="${logo.url}"/>
    <a href="${clientUrl}"><img src="${logoUrl}" class="img-responsive" alt="${fn:escapeXml(logo.displayableName)}"></a>
</c:if>

<p class="client-name" style="word-wrap: break-word;"><a href="${clientUrl}">${currentNode.displayableName}</a></p>
