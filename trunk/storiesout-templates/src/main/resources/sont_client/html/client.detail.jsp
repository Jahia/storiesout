<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
This is the detail view
<c:if test="${currentNode.properties.status.string eq 'active'}">
    <span class="client-active"><fmt:message key="sont_client.status.active"/></span>
</c:if>
<c:url var="clientUrl" value="${currentNode.url}"/>
<a href="${clientUrl}"><img src="${url.currentModule}/images/logo-client.png" class="client-logo" alt="Nom du client"></a>
<p class="client-name" style="word-wrap: break-word;"><a href="${clientUrl}">${currentNode.displayableName}</a></p>
