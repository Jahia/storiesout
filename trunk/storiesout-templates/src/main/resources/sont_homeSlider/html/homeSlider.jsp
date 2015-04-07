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
<section class="slider hidden-print">
    <div class="container relative">
        <div class="social social-big social-absolute">
            <a href="#" class="btn btn-twitter">
                <i class="fa fa-2x fa-twitter"></i>
            </a>
            <a href="#" class="btn btn-linkedin">
                <i class="fa fa-2x fa-linkedin"></i>
            </a>
            <a href="#" class="btn btn-facebook">
                <i class="fa fa-2x fa-facebook"></i>
            </a>
            <a href="#" class="btn btn-youtube">
                <i class="fa fa-2x fa-youtube"></i>
            </a>
        </div>
        <div class="flexslider carousel clearfix">

            <div class="flex-viewport" style="overflow: hidden; position: relative; height: 370px;">
                <ul class="slides"
                    style="width: 1200%; -webkit-transition-duration: 0.6s; transition-duration: 0.6s; -webkit-transform: translate3d(-4560px, 0px, 0px);">
                    <li class="clone" style="width: 1140px; float: left; display: block;">
                        <div class="container-fluid">
                            <div class="carousel-caption">


                                <h2>Stories<span class="color-blue">Out</span> 3
                                </h2>

                                <p class="lead inverse">StoriesOut est l'agence de communication des sociétés
                                    innovantes.</p>

                                <p class="lead inverse">Avec l'essor des nouveaux médias, nous pensons qu'il est
                                    possible
                                    d'écrire chaque histoire en
                                    temps réel.

                                </p>

                                <p>
                                    <a class="btn btn-lg btn-primary" href="#" role="button"><i
                                            class="fa fa-arrow-right"></i> Découvrez comment</a>
                                </p>

                            </div>

                            <div class="carousel-img">
                                <a href="#"><img class="img-responsive" src="${url.currentModule}/img/book.jpg"
                                                 alt="alt"></a>
                            </div>
                        </div>
                    </li>
                    <li class="" style="width: 1140px; float: left; display: block;">
                        <iframe id="player_1" src="http://player.vimeo.com/video/39683393?api=1&amp;player_id=player_1"
                                width="100%" height="480" frameborder="0" webkitallowfullscreen="" mozallowfullscreen=""
                                allowfullscreen=""></iframe>
                    </li>
                    <li style="width: 1140px; float: left; display: block;" class="">
                        <div class="container-fluid">
                            <div class="carousel-caption">


                                <h2>Stories<span class="color-blue">Out</span> 1
                                </h2>

                                <p class="lead inverse">StoriesOut est l'agence de communication des sociétés
                                    innovantes.</p>

                                <p class="lead inverse">Avec l'essor des nouveaux médias, nous pensons qu'il est
                                    possible
                                    d'écrire chaque histoire en
                                    temps réel.

                                </p>

                                <p>
                                    <a class="btn btn-lg btn-primary" href="#" role="button"><i
                                            class="fa fa-arrow-right"></i> Découvrez comment</a>
                                </p>

                            </div>

                            <div class="carousel-img">
                                <a href="#"><img class="img-responsive" src="${url.currentModule}/img/book.jpg"
                                                 alt="alt"></a>
                            </div>
                        </div>
                    </li>
                    <li style="width: 1140px; float: left; display: block;" class="">
                        <div class="container-fluid">
                            <div class="carousel-caption">


                                <h2>Stories<span class="color-blue">Out</span>2
                                </h2>

                                <p class="lead inverse">StoriesOut est l'agence de communication des sociétés
                                    innovantes.</p>

                                <p class="lead inverse">Avec l'essor des nouveaux médias, nous pensons qu'il est
                                    possible
                                    d'écrire chaque histoire en
                                    temps réel.

                                </p>

                                <p>
                                    <a class="btn btn-lg btn-primary" href="#" role="button"><i
                                            class="fa fa-arrow-right"></i> Découvrez comment</a>
                                </p>

                            </div>

                            <div class="carousel-img">
                                <a href="#"><img class="img-responsive" src="${url.currentModule}/img/book.jpg"
                                                 alt="alt"></a>
                            </div>
                        </div>
                    </li>
                    <li style="width: 1140px; float: left; display: block;" class="flex-active-slide">
                        <div class="container-fluid">
                            <div class="carousel-caption">


                                <h2>Stories<span class="color-blue">Out</span> 3
                                </h2>

                                <p class="lead inverse">StoriesOut est l'agence de communication des sociétés
                                    innovantes.</p>

                                <p class="lead inverse">Avec l'essor des nouveaux médias, nous pensons qu'il est
                                    possible
                                    d'écrire chaque histoire en
                                    temps réel.

                                </p>

                                <p>
                                    <a class="btn btn-lg btn-primary" href="#" role="button"><i
                                            class="fa fa-arrow-right"></i> Découvrez comment</a>
                                </p>

                            </div>

                            <div class="carousel-img">
                                <a href="#"><img class="img-responsive" src="${url.currentModule}/img/book.jpg"
                                                 alt="alt"></a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <ol class="flex-control-nav flex-control-paging">
                <li><a class="">1</a></li>
                <li><a class="">2</a></li>
                <li><a class="">3</a></li>
                <li><a class="flex-active">4</a></li>
            </ol>
            <ul class="flex-direction-nav">
                <li><a class="flex-prev" href="#">Previous</a></li>
                <li><a class="flex-next" href="#">Next</a></li>
            </ul>
        </div>
    </div>
</section>