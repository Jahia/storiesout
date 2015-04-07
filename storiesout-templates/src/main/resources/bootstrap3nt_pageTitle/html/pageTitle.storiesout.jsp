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
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<template:addResources type="css" resources="bootstrap.min.css"/>
<c:set var="cssClass"/>
<c:set var="hx"/>
<c:if test="${jcr:isNodeType(currentNode,'bootstrap3mix:advancedPageTitle' )}">
    <c:set var="cssClass" value="${currentNode.properties.cssClass.string}"/>
    <c:set var="hx" value="${currentNode.properties['hx'].string}"/>
</c:if>


<c:if test="${empty hx}">
    <c:set var="hx" value="h1"/>
</c:if>

<c:set var="pageTitle"
       value="${renderContext.mainResource.node.displayableName}"/>
<c:if test="${jcr:isNodeType(renderContext.mainResource.node, 'somix:alternateTitle')}">
    <c:set var="alternateTitle" value="${renderContext.mainResource.node.properties.alternateTitle.string}"/>
    <c:if test="${not empty alternateTitle}">
        <c:set var="pageTitle"
               value="${alternateTitle}"/>
    </c:if>
</c:if>


<${hx}<c:if test="${! empty cssClass}"><c:out value=" "/>class="${cssClass}"</c:if>>${pageTitle}</${hx}>

<c:if test="${jcr:isNodeType(renderContext.mainResource.node, 'somix:intro')}">
    <c:set var="intro" value="${renderContext.mainResource.node.properties.intro.string}"/>
  <c:if test="${not empty intro}">${intro}
    </c:if>
</c:if>
