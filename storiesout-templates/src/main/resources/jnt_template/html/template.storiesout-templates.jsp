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
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <meta name="author" content="">
    <link rel="icon" href="${url.currentModule}/img/favicon.ico">

    <title>${fn:escapeXml(renderContext.mainResource.node.displayableName)}</title>

    <template:addResources type="css" resources="bootstrap.min.css"/>
    <template:addResources type="css" resources="storiesout.css"/>
    <template:addResources type="css" resources="docs.css"/>
    <template:addResources type="css" resources="font-awesome.min.css"/>


    <template:addResources type="javascript" resources="ie8-responsive-file-warning.js" condition="if lt IE 9"/>
    <template:addResources type="javascript" resources="ie-emulation-modes-warning.js"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <template:addResources type="javascript" resources="html5shiv.min.js" condition="if lt IE 9"/>
    <template:addResources type="javascript" resources="respond.min.js"/>

    <!-- google fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>

    <!-- flexslider CSS http://flexslider.woothemes.com/-->
    <template:addResources type="css" resources="flexslider.css"/>
    <template:addResources type="css" resources="gem.css"/>

</head>

<body>

<template:area path="pagecontent"/>

<template:addResources type="javascript" resources="jquery.min.js"/>
<template:addResources type="javascript" resources="bootstrap.min.js"/>
<template:addResources type="javascript" resources="ie10-viewport-bug-workaround.js"/>
<template:addResources type="javascript" resources="jquery.flexslider-min.js"/>
<template:addResources type="inline">
<script>
    // Can also be used with $(document).ready()
    $(window).load(function () {
        $('.flexslider').flexslider({
            animation:"slide",
            smoothHeight:true
        });
    });
</script>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-54802fa11e909c08"
        async="async"></script>

</template:addResources>
<template:addResources type="javascript" resources="modernizr.js"/>
<template:addResources type="javascript" resources="main.js"/>

<a href="#0" class="cd-top">Top</a>

</body>
</html>
