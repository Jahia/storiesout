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
<%-- TODO: Hardcoded --%>
<div class="row">
                    <div class="col-md-5">

                        <a data-toggle="modal" data-target="#myModalProfile" href="#" title="Anne">
                          <img alt="Anne" width="165" height="165" class="img-circle" src="${url.currentModule}/img/anne.png">
                        </a>
                    </div>
                    <div class="col-md-7">
                        <h3 class="name"><a data-toggle="modal" data-target="#myModalProfile" href="#" title="Anne">Anne
                            de Forsan</a></h3>
                        <h4 class="position">Chanteuse de rock</h4>

                        <p>[THIS IS AN HARDCODED COMPONENT] Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean dictum varius ipsum,</p>

                        <div class="social-links hidden-print">
                            <a href="#"><span class="fa-stack fa-lg">
                              <i class="fa fa-circle fa-stack-2x"></i>
                              <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                            </span></a>
                            <a href="#"><span class="fa-stack fa-lg">
                              <i class="fa fa-circle fa-stack-2x"></i>
                              <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                           </span></a>
                            <a href="#"><span class="fa-stack fa-lg">
                              <i class="fa fa-circle fa-stack-2x"></i>
                              <i class="fa fa-google-plus fa-stack-1x fa-inverse"></i>
                            </span></a>

                        </div>
                    </div>
                </div>