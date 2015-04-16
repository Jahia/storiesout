<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lang" uri="http://storiesout.com/tags/languageswitcher" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--@elvariable id="currentUser" type="org.jahia.services.usermanager.JahiaUser"--%>
<%--@elvariable id="currentAliasUser" type="org.jahia.services.usermanager.JahiaUser"--%>
<ui:initLangBarAttributes activeLanguagesOnly="${renderContext.liveMode}"/>
<c:set var="languageCodes" value="${requestScope.languageCodes}"/>
<c:if test="${fn:length(languageCodes)>1}">
    <div class="header-lang">
        <c:forEach var="languageCode" items="${languageCodes}">
            <lang:switchToLanguageLink languageCode="${languageCode}"/>
        </c:forEach>
    </div>
</c:if>
<c:if test="${renderContext.loggedIn}">
    <jcr:node var="userNode" path="${currentUser.localPath}"/>
    <jcr:nodeProperty var="picture" node="${userNode}" name="j:picture"/>
    <c:set var="firstname" value="${userNode.properties['j:firstName'].string}"/>
    <c:set var="lastname" value="${userNode.properties['j:lastName'].string}"/>

    <div class="dropdown btn-logout">
        <a id="dLabel" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" role="button"
           aria-expanded="false">
            <c:if test="${not empty picture}">
                <img src='<c:url value="${picture.node.thumbnailUrls['avatar_120']}"/>'
                     alt="${fn:escapeXml(firstname)} ${fn:escapeXml(lastname)}" class="img-user img-circle"/>
            </c:if>
            <c:if test="${empty picture}">
                <img src="${url.currentModule}/img/anne.png" alt="${fn:escapeXml(firstname)} ${fn:escapeXml(lastname)}"
                     class="img-user img-circle">
            </c:if>

                ${fn:escapeXml(empty firstname and empty lastname ? userNode.name : firstname)}&nbsp;${fn:escapeXml(lastname)}
            <span class="caret"></span>
        </a>
        <c:if test="${renderContext.loggedIn}">
            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                <c:if test="${!renderContext.settings.distantPublicationServerMode
and renderContext.mainResource.node.properties['j:originWS'].string ne 'live'
and not jcr:isNodeType(renderContext.mainResource.node.resolveSite, 'jmix:remotelyPublished')
}">
                    <c:if test="${! renderContext.liveMode}">
                        <li role="presentation">
                            <a role="menuitem" tabindex="-1"  href="<c:url value='${url.live}'/>">
                                <i class="fa fa-fw fa-eye"></i>
                                <fmt:message key="sont_adminBar.gotoLive"/>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${! renderContext.previewMode && jcr:hasPermission(renderContext.mainResource.node, 'editModeAccess')}">
                        <li role="presentation">
                            <a role="menuitem" tabindex="-1"  href="<c:url value='${url.preview}'/>">
                                <i class="fa fa-fw fa-globe"></i>
                                <fmt:message key="sont_adminBar.gotoPreview"/>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${! renderContext.editMode && jcr:hasPermission(renderContext.mainResource.node, 'editModeAccess')}">
                        <li role="presentation">
                            <a role="menuitem" tabindex="-1"  href="<c:url value='${url.edit}'/>">
                                <i class="fa fa-fw fa-pencil-square-o"></i>
                                <fmt:message key="sont_adminBar.gotoEdit"/>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${! renderContext.editMode && !jcr:hasPermission(renderContext.mainResource.node, 'editModeAccess') && jcr:hasPermission(renderContext.mainResource.node, 'contributeModeAccess')}">
                        <li role="presentation">
                            <a role="menuitem" tabindex="-1"  href="<c:url value='${url.contribute}'/>">
                                <i class="fa fa-fw fa-edit"></i>
                                <fmt:message key="sont_adminBar.gotoContribute"/>
                            </a>
                        </li>
                    </c:if>
                </c:if>

                <li role="presentation" class="divider"></li>
                <li role="presentation">
                    <a role="menuitem" tabindex="-1"  href="<c:url value='${url.myProfile}'/>">
                        <i class="fa fa-fw fa-user"></i>
                        <fmt:message key="sont_adminBar.profile"/>
                    </a>
                </li>

                <li class="divider" role="presentation"></li>

                <li role="presentation">
                    <a role="menuitem" tabindex="-1"  href="<c:url value='${url.logout}'/>">
                        <i class="fa fa-fw fa-power-off"></i>
                        <fmt:message key="sont_adminBar.logout"/>
                    </a>
                </li>
            </ul>
        </c:if>

    </div>
</c:if>


