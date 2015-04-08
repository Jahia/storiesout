<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="lang" uri="http://jahia.com/tags/languageswitcher" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>

<c:set var="state" value="${currentNode.properties['state'].string}"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="footer" value="${currentNode.properties['footer'].string}"/>

<c:if test="${jcr:isNodeType(currentNode, 'somix:moreLink')}">
    <c:set var="linkNode" value="${currentNode.properties.link.node}"/>
    <c:set var="imageNode" value="${currentNode.properties.image.node}"/>
</c:if>


<div class="panel panel-${state}">
    <c:if test="${! empty title}">
        <div class="panel-heading clearfix">
            <h3 class="pull-left panel-title">${title}</h3>
            <c:if test="${! empty linkNode}">
                <c:url var="linkUrl" value="${linkNode.url}"/>
                <a class="pull-right" href="${linkUrl}"><i class="fa fa-angle-right"></i> Plus</a>
            </c:if>
        </div>
    </c:if>
    <c:if test="${! empty imageNode}">
        <c:url var="imageUrl" value="${imageNode.url}"/>
        <div class="panel-illustration">
            <c:choose>
                <c:when test="${! empty linkNode}">
                    <c:url var="linkUrl" value="${linkNode.url}"/>
                    <a href="${linkUrl}">
                        <img src="${imageUrl}" class="img-responsive" alt="alt">
                    </a>
                </c:when>
                <c:otherwise>
                        <img src="${imageUrl}" class="img-responsive" alt="alt">
                </c:otherwise>
            </c:choose>
        </div>
    </c:if>
    <div class="panel-body">
        <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jmix:droppableContent')}" var="droppableContent">
            <template:module node="${droppableContent}" editable="true"/>
        </c:forEach>
        <c:if test="${renderContext.editMode}">
            <template:module path="*" nodeTypes="jmix:droppableContent"/>
        </c:if>
    </div>
    <c:if test="${! empty footer}">
        <div class="panel-footer">${footer}</div>
    </c:if>

</div>