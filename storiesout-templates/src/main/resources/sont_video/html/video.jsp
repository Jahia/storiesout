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
<div class="col-xs-6 col-sm-6 col-md-3">
    <div class="video-item">
        <div class="img_box">
            <c:url var="detailUrl" value='${currentNode.url}'/>
            <a href="${detailUrl}">
                <img src="${url.currentModule}/img/video-img.png" alt="video-img.png" class="img-responsive">
                                <span class="circle">
                                    <span class="plus"><i class="fa fa-play fa-fw"></i></span>
                                </span>
            </a>
        </div>
        <div class="text">
            <c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
            <c:if test="${! empty title}"><h3>${title}</h3></c:if>
            <p>
                [THIS IS AN HARDCODED COMPONENT]Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus
                finibus sem in vestibulum.
            </p>
        </div>
    </div>
</div>