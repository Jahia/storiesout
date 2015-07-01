<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<c:set var="date" value="${currentNode.properties.date.time}"/>
<c:choose>
  <c:when test="${currentResource.locale.language eq 'fr'}">
    <fmt:formatDate value="${date}" pattern="d MMMM yyyy" var="formatedDate"/>
  </c:when>
  <c:otherwise>
    <fmt:formatDate value="${date}" pattern="MMMM d, yyyy" var="formatedDate"/>
  </c:otherwise>
</c:choose>

<p class="banner"><i class="fa fa-calendar"></i> <span>${formatedDate}</span>
<c:forEach items="${currentNode.properties.relatedClient}" var="client">
  <c:set var="clientNode" value="${client.node}"/>
  <i class="fa fa-thumb-tack" style="padding-left:10px"></i>
  <c:url var="clientUrl" value="${clientNode.url}"/>                           
  <a href="${clientUrl}">${clientNode.displayableName}</a>                           
</c:forEach>
</p>