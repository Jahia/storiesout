<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<!DOCTYPE html>
<c:set var="mainResourceNode" value="${renderContext.mainResource.node}"/>
<c:set var="currentLang" value="${renderContext.mainResourceLocale.language}"/>
<html lang="${currentLang}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">
    <link rel="icon" href="${url.currentModule}/img/favicon.ico">
    <link rel="apple-touch-icon" sizes="57x57" href="${url.currentModule}/img/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="${url.currentModule}/img/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${url.currentModule}/img/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${url.currentModule}/img/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${url.currentModule}/img/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${url.currentModule}/img/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="${url.currentModule}/img/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${url.currentModule}/img/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="${url.currentModule}/img/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="${url.currentModule}/img/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${url.currentModule}/img/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${url.currentModule}/img/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${url.currentModule}/img/favicon-16x16.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="${url.currentModule}/img/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <c:set var="pageTitle" value="${renderContext.mainResource.node.displayableName}"/>
    <c:if test="${jcr:isNodeType(renderContext.mainResource.node, 'somix:alternateTitle')}">
        <c:set var="alternateTitle" value="${renderContext.mainResource.node.properties.alternateTitle.string}"/>
        <c:if test="${not empty alternateTitle}">
            <c:set var="pageTitle"
                   value="${alternateTitle}"/>
        </c:if>
    </c:if>

    <title>${pageTitle}</title>
    <c:if test="${not empty mainResourceNode.properties['jcr:description'].string}">
        <c:set var="pageDescription"
               value="${fn:substring(mainResourceNode.properties['jcr:description'].string,0,160)}"/>
        <meta name="description" content="${fn:escapeXml(pageDescription)}"/>
        <meta property="og:description" content="${fn:escapeXml(pageDescription)}" />
    </c:if>

    <c:set var="keywordsI18n" value="${renderContext.mainResource.node.properties['j:keywordsI18n'].string}"/>
    <c:choose>
        <c:when test="${! empty keywordsI18n}">
            <meta name="keywords" content="${fn:trim(keywordsI18n)}"/>
        </c:when>
        <c:otherwise>
            <jcr:nodeProperty node="${renderContext.mainResource.node}" name="j:keywords"  var="keywords"/>
            <c:set var="keywordsStr" value=""/>
            <c:forEach items="${keywords}" var="keyword">
                <c:set var="keywordsStr">${fn:escapeXml(keywordsStr)}--${fn:escapeXml(keyword.string)}</c:set>
            </c:forEach>
            <c:if test="${!empty keywordsStr}">
                <meta name="keywords" content="${fn:trim(fn:replace(keywordsStr,'--',' '))}"/>
            </c:if>
        </c:otherwise>
    </c:choose>


    <meta property="og:title" content="${fn:escapeXml(pageTitle)}" />

    <template:addResources type="css" resources="font-awesome.min.css"/>
    <template:addResources type="css" resources="bootstrap.min.css"/>
    <template:addResources type="css" resources="storiesout.css"/>
    <template:addResources type="css" resources="docs.css"/>


    <template:addResources type="javascript" resources="ie8-responsive-file-warning.js" condition="if lt IE 9"/>
    <template:addResources type="javascript" resources="ie-emulation-modes-warning.js"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <template:addResources type="javascript" resources="html5shiv.min.js" condition="if lt IE 9"/>
    <template:addResources type="javascript" resources="respond.min.js"/>

    <!-- google fonts -->
    <link href='https://fonts.googleapis.com/css?family=Dosis:400,700' rel='stylesheet' type='text/css'>


</head>

<body>

<template:area path="pagecontent"/>

<template:addResources type="javascript" resources="jquery.min.js"/>
<template:addResources type="javascript" resources="bootstrap.min.js"/>
<template:addResources type="javascript" resources="ie10-viewport-bug-workaround.js"/>
<template:addResources type="inline">
    <!-- Go to www.addthis.com/dashboard to customize your tools -->
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-54802fa11e909c08"
            async="async"></script>

</template:addResources>
<template:addResources type="javascript" resources="modernizr.js"/>
<template:addResources type="javascript" resources="main.js"/>

<a href="#0" class="cd-top">Top</a>

</body>
</html>
