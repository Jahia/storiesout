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
<template:addResources type="javascript" resources="sobanner.js"/>
<c:set var="image" value="${currentNode.properties.image.node}"/>
<c:if test="${! empty image}">
    <c:url var="imageUrl" value="${image.url}" context="/"/>
</c:if>
<c:if test="${empty imageUrl}">
    <c:url var="imageUrl" value="${url.currentModule}/img/bg-content.png"/>
</c:if>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="lead" value="${currentNode.properties.lead.string}"/>

<c:set var="linkType" value="${currentNode.properties['linkType'].string}"/>
<c:set var="linkTitle"/>
<c:set var="linkUrl"/>
<c:choose>
    <c:when test="${linkType == 'internal'}">
        <c:set var="linkNode" value="${currentNode.properties.internalLink.node}"/>
        <c:set var="linkTitle" value="${currentNode.properties.linkTitle.string}"/>
        <c:if test="${! empty linkNode}">
            <c:if test="${empty linkTitle}">
                <c:set var="linkTitle" value="${linkNode.displayableName}"/>
            </c:if>
            <c:url var="linkUrl" value="${linkNode.url}" context="/"/>
        </c:if>
    </c:when>
    <c:when test="${linkType == 'file'}">
        <c:set var="linkNode" value="${currentNode.properties.fileLink.node}"/>
        <c:set var="linkTitle" value="${currentNode.properties.linkTitle.string}"/>
        <c:if test="${! empty linkNode}">
            <c:if test="${empty linkTitle}">
                <c:set var="linkTitle" value="${linkNode.displayableName}"/>
            </c:if>
            <c:url var="linkUrl" value="${linkNode.url}" context="/"/>
        </c:if>
    </c:when>
    <c:when test="${linkType == 'external'}">
        <c:set var="linkTitle" value="${currentNode.properties.linkTitle.string}"/>
        <c:set var="linkUrl" value="${currentNode.properties.externalLink.string}"/>
        <c:if test="${fn:contains(linkUrl, 'youtube.com')}">
            <c:set var="isVideo" value="true"/>
        </c:if>

    </c:when>
</c:choose>
<c:set var="logo" value="${currentNode.properties.logo.node}"/>
<c:if test="${! empty logo}">
    <c:url var="logoUrl" value="${logo.url}" context="/"/>
</c:if>
<c:set var="theme" value="${currentNode.properties.theme.string}"/>
<c:set var="text" value="${currentNode.properties.text.string}"/>


<div class="container-fluid so-banner ${theme}" style="background: url(${imageUrl}) no-repeat center center;background-size:cover">
    <div class="so-banner-content">
        <div class="so-banner-content-wrapper">
            <c:if test="${! empty logoUrl}">
                <div class="so-product-logo">
                    <c:choose>
                        <c:when test="${! empty linkUrl}">
                            <a href="${linkUrl}"><img src="${logoUrl}"/></a>
                        </c:when>
                        <c:otherwise>
                            <img src="${logoUrl}"/>
                        </c:otherwise>
                    </c:choose>

                </div>
            </c:if>
            <c:if test="${! empty title}">
                <h1>${title}</h1>
            </c:if>
            <c:if test="${! empty lead}">
                <p>${lead}</p>
            </c:if>
        </div>
    </div>
    <c:if test="${! empty text || ! empty linkUrl}">
        <div class="so-banner-cta">
                ${text}
            <c:if test="${! empty linkUrl}">
                <a class="btn btn-cta" href="${linkUrl}">${linkTitle}</a>
            </c:if>
        </div>
    </c:if>
</div>
