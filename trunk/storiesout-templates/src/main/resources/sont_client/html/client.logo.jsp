<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<c:set var="logo" value="${currentNode.properties.logoBig.node}"/>
<c:if test="${! empty logo}">
    <c:url var="logoUrl" value="${logo.url}"/>
    <p></p><img src="${logoUrl}" class="img-responsive" alt="${fn:escapeXml(currentNode.displayableName)}"></p>
</c:if>
