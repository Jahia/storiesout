<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="hx" value="${currentNode.properties['hx'].string}"/>
<c:set var="secondaryTitle" value="${currentNode.properties['secondaryTitle'].string}"/>

<c:if test="${empty hx}">
    <c:set var="hx" value="h2"/>
</c:if>
<c:if test="${! empty title}">
    <${hx} class="title">${title}</${hx}>
</c:if>
<c:if test="${! empty secondaryTitle}">
    <div class="lead">${secondaryTitle}</div>
</c:if>
${currentNode.properties['text'].string}