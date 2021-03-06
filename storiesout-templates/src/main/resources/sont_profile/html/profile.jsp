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
<div class="row">
    <div class="col-md-5">

        <c:set var="photo" value="${currentNode.properties.photo.node}"/>
        <c:if test="${! empty photo}">
            <c:url var="photoUrl" value="${photo.url}"/>
            <c:url var="detailView" value="${currentNode.url}"/>
            <a  href="${detailView}"
               title="${fn:escapeXml(currentNode.displayableName)}">
                <img alt="${fn:escapeXml(currentNode.displayableName)}" width="165" height="165" class="img-circle"
                     src="${photoUrl}">
            </a>
        </c:if>
    </div>
    <div class="col-md-7">
        <h3 class="name"><a href="${detailView}"
                            title="Anne">${currentNode.displayableName}</a></h3>
        <h4 class="position">${currentNode.properties.subtitle.string}</h4>

        <p>${functions:abbreviate(functions:removeHtmlTags(currentNode.properties.bio.string), 200, 300, '...')}</p>

        <div class="social-links hidden-print">
            <c:set var="twitter" value="${currentNode.properties.twitter.string}"/>
            <c:if test="${! empty twitter}">
                <a href="${twitter}"><span class="fa-stack fa-lg">
                              <i class="fa fa-circle fa-stack-2x"></i>
                              <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                            </span></a>
            </c:if>
            <c:set var="linkedin" value="${currentNode.properties.linkedin.string}"/>
            <c:if test="${! empty linkedin}">
                <a href="${linkedin}"><span class="fa-stack fa-lg">
                              <i class="fa fa-circle fa-stack-2x"></i>
                              <i class="fa fa-linkedin fa-stack-1x fa-inverse"></i>
                           </span></a>
            </c:if>
            <c:set var="facebook" value="${currentNode.properties.facebook.string}"/>
            <c:if test="${! empty facebook}">
                <a href="${facebook}"><span class="fa-stack fa-lg">
                              <i class="fa fa-circle fa-stack-2x"></i>
                              <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                           </span></a>
            </c:if>
            <c:set var="google" value="${currentNode.properties.google.string}"/>
            <c:if test="${! empty google}">
                <a href="${google}"><span class="fa-stack fa-lg">
                              <i class="fa fa-circle fa-stack-2x"></i>
                              <i class="fa fa-google-plus fa-stack-1x fa-inverse"></i>
                            </span></a>
            </c:if>

        </div>
    </div>
</div>

