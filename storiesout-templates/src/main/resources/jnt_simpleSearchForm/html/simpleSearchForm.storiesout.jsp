<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<template:addCacheDependency uuid="${currentNode.properties.result.string}"/>
<c:if test="${not empty currentNode.properties.result.node}">
    <c:url value="${currentNode.properties.result.node.url}" var="searchUrl"/>
    <s:form method="post" class="navbar-form navbar-right" action="${searchUrl}" role="search">
        <div class="input-group">
            <fmt:message key='jnt_simpleSearchForm.search' var="placeholder"/>
            <s:term match="all_words" id="searchTerm" searchIn="siteContent,tags" class="form-control"
                    placeholder="${placeholder}"/>
            <s:site value="${renderContext.site.name}" includeReferencesFrom="systemsite" display="false"/>
            <s:language value="${renderContext.mainResource.locale}" display="false"/>
          <span class="input-group-btn">
            <button class="btn btn-primary" type="button"><i class="fa fa-search"></i>
            </button>
          </span>
        </div>
    </s:form>
</c:if>
