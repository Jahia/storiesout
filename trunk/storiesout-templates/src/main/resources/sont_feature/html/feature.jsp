<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<c:set var="layout" value="${currentNode.properties.layout.string}"/>
<c:if test="${empty layout}">
    <c:set var="layout" value="left-image"/>
</c:if>
<template:include view="${layout}"/>