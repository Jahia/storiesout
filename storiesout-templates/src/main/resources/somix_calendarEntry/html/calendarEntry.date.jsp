<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<c:set var="date" value="${currentNode.properties.date.time}"/>
<fmt:formatDate value="${date}" pattern="MMMM" var="month"/>
<fmt:formatDate value="${date}" pattern="d" var="day"/>
<fmt:formatDate value="${date}" pattern="yyyy" var="year"/>

<p class="banner"><i class="fa fa-calendar"></i> <span>${month} ${day}, ${year}</span>
<c:forEach items="${currentNode.properties.relatedClient}" var="client">
  <c:set var="clientNode" value="${client.node}"/>
  <i class="fa fa-thumb-tack" style="padding-left:10px"></i>
  <c:url var="clientUrl" value="${clientNode.url}"/>                           
  <a href="${clientUrl}">${clientNode.displayableName}</a>                           
</c:forEach>
</p>