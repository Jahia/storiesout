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
<c:url var="linkUrl" value="${currentNode.url}"/>


<div class="press-item-big">
    <c:set var="parentPage" value="${jcr:getParentOfType(renderContext.mainResource.node, 'jnt:page')}" />
    <c:choose>
        <c:when test="${! empty parentPage}">
            <c:url var="parentUrl" value='${parentPage.url}'/>
        </c:when>
        <c:otherwise>
            <c:set var="parentUrl">javascript:history.back()</c:set>
        </c:otherwise>
    </c:choose>


    <p><a href="${parentUrl}" class="btn btn-primary "><i class="fa fa-angle-left"></i> <fmt:message key="sont_client.backToList"/></a></p>

    <h2 class="title"><a href="${linkUrl}">${currentNode.displayableName}</a></h2>

    <div class="toolbar">
        <a class="btn btn-link" href="#">
            <i class="fa fa-calendar"></i>
            <c:set var="date" value="${currentNode.properties.date.time}"/>
            <c:set var="language" value="${currentResource.locale.language}"/>
            <fmt:setLocale value="${language}" scope="session"/>
            <c:choose>
                <c:when test="${language eq 'fr'}">
                    <fmt:formatDate value="${date}" pattern="d MMMM yyyy" var="formatedDate"/>
                </c:when>
                <c:otherwise>
                    <fmt:formatDate value="${date}" pattern="MMMM d, yyyy" var="formatedDate"/>
                </c:otherwise>
            </c:choose>

            <span>${formatedDate}</span>

        </a>
        <a class="btn btn-link" href="#">
            <i class="fa fa-user"></i>
            <span>${currentNode.properties.author.string} </span>
        </a>
        <c:forEach items="${currentNode.properties.relatedClient}" var="client">
            <c:set var="clientNode" value="${client.node}"/>
            <i class="fa fa-thumb-tack" style="padding-left:10px"></i>
            <c:url var="clientUrl" value="${clientNode.url}"/>
            <a href="${clientUrl}">${clientNode.displayableName}</a>
        </c:forEach>
        <%--
        <a class="btn btn-link" href="#comments">
            <i class="fa fa-comments"></i>
            <span>13 comments</span>
        </a>
        --%>
    </div>
    <div class="row">
        <c:set var="imageNode" value="${currentNode.properties.image.node}"/>
        <c:if test="${! empty imageNode}">
            <c:url var="imageUrl" value="${imageNode.url}"/>
            <div class="col-sm-12">
                <a href="${linkUrl}">
                    <img class="img-responsive center-block img-bottom-margin"
                         alt="${fn:escapeXml(imageNode.displayableName)}" width="848" height="364"
                         src="${imageUrl}">
                </a>
            </div>
        </c:if>

        <div class="col-sm-12">
            ${currentNode.properties.text.string}

        </div>
    </div>
    <hr>
</div>