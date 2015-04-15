<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>



<c:set var="parentPage" value="${jcr:getParentOfType(renderContext.mainResource.node, 'jnt:page')}" />
<c:choose>
    <c:when test="${! empty parentPage}">
        <c:url var="parentUrl" value='${parentPage.url}'/>
    </c:when>
    <c:otherwise>
        <c:set var="parentUrl">javascript:history.back()</c:set>
    </c:otherwise>
</c:choose>

<div class="container">
    <div class="row">
        <div class="col-md-3 col-sm-12">
            <p><a href="${parentUrl}" class="btn btn-primary btn-block"><i class="fa fa-angle-left"></i> <fmt:message key="sont_client.backToList"/></a></p>
            <c:set var="mediaType" value="${currentNode.properties.mediaType.string}"/>
            <c:choose>
                <c:when test="${mediaType eq 'picture'}">
                    <c:set var="mediaPicture" value="${currentNode.properties.mediaPicture.node}"/>
                    <c:if test="${! empty mediaPicture}">
                        <c:url var="mediaPictureUrl" value="${mediaPicture.url}"/>
                        <img src="${mediaPictureUrl}" class="img-responsive"/>
                    </c:if>
                </c:when>
                <c:when test="${mediaType eq 'video'}">
                    ${currentNode.properties.mediaVideo.string}
                </c:when>
            </c:choose>
        </div>
        <div class="col-md-6 col-sm-12 ">
            <c:set var="logo" value="${currentNode.properties.logoBig.node}"/>
            <c:if test="${! empty logo}">
                <c:url var="logoUrl" value="${logo.url}"/>
                <p></p><img src="${logoUrl}" class="img-responsive" alt="${fn:escapeXml(currentNode.displayableName)}"></p>
            </c:if>
        </div>
        <div class="col-md-3 col-sm-12 ">
            <c:set var="quote" value="${currentNode.properties.quote.string}"/>
            <c:if test="${! empty quote}">
                ${quote}
            </c:if>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <h2><fmt:message key="sont_client.description"/></h2>
            ${currentNode.properties.description.string}
        </div>
    </div>
</div>
