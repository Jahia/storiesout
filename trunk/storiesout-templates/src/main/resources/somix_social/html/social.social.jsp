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

<c:if test="${jcr:isNodeType(currentNode, 'somix:social')}">
    <c:set var="displaySocial" value="${currentNode.properties.displaySocial.boolean}"/>
    <c:if test="${displaySocial == true}">
        <div class="social">
            <c:set var="siteNode" value="${currentNode.resolveSite}"/>
            <c:set var="twitter" value="${siteNode.properties.twitter.string}"/>
            <c:set var="linkedin" value="${siteNode.properties.linkedin.string}"/>
            <c:set var="facebook" value="${siteNode.properties.facebook.string}"/>
            <c:set var="youtube" value="${siteNode.properties.youtube.string}"/>
            <c:set var="displaySocial" value="${currentNode.properties.displaySocial.boolean}"/>
            <c:if test="${! empty twitter}"><a class="btn btn-twitter" href="${twitter}"> <i class="fa fa-twitter" style="line-height: 35px;"></i> </a></c:if>
            <c:if test="${! empty linkedin}"><a class="btn btn-linkedin" href="${linkedin}"> <i class="fa fa-linkedin" style="line-height: 35px;"></i> </a></c:if>
            <c:if test="${! empty facebook}"><a class="btn btn-twitter" href="${facebook}"> <i class="fa fa-facebook" style="line-height: 35px;"></i> </a></c:if>
            <c:if test="${! empty youtube}"><a class="btn btn-youtube" href="${youtube}"> <i class="fa fa-youtube" style="line-height: 35px;"></i> </a></c:if>
        </div>
    </c:if>
</c:if>
