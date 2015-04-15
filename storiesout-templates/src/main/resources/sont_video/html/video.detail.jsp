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
<c:set var="parentPage" value="${jcr:getParentOfType(renderContext.mainResource.node, 'jnt:page')}" />
<c:choose>
    <c:when test="${! empty parentPage}">
        <c:url var="parentUrl" value='${parentPage.url}'/>
    </c:when>
    <c:otherwise>
        <c:set var="parentUrl">javascript:history.back()</c:set>
    </c:otherwise>
</c:choose>

<div class="col-xs-12 col-sm-12 col-md-3">


    <p><a href="${parentUrl}" class="btn btn-primary btn-block"><i class="fa fa-angle-left"></i> <fmt:message
            key="sont_video.backToList"/></a></p>


    <h3 class="title">Decription</h3>

    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elit lectus, lacinia eget feugiat
        non, consequat et diam. Praesent in odio vitae neque tincidunt congue. Mauris vitae condimentum
        nunc. Curabitur porttitor dignissim tempor. In hac habitasse platea dictumst.

    </p>

    <p>Phasellus leo elit, ultrices fermentum tempor eu, aliquet eu lorem. Vivamus rutrum elementum
        odio. Donec eget nibh ut urna mollis bibendum. Maecenas nec neque sodales felis suscipit
        hendrerit in sit amet augue. </p>

</div>
<div class="col-xs-12 col-sm-12 col-md-9">
    <iframe id="player_1" src="http://player.vimeo.com/video/39683393?api=1&amp;player_id=player_1" width="100%"
            height="400" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>

</div>

