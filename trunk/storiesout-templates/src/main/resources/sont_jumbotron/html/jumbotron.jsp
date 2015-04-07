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
<%-- TODO: HARDCODED --%>
<div class="jumbotron jumbotron-so jumbotron-img" style="background-image: url(${url.currentModule}/img/book.jpg)">
            <div class="row">
                <div class="col-md-6 jumbotron-text">
                    <h2>Stories<span class="color-blue">Out</span></h2>

                    <p>[THIS IS AN HARDCODED COMPONENT] StoriesOut est l'agence de communication des sociétés innovantes.</p>

                    <p>Avec l'essor des nouveaux médias, nous pensons qu'il est possible d'écrire chaque histoire en
                        temps réel.

                    </p>

                    <p>
                        <a class="btn btn-lg btn-primary" href="#" role="button"><i class="fa fa-arrow-right"></i>
                            Découvrez comment</a>
                    </p>
                </div>
                <div class="col-md-6">
                    <div class="social social-big">
                        <a class="btn btn-twitter" href="#">
                            <i class="fa fa-2x fa-twitter"></i>
                        </a>
                        <a class="btn btn-linkedin" href="#">
                            <i class="fa fa-2x fa-linkedin"></i>
                        </a>
                        <a class="btn btn-facebook" href="#">
                            <i class="fa fa-2x fa-facebook"></i>
                        </a>
                        <a class="btn btn-youtube" href="#">
                            <i class="fa fa-2x fa-youtube"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>