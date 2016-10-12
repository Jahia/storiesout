<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<c:set var="homeSliderItems" value="${jcr:getChildrenOfType(currentNode, 'somix:homeSliderItem')}"/>

<section class="slider hidden-print">
        <c:choose>
            <c:when test="${renderContext.editMode}">
                <c:forEach items="${homeSliderItems}" var="homeSliderItem" varStatus="status">
                    <template:module node="${homeSliderItem}"/>
                </c:forEach>
                <template:module path="*" nodeTypes="somix:homeSliderItem"/>
            </c:when>
            <c:otherwise>
                <%-- flexslider CSS http://flexslider.woothemes.com --%>
                <template:addResources type="css" resources="flexslider.css"/>
                <template:addResources type="css" resources="gem.css"/>

                <template:include view="social-big-absolute"/>
                <div class="flexslider carousel clearfix" id="flexslider-${currentNode.identifier}">
                    <ul class="slides">
                        <c:forEach items="${homeSliderItems}" var="homeSliderItem">
                            <li><template:module node="${homeSliderItem}"/></li>
                        </c:forEach>
                    </ul>
                </div>
                <template:addResources type="javascript" resources="jquery.min.js"/>
                <template:addResources type="javascript" resources="jquery.flexslider-min.js"/>
                <template:addResources type="inline">
                    <script>
                        // Can also be used with $(document).ready()
                        $(window).load(function () {
                            $('#flexslider-${currentNode.identifier}').flexslider({
                                animation: "slide",
                                smoothHeight: true
                            });
                        });
                    </script>
                </template:addResources>
            </c:otherwise>
        </c:choose>
</section>

